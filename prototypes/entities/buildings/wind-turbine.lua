local hit_effects = require("__base__/prototypes/entity/hit-effects")

local wind_turbine_persistent_sound = {
  variations = {
    {
      filename = kr_buildings_sounds_path .. "wind-turbine-rotating.ogg",
      volume = 0.55,
    },
    {
      filename = kr_buildings_sounds_path .. "wind-turbine-rotating-2.ogg",
      volume = 0.38,
    },
  },
  aggregation = {
    max_count = 3,
    remove = false,
    count_already_playing = true,
  },
}

data:extend({
  {
    type = "electric-energy-interface",
    name = "kr-wind-turbine",
    icon = kr_entities_icons_path .. "wind-turbine.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "player-creation", "not-rotatable" },
    minable = { mining_time = 0.25, result = "kr-wind-turbine" },
    max_health = 200,
    corpse = "medium-remnants",
    resistances = {
      {
        type = "fire",
        percent = 30,
      },
      {
        type = "physical",
        percent = 60,
      },
      {
        type = "impact",
        percent = 30,
      },
    },
    fast_replaceable_group = "wind-turbine",
    damaged_trigger_effect = hit_effects.entity(),
    collision_box = { { -1.25, -1.25 }, { 1.25, 1.25 } },
    selection_box = { { -1.45, -1.45 }, { 1.45, 1.45 } },
    drawing_box = { { -0.5, -2 }, { 0.5, 1 } },
    energy_source = {
      type = "electric",
      buffer_capacity = "20kJ",
      usage_priority = "primary-output",
      -- input_flow_limit = "20kW",
      output_flow_limit = "20kW",
      render_no_power_icon = false,
    },

    water_reflection = {
      pictures = {
        filename = kr_entities_path .. "wind-turbine/wind-turbine-reflection.png",
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

    energy_production = "20kW",
    -- energy_usage = "0kW",
    animation = {
      layers = {
        {
          filename = kr_entities_path .. "wind-turbine/wind-turbine.png",
          priority = "high",
          width = 98,
          height = 143,
          frame_count = 30,
          line_length = 6,
          animation_speed = 0.8,
          shift = { 0, -1.2 },
          hr_version = {
            filename = kr_entities_path .. "wind-turbine/hr-wind-turbine.png",
            priority = "medium",
            width = 196,
            height = 286,
            scale = 0.5,
            frame_count = 30,
            line_length = 6,
            animation_speed = 0.8,
            shift = { 0, -1.2 },
          },
        },
        {
          filename = kr_entities_path .. "wind-turbine/wind-turbine-shadow.png",
          priority = "high",
          width = 121,
          height = 50,
          frame_count = 30,
          line_length = 6,
          scale = 1.3,
          animation_speed = 0.5,
          draw_as_shadow = true,
          shift = { 1.15, 0.05 },
          hr_version = {
            filename = kr_entities_path .. "wind-turbine/hr-wind-turbine-shadow.png",
            priority = "medium",
            width = 242,
            height = 100,
            scale = 0.65,
            frame_count = 30,
            line_length = 6,
            animation_speed = 0.5,
            draw_as_shadow = true,
            shift = { 1.15, 0.05 },
          },
        },
      },
    },
    continuous_animation = true,
    working_sound = {
      sound = wind_turbine_persistent_sound,
      idle_sound = wind_turbine_persistent_sound,
      persistent = true,
    },
  },
})
