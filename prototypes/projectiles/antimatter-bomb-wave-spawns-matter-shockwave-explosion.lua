data:extend({
  {
    type = "projectile",
    name = "antimatter-bomb-wave-spawns-matter-shockwave-explosion",
    flags = { "not-on-map" },
    hidden = true,
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-explosion",
              entity_name = "matter-shockwave",
              max_movement_distance = 21 / 6,
              max_movement_distance_deviation = 2,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true,
            },
          },
        },
      },
    },
    animation = nil,
    shadow = nil,
  },
})
