-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "growing"
return
{
	{
		type = "recipe",
		name = "kr-biomass-growing",
		category = "bioprocessing",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{type="fluid", name="petroleum-gas", amount=50},
			{type="fluid", name="oxygen", amount=50}			
		},
		results =
		{ 
			{type="item", name="biomass", amount=5}
		}
	},
	{
		type = "recipe",
		name = "kr-creep-virus",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
			{"poison-capsule", 1},
			{"biomass", 25},
			{"imersite-powder", 5}
		},
		result = "kr-creep-virus"
	},
	{
		type = "recipe",
		name = "kr-biter-virus",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
			{"poison-capsule", 1},
			{"biomass", 25},
			{"imersite-powder", 5}
		},
		result = "kr-biter-virus"
	}
}