-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "smelting"
return
{
	{
		type = "recipe",
		name = "coke",
		category = "smelting",
		energy_required = 16,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"coal", 6},
			{"wood", 6}
		},
		result = "coke",
		result_count = 6
	},
	{
		type = "recipe",
		name = "glass",
		category = "smelting",
		energy_required = 16,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients =
		{
			{"sand", 16}
		},
		result = "glass",
		result_count = 8
	},
	{
		type = "recipe",
		name = "silicon",
		category = "smelting",
		energy_required = 16,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients = 
		{
			{"quartz", 18}
		},
		result = "silicon",
		result_count = 9
    },
	{
		type = "recipe",
		name = "rare-metals",
		category = "smelting",
		subgroup = "raw-material",
		energy_required = 16,
		enabled = true,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients = 
		{
			{"raw-rare-metals", 10}
		},
		result = "rare-metals",
		result_count = 5
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
    },	
	{
		type = "recipe",
		name = "rare-metals-2",
		category = "smelting",
		subgroup = "raw-material",
		energy_required = 16,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients = 
		{
			{"enriched-rare-metals", 5}
		},
		result = "rare-metals",
		result_count = 5
    },
	{
		type = "recipe",
		name = "imersium-plate",
		category = "smelting",
		energy_required = 32,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients = 
		{
			{"imersite-powder", 9},
			{"rare-metals", 6}
		},
		result = "imersium-plate",
		result_count = 3
    }
}