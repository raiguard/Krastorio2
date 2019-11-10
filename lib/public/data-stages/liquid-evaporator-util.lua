local color = require ("__Krastorio2__/lib/private/data-stages/colorRGB")

-- -- -- LIQUID EVAPORATOR UTIL
-- Notes: in flare stack liquid is blacklisted, in liquid evaporator is whitelisted 

if not krastorio.liquid_evaporator_func then
	krastorio.liquid_evaporator_func = {}
	krastorio.liquid_evaporator_func.dlr_func = require("__Krastorio2__/lib/private/data-stages/destroy-liquid-recipe-util")
end
-- whitelisted evaporate recipes (singleton table)
if not krastorio.liquid_evaporator_func.whitelist then
	krastorio.liquid_evaporator_func.whitelist =
	{
		["water"] = true,
		["steam"] = true,
		["k-dirty-water"] = true,
		["dirty-water"] = true,
		["k-pure-water"] = true,
		["pure-water"] = true,
		["k-salt-water"] = true,
		["salt-water"] = true,
		["k-mineral-water"] = true,
		["mineral-water"] = true,
		["high-pressure-water"] = true,
		["high-pressure-k-dirty-water"] = true,
		["high-pressure-dirty-water"] = true,
		["high-pressure-k-pure-water"] = true,
		["high-pressure-pure-water"] = true,
		["high-pressure-k-salt-water"] = true,
		["high-pressure-salt-water"] = true,
		["high-pressure-k-mineral-water"] = true,
		["high-pressure-mineral-water"] = true
	}
end
-- products of evaporate recipes (singleton table)
if not krastorio.liquid_evaporator_func.fluid_products then
	krastorio.liquid_evaporator_func.fluid_products =
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
function krastorio.liquid_evaporator_func.whitelistFluid(fluid_name)
	krastorio.liquid_evaporator_func.whitelist[fluid_name] = true
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
function krastorio.liquid_evaporator_func.addEvaporateFluidProduct(fluid_name, product)
	krastorio.liquid_evaporator_func.fluid_products[fluid_name] = product
end

--[[
	Create a evaporate fluid recipe of one fluid, with some conditions:
	- if fluid exist
	- if fluid is whitelisted
	- will automatically add sub product if present in liquid_evaporator_func.fluid_products
	  added in liquid_evaporator_func.addEvaporateFluidProduct(fluid_name, product)
	- if the evaporate recipe already exist, will be overwritten
]]--
function krastorio.liquid_evaporator_func.generateEvaporateFluidsRecipe(fluid_name)
	krastorio.liquid_evaporator_func.dlr_func.generateDestroyFluidsRecipe
	(
		fluid_name, 
		"evaporate", 
		"k-liquid-evaporator", 
		krastorio.liquid_evaporator_func.fluid_products,
		krastorio.liquid_evaporator_func.whitelist,
		true
	)
end

--[[
	Disable a specific evaporate recipe, need the name of fluid
--]]
function krastorio.liquid_evaporator_func.removeEvaporateFluidsRecipe(fluid_name)	
	local recipe = krastorio.recipes.getRecipeFromName("k-evaporate-" .. fluid_name)
	if recipe then
		recipe.enabled = false
		krastorio.technologies.removeUnlockRecipe(krastorio.technologies.getTechnologyThatUnlockRecipe("k-liquid-evaporator"), recipe.name)	
	end
end

-- -- -- KRASTORIO ONLY (Use it if you know what you are doing)

-- Generate all recipes
function krastorio.liquid_evaporator_func.generateEvaporateFluidsRecipes()	
	for _, fluid in pairs(data.raw.fluid) do
		krastorio.liquid_evaporator_func.generateEvaporateFluidsRecipe(fluid.name)
	end
end

return krastorio.liquid_evaporator_func
