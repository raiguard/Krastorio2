-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "smelting"
return
{
	{
		type = "recipe",
		name = "kr-coal",
		category = "smelting",
		energy_required = 5,
		enabled = true,
		allow_productivity = true,
		ingredients =
		{
			{"wood", 5},
		},
		result = "coal",
		result_count = 3
	},
	{
		type = "recipe",
		name = "coke",
		category = "smelting",
		energy_required = 10,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"coal", 3},
			{"wood", 3}
		},
		result = "coke",
		result_count = 2
	},
	{
		type = "recipe",
		name = "glass",
		category = "smelting",
		energy_required = 3,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients =
		{
			{"sand", 3}
		},
		result = "glass",
		result_count = 1
	},
	{
		type = "recipe",
		name = "silicon",
		category = "smelting",
		energy_required = 6.4,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients = 
		{
			{"quartz", 6}
		},
		result = "silicon",
		result_count = 3
    },
	{
		type = "recipe",
		name = "enriched-iron-plate",
		category = "smelting",
		energy_required = 16,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients = 
		{
			{"enriched-iron", 5}
		},
		result = "iron-plate",
		result_count = 5
    },	
	{
		type = "recipe",
		name = "enriched-copper-plate",
		category = "smelting",
		energy_required = 16,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients = 
		{
			{"enriched-copper", 5}
		},
		result = "copper-plate",
		result_count = 5 
    }
}