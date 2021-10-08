local kr_explosions_sprites_path = kr_entities_path .. "explosions/"

data:extend({

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "explosion",
    name = "impulse-rifle-beam",
    flags = { "not-on-map", "hidden" },
    subgroup = "explosions",
    rotate = true,
    beam = true,
    animations = {
      {
        filename = kr_explosions_sprites_path .. "impulse-rifle-beam.png",
        priority = "extra-high",
        draw_as_glow = true,
        width = 62,
        height = 1,
        frame_count = 6,
        line_length = 6,
      },
    },
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "explosion",
    name = "matter-shockwave",
    flags = { "not-on-map" },
    animations = {
      {
        filename = kr_explosions_sprites_path .. "matter-shockwave-1.png",
        priority = "high",
        flags = { "smoke" },
        line_length = 8,
        width = 66,
        height = 68,
        frame_count = 32,
        animation_speed = 0.5,
        shift = util.by_pixel(-1, 0),
        hr_version = {
          filename = kr_explosions_sprites_path .. "hr-matter-shockwave-1.png",
          priority = "high",
          flags = { "smoke" },
          line_length = 8,
          width = 132,
          height = 136,
          frame_count = 32,
          animation_speed = 0.5,
          shift = util.by_pixel(-0.5, 0),
          scale = 1.5,
        },
      },
      {
        filename = kr_explosions_sprites_path .. "matter-shockwave-2.png",
        priority = "high",
        flags = { "smoke" },
        line_length = 8,
        width = 56,
        height = 64,
        frame_count = 32,
        animation_speed = 0.5,
        shift = util.by_pixel(-1, 0),
        hr_version = {
          filename = kr_explosions_sprites_path .. "hr-matter-shockwave-2.png",
          priority = "high",
          flags = { "smoke" },
          line_length = 8,
          width = 110,
          height = 128,
          frame_count = 32,
          animation_speed = 0.5,
          shift = util.by_pixel(0, 3),
          scale = 1.5,
        },
      },
    },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "explosion",
    name = "matter-fire-smoke",
    fade_out_duration = 40,
    scale_out_duration = 50,
    scale_in_duration = 10,
    scale_initial = 0.1,
    scale = 2,
    scale_deviation = 0.25,
    scale_increment_per_tick = 0.005,
    correct_rotation = true,
    scale_animation_speed = true,
    animations = {
      {
        width = 152,
        height = 120,
        line_length = 5,
        frame_count = 60,
        shift = { -0.53125, -0.4375 },
        priority = "high",
        animation_speed = 0.50,
        tint = { r = 0.15, g = 0.09, b = 0.12, a = 0.5 },
        filename = kr_explosions_sprites_path .. "smoke.png",
        flags = { "smoke" },
      },
    },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "explosion",
    name = "matter-explosion",
    flags = { "not-on-map" },
    animations = {
      width = 316,
      height = 360,
      frame_count = 100,
      priority = "very-low",
      flags = { "linear-magnification" },
      shift = util.by_pixel(1, -123), --shift = util.by_pixel(1, -63), shifted by 60 due to scaling and centering
      draw_as_glow = true,
      animation_speed = 0.5 * 0.75,
      scale = 3,
      dice_y = 5,
      stripes = {
        {
          filename = kr_explosions_sprites_path .. "matter-explosion-1.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = kr_explosions_sprites_path .. "matter-explosion-2.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = kr_explosions_sprites_path .. "matter-explosion-3.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = kr_explosions_sprites_path .. "matter-explosion-4.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
      },
      hr_version = {
        width = 628,
        height = 720,
        frame_count = 100,
        priority = "very-low",
        flags = { "linear-magnification" },
        shift = util.by_pixel(0.5, -122.5), --shift = util.by_pixel(0.5, -62.5), shifted by 60 due to scaling and centering
        draw_as_glow = true,
        animation_speed = 0.5 * 0.75,
        scale = 1.5,
        dice_y = 5,
        stripes = {
          {
            filename = kr_explosions_sprites_path .. "hr-matter-explosion-1.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = kr_explosions_sprites_path .. "hr-matter-explosion-2.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = kr_explosions_sprites_path .. "hr-matter-explosion-3.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = kr_explosions_sprites_path .. "hr-matter-explosion-4.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
        },
      },
    },
    sound = {
      aggregation = {
        max_count = 1,
        remove = true,
      },
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0,
        },
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } },
          },
        },
      },
    },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "explosion",
    name = "beacon-matter-explosion",
    flags = { "not-on-map" },
    animations = {
      {
        filename = kr_explosions_sprites_path .. "beacon-explosion.png",
        animation_speed = 0.25,
        scale = 0.75,
        width = 932,
        height = 1200,
        line_length = 4,
        frame_count = 8,
        shift = util.by_pixel(0, -180),
        draw_as_glow = true,
      },
    },
    sound = {
      aggregation = {
        max_count = 1,
        remove = true,
      },
      variations = {
        {
          filename = "__Krastorio2Assets__/sounds/others/intergalactic-transceiver-win-wave.ogg",
          volume = 0.8,
        },
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } },
          },
        },
      },
    },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "explosion",
    name = "matter-explosion-s",
    flags = { "not-on-map" },
    animations = {
      width = 316,
      height = 360,
      frame_count = 100,
      priority = "very-low",
      flags = { "linear-magnification" },
      shift = util.by_pixel(1, -123), --shift = util.by_pixel(1, -63), shifted by 60 due to scaling and centering
      draw_as_glow = true,
      animation_speed = 0.5 * 0.75,
      scale = 2,
      dice_y = 5,
      stripes = {
        {
          filename = kr_explosions_sprites_path .. "matter-explosion-1.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = kr_explosions_sprites_path .. "matter-explosion-2.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = kr_explosions_sprites_path .. "matter-explosion-3.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = kr_explosions_sprites_path .. "matter-explosion-4.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
      },
      hr_version = {
        width = 628,
        height = 720,
        frame_count = 100,
        priority = "very-low",
        flags = { "linear-magnification" },
        shift = util.by_pixel(0.5, -122.5), --shift = util.by_pixel(0.5, -62.5), shifted by 60 due to scaling and centering
        draw_as_glow = true,
        animation_speed = 0.5 * 0.75,
        scale = 1,
        dice_y = 5,
        stripes = {
          {
            filename = kr_explosions_sprites_path .. "hr-matter-explosion-1.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = kr_explosions_sprites_path .. "hr-matter-explosion-2.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = kr_explosions_sprites_path .. "hr-matter-explosion-3.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
          {
            filename = kr_explosions_sprites_path .. "hr-matter-explosion-4.png",
            width_in_frames = 5,
            height_in_frames = 5,
          },
        },
      },
    },
    sound = {
      aggregation = {
        max_count = 1,
        remove = true,
      },
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0,
        },
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } },
          },
        },
      },
    },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "explosion",
    name = "small-matter-explosion",
    flags = { "not-on-map" },
    animations = {
      {
        filename = kr_explosions_sprites_path .. "small-matter-explosion.png",
        width = 400,
        height = 400,
        frame_count = 47,
        line_length = 8,
        shift = { 0.1875, -0.75 },
        animation_speed = 0.5,
        draw_as_glow = true,
      },
    },
    sound = {
      aggregation = {
        max_count = 1,
        remove = true,
      },
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0,
        },
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } },
          },
        },
      },
    },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "explosion",
    name = "medium-matter-explosion",
    flags = { "not-on-map" },
    animations = {
      {
        filename = kr_explosions_sprites_path .. "medium-matter-explosion.png",
        width = 800,
        height = 800,
        frame_count = 47,
        line_length = 8,
        shift = { 0.1875, -0.75 },
        animation_speed = 0.4,
        draw_as_glow = true,
      },
    },
    sound = {
      aggregation = {
        max_count = 1,
        remove = true,
      },
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 2.0,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 2.0,
        },
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } },
          },
        },
      },
    },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "explosion",
    name = "rail-matter-explosion",
    flags = { "not-on-map" },
    animations = {
      {
        filename = kr_explosions_sprites_path .. "rail-matter-explosion.png",
        animation_speed = 0.5,
        width = 600,
        height = 800,
        line_length = 6,
        frame_count = 36,
        shift = util.by_pixel(0, -48),
        draw_as_glow = true,
      },
    },
    sound = {
      aggregation = {
        max_count = 2,
        remove = true,
      },
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.0,
        },
      },
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = { { -0.2, -0.2 }, { 0.2, 0.2 } },
          },
        },
      },
    },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "trivial-smoke",
    name = "kr-laser-explosion-gunshot-smoke-fast",
    animation = {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      blend_mode = "additive-soft",
      width = 50,
      height = 50,
      frame_count = 16,
      animation_speed = 16 / 60,
      duration = 600,
      fade_in_duration = 0,
      fade_away_duration = 600,
      spread_duration = 600,
      start_scale = 0.20,
      end_scale = 1.0,
      tint = { r = 0.65, g = 0.0, b = 0.0, a = 0.9 },
    },
    duration = 60,
    fade_away_duration = 60,
  },
  {
    type = "explosion",
    name = "kr-laser-explosion-gunshot",
    flags = { "not-on-map" },
    subgroup = "explosions",
    animations = {
      {
        filename = kr_explosions_sprites_path .. "laser_gunshot.png",
        priority = "extra-high",
        draw_as_glow = true,
        width = 51,
        height = 57,
        frame_count = 2,
        animation_speed = 1.3,
        shift = { 0, 0 },
      },
      {
        filename = kr_explosions_sprites_path .. "laser_gunshot.png",
        priority = "high",
        draw_as_glow = true,
        blend_mode = "additive",
        width = 51,
        height = 57,
        frame_count = 2,
        animation_speed = 1.3,
        shift = { 0, 0 },
      },
      {
        filename = kr_explosions_sprites_path .. "laser_gunshot.png",
        priority = "medium",
        width = 51,
        height = 57,
        frame_count = 2,
        animation_speed = 1.3,
        shift = { 0, 0 },
      },
    },
    rotate = true,
    smoke = "kr-laser-explosion-gunshot-smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 0.25,
  },

  {
    type = "explosion",
    name = "kr-laser-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    icon_size = 64,
    flags = { "not-on-map" },
    subgroup = "explosions",
    animations = {
      filename = kr_explosions_sprites_path .. "laser-explosion.png",
      flags = { "compressed" },
      width = 300,
      height = 300,
      frame_count = 47,
      line_length = 8,
      shift = { 0.1875, -0.75 },
      draw_as_glow = true,
      animation_speed = 0.55,
    },
    sound = {
      aggregation = {
        max_count = 2,
        remove = true,
      },
      audible_distance_modifier = 1.95,
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 0.75,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 0.75,
        },
      },
    },
  },

  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
})
