data:extend(
{
-----------------------------------------------------------------------------------------------------------------
---------------------------------------------ONLY BUILDINGS UNLOCKING--------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "technology",
		name = "kr-basic-fluid-handling",
		mod = "Krastorio2",
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
		mod = "Krastorio2",
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
		mod = "Krastorio2",
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
		mod = "Krastorio2",
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
		mod = "Krastorio2",
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
			time = 30
		}
    },
	{
		type = "technology",
		name = "kr-containers",
		mod = "Krastorio2",
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
			time = 30
		}
    },
	-----------------------------------------------------------------------
	-- AUTOMATION TIER AND UPPER
	-----------------------------------------------------------------------
	{
		type = "technology",
		name = "kr-shelter",
		mod = "Krastorio2",
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
			count = 100,
			ingredients = 
			{
				{"basic-tech-card", 1},
				{"automation-science-pack", 1}
			},
			time = 30
		}
    },
	{
		type = "technology",
		name = "kr-electric-mining-drill",
		mod = "Krastorio2",		
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
			time = 30
		}
	},
	{
		type = "technology",
		name = "kr-mineral-water-gathering",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "mineral-water-gathering.png",
		icon_size = 128,
		prerequisites = {"fluid-handling", "kr-fluids-chemistry"},
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-mineral-water-pumpjack"
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
		name = "kr-sentinel",	
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "sentinel.png",
		icon_size = 128,
		prerequisites = {"optics", "kr-stone-processing"},
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-sentinel"
			}
		},
		unit =
		{
			count = 100,
			ingredients = 
			{
				{"basic-tech-card", 1},
				{"automation-science-pack", 1}
			},
			time = 30
		}
	},
	{
		type = "technology",
		name = "kr-radar",	
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "radar.png",
		icon_size = 128,
		prerequisites = {"kr-sentinel", "electronics", "steel-processing"},
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
			time = 30
		}
	},
	{
		type = "technology",
		name = "kr-steel-fluid-handling",
		mod = "Krastorio2",
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
		mod = "Krastorio2",
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
	{
		type = "technology",
		name = "kr-gas-power-station",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "gas-power-station.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-gas-power-station"
			}
		},
		prerequisites = {"oil-processing", "engine"},
		unit =
		{
			count = 400,
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
		mod = "Krastorio2",
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
		mod = "Krastorio2",
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
	-- nothing
	-----------------------------------------------------------------------
	-- UTILITY TIER AND UPPER
	-----------------------------------------------------------------------
	{
		type = "technology",
		name = "kr-logistic-containers-2",
		mod = "Krastorio2",
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
    },
	{
		type = "technology",
		name = "kr-singularity-lab",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "singularity-lab.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",			
				recipe = "kr-singularity-lab"
			}
		},
		prerequisites = {"kr-ai-core", "rocket-silo"},
		unit =
		{
			count = 1200,
			ingredients = 
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"production-science-pack", 1},
				{"utility-science-pack", 1}
			},
			time = 60
		}
    },
	{
		type = "technology",
		name = "kr-logistic-4",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "logistics-4.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",			
				recipe = "kr-advanced-splitter"
			},
			{
				type = "unlock-recipe",			
				recipe = "kr-advanced-transport-belt"
			},
			{
				type = "unlock-recipe",			
				recipe = "kr-advanced-underground-belt"
			}
		},
		prerequisites = {"logistics-3"},
		unit =
		{
			count = 1000,
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
    },
	{
		type = "technology",
		name = "kr-logistic-5",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "logistics-5.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",			
				recipe = "kr-superior-splitter"
			},
			{
				type = "unlock-recipe",			
				recipe = "kr-superior-transport-belt"
			},
			{
				type = "unlock-recipe",			
				recipe = "kr-superior-underground-belt"
			}
		},
		prerequisites = {"kr-logistic-4", "kr-imersium-processing"},
		unit =
		{
			count = 1500,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"advanced-tech-card", 1}
			},
			time = 30
		}
    },
	{
		type = "technology",
		name = "kr-advanced-furnace",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "advanced-furnace.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",			
				recipe = "kr-advanced-furnace"
			}
		},
		prerequisites = {"kr-imersium-processing", "kr-energy-control-unit"},
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-advanced-roboports",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "advanced-roboports.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",			
				recipe = "kr-small-roboport"
			},
			{
				type = "unlock-recipe",			
				recipe = "kr-large-roboport"
			}
		},
		prerequisites = {"kr-imersium-processing"},
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-advanced-chemical-plant",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "advanced-chemical-plant.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",			
				recipe = "kr-advanced-chemical-plant"
			}		
		},
		prerequisites = {"kr-imersium-processing"},
		unit =
		{
			count = 1000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1}
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-singularity-beacon",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "singularity-beacon.png",
		icon_size = 128,
		effects =
		{
		
		},
		prerequisites = {"kr-imersium-processing", "kr-energy-control-unit", "kr-singularity-tech-card"},
		unit =
		{
			count = 1500,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 45
		}
    },
	{
		type = "technology",
		name = "kr-intergalactic-transceiver",
		mod = "Krastorio2",
		icon = kr_technologies_icons_path .. "intergalactic-transceiver.png",
		icon_size = 128,
		effects =
		{
		
		},
		prerequisites = {"kr-imersium-processing", "kr-energy-control-unit", "kr-singularity-tech-card"},
		unit =
		{
			count = 3000,
			ingredients = 
			{
				{"production-science-pack", 1},
				{"utility-science-pack", 1},
				{"space-science-pack", 1},
				{"matter-tech-card", 1},
				{"advanced-tech-card", 1},
				{"singularity-tech-card", 1}
			},
			time = 60
		}
    }
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})

-- Loader recipes
if krastorio.general.getSafeSettingValue("kr-loaders") then
	krastorio.technologies.addUnlockRecipe("kr-logistic-4", "kr-advanced-loader")
	krastorio.technologies.addUnlockRecipe("kr-logistic-5", "kr-superior-loader")
end
