local kr_icons_size = false

if krastorio.general.getSafeSettingValue("kr-large-icons") then
  kr_icons_size = true
end

local hit_effects = require("__base__/prototypes/entity/hit-effects")

local greenhouse_working_sound = {
  filename = kr_buildings_sounds_path .. "greenhouse.ogg",
  volume = 0.75,
  idle_sound = { filename = "__base__/sound/idle1.ogg" },
  aggregation = {
    max_count = 3,
    remove = false,
    count_already_playing = true,
  },
}

data:extend({
  {
    type = "assembling-machine",
    name = "kr-greenhouse",
    icon_size = 64,
    icon_mipmaps = 4,
    icon = kr_entities_icons_path .. "greenhouse.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { hardness = 1, mining_time = 1, result = "kr-greenhouse" },
    max_health = 500,
    corpse = "kr-big-random-pipes-remnant",
    dying_explosion = "big-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    {
      { type = "impact", percent = 50 },
    },
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = kr_pipe_path,
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        height = 2,
        base_level = -1,
        pipe_connections = {
          { type = "input-output", position = { 0, -4 } },
          { type = "input-output", position = { -4, 0 } },
          { type = "input-output", position = { 4, 0 } },
          { type = "input-output", position = { 0, 4 } },
        },
      },
      off_when_no_fluid_recipe = false,
    },
    collision_box = { { -3.25, -3.25 }, { 3.25, 3.25 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    fast_replaceable_group = "kr-greenhouse",
    module_specification = {
      module_slots = 3,
    },
    allowed_effects = { "consumption", "speed", "productivity", "pollution" },
    animation = {
      layers = {
        {
          filename = kr_entities_path .. "greenhouse/greenhouse.png",
          priority = "high",
          scale = scale,
          width = 256,
          height = 256,
          frame_count = 1,
          hr_version = {
            filename = kr_entities_path .. "greenhouse/hr-greenhouse.png",
            priority = "high",
            width = 512,
            height = 512,
            frame_count = 1,
            scale = 0.5,
          },
        },
        {
          filename = kr_entities_path .. "greenhouse/greenhouse-sh.png",
          priority = "high",
          scale = scale,
          width = 256,
          height = 256,
          shift = { 0.32, 0 },
          frame_count = 1,
          draw_as_shadow = true,
          hr_version = {
            filename = kr_entities_path .. "greenhouse/hr-greenhouse-sh.png",
            priority = "high",
            width = 512,
            height = 512,
            shift = { 0.32, 0 },
            frame_count = 1,
            draw_as_shadow = true,
            scale = 0.5,
          },
        },
      },
    },
    working_visualisations = {
      {
        draw_as_light = true,
        animation = {
          filename = kr_entities_path .. "greenhouse/greenhouse-light.png",
          scale = scale,
          width = 256,
          height = 256,
          frame_count = 1,
          repeat_count = 10,
          animation_speed = 0.35,
          hr_version = {
            filename = kr_entities_path .. "greenhouse/hr-greenhouse-light.png",
            width = 512,
            height = 512,
            frame_count = 1,
            repeat_count = 10,
            scale = 0.5,
            animation_speed = 0.35,
          },
        },
      },
      {
        animation = {
          filename = kr_entities_path .. "greenhouse/greenhouse-working.png",
          scale = scale,
          width = 256,
          height = 256,
          frame_count = 10,
          line_length = 5,
          animation_speed = 0.35,
          hr_version = {
            filename = kr_entities_path .. "greenhouse/hr-greenhouse-working.png",
            width = 512,
            height = 512,
            frame_count = 10,
            line_length = 5,
            scale = 0.5,
            animation_speed = 0.35,
          },
        },
      },
    },
    crafting_categories = { "growing" },
    scale_entity_info_icon = kr_icons_size,
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = greenhouse_working_sound,
    crafting_speed = 1,
    return_ingredients_on_change = true,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = -5,
    },
    energy_usage = "144.8KW",
    ingredient_count = 4,
  },
})
