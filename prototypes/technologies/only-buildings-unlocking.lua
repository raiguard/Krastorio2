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
				recipe = "kr-grow-wood-with-water"
			}
		},
		prerequisites = {"kr-automation-core", "kr-stone-processing"},
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
		name = "kr-decorations",
		icon = kr_technologies_icons_path .. "decorations.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "tree-01"
			},
			{
				type = "unlock-recipe",
				recipe = "tree-02"
			},
			{
				type = "unlock-recipe",
				recipe = "tree-03"
			},
			{
				type = "unlock-recipe",
				recipe = "tree-04"
			},
			{
				type = "unlock-recipe",
				recipe = "tree-05"
			},
			{
				type = "unlock-recipe",
				recipe = "tree-06"
			},
			{
				type = "unlock-recipe",
				recipe = "tree-07"
			},
			{
				type = "unlock-recipe",
				recipe = "tree-08"
			},
			{
				type = "unlock-recipe",
				recipe = "tree-09"
			},
			{
				type = "unlock-recipe",
				recipe = "rock-big"
			},
			{
				type = "unlock-recipe",
				recipe = "rock-huge"
			}
		},
		prerequisites = {"kr-greenhouse"},
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
			}
		},
		prerequisites = {"kr-automation-core"},
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
			count = 100,
			ingredients = 
			{
				{"basic-tech-card", 1}
			},
			time = 20
		}
    },
	-----------------------------------------------------------------------
	-- AUTOMATION TIER AND UPPER
	-----------------------------------------------------------------------
	{
		type = "technology",
		name = "kr-shelter",
		icon = kr_technologies_icons_path .. "shelter.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-shelter"
			}
		},
		prerequisites = {"automation-science-pack"},
		unit =
		{
			count = 50,
			ingredients = 
			{
				{"basic-tech-card", 1},
				{"automation-science-pack", 1}
			},
			time = 20
		}
    },
	{
		type = "technology",
		name = "kr-electric-mining-drill",	
		icon = kr_technologies_icons_path .. "electric-mining-drill.png",
		icon_size = 128,		
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "electric-mining-drill"
			}
		},
		prerequisites = {"automation-science-pack"},
		unit =
		{
			count = 40,
			ingredients = 
			{
				{"basic-tech-card", 1},
				{"automation-science-pack", 1}
			},
			time = 15
		}
	},
	{
		type = "technology",
		name = "kr-mineral-water-gathering",
		icon = kr_technologies_icons_path .. "mineral-water-gathering.png",
		icon_size = 128,
		prerequisites = {"fluid-handling", "kr-fluids-chemistry"},
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-water-pumpjack"
			}
		},
		unit =
		{
			count = 100,
			ingredients = 
			{
				{"basic-tech-card", 1},
				{"automation-science-pack", 1},
                {"logistic-science-pack", 1}
			},
			time = 30
		}
	},
	-----------------------------------------------------------------------
	-- LOGISTIC TIER AND UPPER
	-----------------------------------------------------------------------
	{
		type = "technology",
		name = "kr-radar&watchtower",	
		icon = kr_technologies_icons_path .. "radar&watchtower.png",
		icon_size = 128,
		prerequisites = {"electronics", "steel-processing"},
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "radar"
			}
		},
		unit =
		{
			count = 200,
			ingredients = 
			{
				{"basic-tech-card", 1},
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 20
		}
	},
	{
		type = "technology",
		name = "kr-steel-fluid-handling",
		icon = kr_technologies_icons_path .. "basic-fluid-handling.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-steel-pipe"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-steel-pipe-to-ground"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-steel-pump"
			}
		},
		prerequisites = {"steel-processing", "fluid-handling"},
		unit =
		{
			count = 100,
			ingredients = 
			{
				{"basic-tech-card", 1},
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 30
		}
    },	
	{
		type = "technology",
		name = "kr-steel-fluid-tanks",
		icon = kr_technologies_icons_path .. "steel-fluid-tanks.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-fluid-storage-1"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-fluid-storage-2"
			}
		},
		prerequisites = {"kr-steel-fluid-handling"},
		unit =
		{
			count = 120,
			ingredients = 
			{
				{"basic-tech-card", 1},
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 30
		}
    },
	-----------------------------------------------------------------------
	-- CHEMICAL TIER AND UPPER
	-----------------------------------------------------------------------
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
		name = "kr-advanced-lab",
		icon = kr_technologies_icons_path .. "biusart-lab.png",
		icon_size = 128,
		prerequisites = {"advanced-electronics"},
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "biusart-lab"	
			}
		},
		unit =
		{
			count = 300,
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
	-----------------------------------------------------------------------
	-- PRODUCTION TIER AND UPPER
	-----------------------------------------------------------------------
	{
		type = "technology",
		name = "kr-fusion-energy",
		icon = kr_technologies_icons_path .. "fusion-energy.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",			
				recipe = "kr-fusion-reactor"
			}
		},
		prerequisites = {"advanced-electronics-2", "nuclear-power"},
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"production-science-pack", 1}
			},
			time = 45
		}
    },
	-----------------------------------------------------------------------
	-- UTILITY TIER AND UPPER
	-----------------------------------------------------------------------
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
				{"production-science-pack", 1},
				{"utility-science-pack", 1}
			},
			time = 30
		}
    }
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})