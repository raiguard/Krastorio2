data:extend({
  {
    type = "explosion",
    name = "matter-explosion-s",
    flags = { "not-on-map" },
    hidden = true,
    animations = {
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
          filename = "__Krastorio2Assets__/explosions/matter-explosion-1.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = "__Krastorio2Assets__/explosions/matter-explosion-2.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = "__Krastorio2Assets__/explosions/matter-explosion-3.png",
          width_in_frames = 5,
          height_in_frames = 5,
        },
        {
          filename = "__Krastorio2Assets__/explosions/matter-explosion-4.png",
          width_in_frames = 5,
          height_in_frames = 5,
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
})
