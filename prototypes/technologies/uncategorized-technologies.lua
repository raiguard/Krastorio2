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
				{"logistic-science-pack", 1}
			},
			time = 30
		}
    },
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
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------PURE RECIPES---------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
        type = "technology",
        name = "kr-advanced-chemistry",
        icon = kr_technologies_icons_path .. "advanced-chemistry.png",
        icon_size = 128,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "kr-water-separation"
            }
        },
        prerequisites = {"sulfur-processing", "kr-mineral-water-gathering", "kr-atmosphere-condensation"},
		order = "d-a",
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
    }
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})