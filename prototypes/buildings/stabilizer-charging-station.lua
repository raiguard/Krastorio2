local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-stabilizer-charging-station",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "imersium-beam", amount = 4 },
      { type = "item", name = "energy-control-unit", amount = 20 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "kr-stabilizer-charging-station", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-stabilizer-charging-station",
    icon = "__Krastorio2Assets__/icons/entities/stabilizer-charging-station.png",
    subgroup = "production-machine",
    order = "i[matter]-c[stabilizer-charging-station]",
    place_result = "kr-stabilizer-charging-station",
    stack_size = 50,
  },
  {
    type = "furnace",
    name = "kr-stabilizer-charging-station",
    icon = "__Krastorio2Assets__/icons/entities/stabilizer-charging-station.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "kr-stabilizer-charging-station" },
    collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
    selection_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
    crafting_categories = { "stabilizer-charging" },
    crafting_speed = 2.0,
    result_inventory_size = 1,
    source_inventory_size = 1,
    module_slots = 2,
    allowed_effects = { "consumption", "speed", "pollution" },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 },
    },
    energy_usage = "1MW",
    max_health = 200,
    damaged_trigger_effect = hit_effects.entity(),
    dying_explosion = "small-matter-explosion",
    corpse = "medium-remnants",
    resistances = {
      { type = "physical", percent = 20 },
      { type = "fire", percent = 35 },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/stabilizer-charging-station.ogg",
        volume = 0.5,
      },
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
      },
    },
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__Krastorio2Assets__/buildings/stabilizer-charging-station/stabilizer-charging-station.png",
            priority = "high",
            width = 170,
            height = 170,
            frame_count = 80,
            line_length = 10,
            animation_speed = 0.4,
            scale = 0.4,
          },
          {
            filename = "__Krastorio2Assets__/buildings/stabilizer-charging-station/stabilizer-charging-station-sh.png",
            priority = "high",
            width = 170,
            height = 144,
            frame_count = 80,
            line_length = 8,
            animation_speed = 0.4,
            shift = { 0.23, 0.262 },
            draw_as_shadow = true,
            scale = 0.4,
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = "__Krastorio2Assets__/buildings/stabilizer-charging-station/stabilizer-charging-station-reflection.png",
          priority = "extra-high",
          width = 20,
          height = 25,
          shift = util.by_pixel(0, 40),
          variation_count = 1,
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },
      working_visualisations = {
        {
          animation = {
            filename = "__Krastorio2Assets__/buildings/stabilizer-charging-station/stabilizer-charging-station-light.png",
            priority = "high",
            width = 170,
            height = 170,
            frame_count = 80,
            line_length = 10,
            animation_speed = 0.4,
            scale = 0.4,
            draw_as_light = true,
          },
        },
      },
    },
  },
})
