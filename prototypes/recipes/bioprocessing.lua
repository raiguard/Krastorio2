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
	}	
}