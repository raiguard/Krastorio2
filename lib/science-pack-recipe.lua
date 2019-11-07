--[[
	-- How is defined science_pack_recipes:	
	science_pack_recipes["name of mod"]["name of science pack"]
	
	"name of science pack" could be only:
	"automation-science-pack",
	"logistic-science-pack",
	"military-science-pack",
	"chemical-science-pack",
	"production-science-pack",
	"utility-science-pack"
	
	Also, to add a new variant in automatic way, call this function:
	science_pack_recipes.addRecipeVariation(mod_name, science_pack_name, recipe)
	where:
	@ mod_name, name of mod that use this recipe for this science pack
	@ science_pack_name, name of science pack es: "automation-science-pack"
	@ recipe, all recipe defined as standard of data.raw of Factorio
--]]

if not science_pack_recipes then
	science_pack_recipes = {}
	
	-- -- Base vanilla recipes
	science_pack_recipes["Factorio"] = {}
	-- Automation science pack
	science_pack_recipes["Factorio"]["automation-science-pack"] = 
	{
		type = "recipe",
		name = "automation-science-pack",
		energy_required = 5,
		ingredients = 
		{
			{"copper-plate", 1},
			{"iron-gear-wheel",	1}
		},
		result = "automation-science-pack"
	}
	-- Logistic science pack
	science_pack_recipes["Factorio"]["logistic-science-pack"] = 
	{
		type = "recipe",
		name = "logistic-science-pack",
		enabled = false,
		energy_required = 6,
		ingredients =
		{
			{"inserter", 1},
			{"transport-belt", 1}
		},
		result = "logistic-science-pack"
	}
	-- Military science pack
	science_pack_recipes["Factorio"]["military-science-pack"] = 
	{
		type = "recipe",
		name = "military-science-pack",
		enabled = false,
		energy_required = 10,
		result_count = 2,
		ingredients = 
		{
			{"piercing-rounds-magazine", 1},
			{"grenade",	1},
			{"stone-wall", 2}
		},		
		result = "military-science-pack"		
    }
	-- Chemical science pack
	science_pack_recipes["Factorio"]["chemical-science-pack"] = 
	{
		type = "recipe",
		name = "chemical-science-pack",
		enabled = false,
		energy_required = 24,
		result_count = 2,
		ingredients = 
		{
			{"engine-unit",	2},
			{"advanced-circuit", 3},
			{"sulfur", 1}
		},
		result = "chemical-science-pack"
	}
	-- Production science pack
	science_pack_recipes["Factorio"]["production-science-pack"] = 
	{
		type = "recipe",
		name = "production-science-pack",
		enabled = false,
		energy_required = 21,
		result_count = 3,
		ingredients = 
		{
			{"electric-furnace", 1},
			{"productivity-module", 1},
			{"rail", 30}
		},
		result = "production-science-pack"
	}
	-- Utility science pack
	science_pack_recipes["Factorio"]["utility-science-pack"] = 
	{
		type = "recipe",
		name = "utility-science-pack",
		enabled = false,
		energy_required = 21,
		result_count = 3,
		ingredients = 
		{
			{"low-density-structure", 3},
			{"processing-unit",	2},
			{"flying-robot-frame", 1}
		},
		result = "utility-science-pack"
    }
	
	-- -- Krastorio recipes
	science_pack_recipes["Krastorio"] = {}
	-- Automation science pack
	science_pack_recipes["Krastorio"]["automation-science-pack"] = 
	{
		type = "recipe",
		name = "automation-science-pack",
		energy_required = 20,
		result_count = 5,
		ingredients = 
		{
			{"electronic-circuit", 5},
			{"iron-gear-wheel", 5}
		},
		result = "automation-science-pack"
	}
	-- Logistic science pack
	science_pack_recipes["Krastorio"]["logistic-science-pack"] = 
	{
		type = "recipe",		
		name = "logistic-science-pack",
		enabled = false,
		energy_required = 20,
		result_count = 5,
		ingredients =
		{
			{"inserter", 5},
			{"transport-belt", 5}
		},
		result = "logistic-science-pack"
	}
	-- Military science pack
	science_pack_recipes["Krastorio"]["military-science-pack"] = 
	{
		type = "recipe",
		name = "military-science-pack",		
		enabled = false,
		energy_required = 20,
		result_count = 5,
		ingredients =
		{
			{"piercing-rounds-magazine", 5},
			{"submachine-gun", 4},
			{"stone-wall", 3}
		},
		result = "military-science-pack"		
	}
	-- Chemical science pack
	science_pack_recipes["Krastorio"]["chemical-science-pack"] = 
	{
		type = "recipe",
		name = "chemical-science-pack",
		enabled = false,
		energy_required = 20,
		result_count = 5,
		ingredients = 
		{
			{"k-quartz", 20},
			{"advanced-circuit", 5},
			{"solid-fuel", 5}
		},
		result = "chemical-science-pack"
	}
	-- Production science pack
	science_pack_recipes["Krastorio"]["production-science-pack"] = 
	{
		type = "recipe",
		name = "production-science-pack",
		enabled = false,
		energy_required = 20,
		result_count = 5,
		ingredients = 
		{
			{"electric-furnace", 2},
			{"productivity-module", 5},
			{"gold-plate", 10},
			{"plastic-bar", 10}
		},
		result = "production-science-pack"
	}
	-- Utility science pack
	science_pack_recipes["Krastorio"]["utility-science-pack"] = 
	{
		type = "recipe",
		name = "utility-science-pack",
		enabled = false,
		energy_required = 20,
		result_count = 5,
		ingredients = 
		{
			{"speed-module", 5},
			{"processing-unit", 5},
			{"repair-pack", 10},
			{"flying-robot-frame", 5}
		},
		result = "utility-science-pack"
    }
end

-- Add a new recipe variation for one mod 
-- (call this function two time with the same mod_name, science_pack_name will overwrite the previus variation)
-- this function must be called with the same argument in setting-update stage and in data-update stage, both!
-- @ mod_name, name of mod that use this recipe for this science pack
-- @ science_pack_name, name of science pack es: "automation-science-pack"
-- @ recipe, all recipe defined as standard of data.raw of Factorio
function science_pack_recipes.addRecipeVariation(mod_name, science_pack_name, recipe)
	if not science_pack_recipes[mod_name] then
		science_pack_recipes[mod_name] = {}
	end
	if data.raw["string-setting"] and data.raw["string-setting"]["k-" .. science_pack_name .. "-recipe"] then
		table.insert(data.raw["string-setting"]["k-" .. science_pack_name .. "-recipe"].allowed_values, mod_name)
	else
		science_pack_recipes[mod_name][science_pack_name] = recipe
	end	
end

return science_pack_recipes