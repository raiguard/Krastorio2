data:extend({
  {
    type = "corpse",
    name = "kr-superior-underground-belt-remnant",
    localised_name = { "remnant-name", { "entity-name.kr-superior-underground-belt" } },
    icon = kr_entities_icons_path .. "transport-belts/superior-transport-belt/superior-underground-belt.png",
    icon_size = 64,
    flags = { "placeable-neutral", "not-on-map", "building-direction-8-way" },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    subgroup = "remnants",
    order = "d[remnants]-a[generic]-a[small]",
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = {
      filename = kr_remnants_path
        .. "transport-belts/superior-transport-belt/underground-belt/superior-underground-belt-remnant.png",
      line_length = 1,
      width = 60,
      height = 50,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 8,
      shift = util.by_pixel(4, 3),
      hr_version = {
        filename = kr_remnants_path
          .. "transport-belts/superior-transport-belt/underground-belt/hr-superior-underground-belt-remnant.png",
        line_length = 1,
        width = 116,
        height = 100,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 8,
        shift = util.by_pixel(3.5, 3.5),
        scale = 0.5,
      },
    },
  },
})
