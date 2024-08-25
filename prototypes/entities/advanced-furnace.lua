function furnacekpipepictures_a()
  return {
    north = {
      filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-k-pipe-N.png",
      priority = "extra-high",
      width = 71,
      height = 38,
      shift = util.by_pixel(2.25, 13.5),
      scale = 0.5,
    },
    east = {
      filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-k-pipe-E-top.png",
      priority = "extra-high",
      width = 59, --42,
      height = 76,
      shift = util.by_pixel(-28.75, 1),
      scale = 0.5,
    },
    south = {
      filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-k-pipe-S-right.png",
      priority = "extra-high",
      width = 88,
      height = 61,
      shift = util.by_pixel(0, -31.5),
      scale = 0.5,
    },
    west = {
      filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-k-pipe-W-bottom.png",
      priority = "extra-high",
      width = 39,
      height = 73,
      shift = util.by_pixel(25.75, 1.25),
      scale = 0.5,
    },
  }
end

function furnacekpipepictures_b()
  return {
    north = {
      filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-k-pipe-N.png",
      priority = "extra-high",
      width = 71,
      height = 38,
      shift = util.by_pixel(2.25, 13.5),
      scale = 0.5,
    },
    east = {
      filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-k-pipe-E-bottom.png",
      priority = "extra-high",
      width = 76, --42,
      height = 76,
      shift = util.by_pixel(-33, 1),
      scale = 0.5,
    },
    south = {
      filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-k-pipe-S-left.png",
      priority = "extra-high",
      width = 88,
      height = 61,
      shift = util.by_pixel(0, -31.25),
      scale = 0.5,
    },
    west = {
      filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-k-pipe-W-top.png",
      priority = "extra-high",
      width = 39,
      height = 87, --73,
      shift = util.by_pixel(25.5, -2.25),
      scale = 0.5,
    },
  }
end

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local kr_icons_size = false

if krastorio.general.getSafeSettingValue("kr-large-icons") then
  kr_icons_size = true
end

local advanced_furnace_sound = {
  filename = "__Krastorio2Assets__/sounds/buildings/advanced-furnace.ogg",
  volume = 0.50,
  aggregation = {
    max_count = 2,
    remove = false,
    count_already_playing = true,
  },
}

data:extend({
  {
    type = "assembling-machine",
    name = "kr-advanced-furnace",
    icon = "__Krastorio2Assets__/icons/entities/advanced-furnace.png",
    icon_size = 128,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-advanced-furnace" },
    max_health = 2000,
    corpse = "kr-big-random-pipes-remnant",
    dying_explosion = "big-explosion",
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 95 },
      { type = "impact", percent = 80 },
    },
    collision_box = { { -3.25, -3.25 }, { 3.25, 3.25 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = furnacekpipepictures_a(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { -1, -3 } } },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "input",
        pipe_picture = furnacekpipepictures_b(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { 1, -3 } } },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "input",
        pipe_picture = furnacekpipepictures_b(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.west, position = { -3, -1 } } },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "input",
        pipe_picture = furnacekpipepictures_a(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.east, position = { 3, -1 } } },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "output",
        pipe_picture = furnacekpipepictures_b(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.south, position = { -1, 3 } } },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "output",
        pipe_picture = furnacekpipepictures_a(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.south, position = { 1, 3 } } },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "output",
        pipe_picture = furnacekpipepictures_a(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.west, position = { -3, 1 } } },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "output",
        pipe_picture = furnacekpipepictures_b(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.east, position = { 3, 1 } } },
        secondary_draw_orders = { north = -1 },
      },
      off_when_no_fluid_recipe = true,
    },
    animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace.png",
          priority = "high",
          width = 480,
          height = 480,
          shift = { 0, -0.1 },
          frame_count = 1,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-sh.png",
          priority = "high",
          width = 165,
          height = 480,
          shift = { 3.1, -0.1 },
          frame_count = 1,
          draw_as_shadow = true,
          scale = 0.5,
        },
      },
    },
    working_visualisations = {
      {
        constant_speed = true,
        animation = {
          filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-anim-light.png",
          priority = "high",
          width = 480,
          height = 480,
          shift = { 0, -0.1 },
          frame_count = 28,
          line_length = 4,
          animation_speed = 0.8,
          draw_as_light = true,
          scale = 0.5,
        },
      },
      {
        constant_speed = true,
        animation = {
          filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-anim-glow.png",
          priority = "high",
          width = 480,
          height = 480,
          shift = { 0, -0.1 },
          frame_count = 28,
          line_length = 4,
          animation_speed = 0.8,
          draw_as_glow = true,
          fadeout = true,
          blend_mode = "additive",
          scale = 0.5,
        },
      },
      {
        constant_speed = true,
        animation = {
          filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-anim.png",
          priority = "high",
          width = 480,
          height = 480,
          shift = { 0, -0.1 },
          frame_count = 28,
          line_length = 4,
          animation_speed = 0.8,
          scale = 0.5,
        },
      },
      {
        constant_speed = true,
        light = {
          intensity = 0.65,
          size = 4,
          shift = { 1.29, 2 },
          color = { r = 1, g = 0.35, b = 0.2 },
        },
      },
    },
    crafting_categories = { "smelting", "advanced-smelting" },
    scale_entity_info_icon = kr_icons_size,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = advanced_furnace_sound,
    idle_sound = { filename = "__base__/sound/idle1.ogg" },
    crafting_speed = 12,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 6 },
    },

    water_reflection = {
      pictures = {
        filename = "__Krastorio2Assets__/entities/advanced-furnace/advanced-furnace-reflection.png",
        priority = "extra-high",
        width = 80,
        height = 60,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    energy_usage = "2MW",
    ingredient_count = 6,
    module_specification = { module_slots = 4, module_info_icon_shift = { 0, 1.7 }, module_info_icon_scale = 1 },
    allowed_effects = { "consumption", "speed", "productivity", "pollution" },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
  },
})
