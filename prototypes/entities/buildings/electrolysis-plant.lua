local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local kr_icons_size = false

if krastorio.general.getSafeSettingValue("kr-large-icons") then
  kr_icons_size = true
end

data:extend({
  {
    type = "assembling-machine",
    name = "kr-electrolysis-plant",
    icon = kr_entities_icons_path .. "electrolysis-plant.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-electrolysis-plant" },
    max_health = 500,
    corpse = "kr-medium-random-pipes-remnant",
    dying_explosion = "big-explosion",
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 50 },
      { type = "impact", percent = 50 },
    },
    fluid_boxes = {
      -- Input
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 10,
        base_level = -1,
        pipe_connections = { { type = "input", position = { -3, -1 } } },
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 10,
        base_level = -1,
        pipe_connections = { { type = "input", position = { -3, 1 } } },
      },
      -- Output
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 10,
        base_level = 1,
        pipe_connections = { { type = "output", position = { 3, -1 } } },
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        pipe_picture = kr_pipe_path,
        base_area = 10,
        base_level = 1,
        pipe_connections = { { type = "output", position = { 3, 1 } } },
      },
      off_when_no_fluid_recipe = false,
    },
    collision_box = { { -2.3, -2.3 }, { 2.3, 2.3 } },
    selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "assembling-machine",
    scale_entity_info_icon = kr_icons_size,
    animation = {
      layers = {
        {
          filename = kr_entities_path .. "electrolysis-plant/electrolysis-plant.png",
          width = 190,
          height = 190,
          frame_count = 1,
          shift = { 0, 0 },
          hr_version = {
            filename = kr_entities_path .. "electrolysis-plant/hr-electrolysis-plant.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 1,
            shift = { 0, 0 },
          },
        },
        {
          filename = kr_entities_path .. "electrolysis-plant/electrolysis-plant-sh.png",
          width = 190,
          height = 190,
          frame_count = 1,
          draw_as_shadow = true,
          shift = { 0, 0 },
          hr_version = {
            filename = kr_entities_path .. "electrolysis-plant/hr-electrolysis-plant-sh.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 1,
            draw_as_shadow = true,
            shift = { 0, 0 },
          },
        },
      },
    },
    working_visualisations = {
      {
        apply_recipe_tint = "primary",
        animation = {
          filename = kr_entities_path .. "electrolysis-plant/electrolysis-plant-work.png",
          width = 190,
          height = 190,
          frame_count = 12,
          line_length = 6,
          animation_speed = 0.4,
          shift = { 0, 0 },
          blend_mode = "additive",
          draw_as_glow = true,
          hr_version = {
            filename = kr_entities_path .. "electrolysis-plant/hr-electrolysis-plant-work.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 12,
            line_length = 6,
            animation_speed = 0.4,
            shift = { 0, 0 },
            blend_mode = "additive",
            draw_as_glow = true,
          },
        },
      },
      {
        apply_recipe_tint = "primary",
        animation = {
          filename = kr_entities_path .. "electrolysis-plant/electrolysis-plant-work-light.png",
          width = 190,
          height = 190,
          frame_count = 12,
          line_length = 6,
          animation_speed = 0.4,
          shift = { 0, 0 },
          draw_as_light = true,
          hr_version = {
            filename = kr_entities_path .. "electrolysis-plant/hr-electrolysis-plant-work-light.png",
            width = 380,
            height = 380,
            scale = 0.5,
            frame_count = 12,
            line_length = 6,
            animation_speed = 0.4,
            shift = { 0, 0 },
            draw_as_light = true,
          },
        },
      },
    },
    crafting_categories = { "electrolysis" },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      sound = {
        filename = kr_buildings_sounds_path .. "electrolysis-plant.ogg",
        volume = 0.85,
      },
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 0.5,
      },
      apparent_volume = 1.5,
    },
    crafting_speed = 1,
    return_ingredients_on_change = true,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 0.5,
    },

    water_reflection = {
      pictures = {
        filename = kr_entities_path .. "electrolysis-plant/electrolysis-plant-reflection.png",
        priority = "extra-high",
        width = 42,
        height = 38,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    energy_usage = "0.375MW",
    ingredient_count = 6,
    module_specification = { module_slots = 2, module_info_icon_shift = { 0, 1.2 }, module_info_icon_scale = 1 },
    allowed_effects = { "consumption", "speed", "productivity", "pollution" },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
  },
})
