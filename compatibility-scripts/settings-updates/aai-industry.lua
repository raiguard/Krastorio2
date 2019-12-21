if mods["aai-industry"] then

	local science_pack_recipe = require(kr_public_lib .. "science-pack-recipe")
	
	-- Automation science pack
	-- not exist
	-- Logistic science pack
	science_pack_recipe.addRecipeVariation
	(
		"AAI Industry", 
		"logistic-science-pack",
		{
			type = "recipe",
			name = "logistic-science-pack",
			enabled = false,
			energy_required = 10,
			ingredients =
			{
				{"inserter", 1},
				{"transport-belt", 2}
			},
			result = "logistic-science-pack",
			result_count = 2
		}
	)
	-- Military science pack	
	-- not exist
	-- Chemical science pack	
	-- not exist	
	-- Production science pack
	-- not exist	
	-- Utility science pack
	science_pack_recipe.addRecipeVariation
	(
		"AAI Industry",
		"utility-science-pack",
		{
			type = "recipe",
			name = "utility-science-pack",
			enabled = false,
			energy_required = 35,
			result_count = 5,
			ingredients = 
			{
				{"low-density-structure", 3},
				{"processing-unit",	3},
				{"flying-robot-frame", 1}
			},
			result = "utility-science-pack"
		}
	)

end