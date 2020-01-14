-- A RECIPE FOR STAY IN THIS FILE SHOULD !!NOT!! HAVE THE ATTRIBUTE category
return
{
	{
		type = "recipe",
		name = "automation-core",
		energy_required = 3,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"iron-gear-wheel", 2},
			{"iron-stick", 2},
			{"copper-plate", 3}
		},
		result = "automation-core",
		result_count = 1
	},
	{
		type = "recipe",
		name = "electronic-components",
		energy_required = 4,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"silicon", 1},
			{"plastic-bar", 1},
			{"glass", 1}
		},
		result = "electronic-components",
		result_count = 2
	},
	{
		type = "recipe",
		name = "coke",
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
		name = "steel-gear-wheel",
		energy_required = 0.5,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"steel-plate", 2}
		},
		result = "steel-gear-wheel",
		result_count = 1
	},
	{
		type = "recipe",
		name = "steel-beam",
		energy_required = 3,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"steel-plate", 2}
		},
		result = "steel-beam",
		result_count = 1
	},
	{
		type = "recipe",
		name = "ai-core",
		category = "crafting-with-fluid",
		energy_required = 8,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{ type = "item",  name = "processing-unit", amount = 2 },
			{ type = "item",  name = "menarite-crystal", amount = 1 },
			{ type = "fluid", name = "nitric-acid", amount = 4 }
		},
		result = "ai-core",
		result_count = 1
	}
}