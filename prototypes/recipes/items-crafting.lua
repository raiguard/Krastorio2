-- A RECIPE FOR STAY IN THIS FILE SHOULD !!NOT!! HAVE THE ATTRIBUTE category
return
{
	{
		type = "recipe",
		name = "automation-core",
		energy_required = 3,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"iron-gear-wheel", 2},
			{"iron-stick", 2},
			{"copper-plate", 3}
		},
		result = "automation-core",
		result_count = 1
	},
	{
		type = "recipe",
		name = "electronic-components",
		energy_required = 4,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"silicon", 1},
			{"plastic-bar", 1},
			{"glass", 1}
		},
		result = "electronic-components",
		result_count = 2
	},
	{
		type = "recipe",
		name = "steel-gear-wheel",
		energy_required = 0.5,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"steel-plate", 2}
		},
		result = "steel-gear-wheel",
		result_count = 1
	},
	{
		type = "recipe",
		name = "steel-beam",
		energy_required = 3,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"steel-plate", 2}
		},
		result = "steel-beam",
		result_count = 1
	},
	{
		type = "recipe",
		name = "ai-core",
		category = "crafting-with-fluid",
		energy_required = 8,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{ type = "item",  name = "processing-unit", amount = 2 },
			{ type = "item",  name = "imersite-crystal", amount = 1 },
			{ type = "fluid", name = "nitric-acid", amount = 4 }
		},
		result = "ai-core",
		result_count = 1
	},
	{
		type = "recipe",
		name = "pollution-filter",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"coal", 2},
			{"steel-plate", 2},
			{"plastic-bar", 2}
		},
		result = "pollution-filter"
    },
	{
		type = "recipe",
		name = "restore-used-pollution-filter",
		category = "crafting-with-fluid",
		icon = kr_recipes_icons_path .. "restore-used-pollution-filter.png",
		icon_size = 128,
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			 {type = "item",  name = "used-pollution-filter", amount = 1},
			{ type = "fluid", name = "water", amount = 50}
		},
		results =
		{
			{ type = "item",  name = "pollution-filter", amount = 1},
			{ type = "fluid", name = "dirty-water", amount = 50}
		},
		subgroup = "intermediate-product",
		order = "06[restore-used-pollution-filter]"
    },
	---
	-- Drill heads
	---
	{
		type = "recipe",
		name = "steel-drill-head",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"steel-plate", 10},
			{"steel-gear-wheel", 5},
			{"steel-beam", 1}
		},
		result = "steel-drill-head"
    },	
	{
		type = "recipe",
		name = "alloy-drill-head",
		energy_required = 5,
		enabled = false,
		ingredients =
		{
			{"steel-drill-head", 1},
			{"rare-metals", 2}
		},
		result = "alloy-drill-head"
    },
	{
		type = "recipe",
		name = "imersite-drill-head",
		energy_required = 5,
		enabled = false,
		ingredients =
		{
			{"alloy-drill-head", 1},
			{"imersite-crystal", 2}
		},
		result = "imersite-drill-head"
    },
	---
	{
		type = "recipe",
		name = "imersium-gear-wheel",
		energy_required = 0.5,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"imersium-plate", 2}
		},
		result = "imersium-gear-wheel",
		result_count = 1
	},
	{
		type = "recipe",
		name = "imersium-beam",
		energy_required = 3,
		enabled = false,
		allow_productivity = true,
		ingredients =
		{
			{"imersium-plate", 2}
		},
		result = "imersium-beam",
		result_count = 1
	}
}