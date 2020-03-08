-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "fluid-filtration"
return
{
	{
		type = "recipe",
		name = "quartz",
		icon = kr_items_with_variations_icons_path .. "quartz/quartz.png",
		icon_size = 64,
		category = "fluid-filtration",
		subgroup = "raw-material",
		energy_required = 2.1,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients = 
		{
			{ type = "item", name = "sand", amount = 12 },
			{ type = "fluid", name = "water", amount = 12 }
		},
		results = 
		{
			{ type = "item", name = "quartz", amount = 6 },
			{ type = "item", name = "stone", probability = 0.3, amount = 1 }
		},
		crafting_machine_tint =
		{
			primary = {r = 0.75, g = 0.72, b = 0.5, a = 1}, --dirty
			secondary = {r = 0.9, g = 0.8, b = 0.95, a = 1} --clear
		}
    },
	---
	-- DIRTY WATER FILTRATION RECIPES
	---
	{
		type = "recipe",
		name = "dirty-water-filtration-1",
		category = "fluid-filtration",
		icons =
		{
			{
				icon      = data.raw.fluid["dirty-water"].icon,
				icon_size = data.raw.fluid["dirty-water"].icon_size
			},
			{
				icon      = data.raw.item["iron-ore"].icon,
				icon_size =	data.raw.item["iron-ore"].icon_size,
				scale = 0.20 * (data.raw.fluid["dirty-water"].icon_size/data.raw.item["iron-ore"].icon_size),
				shift = {0, 4} 
			}
		},
		icon_size = data.raw.fluid["dirty-water"].icon_size,
		energy_required = 2,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients =
		{
			{type = "fluid", name = "dirty-water", amount = 100, catalyst_amount = 100},	
		},
		results =
		{
			{type = "fluid", name = "water", amount = 100, catalyst_amount = 100},
			{type = "item",  name = "stone", probability = 0.30, amount = 1},
			{type = "item",  name = "iron-ore", probability = 0.10, amount = 1}
		},
		crafting_machine_tint =
		{
			primary = {r = 0.5, g = 0.4, b = 0.6, a = 1}, --dirty
			secondary = {r = 0.6, g = 0.75, b = 1, a = 1} --clear
		},
		subgroup = "raw-material",
		order = "w011[dirty-water-filtration-1]"
	},	
	{
		type = "recipe",
		name = "dirty-water-filtration-2",
		category = "fluid-filtration",
		icons =
		{
			{
				icon      = data.raw.fluid["dirty-water"].icon,
				icon_size = data.raw.fluid["dirty-water"].icon_size
			},
			{
				icon      = data.raw.item["copper-ore"].icon,
				icon_size =	data.raw.item["copper-ore"].icon_size,
				scale = 0.20 * (data.raw.fluid["dirty-water"].icon_size/data.raw.item["copper-ore"].icon_size),
				shift = {0, 4} 		
			}
		},
		icon_size = data.raw.fluid["dirty-water"].icon_size,
		energy_required = 2,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients =
		{
			{type = "fluid", name = "dirty-water", amount = 100, catalyst_amount = 100},		
		},
		results =
		{
			{type = "fluid", name = "water", amount = 100, catalyst_amount = 100},
			{type = "item",  name = "stone", probability = 0.30, amount = 1},
			{type = "item",  name = "copper-ore", probability = 0.10, amount = 1}
		},
		crafting_machine_tint =
		{
			primary = {r = 0.75, g = 0.4, b = 0.5, a = 1}, --dirty
			secondary = {r = 0.6, g = 0.75, b = 1, a = 1} --clear
		},
		subgroup = "raw-material",
		order = "w012[dirty-water-filtration-2]"
	},
	---
}