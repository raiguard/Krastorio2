-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "smelting"
return
{
	{
		type = "recipe",
		name = "glass",
		category = "smelting",
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
		name = "silicon",
		category = "smelting",
		energy_required = 6.4,
		enabled = false,
		ingredients = 
		{
			{"quartz", 6}
		},
		result = "silicon",
		result_count = 3
    }
}