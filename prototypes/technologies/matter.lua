data:extend(
{
	{
		type = "technology",
		name = "kr-matter-processing",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "matter-processing.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-matter-plant"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-matter-assembler"
			}
		},
		prerequisites = {"kr-matter-tech-card", "kr-imersium-processing", "kr-energy-control-unit"},
		order = "g-e-d",
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
    },
	{
		type = "technology",
		name = "kr-matter-coal-processing",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "matter-coal.png",
		icon_size = 128,
		effects = {},
		prerequisites = {"kr-matter-processing"},
		order = "g-e-e",
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1}				
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-matter-copper-processing",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "matter-copper.png",
		icon_size = 128,
		effects = {},
		prerequisites = {"kr-matter-processing"},
		order = "g-e-e",
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1}				
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-matter-iron-processing",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "matter-iron.png",
		icon_size = 128,
		effects = {},
		prerequisites = {"kr-matter-processing"},
		order = "g-e-e",
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1}				
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-matter-minerals-processing",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "matter-minerals.png",
		icon_size = 128,
		effects = {},
		prerequisites = {"kr-matter-processing"},
		order = "g-e-e",
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1}				
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-matter-oil-processing",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "matter-oil.png",
		icon_size = 128,
		effects = {},
		prerequisites = {"kr-matter-processing"},
		order = "g-e-e",
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1}				
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-matter-stone-processing",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "matter-stone.png",
		icon_size = 128,
		effects = {},
		prerequisites = {"kr-matter-processing"},
		order = "g-e-e",
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1}				
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-matter-uranium-processing",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "matter-uranium.png",
		icon_size = 128,
		effects = {},
		prerequisites = {"kr-matter-processing"},
		order = "g-e-e",
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1}				
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-matter-water-processing",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "matter-water.png",
		icon_size = 128,
		effects = {},
		prerequisites = {"kr-matter-processing"},
		order = "g-e-e",
		unit =
		{
			count = 1000,
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
})