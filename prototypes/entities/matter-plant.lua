local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local kr_icons_size = false

if krastorio.general.getSafeSettingValue("kr-large-icons") then
  kr_icons_size = true
end

data:extend({
  {
    type = "assembling-machine",
    name = "kr-matter-plant",
    icon = "__Krastorio2Assets__/icons/entities/matter-plant.png",
    icon_size = 128,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-matter-plant" },
    max_health = 2000,
    damaged_trigger_effect = hit_effects.entity(),
    corpse = "matter-plant-remnant",
    dying_explosion = "medium-matter-explosion",
    resistances = {
      { type = "physical", percent = 60 },
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
          filename = "__Krastorio2Assets__/entities/matter-plant/matter-plant.png",
          priority = "high",
          width = 462,
          height = 500,
          frame_count = 1,
          shift = { -0.1, -0.2 },
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/entities/matter-plant/matter-plant-sh.png",
          priority = "high",
          width = 504,
          height = 444,
          frame_count = 1,
          draw_as_shadow = true,
          shift = { 0.23, 0.24 },
          scale = 0.5,
        },
      },
    },
    working_visualisations = {
      {
        draw_as_light = true,
        blend_mode = "additive-soft",
        animation = {
          filename = "__Krastorio2Assets__/entities/matter-plant/matter-plant-working-light.png",
          priority = "high",
          width = 462,
          height = 500,
          frame_count = 30,
          line_length = 6,
          shift = { -0.1, -0.2 },
          scale = 0.5,
          animation_speed = 0.75,
        },
      },
      {
        draw_as_glow = true,
        blend_mode = "additive-soft",
        synced_fadeout = true,
        animation = {
          filename = "__Krastorio2Assets__/entities/matter-plant/matter-plant-working-glow.png",
          priority = "high",
          width = 462,
          height = 500,
          frame_count = 30,
          line_length = 6,
          shift = { -0.1, -0.2 },
          scale = 0.5,
          animation_speed = 0.75,
        },
      },
      {
        animation = {
          filename = "__Krastorio2Assets__/entities/matter-plant/matter-plant-working.png",
          width = 462,
          height = 500,
          frame_count = 30,
          line_length = 6,
          shift = { -0.1, -0.2 },
          scale = 0.5,
          animation_speed = 0.75,
        },
      },
    },
    crafting_categories = { "matter-conversion" },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = { filename = "__Krastorio2Assets__/sounds/buildings/matter-plant.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
      apparent_volume = 1.5,
    },
    crafting_speed = 1.0,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 20 },
    },
    energy_usage = "24.19MW",
    ingredient_count = 6,
    module_specification = { module_slots = 4, module_info_icon_shift = { 0, 1.7 }, module_info_icon_scale = 1 },
    allowed_effects = { "consumption", "speed", "pollution" },
    open_sound = { filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1 },
    close_sound = { filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1 },
  },
})
