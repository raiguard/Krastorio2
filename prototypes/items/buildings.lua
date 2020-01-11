data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
    {
		type = "item",
		name = "kr-wind-turbine",
		icon =  kr_entities_icons_path .. "wind-turbine.png",
		icon_size = 64,
		subgroup = "energy",
		order = "c[solar-panel]-a[wind-turbine]",
		place_result = "kr-wind-turbine",
		stack_size = 50
	},
    {
		type = "item",
		name = "kr-greenhouse",
		icon =  kr_entities_icons_path .. "greenhouse.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "d-g1[greenhouse]",
		place_result = "kr-greenhouse",
		stack_size = 50
    },
    {
		type = "item",
		name = "kr-research-server",
		icon =  kr_entities_icons_path .. "research-server.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "aaa",
		place_result = "kr-research-server",
		stack_size = 50
    },
    {
		type = "item",
		name = "kr-crusher",
		icon =  kr_entities_icons_path .. "crusher.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "d-h1[crusher]",
		place_result = "kr-crusher",
		stack_size = 50
    },	
	{
		type = "item",
		name = "kr-shelter",
		icon =  kr_entities_icons_path .. "shelter.png",
		icon_size = 64,
		subgroup = "storage",
		order = "aaa",
		place_result = "kr-shelter",
		stack_size = 1
    },	
    {
		type = "item",
		name = "kr-water-pumpjack",
		icon =  kr_entities_icons_path .. "water-pumpjack.png",
		icon_size = 64,
		subgroup = "extraction-machine",
		order = "b[fluids]-b[water-pumpjack]",
		place_result = "kr-water-pumpjack",
		stack_size = 50
    },	
	{
		type = "item",
		name = "kr-quarry-drill",
		icon =  kr_entities_icons_path .. "quarry-drill.png",
		icon_size = 64,
		subgroup = "extraction-machine",
		order = "a[items]-c[quarry-drill]",
		place_result = "kr-quarry-drill",
		stack_size = 50
    },
	-- -- --
	-- NEW LABORATORIES
	-- -- --
    {
		type = "item",
		name = "biusart-lab",
		icon =  kr_entities_icons_path .. "biusart-lab.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "g[advanced-lab]",
		place_result = "biusart-lab",
		stack_size = 10
    },
	-- -- --
	-- MEDIUM CONTEINERS
	-- -- --
	{
		type = "item",
		name = "kr-medium-active-provider-container",
		icon = kr_entities_icons_path .. "containers/medium-containers/" .. "medium-active-provider-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "kr-logistics-2",
		order = "a[medium-active-provider-container]",
		place_result = "kr-medium-active-provider-container"
    },
	{
		type = "item",
		name = "kr-medium-buffer-container",
		icon = kr_entities_icons_path .. "containers/medium-containers/" .. "medium-buffer-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "kr-logistics-2",
		order = "b[medium-buffer-container]",
		place_result = "kr-medium-buffer-container"
    },	
	{
		type = "item",
		name = "kr-medium-container",
		icon = kr_entities_icons_path .. "containers/medium-containers/" .. "medium-container.png",
		stack_size = 50,
		icon_size = 32,
		subgroup = "storage",
		order = "a[items]-d[medium-container]",
		place_result = "kr-medium-container"
    },
	{
		type = "item",
		name = "kr-medium-passive-provider-container",
		icon = kr_entities_icons_path .. "containers/medium-containers/" .. "medium-passive-provider-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "kr-logistics-2",
		order = "c[medium-passive-provider-container]",
		place_result = "kr-medium-passive-provider-container"
    },
	{
		type = "item",
		name = "kr-medium-requester-container",
		icon = kr_entities_icons_path .. "containers/medium-containers/" .. "medium-requester-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "kr-logistics-2",
		order = "d[medium-requester-container]",
		place_result = "kr-medium-requester-container"
    },
	{
		type = "item",
		name = "kr-medium-storage-container",
		icon = kr_entities_icons_path .. "containers/medium-containers/" .. "medium-storage-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "kr-logistics-2",
		order = "e[medium-storage-container]",
		place_result = "kr-medium-storage-container"
    },	
	-- -- --
	-- BIG CONTEINERS
	-- -- --
	{
		type = "item",
		name = "kr-big-active-provider-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-active-provider-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "kr-logistics-3",
		order = "a[big-active-provider-container]",
		place_result = "kr-big-active-provider-container"
    },
	{
		type = "item",
		name = "kr-big-buffer-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-buffer-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "kr-logistics-3",
		order = "b[big-buffer-container]",
		place_result = "kr-big-buffer-container"
    },	
	{
		type = "item",
		name = "kr-big-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "storage",
		order = "a[items]-dz[big-container]",
		place_result = "kr-big-container"
    },
	{
		type = "item",
		name = "kr-big-passive-provider-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-passive-provider-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "kr-logistics-3",
		order = "c[big-passive-provider-container]",
		place_result = "kr-big-passive-provider-container"
    },
	{
		type = "item",
		name = "kr-big-requester-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-requester-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "kr-logistics-3",
		order = "d[big-requester-container]",
		place_result = "kr-big-requester-container"
    },
	{
		type = "item",
		name = "kr-big-storage-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-storage-container.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "kr-logistics-3",
		order = "e[big-storage-container]",
		place_result = "kr-big-storage-container"
    },	
	-- -- --
	-- FLUID STORAGES
	-- -- --
	{
		type = "item",
		name = "kr-fluid-storage-1",
		icon = kr_entities_icons_path .. "fluid-storages/fluid-storage-1.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "storage",
		order = "b[fluid]-bb2[storage-tank-2]",
		place_result = "kr-fluid-storage-1"
    },
	{
		type = "item",
		name = "kr-fluid-storage-2",
		icon = kr_entities_icons_path .. "fluid-storages/fluid-storage-2.png",
		stack_size = 50,
		icon_size = 32,    
		subgroup = "storage",
		order = "b[fluid]-c[storage-tank-3]",
		place_result = "kr-fluid-storage-2"
    },
	-- -- --
	-- STEEL PIPES
	-- -- --
	{
		type = "item",
		name = "kr-steel-pipe",
		icon = kr_entities_icons_path .. "steel-pipe.png",
		icon_size = 32,
		subgroup = "energy-pipe-distribution",
		order = "a[pipes]-a2[steel-pipe]",
		place_result = "kr-steel-pipe",
		stack_size = 100
	},  
	{
		type = "item",
		name = "kr-steel-pipe-to-ground",
		icon = kr_entities_icons_path .. "steel-pipe-to-ground.png",
		icon_size = 32,
		subgroup = "energy-pipe-distribution",
		order = "a[pipes]-b2[steel-pipe-to-ground]",
		place_result = "kr-steel-pipe-to-ground",
		stack_size = 50
	},  
	{
		type = "item",
		name = "kr-steel-pump",
		icon = kr_entities_icons_path .. "steel-pump.png",
		icon_size = 32,
		subgroup = "energy-pipe-distribution",
		order = "b[pipes]-c2[steel-pump]",
		place_result = "kr-steel-pump",
		stack_size = 50
	},
	-- -- --
	{
		type = "item",
		name = "kr-electrolysis-plant",
		icon = kr_entities_icons_path .. "electrolysis-plant.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "e-a1[electrolysis-plant]",
		place_result = "kr-electrolysis-plant",
		stack_size = 50
    },	
    {
		type = "item",
		name = "kr-filtration-plant",
		icon = kr_entities_icons_path .. "filtration-plant.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "e-b1[filtration-plant]",
		place_result = "kr-filtration-plant",
		stack_size = 50
    },
	{
		type = "item",
		name = "kr-atmospheric-condenser",
		icon = kr_entities_icons_path .. "atmospheric-condenser.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "e-c1[atmospheric-condenser]",
		place_result = "kr-atmospheric-condenser",
		stack_size = 50
    },
	
	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
