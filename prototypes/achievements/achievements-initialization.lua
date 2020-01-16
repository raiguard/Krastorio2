data:extend(
{
	{
        type = "produce-achievement",
        name = "10000-matter",
		icons = 
		{
			{ icon = kr_achievements_icons_path .. "backgrounds/normal.png", icon_size = 128 },
			{ icon = kr_achievements_icons_path .. "matter.png", icon_size = 128 }
		},
		icon_size = 128,
        order = "kr-p-m1",
		limited_to_one_game = false,
		fluid_product = "matter",
		amount = 10000
    },
	{
        type = "produce-achievement",
        name = "100000-matter",
		icons = 
		{
			{ icon = kr_achievements_icons_path .. "backgrounds/silver.png", icon_size = 128 },
			{ icon = kr_achievements_icons_path .. "matter.png", icon_size = 128 }
		},
		icon_size = 128,
        order = "kr-p-m2",
		limited_to_one_game = false,
		fluid_product = "matter",
		amount = 100000
    },
	{
        type = "produce-achievement",
        name = "1000000-matter",
		icons = 
		{
			{ icon = kr_achievements_icons_path .. "backgrounds/gold.png", icon_size = 128 },
			{ icon = kr_achievements_icons_path .. "matter.png", icon_size = 128 }
		},
		icon_size = 128,
        order = "kr-p-m3",
		limited_to_one_game = false,
		fluid_product = "matter",
		amount = 1000000
    },
	{
        type = "build-entity-achievement",
        name = "dig-into-deep",
		icons = 
		{
			{ icon = kr_achievements_icons_path .. "backgrounds/normal.png", icon_size = 128 },
			{ icon = kr_achievements_icons_path .. "dig-into-deep.png", icon_size = 128 }
		},
		icon_size = 128,
        order = "kr-b-1",
		limited_to_one_game = false,
		to_build = "kr-quarry-drill",
		amount = 1
    }
})