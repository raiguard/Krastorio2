data:extend(
{
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------CHARACTER EQUIPMENTS-------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	-- -- Exoskeletons
	{
		type = "technology",
		name = "kr-advanced-exoskeleton-equipment",
		icon_size = 128,
		icon = kr_technologies_icons_path .. "advanced-exoskeleton-equipment.png",
		upgrade = false,
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "advanced-exoskeleton-equipment"
			}
		},
		prerequisites = {"exoskeleton-equipment", "speed-module-2"},
		unit = 		
		{
			count = 250,
			ingredients = 
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"utility-science-pack", 1}
			},
			time = 30
		}		
	},
	{
		type = "technology",
		name = "kr-superior-exoskeleton-equipment",
		icon_size = 128,
		icon = kr_technologies_icons_path .. "superior-exoskeleton-equipment.png",
		upgrade = false,
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "superior-exoskeleton-equipment"
			}
		},
		prerequisites = {"kr-advanced-exoskeleton-equipment", "kr-imersium-processing"},
		unit = 		
		{
			count = 500,
			ingredients = 
			{
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"advanced-tech-card", 1}		
			},
			time = 45
		}		
	},
	-- -- Imersite night visor
	{
		type = "technology",
		name = "kr-imersite-night-vision-equipment",
		icon_size = 128,
		icon = kr_technologies_icons_path .. "imersite-night-vision-equipment.png",
		upgrade = false,
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "imersite-night-vision-equipment"
			}
		},
		prerequisites = {"night-vision-equipment", "kr-quarry-minerals-extraction"},
		unit = 		
		{
			count = 250,
			ingredients = 
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"utility-science-pack", 1}
			},
			time = 30
		}		
	},
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------VEHICLES EQUIPMENTS--------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	{
		type = "technology",
		name = "kr-advanced-additional-engine",		
		icons =
		{
			{ icon = kr_technologies_icons_path .. "advanced-additional-engine.png", icon_size = 128 },
			{ icon = kr_technologies_icons_path .. "overlays/equipment-overlay.png", icon_size = 128 }
		},
		icon_size = 128,
		upgrade = false,
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "advanced-additional-engine"
			}
		},
		prerequisites = {"electric-engine", "advanced-electronics-2", "utility-science-pack"},
		unit = 		
		{
			count = 250,
			ingredients = 
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"utility-science-pack", 1}
			},
			time = 30
		}
	},
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------UNIVERSAL EQUIPMENTS-------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	--GENERATORS
	{
		type = "technology",
		name = "kr-portable-generator",		
		icons = 
		{
			{ icon = kr_technologies_icons_path .. "portable-generator.png", icon_size = 128 },
			{ icon = kr_technologies_icons_path .. "overlays/equipment-overlay.png", icon_size = 128 }
		},
		icon_size = 128,
		upgrade = false,
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "portable-generator"
			}
		},
		prerequisites = {"battery-equipment", "chemical-science-pack"},
		unit = 		
		{
			count = 120,
			ingredients = 
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack",	1},
			},
			time = 60
		}
	},
	{
		type = "technology",
		name = "kr-nuclear-reactor-equipment",		
		icons = 
		{
			{ icon = kr_technologies_icons_path .. "nuclear-reactor-equipment.png", icon_size = 128 },
			{ icon = kr_technologies_icons_path .. "overlays/equipment-overlay.png", icon_size = 128 }
		},
		icon_size = 128,
		upgrade = false,
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "nuclear-reactor-equipment"
			}
		},
		prerequisites = {"nuclear-power", "power-armor"},
		unit = 		
		{
			count = 120,
			ingredients = 
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack",	1},
			},
			time = 60
		}
	},
	{
		type = "technology",
		name = "kr-antimatter-reactor-equipment",		
		icons = 
		{
			{ icon = kr_technologies_icons_path .. "antimatter-reactor-equipment.png", icon_size = 128 },
			{ icon = kr_technologies_icons_path .. "overlays/equipment-overlay.png", icon_size = 128 }
		},
		icon_size = 128,
		upgrade = false,
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "antimatter-reactor-equipment"
			}
		},
		prerequisites = {"kr-nuclear-reactor-equipment", "kr-antimatter-reactor"},
		unit = 		
		{
			count = 1500,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1}				
			},
			time = 45
		}
	}
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
})