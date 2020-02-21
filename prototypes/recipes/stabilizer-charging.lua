-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "stabilizer-charging"
return
{
	{
		type = "recipe",
		name = "charge-stabilizer",
		category = "stabilizer-charging",
		subgroup = "intermediate-product",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"matter-stabilizer", 1}
		},
		result = "charged-matter-stabilizer"
    },
}
	