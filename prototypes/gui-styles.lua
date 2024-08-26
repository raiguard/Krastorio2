local styles = data.raw["gui-style"]["default"]

styles.kr_planetary_teleporter_destinations_frame = {
  type = "frame_style",
  parent = "deep_frame_in_shallow_frame",
  width = 600,
  minimal_height = 257 * 2,
  background_graphical_set = {
    position = { 282, 17 },
    corner_size = 8,
    overall_tiling_vertical_size = 257 - 12,
    overall_tiling_vertical_spacing = 12,
    overall_tiling_vertical_padding = 6,
    overall_tiling_horizontal_size = 200 - 12,
    overall_tiling_horizontal_spacing = 12,
    overall_tiling_horizontal_padding = 6,
  },
}

styles.kr_planetary_teleporter_destinations_scroll_pane = {
  type = "scroll_pane_style",
  parent = "deep_slots_scroll_pane",
  bottom_margin = 12,
  bottom_padding = 0,
  extra_bottom_padding_when_activated = 0,
  height = 257 * 2,
  graphical_set = {
    base = { position = { 85, 0 }, corner_size = 8, draw_type = "outer" },
    shadow = default_inner_shadow,
  },
}

styles.kr_planetary_teleporter_destination_minimap = {
  type = "minimap_style",
  size = 176,
}

styles.kr_planetary_teleporter_destination_minimap_button = {
  type = "button_style",
  parent = "button",
  size = 176,
  default_graphical_set = {},
  hovered_graphical_set = {
    base = { position = { 81, 80 }, size = 1, opacity = 0.7 },
  },
  clicked_graphical_set = { position = { 70, 146 }, size = 1, opacity = 0.7 },
  disabled_graphical_set = {},
}

styles.kr_planetary_teleporter_destination_name_button = {
  type = "button_style",
  parent = "train_status_button",
  width = 176,
  disabled_font_color = styles.list_box_item.default_font_color,
  disabled_graphical_set = styles.list_box_item.default_graphical_set,
}

styles.kr_planetary_teleporter_destination_charge_bar = {
  type = "progressbar_style",
  width = 176,
  top_margin = -2,
}

styles.kr_subheader_bold_label = {
  type = "label_style",
  parent = "subheader_caption_label",
  font_color = default_font_color,
}
