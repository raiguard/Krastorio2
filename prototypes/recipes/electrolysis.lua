-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "electrolysis"
return
{
	{
		type = "recipe",
		name = "kr-water-electrolysis",
		category = "electrolysis",
		icon = kr_recipes_icons_path .. "water-electrolysis.png",
		icon_size = 256,
		energy_required = 3,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients = 
		{
			{ type = "item", name = "sand", amount = 10 },
			{ type = "fluid", name = "water", amount = 40 }
		},
		results =
		{
			{ type = "fluid", name = "chlorine", amount = 20 },
			{ type = "fluid", name = "hydrogen", amount = 30 }
		},
		subgroup = "raw-material",
		order = "y01[air-separation]"
	},
	{
		type = "recipe",
		name = "kr-water-separation",
		category = "electrolysis",
		icon = kr_recipes_icons_path .. "water-separation.png",
		icon_size = 256,
		energy_required = 3,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients = 
		{
			{ type = "fluid", name = "water", amount = 50 }
		},
		results =
		{
			{ type = "fluid", name = "oxygen", amount = 20 },
			{ type = "fluid", name = "hydrogen", amount = 30 }
		},
		subgroup = "raw-material",
		order = "y01[air-separation]"
	}
}