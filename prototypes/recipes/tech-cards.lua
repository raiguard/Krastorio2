-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE PRODUCTS THAT IS ONLY TOOLS
return
{
	{
		type = "recipe",
		name = "basic-tech-card",
		energy_required = 20,
		enabled = true,
		ingredients =
		{
			{"wood", 5},
			{"copper-cable", 5}
		},
		result = "basic-tech-card",
		result_count = 5
	},
	{
		type = "recipe",
		name = "matter-research-data",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"wood", 1},
		},
		result = "matter-research-data",
		result_count = 5
	},	
	{
		type = "recipe",
		name = "matter-tech-card",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"matter-research-data", 10},
			{"processing-unit", 5}
		},
		result = "matter-tech-card",
		result_count = 5
	}
}