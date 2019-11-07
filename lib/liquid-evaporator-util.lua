local color = require ("lib.colorRGB")

-- -- -- LIQUID EVAPORATOR UTIL
-- Notes: in flare stack liquid is blacklisted, in liquid evaporator is whitelisted 

if not liquid_evaporator_func then
	liquid_evaporator_func = {}
	liquid_evaporator_func.dlr_func = require("lib.destroy-liquid-recipe-util")
end
-- whitelisted evaporate recipes (singleton table)
if not liquid_evaporator_func.whitelist then
	liquid_evaporator_func.whitelist =
	{
		["water"] = true,
		["steam"] = true,
		["k-dirty-water"] = true,
		["dirty-water"] = true,
		["k-pure-water"] = true,
		["pure-water"] = true,
		["k-salt-water"] = true,
		["salt-water"] = true,
		["high-pressure-water"] = true,
		["high-pressure-k-dirty-water"] = true,
		["high-pressure-dirty-water"] = true,
		["high-pressure-k-pure-water"] = true,
		["high-pressure-pure-water"] = true,
		["high-pressure-k-salt-water"] = true,
		["high-pressure-salt-water"] = true
	}
end
-- products of evaporate recipes (singleton table)
if not liquid_evaporator_func.fluid_products then
	liquid_evaporator_func.fluid_products =
	{
		["k-dirty-water"] = {type="item", name="stone", amount=1, probability=0.30},
		["dirty-water"]   = {type="item", name="stone", amount=1, probability=0.30}
	}
end

-- -- -- PUBLIC
-- Notes:
--[[
	This functions must be called in data phase,
	Krastorio generate all evaporate recipes in data update phase,
	if someone want add post data update phase evaporate modifications,
	must be regenerate the specific recipes. 
]]--
--------

--[[
	With this funcion, could be whitelisted in Krastorio a fluid for not be
	evaporate it in Krastorio flare stack.
]]--
-- @fluid_name, name of fluid to whitelist
function liquid_evaporator_func.whitelistFluid(fluid_name)
	liquid_evaporator_func.whitelist[fluid_name] = true
end

--[[
	With this funcion, is possible assign a product generated from
	evaporate a specific fluid in Krastorio liquid evaporator.
	
	The given product must be defined with the standard form of Factorio inventory item:
	{item_name, amount}
	{type="item" item_name=_item_name, amount=_amount}
	The product can't be another fluid! But could have a probability.
]]--
-- @fluid_name, name of fluid that create the product
-- @product, the product created
function liquid_evaporator_func.addEvaporateFluidProduct(fluid_name, product)
	liquid_evaporator_func.fluid_products[fluid_name] = product
end

--[[
	Create a evaporate fluid recipe of one fluid, with some conditions:
	- if fluid exist
	- if fluid is whitelisted
	- will automatically add sub product if present in liquid_evaporator_func.fluid_products
	  added in liquid_evaporator_func.addEvaporateFluidProduct(fluid_name, product)
	- if the evaporate recipe already exist, will be overwritten
]]--
function liquid_evaporator_func.generateEvaporateFluidsRecipe(fluid_name)
	liquid_evaporator_func.dlr_func.generateDestroyFluidsRecipe
	(
		fluid_name, 
		"evaporate", 
		"k-liquid-evaporator", 
		liquid_evaporator_func.fluid_products,
		liquid_evaporator_func.whitelist,
		true
	)
end

--[[
	Disable a specific evaporate recipe, need the name of fluid
--]]
function liquid_evaporator_func.removeEvaporateFluidsRecipe(fluid_name)	
	local recipe = aswil.recipes.getRecipeFromName("k-evaporate-" .. fluid_name)
	if recipe then
		recipe.enabled = false
		aswil.technologies.removeUnlockRecipe(aswil.technologies.getTechnologyThatUnlockRecipe("k-liquid-evaporator"), recipe.name)	
	end
end

-- -- -- KRASTORIO ONLY

-- Generate all recipes
function liquid_evaporator_func.generateEvaporateFluidsRecipes()	
	for _, fluid in pairs(data.raw.fluid) do
		liquid_evaporator_func.generateEvaporateFluidsRecipe(fluid.name)
	end
end

return liquid_evaporator_func
