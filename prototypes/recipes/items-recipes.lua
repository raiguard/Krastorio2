return
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "recipe",
		name = "kr-grow-wood",
		category = "greenhouse",
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
			{"iron-gear-wheel", 5},
			{"iron-stick", 5},
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
		name = "iron-beam",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"iron-plate", 3}
		},
		result = "iron-beam",
		result_count = 1
	},
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
}