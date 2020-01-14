data:extend(
{
	{
        type = "produce-achievement",
        name = "10000-matter",
        order = "kr-p-m1",
        icon = kr_achievements_icons_path .. "10000-matter.png",
        icon_size = 128,
		limited_to_one_game = false,
		fluid_product = "matter",
		amount = 10000
    },
	{
        type = "produce-achievement",
        name = "100000-matter",
        order = "kr-p-m2",
        icon = kr_achievements_icons_path .. "100000-matter.png",
        icon_size = 128,
		limited_to_one_game = false,
		fluid_product = "matter",
		amount = 100000
    },
	{
        type = "produce-achievement",
        name = "1000000-matter",
        order = "kr-p-m3",
        icon = kr_achievements_icons_path .. "1000000-matter.png",
        icon_size = 128,
		limited_to_one_game = false,
		fluid_product = "matter",
		amount = 1000000
    },
	{
        type = "build-entity-achievement",
        name = "dig-into-deep",
        order = "kr-b-1",
        icon = kr_achievements_icons_path .. "dig-into-deep.png",
        icon_size = 128,
		limited_to_one_game = false,
		to_build = "kr-quarry-drill",
		amount = 1
    }
})