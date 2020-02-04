data:extend(
{
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------CHARACTER EQUIPMENTS-------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	-- -- Exoskeletons

	-- -- Imersite night visor

-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------VEHICLES EQUIPMENTS--------------------------------------------
----------------------------------------------------------------------------------------------------------------- 

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