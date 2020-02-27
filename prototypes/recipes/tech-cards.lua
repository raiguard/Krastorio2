-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE PRODUCTS THAT IS ONLY TOOLS
return
{
	{
		type = "recipe",
		name = "blank-tech-card",
		energy_required = 1,
		enabled = false,
		ingredients =
		{
			{"iron-plate", 1},
			{"copper-cable", 1}			
		},
		result = "blank-tech-card",
		result_count = 5
	},
	{
		type = "recipe",
		name = "biters-research-data",
		energy_required = 40,
		enabled = false,
		ingredients =
		{
			{"biomass", 10},
			{"coke", 5},
			{"steel-plate", 5}			
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
		name = "space-science-pack",
		category = "t3-tech-cards",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"blank-tech-card", 10},
			{"space-research-data", 5}
		},
		result = "space-science-pack",
		result_count = 5
	},	
	{
		type = "recipe",
		name = "matter-research-data",
		category = "t3-tech-cards",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"imersite-crystal", 5},
			{"rare-metals", 5},
			{"lithium", 5},
			{"plastic-bar", 5}
		},
		result = "matter-research-data",
		result_count = 5
	},	
	{
		type = "recipe",
		name = "matter-tech-card",
		category = "t3-tech-cards",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"blank-tech-card", 15},
			{"matter-research-data", 10},
			{"processing-unit", 5}			
		},
		result = "matter-tech-card",
		result_count = 5
	},
	{
		type = "recipe",
		name = "advanced-tech-card",
		category = "t3-tech-cards",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"blank-tech-card", 15},
			{"imersium-gear-wheel", 20},
			{"lithium-sulfur-battery", 10},
			{"electric-engine-unit", 5}
		},
		result = "advanced-tech-card",
		result_count = 5
	},
	{
		type = "recipe",
		name = "singularity-research-data",
		category = "t3-tech-cards",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"imersium-plate", 10},
			{"charged-matter-stabilizer", 5},
			{"energy-control-unit", 5}
		},
		result = "singularity-research-data",
		result_count = 5
	},	
	{
		type = "recipe",
		name = "singularity-tech-card",
		category = "t3-tech-cards",
		energy_required = 20,
		enabled = false,
		ingredients =
		{
			{"blank-tech-card", 15},
			{"singularity-research-data", 10},
			{"ai-core", 5}			
		},
		result = "singularity-tech-card",
		result_count = 5
	}
}