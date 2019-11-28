return
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "recipe",
		name = "kr-grow-wood",
		category = "growing",
		energy_required = 180,
		enabled = false,
		ingredients =
		{
			{type="fluid", name="water", amount=60}
		},
		result = "wood",
		result_count = 30
	},
	{
		type = "recipe",
		name = "automation-core",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"iron-gear-wheel", 2},
			{"iron-stick", 2},
			{"copper-plate", 5}
		},
		result = "automation-core",
		result_count = 1
	},
	{
		type = "recipe",
		name = "coke",
		energy_required = 10,
		enabled = false,
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
		name = "sand",
		category = "crushing",
		hide_from_player_crafting = true,
		always_show_made_in = true,
		allow_as_intermediate = false,
		allow_intermediates = false,
		always_show_products = true,
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"stone", 1}
		},
		result = "sand",
		result_count = 3
	},
	{
		type = "recipe",
		name = "glass",
		category = "smelting",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"sand", 3}
		},
		result = "glass",
		result_count = 1
	},
	{
		type = "recipe",
		name = "steel-gear-wheel",
		energy_required = 0.5,
		enabled = false,
		ingredients =
		{
			{"steel-plate", 2}
		},
		result = "steel-gear-wheel",
		result_count = 1
	},
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
}