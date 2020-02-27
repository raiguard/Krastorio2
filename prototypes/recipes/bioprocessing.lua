-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "growing"
return
{
	{
		type = "recipe",
		name = "kr-biomass-growing",
		category = "bioprocessing",
		energy_required = 180,
		enabled = false,
		ingredients =
		{
			{type="fluid", name="oxygen", amount=50},
			{type="fluid", name="crude-oil", amount=50},
			{name="biomass", amount=1}
		},
		results =
		{ 
			{type="item", name="biomass", amount=3}
		},
	}	
}