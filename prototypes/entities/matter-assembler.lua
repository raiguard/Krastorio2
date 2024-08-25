local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local kr_icons_size = false

if krastorio.general.getSafeSettingValue("kr-large-icons") then
  kr_icons_size = true
end

data:extend({
  {
    type = "assembling-machine",
    name = "kr-matter-assembler",
    icon = "__Krastorio2Assets__/icons/entities/matter-assembler.png",
    icon_size = 128,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-matter-assembler" },
    max_health = 2000,
    damaged_trigger_effect = hit_effects.entity(),
    corpse = "kr-medium-random-pipes-remnant",
    dying_explosion = "medium-matter-explosion",
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 70 },
      { type = "impact", percent = 70 },
    },
    fluid_boxes = {
      -- Inputs
      {
        production_type = "input",
        pipe_picture = require("prototypes.entities.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { 0, -3 } } },
      },
      -- Outputs
      {
        production_type = "output",
        pipe_picture = require("prototypes.entities.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.west, position = { -3, 0 } } },
      },
      {
        production_type = "output",
        pipe_picture = require("prototypes.entities.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.south, position = { 3, 0 } } },
      },
      {
        production_type = "output",
        pipe_picture = require("prototypes.entities.pipe-picture"),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.east, position = { 0, 3 } } },
      },
      off_when_no_fluid_recipe = false,
    },
    collision_box = { { -3.25, -3.25 }, { 3.25, 3.25 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    fast_replaceable_group = "assembling-machine",
    scale_entity_info_icon = kr_icons_size,
    animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/matter-assembler/matter-assembler.png",
          priority = "high",
          width = 473,
          height = 489,
          frame_count = 1,
          scale = 0.5,
          shift = { 0, -0.15 },
        },
        {
          filename = "__Krastorio2Assets__/entities/matter-assembler/matter-assembler-sh.png",
          priority = "medium",
          width = 508,
          height = 446,
          frame_count = 1,
          scale = 0.5,
          shift = { 0.38, 0.22 },
          draw_as_shadow = true,
        },
      },
    },
    working_visualisations = {
      {
        draw_as_light = true,
        animation = {
          filename = "__Krastorio2Assets__/entities/matter-assembler/matter-assembler-working-glow-light.png",
          priority = "high",
          width = 144,
          height = 110,
          frame_count = 30,
          line_length = 6,
          scale = 0.5,
          animation_speed = 0.75,
          shift = { 0, -0.23 },
        },
      },
      {
        draw_as_glow = true,
        blend_mode = "additive",
        synced_fadeout = true,
        animation = {
          filename = "__Krastorio2Assets__/entities/matter-assembler/matter-assembler-working-glow.png",
          priority = "high",
          width = 144,
          height = 110,
          frame_count = 30,
          line_length = 6,
          scale = 0.5,
          animation_speed = 0.75,
          shift = { 0, -0.23 },
        },
      },
      {
        animation = {
          layers = {
            {
              filename = "__Krastorio2Assets__/entities/matter-assembler/matter-assembler-working-light.png",
              priority = "high",
              width = 473,
              height = 489,
              frame_count = 30,
              line_length = 6,
              scale = 0.5,
              animation_speed = 0.75,
              shift = { 0, -0.15 },
              draw_as_light = true,
            },
            {
              filename = "__Krastorio2Assets__/entities/matter-assembler/matter-assembler-working.png",
              priority = "high",
              width = 473,
              height = 489,
              frame_count = 30,
              line_length = 6,
              scale = 0.5,
              animation_speed = 0.75,
              shift = { 0, -0.15 },
            },
          },
        },
        light = {
          intensity = 0.80,
          size = 6,
          shift = { 0, -0.15 },
          color = { r = 0.35, g = 0.5, b = 1 },
        },
      },
    },
    crafting_categories = { "matter-deconversion", "matter-items" },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/matter-assembler.ogg",
        volume = 0.60,
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
      apparent_volume = 0.75,
    },
    crafting_speed = 1.0,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 50 },
    },

    water_reflection = {
      pictures = {
        filename = "__Krastorio2Assets__/entities/matter-assembler/matter-assembler-reflection.png",
        priority = "extra-high",
        width = 46,
        height = 46,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    energy_usage = "48.39MW",
    ingredient_count = 6,
    module_specification = { module_slots = 4, module_info_icon_shift = { 0, 1.8 }, module_info_icon_scale = 0.6 },
    allowed_effects = { "consumption", "productivity", "speed", "pollution" },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
  },
})
