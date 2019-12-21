if mods["IndustrialRevolution"] then

	local science_pack_recipe = require(kr_public_lib .. "science-pack-recipe")

	-- Automation science pack
	science_pack_recipe.addRecipeVariation
	(
		"Industrial Revolution", 
		"automation-science-pack",
		{
			type = "recipe",
			name = "automation-science-pack",
			category = "crafting",
			energy_required = 4,
			ingredients = 
			{
				{"copper-plate", 1},
				{"tin-gear-wheel", 2}
			},
			result = "automation-science-pack",
			result_count = 1			
		}
	)
	-- Logistic science pack
	science_pack_recipe.addRecipeVariation
	(
		"Industrial Revolution", 
		"logistic-science-pack",
		{
			type = "recipe",
			name = "logistic-science-pack",
			category = "crafting",
			enabled = false,
			energy_required = 4,
			ingredients =
			{
				{"bronze-tube", 2},
				{"glass-ingot",	2}
			},
			result = "logistic-science-pack",
			result_count = 1			
		}
	)
	-- Military science pack	
	science_pack_recipe.addRecipeVariation
	(
		"Industrial Revolution", 
		"military-science-pack",
		{
			type = "recipe",
			name = "military-science-pack",
			category = "crafting",
			enabled = false,
			energy_required = 6,
			ingredients = 
			{
				{"iron-magazine", 1},
				{"copper-cartridge", 1},
				{"carbon-powder", 3},
				{"sand", 6}
			},
			result = "military-science-pack",
			result_count = 1			
		}
	)
	-- Chemical science pack	
	science_pack_recipe.addRecipeVariation
	(
		"Industrial Revolution", 
		"chemical-science-pack",
		{
			type = "recipe",
			name = "chemical-science-pack",
			category = "crafting",
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"plastic-bar",	2},
				{"solid-fuel",	1},
				{"iron-gravel",	5},
				{"copper-gravel", 5}
			},			
			result = "chemical-science-pack",
			result_count = 1			
		}
	)	
	-- Production science pack
	science_pack_recipe.addRecipeVariation
	(
		"Industrial Revolution",
		"production-science-pack",
		{
			type = "recipe",
			name = "production-science-pack",
			category = "crafting",
			enabled = false,
			energy_required = 8,
			ingredients =
			{
				{"advanced-circuit", 2},
				{"concrete", 20},
				{"steel-chassis-large", 1},
				{"titanium-plate-heavy", 1}
			},			
			result = "production-science-pack",
			result_count = 1			
		}
	)
	-- Utility science pack
	science_pack_recipe.addRecipeVariation
	(
		"Industrial Revolution",
		"utility-science-pack",
		{
			type = "recipe",
			name = "utility-science-pack",
			category = "crafting",
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"processing-unit",	1},
				{"low-density-structure", 1},
				{"battery", 2},
				{"steel-ring", 1}
			},			
			result = "utility-science-pack",
			result_count = 1			
		}
	)
	
end