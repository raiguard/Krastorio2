data:extend(
{
-----------------------------------------------------------------------------------------------------------------
---------------------------------------------------MIXED UNLOCKING-----------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "technology",
		name = "kr-iron-pickaxe",
		icon_size = 128,
		icon = kr_technologies_icons_path .. "iron-pickaxe.png",
		effects =
		{
			{
				type = "character-mining-speed",
				modifier = 0.75
			}
		},
		prerequisites = {},
		unit =
		{
			count = 50,
			ingredients =
			{
				{"basic-tech-card", 1}
			},
			time = 30
		},
		order = "b-c-a"
	},
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------BUILDINGS AND PROCESS RECIPES-------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "technology",
		name = "kr-fluids-chemistry",
		icon = kr_technologies_icons_path .. "fluids-chemistry.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-filtration-plant"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-electrolysis-plant"
			},
			{
				type = "unlock-recipe",
				recipe = "chemical-plant"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-water-electrolysis"
			}		
		},
		prerequisites = { "kr-basic-fluid-handling", "steel-processing" },
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
		name = "kr-atmosphere-condensation",
		icon = kr_technologies_icons_path .. "atmospheric-condenser.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-atmospheric-condenser"
			},
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["hydrogen"] or "hydrogen"
			},
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["oxygen"] or "oxygen"
			},
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["nitrogen"] or "nitrogen"
			}						
		},
		prerequisites = { "kr-fluids-chemistry", "electronics" },
		unit =
		{
			count = 150,
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
		name = "kr-air-purification",
		icon = kr_technologies_icons_path .. "air-purifier.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-air-purifier"
			},
			{
				type = "unlock-recipe",
				recipe = "pollution-filter"
			},
			{
				type = "unlock-recipe",
				recipe = "kr-air-cleaning"
			},
			{
				type = "unlock-recipe",
				recipe = "restore-used-pollution-filter"
			}
		},
		prerequisites = {"kr-advanced-chemistry", "engine"},
		order = "a-e-d",
		unit =
		{
			count = 250,
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
		name = "kr-fusion-energy",
		icon = kr_technologies_icons_path .. "fusion-energy.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",			
				recipe = "kr-fusion-reactor"
			},
			{
				type = "unlock-recipe",			
				recipe = "kr-advanced-steam-turbine"
			},
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["deuterium-oxide"] or "deuterium-oxide"
			},
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["tritium"] or "tritium"
			},
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["dt-fuel"] or "dt-fuel"
			},
		},
		prerequisites = {"advanced-electronics-2", "kr-lithium-processing", "nuclear-power"},
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
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------PURE RECIPES---------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
        type = "technology",
        name = "kr-silicon-processing",
        icon = kr_technologies_icons_path .. "silicon-processing.png",
        icon_size = 128,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = krastorio.recipes.changed_names["silicon"] or "silicon"
            },
            {
                type = "unlock-recipe",
                recipe = krastorio.recipes.changed_names["quartz"] or "quartz"
            }
        },
        prerequisites = {"kr-fluids-chemistry", "automation-2"},
		order = "c-a",
        unit =
        {
            count = 150,
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
        name = "kr-advanced-chemistry",
        icon = kr_technologies_icons_path .. "advanced-chemistry.png",
        icon_size = 128,
        effects =
        {
			{
                type = "unlock-recipe",
                recipe = "kr-water"
            },
            {
                type = "unlock-recipe",
                recipe = "kr-water-separation"
            },
			{
                type = "unlock-recipe",
                recipe = krastorio.recipes.changed_names["ammonia"] or "ammonia"
            },
			{
                type = "unlock-recipe",
                recipe = krastorio.recipes.changed_names["nitric-acid"] or "nitric-acid"
            },
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["hydrogen-chloride"] or "hydrogen-chloride"
			},
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["biomethanol"] or "biomethanol"
			},			
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["heavy-water"] or "heavy-water"
			}			
        },
        prerequisites = {"sulfur-processing", "kr-mineral-water-gathering", "kr-atmosphere-condensation"},
		order = "d-a",
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
            time = 60
        }
    },
	-- Enriched ores, copper and iron
	{
		type = "technology",
		name = "kr-enriched-ores",
		icon = kr_technologies_icons_path .. "enriched-ores.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "enriched-iron"
			},
			{
				type = "unlock-recipe",
				recipe = "enriched-copper"
			},
			{
				type = "unlock-recipe",
				recipe = "enriched-iron-plate"
			},
			{
				type = "unlock-recipe",
				recipe = "enriched-copper-plate"
			},
			{
				type = "unlock-recipe",
				recipe = "dirty-water-filtration-1"
			},
			{
				type = "unlock-recipe",
				recipe = "dirty-water-filtration-2"
			}			
		},
		prerequisites = {"kr-advanced-chemistry"},
		unit =
		{
			count = 250,
			ingredients = 
			{
				{"basic-tech-card", 1},
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 60
		}
    },
	{
		type = "technology",
		name = "kr-lithium-processing",
		icon = kr_technologies_icons_path .. "lithium-processing.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["lithium"] or "lithium"
			},
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["lithium-chloride"] or "lithium-chloride"
			}			
		},
		prerequisites = {"kr-advanced-chemistry"},
		unit =
		{
			count = 250,
			ingredients = 
			{
				{"basic-tech-card", 1},
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 60
		}
    },	
	{
		type = "technology",
		name = "kr-quarry-minerals-extraction",
		icon = kr_technologies_icons_path .. "quarry-drill.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "kr-quarry-drill"
			},
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["imersite-powder"] or "imersite-powder"
			},
			{
				type = "unlock-recipe",
				recipe = krastorio.recipes.changed_names["imersite-crystal"] or "imersite-crystal"
			}			
		},
		prerequisites = {"kr-advanced-chemistry", "advanced-electronics-2", "electric-engine"},
		order = "g-e-d",
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
			time = 60
		}
    }
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})