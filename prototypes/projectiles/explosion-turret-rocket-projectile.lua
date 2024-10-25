data:extend({
  {
    type = "projectile",
    name = "explosion-turret-rocket-projectile",
    flags = { "not-on-map" },
    acceleration = 0.1,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {

          {
            type = "create-entity",
            entity_name = "big-explosion",
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true,
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 8,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = { amount = 3000, type = "kr-explosion" },
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion",
                  },
                  {
                    type = "show-explosion-on-chart",
                    scale = 0.5,
                  },
                },
              },
            },
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/buildings/missiles/rocket.png",
      frame_count = 5,
      line_length = 5,
      width = 13,
      height = 100,
      shift = { 0, 0 },
      priority = "high",
    },
    smoke = {
      {
        name = "smoke-fast",
        deviation = { 0.15, 0.15 },
        frequency = 1,
        position = { 0, 1 },
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5,
      },
    },
    light = { intensity = 0.5, size = 10, color = { r = 1.0, g = 0.75, b = 0.5 } },
  },
})
