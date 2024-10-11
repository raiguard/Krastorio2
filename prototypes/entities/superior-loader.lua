if not settings.startup["kr-loaders"].value then
  return
end

local graphics = require("prototypes.entities.loader-graphics")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-superior-loader",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-superior-transport-belt", amount = 1 },
      { type = "item", name = "kr-advanced-loader", amount = 2 },
      { type = "item", name = "imersium-gear-wheel", amount = 10 },
    },
    results = { { type = "item", name = "kr-superior-loader", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-superior-loader",
    icon = "__Krastorio2Assets__/icons/entities/superior-loader.png",
    subgroup = "belt",
    order = "d[loader]-a5[kr-superior-loader]",
    place_result = "kr-superior-loader",
    stack_size = 50,
  },
  {
    type = "loader-1x1",
    name = "kr-superior-loader",
    icon = "__Krastorio2Assets__/icons/entities/superior-loader.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.25, result = "kr-superior-loader" },
    placeable_by = { item = "kr-superior-loader", count = 1 },
    fast_replaceable_group = "transport-belt",
    collision_box = { { -0.4, -0.45 }, { 0.4, 0.45 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    speed = 0.1875,
    container_distance = 0.75,
    filter_count = 5,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1.5kW",
    },
    energy_per_item = "9kJ",
    max_health = 300,
    corpse = "small-remnants",
    resistances = { { type = "fire", percent = 90 } },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    belt_animation_set = require("prototypes.entities.superior-belt-animation-set"),
    animation_speed_coefficient = 32,
    structure = graphics.structure({ 151, 34, 191 }),
    structure_render_layer = graphics.structure_render_layer,
  },
})
