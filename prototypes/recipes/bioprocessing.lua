-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "growing"
return
{
	{
		type = "recipe",
		name = "kr-biters-research-data",
		category = "bioprocessing",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"biomass", 5}
		},
		result = "biters-research-data"
	},
	{
		type = "recipe",
		name = "kr-fertilizer",
		category = "bioprocessing",
		energy_required = 180,
		enabled = false,
		ingredients =
		{
			{type="fluid", name="sulfuric-acid", amount=5},
			{type="fluid", name="nitric-acid", amount=5},
			{name="biomass", amount=1}
		},
		results =
		{ 
			{type="item", name="fertilizer", amount=5}
		},
	},
	{
		type = "recipe",
		name = "kr-first-aid-kit",
		category = "bioprocessing",
		energy_required = 5,
		enabled = false,
		ingredients =
		{
			{"biomass", 1},
			{"wood", 1},
			{"iron-plate", 1}
		},
		result = "first-aid-kit"
	},
	{
		type = "recipe",
		name = "kr-biomass",
		category = "bioprocessing",
		energy_required = 180,
		enabled = false,
		ingredients =
		{
			{type="fluid", name="oxygen", amount=50},
			{type="fluid", name="crude-oil", amount=50},
			{name="biomass", amount=50}
		},
		results =
		{ 
			{type="item", name="biomass", amount=60}
		},
	},
	
}