-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "fluid-filtration"
return
{
	{
		type = "recipe",
		name = "quartz",
		icon = kr_mip_icons_path .. "quartz/quartz.png",
		icon_size = 64,
		category = "fluid-filtration",
		subgroup = "raw-material",
		energy_required = 3,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients = 
		{
			{ type = "item", name = "sand", amount = 6 },
			{ type = "fluid", name = "water", amount = 10 }
		},
		results = 
		{
			{ type = "item", name = "quartz", amount = 3 },
			{ type = "item", name = "stone", probability = 0.3, amount = 1 }
		}
    }
}