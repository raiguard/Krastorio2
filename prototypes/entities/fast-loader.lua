if not settings.startup["kr-loaders"].value then
  return
end

local graphics = require("prototypes.entities.loader-graphics")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-fast-loader",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "fast-transport-belt", amount = 1 },
      { type = "item", name = "kr-loader", amount = 2 },
      { type = "item", name = "iron-gear-wheel", amount = 10 },
    },
    results = { { type = "item", name = "kr-fast-loader", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-fast-loader",
    icon = "__Krastorio2Assets__/icons/entities/fast-loader.png",
    subgroup = "belt",
    order = "d[loader]-a2[kr-fast-loader]",
    place_result = "kr-fast-loader",
    stack_size = 50,
  },
  {
    type = "loader-1x1",
    name = "kr-fast-loader",
    icon = "__Krastorio2Assets__/icons/entities/fast-loader.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.25, result = "kr-fast-loader" },
    placeable_by = { item = "kr-fast-loader", count = 1 },
    fast_replaceable_group = "transport-belt",
    next_upgrade = "kr-express-loader",
    collision_box = { { -0.4, -0.45 }, { 0.4, 0.45 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    speed = data.raw["transport-belt"]["fast-transport-belt"].speed,
    container_distance = 0.75,
    filter_count = 5,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "500W",
    },
    energy_per_item = "9kJ",
    max_health = 300,
    corpse = "small-remnants",
    resistances = { { type = "fire", percent = 90 } },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    belt_animation_set = data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set,
    animation_speed_coefficient = 32,
    structure = graphics.structure({ 228, 24, 38 }),
    structure_render_layer = graphics.structure_render_layer,
  },
})
