-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "centrifuging"
return
{
	{
		type = "recipe",
		name = "tritium",
		category = "centrifuging",
		energy_required = 12,
		enabled = false,
		always_show_made_in = true,
		allow_productivity = true,
		ingredients =
		{
			{"lithium", 5},
			{"rare-metals", 5}
		},
		result = "tritium"
	}
}