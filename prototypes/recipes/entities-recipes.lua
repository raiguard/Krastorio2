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
			{"wood" , 100},
			{"iron-beam", 10},
			{"glass", 10},
			{"automation-core", 1}
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
			{"automation-core", 1}
		},
		result = "kr-crusher"
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
			{"steel-pipe", 4}
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
			{"steel-pipe", 12}
		},
		result = "kr-fluid-storage-2"
    },	
	-- -- --
	


	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
}