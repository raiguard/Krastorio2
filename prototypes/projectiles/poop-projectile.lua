data:extend({
  {
    type = "projectile",
    name = "poop-projectile",
    flags = { "not-on-map" },
    acceleration = 0.005,
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-smoke",
              show_in_tooltip = true,
              entity_name = "poop-cloud",
              initial_height = 0,
            },
          },
        },
      },
    },
    light = { intensity = 0.5, size = 4 },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/poop.png",
      frame_count = 12,
      animation_speed = 0.3,
      width = 64,
      height = 64,
      shift = util.by_pixel(1, 0.5),
      priority = "high",
      scale = 0.35,
    },
    shadow = {
      filename = "__Krastorio2Assets__/projectiles/poop.png",
      frame_count = 12,
      animation_speed = 0.3,
      width = 64,
      height = 64,
      shift = util.by_pixel(1, 2),
      priority = "high",
      draw_as_shadow = true,
      scale = 0.35,
    },
    smoke = {
      {
        name = "poop-particle-smoke",
        deviation = { 0.15, 0.15 },
        frequency = 1,
        position = { 0, 0 },
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed_deviation = 5,
      },
    },
  },
})
