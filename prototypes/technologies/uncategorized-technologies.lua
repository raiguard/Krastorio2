data:extend(
{
-----------------------------------------------------------------------------------------------------------------
---------------------------------------------------MIXED UNLOCKING-----------------------------------------------
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
    }
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})