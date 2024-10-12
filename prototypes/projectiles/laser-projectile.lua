data:extend({
  {
    type = "projectile",
    name = "laser-projectile",
    flags = { "not-on-map" },
    --collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    --direction_only = true,
    --piercing_damage = 500,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "damage",
            damage = { amount = 1000, type = "laser" },
          },
          --          {
          --            type = "damage",
          --            damage = {amount = 500 , type = "explosion"}
          --          },
          {
            type = "create-entity",
            entity_name = "kr-laser-explosion",
          },
        },
      },
    },
    final_action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {

          {
            type = "create-entity",
            entity_name = "big-explosion",
          },
          {
            type = "show-explosion-on-chart",
            scale = 1,
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
              radius = 4,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = { amount = 250, type = "kr-explosion" },
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion",
                  },
                },
              },
            },
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/entities/missiles/laser.png",
      frame_count = 1,
      width = 6,
      height = 90,
      priority = "high",
    },
    light = { intensity = 2, size = 15, color = { r = 1, g = 0.1, b = 0.1 } },
  },
})
