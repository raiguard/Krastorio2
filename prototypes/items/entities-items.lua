data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
    {
		type = "item",
		name = "kr-greenhouse",
		icon =  kr_entities_icons_path .. "greenhouse.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "aaa",
		place_result = "kr-greenhouse",
		stack_size = 50
    },	
    {
		type = "item",
		name = "kr-crusher",
		icon =  kr_entities_icons_path .. "crusher.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "aaa",
		place_result = "kr-crusher",
		stack_size = 50
    },	
	-- NEW LABORATORIES
	-- -- --
    {
		type = "item",
		name = "biusart_lab",
		icon =  kr_entities_icons_path .. "biusart_lab.png",
		icon_size = 64,
		subgroup = "production-machine",
		order = "g[lab]",
		place_result = "biusart_lab",
		stack_size = 50
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
		stack_size = 20,
		icon_size = 32,    
		subgroup = "kr-logistics-3",
		order = "a[big-active-provider-container]",
		place_result = "kr-big-active-provider-container"
    },
	{
		type = "item",
		name = "kr-big-buffer-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-buffer-container.png",
		stack_size = 20,
		icon_size = 32,    
		subgroup = "kr-logistics-3",
		order = "b[big-buffer-container]",
		place_result = "kr-big-buffer-container"
    },	
	{
		type = "item",
		name = "kr-big-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-container.png",
		stack_size = 20,
		icon_size = 32,    
		subgroup = "storage",
		order = "a[items]-dz[big-container]",
		place_result = "kr-big-container"
    },
	{
		type = "item",
		name = "kr-big-passive-provider-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-passive-provider-container.png",
		stack_size = 20,
		icon_size = 32,    
		subgroup = "kr-logistics-3",
		order = "c[big-passive-provider-container]",
		place_result = "kr-big-passive-provider-container"
    },
	{
		type = "item",
		name = "kr-big-requester-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-requester-container.png",
		stack_size = 20,
		icon_size = 32,    
		subgroup = "kr-logistics-3",
		order = "d[big-requester-container]",
		place_result = "kr-big-requester-container"
    },
	{
		type = "item",
		name = "kr-big-storage-container",
		icon = kr_entities_icons_path .. "containers/big-containers/" .. "big-storage-container.png",
		stack_size = 20,
		icon_size = 32,    
		subgroup = "kr-logistics-3",
		order = "e[big-storage-container]",
		place_result = "kr-big-storage-container"
    },	
	-- -- --
	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
