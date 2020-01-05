-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "electrolysis"
return
{
	{
		type = "recipe",
		name = "quartz",
		icon = kr_mip_icons_path .. "quartz/quartz.png",
		icon_size = 64,
		category = "electrolysis",
		subgroup = "raw-material",
		energy_required = 3,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients = 
		{
			{ "sand", 6 },
			{ type = "fluid", name = "water", amount = 10 }
		},
		results = 
		{
			{ type = "item", name = "quartz", amount = 3 },
			{ type = "item", name = "stone", probability = 0.3, amount = 1 }
		}
    },
	{
		type = "recipe",
		name = "kr-water-electrolysis",
		category = "electrolysis",
		icon = kr_recipes_icons_path .. "water-electrolysis.png",
		icon_size = 64,
		energy_required = 3,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients = 
		{
			{ type = "fluid", name = "water", amount = 50 }
		},
		results=
		{
			{ type = "fluid", name = "chlorine", amount = 25 },
			{ type = "fluid", name = "hydrogen", amount = 25 }
		},
		subgroup = "raw-material",
		order = "y01[air-separation]"
	}
}