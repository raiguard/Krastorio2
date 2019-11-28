data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-------------------------------------------------ONLY ITEMS UNLOCKING--------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "technology",
		name = "automation-core",
		icon = kr_technologies_icons_path .. "automation-core.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "automation-core"
			}
		},
		prerequisites = {},
		unit =
		{
			count = 30,
			ingredients = 
			{
				{"basic-tech-card", 1}
			},
			time = 15
		}
    },
	{
		type = "technology",
		name = "light-armor",
		icon = kr_technologies_icons_path .. "light-armor.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "light-armor"
			}
		},
		prerequisites = {"military"},
		unit =
		{
			count = 50,
			ingredients = 
			{
				{"basic-tech-card", 1}
			},
			time = 15
		}
    },
	{
		type = "technology",
		name = "automation-science-pack", -- DON'T CHANGE THIS NAME (is needed for the enforce algorithm)
		icon = kr_technologies_icons_path .. "automation-tech-card.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "automation-science-pack"
			}
		},
		prerequisites = {"automation-core"},
		unit =
		{
			count = 100,
			ingredients = 
			{
				{"basic-tech-card", 1}
			},
			time = 30
		}
    },
	{
		type = "technology",
		name = "stone-processing",
		icon = kr_technologies_icons_path .. "crusher.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "sand"
			},
			{
				type = "unlock-recipe",
				recipe = "glass"
			}
		},
		prerequisites = {"kr-crusher"},
		unit =
		{
			count = 50,
			ingredients = 
			{
				{"basic-tech-card", 1}
			},
			time = 15
		}
    },
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})