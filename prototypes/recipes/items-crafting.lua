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
		result = "automation-core"
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
		result = "steel-gear-wheel"
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
		result = "steel-beam"
	},		
	{
		type = "recipe",
		name = "kr-creep-collector",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"iron-stick", 1},
			{"iron-gear-wheel", 5},
			{"automation-core", 1}
		},
		result = "kr-creep-collector"
	},	
	{
		type = "recipe",
		name = "first-aid-kit",
		energy_required = 5,
		enabled = false,
		ingredients =
		{
			{"biomass", 1},
			{"wood", 1},
			{"iron-plate", 1}
		},
		result = "first-aid-kit"
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
	},	
	{
		type = "recipe",
		name = "impulse-rifle",
		energy_required = 30,
		enabled = false,
		ingredients =
		{
			{"steel-plate", 5},
			{"low-density-structure", 5},
			{"imersite-crystal", 1},
			{"steel-gear-wheel", 1}
		},
		result = "impulse-rifle"
    },	
	{
		type = "recipe",
		name = "heavy-rocket-launcher",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"steel-plate", 5},
			{"low-density-structure", 5},
			{"steel-gear-wheel", 1},
			{"processing-unit", 1}			
		},
		result = "heavy-rocket-launcher"
    },	
	{
		type = "recipe",
		name = "impulse-rifle-ammo",
		energy_required = 5,
		enabled = false,
		ingredients =
		{
			{"lithium-sulfur-battery", 1},
			{"imersite-crystal", 1}
		},
		result = "impulse-rifle-ammo"
    },
	{
		type = "recipe",
		name = "imersite-rounds-magazine",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
			{"imersite-powder", 2},
			{"piercing-rounds-magazine", 1}
		},
		result = "imersite-rounds-magazine"
    },	
	{
		type = "recipe",
		name = "heavy-rocket",
		energy_required = 30,
		enabled = false,
		ingredients =
		{
			{"explosives", 20},
			{"steel-plate", 10},
			{"rocket-fuel", 10},
			{"plastic-bar", 10},			
			{"processing-unit", 5}			
		},
		result = "heavy-rocket"
    },
	{
		type = "recipe",
		name = "energy-control-unit",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{"low-density-structure", 5},
			{"imersite-powder", 3},
			{"lithium-sulfur-battery", 3}
		},
		result = "energy-control-unit"
    },
	{
		type = "recipe",
		name = "matter-stabilizer",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{"low-density-structure", 10},
			{"energy-control-unit", 5},
			{"processing-unit", 1}
		},
		result = "matter-stabilizer"
    },
	{
		type = "recipe",
		name = "matter-cube",
		category = "matter-deconversion",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{ type = "fluid", name = "matter", amount = 1000, catalyst_amount = 1000}
		},
		result = "matter-cube"
    },
	{
		type = "recipe",
		name = "antimatter-fuel-cell",
		category = "crafting-with-fluid",
		enabled = true,
		energy_required = 10,
		ingredients =
		{
			{ type = "fluid", name = "matter", amount = 6661, catalyst_amount = 6661},
			{ "matter-stabilizer", 2 }
		},
		result = "antimatter-fuel-cell"
    }	
}