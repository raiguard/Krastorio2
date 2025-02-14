data:extend({
  {
    type = "explosion",
    name = "beacon-matter-explosion",
    flags = { "not-on-map" },
    hidden = true,
    animations = {
      {
        filename = "__Krastorio2Assets__/explosions/beacon-explosion.png",
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
      aggregation = { max_count = 1, remove = true },
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
})
