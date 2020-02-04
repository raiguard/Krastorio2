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
		stack_size = 200
	},
	
	-- -- --
	-- BLACK REINFORCED PLATE
	-- -- --
	
    {
		type = "item",
		name = "kr-black-reinforced-plate",
		icon =  kr_icons_path .. "black-reinforced-plate.png",
		icon_size = 64,
		subgroup = "terrain",
		order = "z[black-reinforced-plate]-a1[black-reinforced-plate]",
		place_as_tile =
		{
			result = "kr-black-reinforced-plate",
			condition_size = 1,
			condition = { "water-tile" }
		},
		stack_size = 200
	},
    {
		type = "item",
		name = "kr-white-reinforced-plate",
		icon =  kr_icons_path .. "white-reinforced-plate.png",
		icon_size = 64,
		subgroup = "terrain",
		order = "z[white-reinforced-plate]-a2[white-reinforced-plate]",
		place_as_tile =
		{
			result = "kr-white-reinforced-plate",
			condition_size = 1,
			condition = { "water-tile" }
		},
		stack_size = 200
	}
	
	-- -- --
	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
