data:extend({
  {
    type = "explosion",
    name = "rail-matter-explosion",
    flags = { "not-on-map" },
    animations = {
      {
        filename = "__Krastorio2Assets__/entities/explosions/rail-matter-explosion.png",
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
      aggregation = { max_count = 2, remove = true },
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
})
