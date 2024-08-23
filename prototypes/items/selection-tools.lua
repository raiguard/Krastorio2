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
    icon = "__Krastorio2Assets__/icons/items/creep-collector.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
      { size = 64, filename = "__Krastorio2Assets__/icons/items/creep-collector.png", scale = 0.25, mipmap_count = 4 },
    },
    flags = { "not-stackable", "spawnable", "only-in-cursor" },
    hidden = true,
    stack_size = 1,
    select = {
      border_color = { r = 0.50, g = 0, b = 0.35 },
      cursor_box_type = "not-allowed",
      mode = {
        "any-entity",
        "any-tile",
        "enemy",
      },
      entity_type_filters = {
        "unit",
        "unit-spawner",
        "turret",
      },
      tile_filters = { "kr-creep" },
      tile_filter_mode = "whitelist",
    },
    alt_select = {
      border_color = { r = 0.55, g = 0, b = 0.40 },
      cursor_box_type = "not-allowed",
      mode = {
        "any-entity",
        "any-tile",
        "enemy",
      },
      entity_type_filters = {
        "unit",
        "unit-spawner",
        "turret",
      },
      selection_cursor_box_type = "not-allowed",
      tile_filters = { "kr-creep" },
      tile_filter_mode = "whitelist",
    },
    always_include_tiles = true,
  },
  {
    type = "selection-tool",
    name = "kr-jackhammer",
    icon = "__Krastorio2Assets__/icons/items/jackhammer.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "not-stackable", "spawnable", "only-in-cursor" },
    hidden = true,
    stack_size = 1,
    select = {
      border_color = { r = 0.55, g = 0.35, b = 0.22 },
      mode = { "any-tile" },
      cursor_box_type = "not-allowed",
      tile_filters = factory_tiles,
      tile_filter_mode = "whitelist",
    },
    alt_select = {
      border_color = { r = 0.55, g = 0.35, b = 0.22 },
      mode = { "any-tile" },
      cursor_box_type = "not-allowed",
      tile_filters = factory_tiles,
      tile_filter_mode = "whitelist",
    },
    always_include_tiles = true,
  },
})
