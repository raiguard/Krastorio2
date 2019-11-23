data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "technology",
		name = "kr-greenhouse",
		icon = kr_technologies_icons_path .. "greenhouse.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-greenhouse"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-grow-wood"
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
			time = 30
		}
    },
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
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})