data:extend(
{
	{
		type = "corpse",
		name = "kr-big-random-pipes-remnant",
		icon = kr_entities_icons_path .. "remnants-icon.png",
		icon_size = 32,
		flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
		selection_box = {{-1, -1}, {1, 1}},
		tile_width = 3,
		tile_height = 3,
		selectable_in_game = false,
		subgroup = "remnants",
		order = "z[remnants]-a[generic]-b[big]",
		time_before_removed = 60 * 60 * 20, -- 20 minutes
		final_render_layer = "remnants",
		remove_on_tile_placement = false,
		animation = 
		make_rotated_animation_variations_from_sheet
		(
			1,
			{
				filename = kr_remnants_path .. "kr-big-random-pipes-remnant.png",
				line_length = 1,
				width = 175,
				height = 175,
				frame_count = 1,
				direction_count = 1,
				hr_version =
				{
					filename = kr_remnants_path .. "hr-kr-big-random-pipes-remnant.png",
					line_length = 1,
					width = 350,
					height = 350,
					frame_count = 1,
					direction_count = 1,
					scale = 0.5
				}
			}
		)
	}
})
