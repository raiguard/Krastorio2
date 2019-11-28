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
	-- MEDIUM CONTEINERS
	-- -- --
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
	-- -- --
	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
