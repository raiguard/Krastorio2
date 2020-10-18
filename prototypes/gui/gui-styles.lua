local styles = data.raw["gui-style"]["default"]

-- -- COMMON

orange_button_glow_color = {241, 168, 57, 128}
cyan_button_glow_color = {194, 234, 252, 128}

styles["kr-title-table"] = 
{
	type                     = "table_style",
	maximal_height           = 40,
	padding                  = 2,
	horizontally_stretchable = "on",
	vertical_stretchable     = "off",
	horizontal_spacing       = 6,
	vertical_spacing         = 1,
	column_alignments        = 
	{
		{ column = 1, alignment = "right"},
		{ column = 2, alignment = "center"},
		{ column = 3, alignment = "left"},
		{ column = 4, alignment = "left"},
		{ column = 5, alignment = "left"},
		{ column = 6, alignment = "left"},
		{ column = 7, alignment = "left"},
		{ column = 8, alignment = "left"},
		{ column = 9, alignment = "left"}
	}
}

styles["kr-title-label"] =
{
	type                 = "label_style",
	parent               = "frame_title",
	height               = 24,
	padding              = 0,
	vertical_stretchable = "off",
	font                 = "default-large-bold",
	rich_text_setting    = "enabled",
	font_color           = bold_font_color
}

-- Teleporters label
styles["kr-title-edit-textbox"] =
{
	type                 = "textbox_style",
	parent               = "textbox",
	width                = 160,
	height               = 24,
	padding              = 0,
	vertical_stretchable = "off",
	font                 = "default-large-semibold",
	rich_text_setting    = "enabled",
	single_line          = true
}

styles["kr-title-draggable-space"] =
{
	type                     = "empty_widget_style",
	parent                   = "draggable_space",
	height                   = 24,
	horizontally_stretchable = "on",
	horizontally_squashable  = "on"
}

styles["kr-top-right-button"] = 
{
	type               = "button_style",
	parent             = "frame_button",
	size               = 24,
	left_click_sound   = {{ filename = "__core__/sound/gui-tool-button.ogg", volume = 1 }}
}

styles["kr-top-right-confirm-button"] = 
{
	type               = "button_style",
	parent             = "frame_button",
	size               = 24,
	left_click_sound   = {{ filename = "__core__/sound/gui-tool-button.ogg", volume = 1 }},
	default_graphical_set =
	{
		base = {position = {68, 17}, corner_size = 8},
		shadow = default_shadow
	},
	hovered_graphical_set =
	{
		base = {position = {102, 17}, corner_size = 8},
		shadow = default_shadow,
		glow = default_glow(cyan_button_glow_color, 0.5)
	},
	clicked_graphical_set =
	{
		base = {position = {120, 17}, corner_size = 8},
		shadow = default_shadow
	},
	disabled_graphical_set =
	{
		base = {position = {86, 17}, corner_size = 8},
		shadow = default_shadow
	}
}

styles["kr-top-right-rename-button"] = 
{
	type               = "button_style",
	parent             = "frame_button",
	size               = 24,
	left_click_sound   = {{ filename = "__core__/sound/gui-tool-button.ogg", volume = 1 }},
	default_graphical_set =
	{
		base = {position = {329, 48}, corner_size = 8},
		shadow = default_shadow
	},
	hovered_graphical_set =
	{
		base = {position = {346, 48}, corner_size = 8},
		shadow = default_shadow,
		glow = default_glow(cyan_button_glow_color, 0.5)
	},
	clicked_graphical_set =
	{
		base = {position = {363, 48}, corner_size = 8},
		shadow = default_shadow
	},
	disabled_graphical_set =
	{
		base = {position = {313, 48}, corner_size = 8},
		shadow = default_shadow
	}
}

styles["kr-top-right-search-button"] = 
{
	type               = "button_style",
	parent             = "frame_button",
	size               = 24,
	left_click_sound   = {{ filename = "__core__/sound/gui-tool-button.ogg", volume = 1 }},
	default_graphical_set =
	{
		base = {position = {34, 17}, corner_size = 8},
		shadow = default_shadow
	},
	hovered_graphical_set =
	{
		base = {position = {353, 0}, corner_size = 8},		
		shadow = default_shadow,
		glow = default_glow(orange_button_glow_color, 0.5)
	},
	clicked_graphical_set =
	{
		base = {position = {352, 17}, corner_size = 8},
		shadow = default_shadow
	},
	disabled_graphical_set =
	{
		base = {position = {52, 17}, corner_size = 8},
		shadow = default_shadow
	}
}

styles["kr-top-right-close-button"] = 
{
	type               = "button_style",
	parent             = "frame_button",
	size               = 24,
	left_click_sound   = {{ filename = "__core__/sound/gui-red-button.ogg", volume = 0.7 }},
	default_graphical_set =
	{
		base = {position = {136, 17}, corner_size = 8},
		shadow = default_shadow
	},
	hovered_graphical_set =
	{
		base = {position = {170, 17}, corner_size = 8},
		shadow = default_shadow,
		glow = default_glow(red_button_glow_color, 0.5)
	},
	clicked_graphical_set =
	{
		base = {position = {187, 17}, corner_size = 8},
		shadow = default_shadow
	},
	disabled_graphical_set =
	{
		base = {position = {153, 17}, corner_size = 8},
		shadow = default_shadow
	}
}

-- -- WIKI

-- Windows frame
styles["kr-wiki-window"] =
{
	type           = "frame_style",
	width          = 760, 
	height         = 600,
	top_padding    = 4,
	bottom_padding = 4,
	right_padding  = 8,	
	graphical_set  =
	{
		filename = "__core__/graphics/gui-new.png",
		position = {0, 0},
		opacity = 0.95,
        background_blur = true,
		corner_size = 8 	
	},
	use_header_filler = false,
	drag_by_title     = false,
	header_background =
	{
		center = {x = 8, y = 8, width = 1, height = 1}
	}
}

-- Main flow
styles["kr-wiki-window-flow"] =
{
	type = "horizontal_flow_style",
    padding = 2,
	maximal_width = 760,
	natural_width = 740,
	graphical_set =
	{
		base = 
		{
			filename = "__core__/graphics/gui-new.png",
			position = {12, 0},
			opacity = 0.0,
			background_blur = true,
			corner_size = 8
		}
	}
}

-- Box for left elements
styles["kr-wiki-left-window-flow"] =
{
	type = "vertical_flow_style",
	vertically_stretchable = "on",
    padding = 1,
	width = 200,
	graphical_set =
	{
		filename = "__core__/graphics/gui-new.png",
		position = {0, 0},
		opacity = 0.0,
		background_blur = true
	}
}

-- Inside of right box where put description, this is the vertical box
styles["kr-wiki-right-window-flow"] =
{
	type = "vertical_flow_style",
	vertical_align = "top",
	horizontal_align = "left",
	natural_width  = 600,
	natural_height = 350,
	vertically_stretchable   = "on",
	horizontally_stretchable = "on",
    padding = 1
}

-- Box where put description
styles["kr-wiki-description-flow"] =
{
	type = "scroll_pane_style",
	vertically_stretchable   = "on",
	horizontally_stretchable = "off",
	vertical_scrollbar_style = { type = "vertical_scrollbar_style" },
	width   = 525,
	padding = 4,
	graphical_set = 
	{
		base = 
		{
			position = {0, 0}, 
			corner_size = 8, 
			draw_type = "outer"
		},
		shadow = default_inner_shadow
	},
    background_graphical_set = {},
    extra_padding_when_activated = 4
}

styles["kr-wiki-back-button-flow"] =
{
	type = "horizontal_flow_style",
    horizontal_align = "left",
	natural_width = 740,
	vertically_stretchable = "off",
    padding = 2,
	margin = 2
}

-- Open button
local base_icon_button_grahphical_set =
{
	filename = "__core__/graphics/gui-new.png",
	stretch_image_to_widget_size = true,
	position = {0, 0},
	corner_size = 2,
	opacity = 0.2,
	draw_type = "outer",
	background_blur = true,
	scale = 1,
	border = 1
}

styles["kr-wiki-icon-button"] =
{
	type = "button_style",
	horizontal_align = "center",
	vertical_align = "center",
	icon_horizontal_align = "center",
	minimal_width = 36,
	height = 36,
	padding = 0,
	stretch_image_to_widget_size = true,
	default_graphical_set = base_icon_button_grahphical_set,
	hovered_graphical_set =
    {
		base = {position = {34, 17}, corner_size = 2, draw_type = "outer", opacity = 0.5},
        shadow = default_dirt,
        glow = default_glow(default_glow_color, 0.5)
	},
	clicked_graphical_set =
	{
		base   = {position = {51, 17}, corner_size = 2, draw_type = "outer", opacity = 0.5},
        shadow = default_dirt
	},
	selected_graphical_set =
	{
		base   = {position = {225, 17}, corner_size = 2, draw_type = "outer", opacity = 0.5},
		shadow = default_dirt
	},
	selected_hovered_graphical_set =
	{
		base   = {position = {369, 17}, corner_size = 2, draw_type = "outer", opacity = 0.5},
		shadow = default_dirt
	},
	strikethrough_color = {0.5, 0.5, 0.5},
	pie_progress_color = {1, 1, 1},
	left_click_sound =
	{
		{ filename = "__core__/sound/gui-click.ogg" }
	},
	draw_shadow_under_picture = true
}

-- Back button
styles["kr-wiki-back-button"] =
{
	type = "button_style",
	horizontal_align = "left",
	default_graphical_set = arrow_back(red_arrow_tileset, arrow_idle_index, "shadow", default_dirt_color),
	hovered_graphical_set = arrow_back(red_arrow_tileset, arrow_hovered_index, "glow", red_arrow_button_glow_color),
	clicked_graphical_set = arrow_back(red_arrow_tileset, arrow_clicked_index),
	disabled_font_color = {0.5, 0.5, 0.5},
	horizontally_squashable = "on",
	disabled_graphical_set = arrow_back(red_arrow_tileset, arrow_disabled_index, "glow", default_dirt_color)
}

styles["kr-title-flow"] =
{
	type = "horizontal_flow_style",
    horizontal_align = "center",
	vertically_stretchable = "off",
	natural_width = 500,
    padding = 1,
	margin = 1
}
-- Description labels
styles["kr-wiki-description-label"] =
{
	type = "label_style",
	parent = "label",
	font = "default",
	rich_text_setting = "enabled",
	single_line = false
}

styles["kr-wiki-image-flow"] =
{
	type = "horizontal_flow_style",
    horizontal_align = "center",
	natural_width = 500,
	vertically_stretchable = "off"
}

-- -- PLANETARY TELEPORTER

-- Windows frame
styles["kr-pt-window"] =
{
	type           = "frame_style",
	width          = 580, 
	height         = 340,
	top_padding    = 4,
	bottom_padding = 4,
	right_padding  = 8,	
	vertical_flow_style =
	{
		type                   = "vertical_flow_style",
		vertical_align         = "center",
		horizontal_align       = "center",
		horizontal_stretchable = "on",
		vertically_stretchable = "on"
	},
	graphical_set  =
	{
		filename        = "__core__/graphics/gui-new.png",
		position        = {0, 0},
		opacity         = 0.95,
        background_blur = true,
		corner_size     = 8 	
	},
	use_header_filler = false,
	drag_by_title     = false,
	header_background =
	{
		center = {x = 8, y = 8, width = 1, height = 1}
	}
}

-- Scrollpane where put table of possible teleporters
styles["kr-pt-tps-scroll-pane"] =
{
	type = "scroll_pane_style",
	horizontal_stretchable   = "on",
	vertically_stretchable   = "on",
	vertical_flow_style = 
	{
		type                   = "vertical_flow_style",
		vertical_align         = "center",
		horizontal_align       = "center",
		horizontal_stretchable = "on",
		vertically_stretchable = "on"
	},
	vertical_scrollbar_style = { type = "vertical_scrollbar_style" },
	padding = 4,
	graphical_set = 
	{
		base = 
		{
			position = {0, 0}, 
			corner_size = 8, 
			draw_type = "outer"
		},
		shadow = default_inner_shadow
	},
    background_graphical_set = {},
    extra_padding_when_activated = 4
}

styles["kr-pt-tps-table"] =
{
	type                     = "table_style",
	parent                   = "table",
	horizontal_stretchable   = "on",
	vertically_stretchable   = "on",
	minimal_width            = 490, 
	minimal_height           = 334,
	horizontal_spacing       = 1,
	vertical_spacing         = 1,
	background_graphical_set =
	{
		position = {282, 17},
		corner_size = 8,
		overall_tiling_vertical_size = 165,
		overall_tiling_vertical_spacing = 0,
		overall_tiling_vertical_padding = 1,
		overall_tiling_horizontal_size = 165,
		overall_tiling_horizontal_spacing = 0,
		overall_tiling_horizontal_padding = 1
	}
}

styles["kr-pt-tp-button"] =
{
	type = "button_style",
	parent = "button",
	horizontal_align = "center",
	vertical_align = "center",
	natural_width  = 165,
	natural_height = 165,
	default_graphical_set =
	{
		base = {position = {312, 744}, corner_size = 8, opacity = 0.5},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5),
	},
	hovered_graphical_set =
    {
		base = {position = {34, 17}, corner_size = 2, draw_type = "inner", opacity = 0.5},
        shadow = default_dirt,
        glow = default_glow(default_glow_color, 0.5)
	},
	clicked_graphical_set =
	{
		base   = {position = {51, 17}, corner_size = 2, draw_type = "inner", opacity = 0.5},
        shadow = default_dirt
	},
	selected_graphical_set =
	{
		base   = {position = {225, 17}, corner_size = 2, draw_type = "inner", opacity = 0.5},
		shadow = default_dirt
	},
	selected_hovered_graphical_set =
	{
		base   = {position = {369, 17}, corner_size = 2, draw_type = "inner", opacity = 0.5},
		shadow = default_dirt
	},
	strikethrough_color = {0.5, 0.5, 0.5},
	pie_progress_color = {1, 1, 1},
	left_click_sound =
	{
		{ filename = "__core__/sound/gui-click.ogg" }
	},
	draw_shadow_under_picture = true,
	padding = 0
}

-- Teleporters flow
styles["kr-pt-tp-flow"] =
{
	type                   = "vertical_flow_style",
    vertical_align         = "center",
	horizontal_align       = "center",
	horizontal_stretchable = "on",
	vertically_stretchable = "on",
	natural_width          = 161,
	natural_height         = 161
}

-- Teleporters label
styles["kr-pt-tp-label"] =
{
	type              = "label_style",
	parent            = "label",
	natural_height    = 40,
	font              = "default-large-semibold",
	rich_text_setting = "enabled",
	single_line       = false
}

-- Teleporters camera
styles["kr-pt-tp-camera"] =
{
	type           = "camera_style",
	parent         = "camera",	
	natural_width  = 115,
	natural_height = 115,
	default_graphical_set =
	{
		base = {position = {312, 744}, corner_size = 8, opacity = 0.5},
		shadow = offset_by_2_default_glow(default_dirt_color, 0.5),
	}
}
