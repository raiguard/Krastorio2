data:extend({
  {
    type = "projectile",
    name = "beacon-wave",
    flags = { "not-on-map" },
    hidden = true,
    acceleration = 0,
    speed_modifier = { 1.0, 0.707 },
    action = {
      {
        type = "area",
        radius = 2,
        ignore_collision_condition = true,
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "damage",
            vaporize = false,
            lower_distance_threshold = 0,
            upper_distance_threshold = 100,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.25,
            damage = { amount = 1, type = "radioactive" },
          },
          {
            type = "damage",
            vaporize = false,
            lower_distance_threshold = 0,
            upper_distance_threshold = 100,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.1,
            damage = { amount = 1, type = "kr-explosion" },
          },
        },
      },
    },
    animation = nil,
    shadow = nil,
  },
})
