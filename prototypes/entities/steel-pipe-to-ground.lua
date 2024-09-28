local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-steel-pipe-to-ground",
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-steel-pipe", amount = 15 },
      { type = "item", name = "steel-plate", amount = 5 },
    },
    results = { { type = "item", name = "kr-steel-pipe-to-ground", amount = 2 } },
  },
  {
    type = "item",
    name = "kr-steel-pipe-to-ground",
    icon = "__Krastorio2Assets__/icons/entities/steel-pipe-to-ground.png",
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-ba[steel-pipe-to-ground]",
    place_result = "kr-steel-pipe-to-ground",
    stack_size = 50,
  },
  {
    type = "pipe-to-ground",
    name = "kr-steel-pipe-to-ground",
    icon = "__Krastorio2Assets__/icons/entities/steel-pipe-to-ground.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.1, result = "kr-steel-pipe-to-ground" },
    fast_replaceable_group = "pipe",
    collision_box = { { -0.29, -0.29 }, { 0.29, 0.2 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    fluid_box = {
      volume = 125,
      pipe_covers = require("prototypes.entities.steel-pipe-covers"),
      pipe_connections = {
        { flow_direction = "input-output", direction = defines.direction.north, position = { 0, 0 } },
        {
          flow_direction = "input-output",
          direction = defines.direction.south,
          position = { 0, 0 },
          connection_type = "underground",
          max_underground_distance = 30,
        },
      },
      hide_connection_info = true,
    },
    max_health = 150,
    corpse = "pipe-remnants",
    resistances = {
      {
        type = "fire",
        percent = 90,
      },
      {
        type = "impact",
        percent = 60,
      },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = sounds.pipe,
    pictures = {
      north = {
        filename = "__Krastorio2Assets__/entities/steel-pipe-to-ground/steel-pipe-to-ground-up.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      south = {
        filename = "__Krastorio2Assets__/entities/steel-pipe-to-ground/steel-pipe-to-ground-down.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      west = {
        filename = "__Krastorio2Assets__/entities/steel-pipe-to-ground/steel-pipe-to-ground-left.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
      east = {
        filename = "__Krastorio2Assets__/entities/steel-pipe-to-ground/steel-pipe-to-ground-right.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        scale = 0.5,
      },
    },
    visualization = data.raw["pipe-to-ground"]["pipe-to-ground"].visualization,
  },
})
