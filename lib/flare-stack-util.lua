local color = require ("lib.colorRGB")

-- -- -- FLARE STACK UTIL
-- Notes: in flare stack liquid is blacklisted, in liquid evaporator is whitelisted 


if not flare_stack_func then
	flare_stack_func = {}
	flare_stack_func.dlr_func = require("lib.destroy-liquid-recipe-util")
end
-- blacklisted burn recipes (singleton table)
if not flare_stack_func.blacklist then
	flare_stack_func.blacklist =
	{
		["water"] = true,
		["steam"] = true,
		["k-dirty-water"] = true,
		["dirty-water"] = true,
		["k-pure-water"] = true,
		["pure-water"] = true,
		["k-salt-water"] = true,
		["salt-water"] = true,
		["k-matter"] = true,
		["matter"] = true,
		["kr-void"] = true,
		["high-pressure-water"] = true,
		["high-pressure-k-dirty-water"] = true,
		["high-pressure-dirty-water"] = true,
		["high-pressure-k-pure-water"] = true,
		["high-pressure-pure-water"] = true,
		["high-pressure-k-salt-water"] = true,
		["high-pressure-salt-water"] = true,
		["high-pressure-k-matter"] = true,
		["high-pressure-matter"] = true,
		["high-pressure-kr-void"] = true
	}
end
-- products of burn recipes (singleton table)
if not flare_stack_func.fluid_products then
	flare_stack_func.fluid_products = {}
end

-- -- -- PUBLIC
-- Notes:
--[[
	This functions must be called in data phase,
	Krastorio generate all burn recipes in data update phase,
	if someone want add post data update phase burn modifications,
	must be regenerate the specific recipes. 
]]--
--------

--[[
	With this funcion, could be blacklisted in Krastorio a fluid for not be
	burn it in Krastorio flare stack.
]]--
-- @fluid_name, name of fluid to blacklist
function flare_stack_func.blacklistFluid(fluid_name)
	flare_stack_func.blacklist[fluid_name] = true
end

--[[
	With this funcion, is possible assign a product generated from
	burn a specific fluid in Krastorio flare stack.
	
	The given product must be defined with the standard form of Factorio inventory item:
	{item_name, amount}
	{type="item" item_name=_item_name, amount=_amount}
	The product can't be another fluid! But could have a probability.
]]--
-- @fluid_name, name of fluid that create the product
-- @product, the product created
function flare_stack_func.addBurnFluidProduct(fluid_name, product)
	flare_stack_func.fluid_products[fluid_name] = product
end

--[[
	Create a burn fluid recipe of one fluid, with some conditions:
	- if fluid exist
	- if fluid is not blacklist
	- will automatically add sub product if present in flare_stack_func.fluid_products
	  added in flare_stack_func.addBurnFluidProduct(fluid_name, product)
	- if the burn recipe already exist, will be overwritten
]]--
function flare_stack_func.generateBurnFluidsRecipe(fluid_name)
	flare_stack_func.dlr_func.generateDestroyFluidsRecipe
	(
		fluid_name, 
		"burn", 
		"k-flare-stack", 
		flare_stack_func.fluid_products,
		flare_stack_func.blacklist,
		false
	)
end

--[[
	Disable a specific burn recipe, need the name of fluid
--]]
function flare_stack_func.removeBurnFluidsRecipe(fluid_name)	
	local recipe = aswil.recipes.getRecipeFromName("k-burn-" .. fluid_name)
	if recipe then
		recipe.enabled = false
		aswil.technologies.removeUnlockRecipe(aswil.technologies.getTechnologyThatUnlockRecipe("k-flare-stack"), recipe.name)	
	end
end

-- -- -- KRASTORIO ONLY

-- Generate all recipes
function flare_stack_func.generateBurnFluidsRecipes()	
	for _, fluid in pairs(data.raw.fluid) do
		flare_stack_func.generateBurnFluidsRecipe(fluid.name)
	end
end

return flare_stack_func
