local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-sentinel",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "glass", amount = 1 },
      { type = "item", name = "iron-plate", amount = 2 },
      { type = "item", name = "copper-cable", amount = 1 },
      { type = "item", name = "automation-core", amount = 1 },
    },
    results = { { type = "item", name = "kr-sentinel", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-sentinel",
    icon = "__Krastorio2Assets__/icons/entities/sentinel.png",
    subgroup = "radars",
    order = "01[sentinel]",
    place_result = "kr-sentinel",
    stack_size = 50,
  },
  {
    type = "radar",
    name = "kr-sentinel",
    icon = "__Krastorio2Assets__/icons/entities/sentinel.png",
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 0.1, result = "kr-sentinel" },
    collision_box = { { -0.25, -0.25 }, { 0.25, 0.25 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    energy_per_sector = "1YJ",
    energy_per_nearby_scan = "1J",
    max_distance_of_sector_revealed = 0,
    max_distance_of_nearby_sector_revealed = 1,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    energy_usage = "40kW",
    max_health = 75,
    corpse = "small-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      {
        type = "fire",
        percent = 50,
      },
      {
        type = "impact",
        percent = 10,
      },
    },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = { filename = "__Krastorio2Assets__/sounds/buildings/sentinel.ogg" },
    },
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/buildings/sentinel/sentinel.png",
          priority = "low",
          width = 128,
          height = 128,
          apply_projection = false,
          direction_count = 120,
          line_length = 12,
          shift = { 0.21, -0.2 },
          scale = 0.35,
        },
      },
    },
    radius_minimap_visualisation_color = { r = 0.059, g = 0.092, b = 0.235, a = 0.275 },
    rotation_speed = 0.0015,
  },
})
