if mods ["angelssmelting"] then
	-- -- Adjustments for enriched ores
	
	-- Increase yield
	krastorio.recipes.replaceProduct("enriched-iron", "enriched-iron", {type = "item",  name = "enriched-iron", amount = 8})
	krastorio.recipes.replaceProduct("enriched-copper", "enriched-copper", {type = "item",  name = "enriched-copper", amount = 8})
	
	-- Add new recipes
	local enriched_iron = krastorio.items.getItem("enriched-iron")	
	local enriched_copper = krastorio.items.getItem("enriched-copper")	
	
	krastorio.recipes.addWithOverrideSafeNewRecipe
	(
		{
			type = "recipe",
			name = "enriched-iron-smelting",
			icons = 
			{
				{ icon = "__angelssmelting__/graphics/icons/ingot-iron.png" },
				{ icon = enriched_iron.icon, icon_size = enriched_iron.icon_size, scale = 0.20, shift = {-8, -8} },
			},
			category = "blast-smelting",
			subgroup = "angels-iron",
			energy_required = 4,
			enabled = false,
			ingredients = 
			{
				{type = "item", name = "enriched-iron", amount = 12}
			},
			results = 
			{
				{type = "item", name = "ingot-iron", amount = 24}
			},
			icon_size = 32,
			order = "e[ingot-iron]-d"
		}
	)	
	krastorio.recipes.addWithOverrideSafeNewRecipe
	(
		{
			type = "recipe",
			name = "enriched-copper-smelting",
			icons = 
			{
				{ icon = "__angelssmelting__/graphics/icons/ingot-copper.png" },
				{ icon = enriched_copper.icon, icon_size = enriched_copper.icon_size, scale = 0.20, shift = {-8, -8} },
			},
			category = "blast-smelting",
			subgroup = "angels-copper",
			energy_required = 4,
			enabled = false,
			ingredients = 
			{
				{type = "item", name = "enriched-copper", amount = 12}
			},
			results = 
			{
				{type = "item", name = "ingot-copper", amount = 24}
			},
			icon_size = 32,
			order = "e[ingot-copper]-d"
		}
	)	
	krastorio.recipes.addWithOverrideSafeNewRecipe
	(
		{
			type = "recipe",
			name = "enriched-iron-processing",
			icons = 
			{
				{ icon = "__angelssmelting__/graphics/icons/processed-iron.png" },
				{ icon = enriched_iron.icon, icon_size = enriched_iron.icon_size, scale = 0.20, shift = {-8, -8} },
			},
			category = "blast-smelting",
			subgroup = "angels-iron",
			energy_required = 2,
			enabled = false,
			ingredients = 
			{
				{type = "item", name = "enriched-iron", amount = 2}
			},
			results = 
			{
				{type = "item", name = "processed-iron", amount = 2}
			},
			icon_size = 32,
			order = "b[processed-iron]-b"
		}
	)	
	krastorio.recipes.addWithOverrideSafeNewRecipe
	(
		{
			type = "recipe",
			name = "enriched-copper-processing",
			icons = 
			{
				{ icon = "__angelssmelting__/graphics/icons/processed-copper.png" },
				{ icon = enriched_copper.icon, icon_size = enriched_copper.icon_size, scale = 0.20, shift = {-8, -8} },
			},
			category = "blast-smelting",
			subgroup = "angels-copper",
			energy_required = 2,
			enabled = false,
			ingredients = 
			{
				{type = "item", name = "enriched-copper", amount = 2}
			},
			results = 
			{
				{type = "item", name = "processed-copper", amount = 2}
			},
			icon_size = 32,
			order = "b[processed-copper]-b"
		}
	)	
	krastorio.technologies.addUnlockRecipe("kr-enriched-ores", krastorio.recipes.changed_names["enriched-iron-smelting"] or "enriched-iron-smelting")
	krastorio.technologies.addUnlockRecipe("kr-enriched-ores", krastorio.recipes.changed_names["enriched-copper-smelting"] or "enriched-copper-smelting")
	krastorio.technologies.addUnlockRecipe("kr-enriched-ores", krastorio.recipes.changed_names["enriched-iron-processing"] or "enriched-iron-processing")
	krastorio.technologies.addUnlockRecipe("kr-enriched-ores", krastorio.recipes.changed_names["enriched-copper-processing"] or "enriched-copper-processing")
	
end
