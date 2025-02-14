data:extend({
  {
    type = "projectile",
    name = "antimatter-bomb-wave-spawns-matter-smoke",
    flags = { "not-on-map" },
    hidden = true,
    acceleration = 0,
    speed_modifier = { 1.000, 0.707 },
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              repeat_count = 10,
              type = "create-trivial-smoke",
              smoke_name = "matter-smoke",
              offset_deviation = { { -2, -2 }, { 2, 2 } },
              starting_frame = 10,
              starting_frame_deviation = 20,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.035,
            },
          },
        },
      },
    },
    animation = nil,
    shadow = nil,
  },
})
