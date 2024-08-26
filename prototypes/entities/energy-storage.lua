local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "accumulator",
    name = "kr-energy-storage",
    icon = "__Krastorio2Assets__/icons/entities/energy-storage.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "placeable-player", "player-creation", "not-rotatable" },
    minable = { mining_time = 1, result = "kr-energy-storage" },
    max_health = 750,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    collision_box = { { -2.75, -2.75 }, { 2.75, 2.75 } },
    selection_box = { { -3, -3 }, { 3, 3 } },
    drawing_box = { { -3, -3 }, { 3, 3 } },
    resistances = {
      { type = "physical", percent = 25 },
      { type = "fire", percent = 25 },
      { type = "impact", percent = 50 },
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "250MJ",
      usage_priority = "tertiary",
      input_flow_limit = "5MW",
      output_flow_limit = "5MW",
    },
    picture = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage.png",
          width = 380,
          height = 380,
          scale = 0.55,
          frame_count = 1,
          shift = { 0, -0.4 },
        },
        {
          filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage-sh.png",
          width = 414,
          height = 270,
          scale = 0.55,
          frame_count = 1,
          draw_as_shadow = true,
          shift = { 0.72, 0.56 },
        },
      },
    },
    charge_animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage.png",
          width = 380,
          height = 380,
          scale = 0.55,
          frame_count = 1,
          repeat_count = 2,
          animation_speed = 0.03,
          shift = { 0, -0.4 },
        },
        {
          filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage-sh.png",
          width = 414,
          height = 270,
          scale = 0.55,
          frame_count = 1,
          repeat_count = 2,
          animation_speed = 0.03,
          draw_as_shadow = true,
          shift = { 0.72, 0.56 },
        },
        {
          filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage-charge.png",
          width = 380,
          height = 380,
          scale = 0.55,
          frame_count = 2,
          line_length = 2,
          animation_speed = 0.03,
          shift = { 0, -0.4 },
          draw_as_glow = true,
        },
        {
          filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage-light.png",
          width = 380,
          height = 380,
          scale = 0.55,
          frame_count = 1,
          repeat_count = 2,
          animation_speed = 0.06,
          shift = { 0, -0.4 },
          draw_as_light = true,
        },
      },
    },
    discharge_animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage.png",
          width = 380,
          height = 380,
          scale = 0.55,
          frame_count = 1,
          repeat_count = 2,
          animation_speed = 0.06,
          shift = { 0, -0.4 },
        },
        {
          filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage-sh.png",
          width = 414,
          height = 270,
          scale = 0.55,
          frame_count = 1,
          repeat_count = 2,
          animation_speed = 0.06,
          draw_as_shadow = true,
          shift = { 0.72, 0.56 },
        },
        {
          filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage-discharge.png",
          width = 380,
          height = 380,
          scale = 0.55,
          frame_count = 2,
          line_length = 2,
          animation_speed = 0.06,
          shift = { 0, -0.4 },
          draw_as_glow = true,
        },
        {
          filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage-light.png",
          width = 380,
          height = 380,
          scale = 0.55,
          frame_count = 1,
          repeat_count = 2,
          animation_speed = 0.06,
          shift = { 0, -0.4 },
          draw_as_light = true,
        },
      },
    },
    charge_cooldown = 5,
    discharge_cooldown = 5,
    --[[
    charge_light =
    {
      intensity = 0.5,
      size = 1,
      color = {r=0.25, g=1, b=0.5}
    },
    discharge_light =
    {
      intensity = 0.75,
      size = 1,
      color = {r=1, g=0.75, b=0.25}
    },
    --]]
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/energy-storage-working.ogg",
        volume = 0.9,
      },
      idle_sound = {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.8,
      },
      max_sounds_per_type = 2,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
    },

    water_reflection = {
      pictures = {
        filename = "__Krastorio2Assets__/entities/energy-storage/energy-storage-reflection.png",
        priority = "extra-high",
        width = 44,
        height = 44,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    circuit_wire_connection_point = circuit_connector_definitions["accumulator"].points,
    circuit_connector_sprites = circuit_connector_definitions["accumulator"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_output_signal = { type = "virtual", name = "signal-A" },
  },
})