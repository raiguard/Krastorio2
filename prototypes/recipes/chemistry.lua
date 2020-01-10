-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "chemistry"
return
{
	{
		type = "recipe",
		name = "enriched-iron",
		category = "chemistry",
		icon = kr_mip_icons_path .. "enriched-iron/enriched-iron.png",
		icon_size = 64,
		energy_required = 3,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients =
		{
			{type = "fluid", name = "sulfuric-acid", amount = 3},
			{type = "fluid", name = "water", amount = 25, catalyst_amount = 25},
			{type = "item",  name = "iron-ore", amount = 9}
		},
		results =
		{ 
			{type = "item",  name = "enriched-iron", amount = 6},
			{type = "fluid", name = "dirty-water", amount = 25, catalyst_amount = 25}
		},
		crafting_machine_tint =
		{
			primary = {r = 0.25, g = 0.50, b = 0.65, a = 0.200},
			secondary = {r = 0.50, g = 0.70, b = 0.90, a = 0.357},
			tertiary = {r = 0.10, g = 0.25, b = 0.50, a = 0.100}, 
			quaternary = {r = 0.25, g = 0.50, b = 0.65, a = 0.850}
		},
		subgroup = "raw-material",
		order = "e01[enriched-iron]"
	},
	{
		type = "recipe",
		name = "enriched-copper",
		icon = kr_mip_icons_path .. "enriched-copper/enriched-copper.png",
		icon_size = 64,
		category = "chemistry",
		energy_required = 3,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		allow_productivity = true,
		ingredients =
		{
			{type = "fluid", name = "sulfuric-acid", amount = 3},
			{type = "fluid", name = "water", amount = 25, catalyst_amount = 25},
			{type = "item",  name = "copper-ore", amount = 9}
		},
		results =
		{ 
			{type = "item",  name = "enriched-copper", amount = 6},
			{type = "fluid", name = "dirty-water", amount = 25, catalyst_amount = 25}
		},
		crafting_machine_tint =
		{
			primary = {r = 0.970, g = 0.501, b = 0.000, a = 0.000},
			secondary = {r = 0.200, g = 0.680, b = 0.300, a = 0.357},
			tertiary = {r = 0.430, g = 0.305, b = 0.2, a = 0.000}, 
			quaternary = {r = 0.970, g = 0.501, b = 0.000, a = 0.900}
		},
		subgroup = "raw-material",
		order = "e02[enriched-copper]"
	}
}
