-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "fluid-filtration"
return
{
	{
		type = "recipe",
		name = "quartz",
		icon = kr_mip_icons_path .. "quartz/quartz.png",
		icon_size = 64,
		category = "fluid-filtration",
		subgroup = "raw-material",
		energy_required = 3,
		enabled = false,
		always_show_made_in = true,
		always_show_products = true,
		ingredients = 
		{
			{ type = "item", name = "sand", amount = 6 },
			{ type = "fluid", name = "water", amount = 10 }
		},
		results = 
		{
			{ type = "item", name = "quartz", amount = 3 },
			{ type = "item", name = "stone", probability = 0.3, amount = 1 }
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
		subgroup = "raw-material",
		order = "w012[dirty-water-filtration-2]"
	},
	---
}