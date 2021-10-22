local factory_tiles = {
  "stone-path",
  "concrete",
  "hazard-concrete-left",
  "hazard-concrete-right",
  "refined-concrete",
  "refined-hazard-concrete-left",
  "refined-hazard-concrete-right",
  "kr-white-reinforced-plate",
  "kr-black-reinforced-plate",
}

if krastorio.general.getSafeSettingValue("kr-kl-stuff") then
  table.insert(factory_tiles, "kr-white-reinforced-plate-l")
  table.insert(factory_tiles, "kr-black-reinforced-plate-l")
end

data:extend({
  {
    type = "selection-tool",
    name = "kr-creep-collector",
    icon = kr_icons_path .. "items/creep-collector.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
      { size = 64, filename = kr_icons_path .. "items/creep-collector.png", scale = 0.25, mipmap_count = 4 },
    },
    flags = { "not-stackable", "spawnable", "only-in-cursor" },
    stack_size = 1,
    subgroup = "terrain",
    order = "z-[collector-tools]-b[creep-collector]",
    selection_color = { r = 0.50, g = 0, b = 0.35 },
    alt_selection_color = { r = 0.55, g = 0, b = 0.40 },
    selection_mode = {
      "any-tile",
    },
    alt_selection_mode = {
      "any-tile",
    },
    selection_cursor_box_type = "not-allowed",
    alt_selection_cursor_box_type = "not-allowed",
    always_include_tiles = true,
    show_in_library = false,
    tile_filters = { "kr-creep" },
    alt_tile_filters = { "kr-creep" },
    tile_filter_mode = "whitelist",
    alt_tile_filter_mode = "whitelist",
  },
  {
    type = "selection-tool",
    name = "kr-jackhammer",
    icon = kr_icons_path .. "items/jackhammer.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "not-stackable", "spawnable", "only-in-cursor" },
    stack_size = 1,
    subgroup = "terrain",
    order = "z-[collector-tools]-a[jackhammer]",
    selection_color = { r = 0.55, g = 0.35, b = 0.22 },
    alt_selection_color = { r = 0.55, g = 0.35, b = 0.22 },
    selection_mode = {
      "any-tile",
    },
    alt_selection_mode = {
      "any-tile",
    },
    selection_cursor_box_type = "not-allowed",
    alt_selection_cursor_box_type = "not-allowed",
    always_include_tiles = true,
    show_in_library = false,
    tile_filters = factory_tiles,
    alt_tile_filters = factory_tiles,
    tile_filter_mode = "whitelist",
    alt_tile_filter_mode = "whitelist",
  },
})
