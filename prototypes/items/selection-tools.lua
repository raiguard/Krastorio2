data:extend(
{
	{
		type = "selection-tool",
		name = "kr-creep-collector",
		icon = kr_icons_path .. "items/creep-collector.png",
		icon_size = 64,
		flags = { "not-stackable" },
		stack_size = 1,
		subgroup = "terrain",
		order = "z-[collector-tools]-b[creep-collector]",
		selection_color = {r = 0.50, g = 0, b = 0.35},
		alt_selection_color = {r = 0.55, g = 0, b = 0.40},
		selection_mode =
		{
			"any-tile"
		},
		alt_selection_mode =
		{
			"any-tile"
		},
		selection_cursor_box_type = "not-allowed",
		alt_selection_cursor_box_type = "not-allowed",
		always_include_tiles = true,
		show_in_library = false,
		tile_filters = { "kr-creep" },
		alt_tile_filters = { "kr-creep" },
		tile_filter_mode = "whitelist",
		alt_tile_filter_mode = "whitelist"
	}
})