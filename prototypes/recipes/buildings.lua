return
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "recipe",
		name = "kr-greenhouse",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"wood" , 20},
			{"iron-beam", 10},
			{"glass", 20},
			{"automation-core", 2}
		},
		result = "kr-greenhouse"		
    },	
	{
		type = "recipe",
		name = "kr-crusher",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"iron-beam", 10},
			{"iron-gear-wheel", 20},
			{"copper-cable", 6},
			{"automation-core", 2}
		},
		result = "kr-crusher"
    },
	{
		type = "recipe",
		name = "kr-shelter",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"iron-beam", 25},
			{"iron-plate", 25},
			{"copper-cable", 10},
			{"coal", 50}
		},
		result = "kr-shelter"
    },
	{
		type = "recipe",
		name = "kr-water-pumpjack",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"automation-core", 2},
			{"steel-gear-wheel", 5},
			{"steel-beam", 5},
			{"pipe", 5}			
		},
		result = "kr-water-pumpjack"
    },
	-- -- --
	-- NEW LABORATORIES
	-- -- --
    {
		type = "recipe",
		name = "biusart-lab",
		energy_required = 4,
		enabled = false,
		ingredients =
		{
			{"advanced-circuit", 5},
			{"steel-beam", 10},
			{"copper-cable", 10}
		},
		result = "biusart-lab"
    },
	-- -- --
	-- MEDIUM CONTEINERS
	-- -- --
	{
		type = "recipe",
		name = "kr-medium-active-provider-container",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
			{"kr-medium-container", 1},
			{"advanced-circuit", 5},
		},
		subgroup = "kr-logistics-2",
		order = "a[medium-active-provider-container]",
		result = "kr-medium-active-provider-container"
    },
	{
		type = "recipe",
		name = "kr-medium-buffer-container",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
			{"kr-medium-container", 1},
			{"advanced-circuit", 5}
		},
		subgroup = "kr-logistics-2",
		order = "b[medium-buffer-container]",
		result = "kr-medium-buffer-container"
    },
	{
		type = "recipe",
		name = "kr-medium-container",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"steel-chest", 2},
			{"steel-beam", 10}
		},
		subgroup = "storage",
		order = "a[items]-d[medium-container]",
		result = "kr-medium-container"
    },
	{
		type = "recipe",
		name = "kr-medium-passive-provider-container",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
			{"kr-medium-container", 1},
			{"advanced-circuit", 5}
		},
		subgroup = "kr-logistics-2",
		order = "c[medium-passive-provider-container]",
		result = "kr-medium-passive-provider-container"
	},
	{
		type = "recipe",
		name = "kr-medium-requester-container",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
			{"kr-medium-container", 1},
			{"advanced-circuit", 5}
		},
		subgroup = "kr-logistics-2",
		order = "d[medium-requester-container]",
		result = "kr-medium-requester-container"
    },
	{
		type = "recipe",
		name = "kr-medium-storage-container",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
			{"kr-medium-container", 1},
			{"advanced-circuit", 5}
		},
		subgroup = "kr-logistics-2",
		order = "e[medium-storage-container]",
		result = "kr-medium-storage-container"
    },	
	-- -- --
	-- BIG CONTEINERS
	-- -- --
	{
		type = "recipe",
		name = "kr-big-active-provider-container",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"kr-big-container", 1},
			{"advanced-circuit", 5}
		},
		subgroup = "kr-logistics-3",
		order = "a[big-active-provider-container]",
		result = "kr-big-active-provider-container"
    },
	{
		type = "recipe",
		name = "kr-big-buffer-container",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"kr-big-container", 1},
			{"advanced-circuit", 5}
		},
		subgroup = "kr-logistics-3",
		order = "b[big-buffer-container]",
		result = "kr-big-buffer-container"
    },	
	{
		type = "recipe",
		name = "kr-big-container",
		energy_required = 30,
		enabled = false,
		ingredients =
		{
			{"kr-medium-container", 4},
			{"steel-beam", 20}
		},
		subgroup = "storage",
		order = "a[items]-dz[big-container]",
		result = "kr-big-container"
    },
	{
		type = "recipe",
		name = "kr-big-passive-provider-container",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"kr-big-container", 1},
			{"advanced-circuit", 5}
		},
		subgroup = "kr-logistics-3",
		order = "c[big-passive-provider-container]",
		result = "kr-big-passive-provider-container"
    },
	{
		type = "recipe",
		name = "kr-big-requester-container",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"kr-big-container", 1},
			{"advanced-circuit", 5}
		},
		subgroup = "kr-logistics-3",
		order = "d[big-requester-container]",
		result = "kr-big-requester-container"
    },	
	{
		type = "recipe",
		name = "kr-big-storage-container",
		energy_required = 3,
		enabled = false,
		ingredients =
		{
			{"kr-big-container", 1},
			{"advanced-circuit", 5}
		},
		subgroup = "kr-logistics-3",
		order = "e[big-storage-container]",
		result = "kr-big-storage-container"
    },	
	-- -- --
	-- FLUID STORAGES
	-- -- --
	{
		type = "recipe",
		name = "kr-fluid-storage-1",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"steel-beam", 20},
			{"kr-steel-pipe", 4}
		},
		result = "kr-fluid-storage-1"
    },	
	{
		type = "recipe",
		name = "kr-fluid-storage-2",
		energy_required = 30,
		enabled = false,
		ingredients =
		{
			{"steel-beam", 20},
			{"kr-steel-pipe", 12}
		},
		result = "kr-fluid-storage-2"
    },	
	-- -- --
	{
		type = "recipe",
		name = "kr-steel-pipe",
		normal =
		{
			enabled = false,
			ingredients = 
			{
				{"steel-plate", 1}
			},
			result = "kr-steel-pipe"
		},
		expensive =
		{
			enabled = false,
			ingredients = 
			{
				{"steel-plate", 2}
			},
			result = "kr-steel-pipe"
		}		
	},  
	{
		type = "recipe",
		name = "kr-steel-pipe-to-ground",
		enabled = false,
		ingredients =
		{
			{"kr-steel-pipe", 15},
			{"steel-plate", 5}
		},		
		result = "kr-steel-pipe-to-ground",
		result_count = 2
	},
	{
		type = "recipe",
		name = "kr-steel-pump",
		energy_required = 2,
		enabled = false,
		ingredients =
		{
			{"steel-gear-wheel", 4},
			{"engine-unit", 1},
			{"steel-beam", 1},
			{"kr-steel-pipe", 1}
		},
		result = "kr-steel-pump"
	},
	{
		type = "recipe",
		name = "kr-electrolysis-plant",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"steel-beam", 10},
			{"automation-core", 3},
			{"copper-plate", 10},
			{"engine-unit", 2}
		},
		result = "kr-electrolysis-plant"
    },	
	{
		type = "recipe",
		name = "kr-filtration-plant",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"steel-beam", 10},
			{"automation-core", 3},
			{"glass", 10},
			{"engine-unit", 2}
		},
		result = "kr-filtration-plant"
    },
	{
		type = "recipe",
		name = "kr-atmospheric-condenser",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"steel-beam", 10},
			{"steel-gear-wheel", 10},
			{"electronic-circuit", 3},			
			{"engine-unit", 2}
		},
		result = "kr-atmospheric-condenser"
    },	
	{
		type = "recipe",
		name = "kr-quarry-drill",
		energy_required = 120,
		enabled = false,
		ingredients = 
		{
			{"steel-beam", 50},
			{"steel-plate", 50},			
			{"electric-engine-unit", 100},
			{"processing-unit", 20}
		},
		result = "kr-quarry-drill"
	},	
	{
		type = "recipe",
		name = "kr-fusion-reactor",
		energy_required = 120,
		enabled = false,
		ingredients = 
		{
			{"steel-beam", 500},
			{"steel-plate", 500},
			{"processing-unit", 100}
		},
		result = "kr-fusion-reactor"
	},	
	{
		type = "recipe",
		name = "kr-advanced-steam-turbine",
		energy_required = 60,
		enabled = false,
		ingredients =
		{
			{"steam-turbine", 2},
			{"steel-gear-wheel", 10},
			{"steel-beam", 50},
			{"copper-plate", 50},
			{"kr-steel-pipe", 10},				
			{"electric-engine-unit", 50}					
		},
		result = "kr-advanced-steam-turbine"
    },
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
}