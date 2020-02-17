-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE PRODUCTS THAT IS ONLY TOOLS
return
{
	{
		type = "recipe",
		name = "biters-research-data",
		energy_required = 50,
		enabled = false,
		ingredients =
		{
			{"biomass", 25}
		},
		result = "biters-research-data",
		result_count = 5
	},
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
	},
	{
		type = "recipe",
		name = "advanced-tech-card",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"wood", 1},
		},
		result = "advanced-tech-card",
		result_count = 5
	},
	{
		type = "recipe",
		name = "singularity-research-data",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"wood", 1},
		},
		result = "singularity-research-data",
		result_count = 5
	},	
	{
		type = "recipe",
		name = "singularity-tech-card",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"singularity-research-data", 10}
		},
		result = "singularity-tech-card",
		result_count = 5
	}
}