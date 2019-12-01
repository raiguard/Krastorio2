data:extend(
{
-----------------------------------------------------------------------------------------------------------------
---------------------------------------------ONLY BUILDINGS UNLOCKING--------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "technology",
		name = "kr-basic-fluid-handling",
		icon = kr_technologies_icons_path .. "basic-fluid-handling.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "pipe"
			},
			{
				type = "unlock-recipe",
				recipe = "pipe-to-ground"
			},
			{
				type = "unlock-recipe",
				recipe = "offshore-pump"
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
		name = "kr-steam-engine",
		icon = kr_technologies_icons_path .. "steam-engine.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "boiler"
			},
			{
				type = "unlock-recipe",
				recipe = "steam-engine"
			}
		},
		prerequisites = {"kr-basic-fluid-handling"},
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
		prerequisites = {"automation-core", "stone-processing"},
		unit =
		{
			count = 60,
			ingredients = 
			{
				{"basic-tech-card", 1}
			},
			time = 30
		}
    },
	{
		type = "technology",
		name = "kr-crusher",
		icon = kr_technologies_icons_path .. "crusher.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-crusher"
			},
		},
		prerequisites = {"automation-core"},
		unit =
		{
			count = 40,
			ingredients = 
			{
				{"basic-tech-card", 1}
			},
			time = 15
		}
    },
	{
		type = "technology",
		name = "kr-containers",
		icon = kr_technologies_icons_path .. "containers.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-medium-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-big-container"
			}			
		},
		prerequisites = {"steel-processing"},
		unit =
		{
			count = 40,
			ingredients = 
			{
				{"basic-tech-card", 1}
			},
			time = 15
		}
    },
	{
		type = "technology",
		name = "kr-logistic-containers-1",
		localised_name = {"technology-name.kr-logistic-containers-1"},
		localised_description = {"technology-description.kr-logistic-containers-1"},
		icon = kr_technologies_icons_path .. "logistic-containers-1.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-medium-passive-provider-container"	
			},
			{
				type = "unlock-recipe",
				recipe = "kr-medium-storage-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-big-passive-provider-container"
			},	
			{
				type = "unlock-recipe",
				recipe = "kr-big-storage-container"
			}
		},
		prerequisites = {"kr-containers", "logistic-robotics"},
		unit =
		{
			count = 200,
			ingredients = 
			{
				{"basic-tech-card", 1},
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 30
		}
    },
	{
		type = "technology",
		name = "kr-logistic-containers-2",
		localised_name = {"technology-name.kr-logistic-containers-2"},
		localised_description = {"technology-description.kr-logistic-containers-2"},
		icon = kr_technologies_icons_path .. "logistic-containers-2.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",			
				recipe = "kr-medium-active-provider-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-medium-buffer-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-medium-requester-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-big-active-provider-container"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-big-buffer-container"
			},			
			{
				type = "unlock-recipe",			
				recipe = "kr-big-requester-container"
			}
		},
		prerequisites = {"kr-containers", "logistic-system"},
		unit =
		{
			count = 600,
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
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})