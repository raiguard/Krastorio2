local styles = data.raw["gui-style"]["default"]

styles.kr_planetary_teleporter_destinations_scroll_pane = {
  type = "scroll_pane_style",
  parent = "flib_naked_scroll_pane_no_padding",
  width = (200 * 3) + 12,
  height = 200 * 3,
  background_graphical_set = {
    position = { 282, 17 },
    corner_size = 8,
    overall_tiling_vertical_size = 200 - 12,
    overall_tiling_vertical_spacing = 12,
    overall_tiling_vertical_padding = 6,
    overall_tiling_horizontal_size = 200 - 12,
    overall_tiling_horizontal_spacing = 12,
    overall_tiling_horizontal_padding = 6,
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
  bar = { position = { 305, 39 }, corner_size = 4 },
  bar_shadow = {
    base = { position = { 296, 39 }, corner_size = 4 },
    shadow = {
      left = { position = { 456, 152 }, size = { 16, 1 } },
      center = { position = { 472, 152 }, size = { 1, 1 } },
      right = { position = { 473, 152 }, size = { 16, 1 } },
    },
  },
  bar_width = 4,
  color = { g = 1 },
  width = 176,
}

data:extend({
  {
    type = "font",
    name = "kr-planetary-teleporter-destination",
    from = "default-semibold",
    size = 14,
    border = true,
    border_color = {},
  },
})

styles.kr_planetary_teleporter_destination_label = {
  type = "label_style",
  font = "kr-planetary-teleporter-destination",
  font_color = default_font_color,
  width = 176,
  height = 176,
  vertical_align = "bottom",
  padding = 4,
  left_padding = 8,
}
