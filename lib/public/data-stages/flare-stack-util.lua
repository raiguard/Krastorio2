local color = require ("__Krastorio2__/lib/private/data-stages/colorRGB")

-- -- -- FLARE STACK UTIL
-- Notes: in flare stack liquid is blacklisted, in liquid evaporator is whitelisted 

if not krastorio.flare_stack_func then
	krastorio.flare_stack_func = {}
	krastorio.flare_stack_func.dlr_func = require("__Krastorio2__/lib/private/data-stages/destroy-liquid-recipe-util")
end
-- blacklisted burn recipes (singleton table)
if not krastorio.flare_stack_func.blacklist then
	krastorio.flare_stack_func.blacklist =
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
		["high-pressure-k-mineral-water"] = true,
		["high-pressure-mineral-water"] = true,
		["high-pressure-k-matter"] = true,
		["high-pressure-matter"] = true,
		["high-pressure-kr-void"] = true
	}
end
-- products of burn recipes (singleton table)
if not krastorio.flare_stack_func.fluid_products then
	krastorio.flare_stack_func.fluid_products = {}
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
function krastorio.flare_stack_func.blacklistFluid(fluid_name)
	krastorio.flare_stack_func.blacklist[fluid_name] = true
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
function krastorio.flare_stack_func.addBurnFluidProduct(fluid_name, product)
	krastorio.flare_stack_func.fluid_products[fluid_name] = product
end

--[[
	Create a burn fluid recipe of one fluid, with some conditions:
	- if fluid exist
	- if fluid is not blacklist
	- will automatically add sub product if present in flare_stack_func.fluid_products
	  added in flare_stack_func.addBurnFluidProduct(fluid_name, product)
	- if the burn recipe already exist, will be overwritten
]]--
function krastorio.flare_stack_func.generateBurnFluidsRecipe(fluid_name)
	krastorio.flare_stack_func.dlr_func.generateDestroyFluidsRecipe
	(
		fluid_name, 
		"burn", 
		"k-flare-stack", 
		krastorio.flare_stack_func.fluid_products,
		krastorio.flare_stack_func.blacklist,
		false
	)
end

--[[
	Disable a specific burn recipe, need the name of fluid
--]]
function krastorio.flare_stack_func.removeBurnFluidsRecipe(fluid_name)	
	local recipe = krastorio.recipes.getRecipeFromName("k-burn-" .. fluid_name)
	if recipe then
		recipe.enabled = false
		krastorio.technologies.removeUnlockRecipe(krastorio.technologies.getTechnologyThatUnlockRecipe("k-flare-stack"), recipe.name)	
	end
end

-- -- -- KRASTORIO ONLY (Use it if you know what you are doing)

-- Generate all recipes
function krastorio.flare_stack_func.generateBurnFluidsRecipes()	
	for _, fluid in pairs(data.raw.fluid) do
		krastorio.flare_stack_func.generateBurnFluidsRecipe(fluid.name)
	end
end

return krastorio.flare_stack_func
