data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

	-- -- --
	-- CREEP
	-- -- --

    {
		type = "item",
		name = "kr-creep",
		icon =  kr_icons_path .. "creep.png",
		icon_size = 64,
		subgroup = "terrain",
		order = "z[creep]-z[creep]",
		place_as_tile =
		{
			result = "kr-creep",
			condition_size = 1,
			condition = { "water-tile" }
		},
			stack_size = 200,
	},
	
	-- -- --
	-- BLACK REINFORCED PLATE
	-- -- --
	
    {
		type = "item",
		name = "black-reinforced-plate",
		icon =  kr_icons_path .. "black-reinforced-plate.png",
		icon_size = 64,
		subgroup = "terrain",
		order = "z[black-reinforced-plate]-z[black-reinforced-plate]",
		place_as_tile =
		{
			result = "black-reinforced-plate",
			condition_size = 1,
			condition = { "water-tile" }
		},
			stack_size = 200,
	},
    {
		type = "item",
		name = "white-reinforced-plate",
		icon =  kr_icons_path .. "white-reinforced-plate.png",
		icon_size = 64,
		subgroup = "terrain",
		order = "z[white-reinforced-plate]-z[white-reinforced-plate]",
		place_as_tile =
		{
			result = "white-reinforced-plate",
			condition_size = 1,
			condition = { "water-tile" }
		},
			stack_size = 200,
	},
	
	-- -- --
	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
