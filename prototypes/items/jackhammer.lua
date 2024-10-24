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

if settings.startup["kr-kl-stuff"].value then
  table.insert(factory_tiles, "kr-white-reinforced-plate-l")
  table.insert(factory_tiles, "kr-black-reinforced-plate-l")
end

data:extend({
  {
    type = "selection-tool",
    name = "kr-jackhammer",
    icon = "__Krastorio2Assets__/icons/items/jackhammer.png",
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
