data:extend({
  {
    type = "projectile",
    name = "basic-railgun-projectile",
    flags = { "not-on-map" },
    -- collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0.25,
    -- direction_only = true,
    piercing_damage = 1000,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "damage",
            damage = { amount = 2000, type = "physical" },
          },
          {
            type = "damage",
            damage = { amount = 500, type = "explosion" },
          },
          {
            type = "create-entity",
            entity_name = "explosion",
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
            entity_name = "small-scorchmark",
            check_buildability = true,
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/railbullet.png",
      frame_count = 1,
      width = 5,
      height = 90,
      priority = "high",
    },
    light = { intensity = 0.5, size = 10, color = { r = 0.8, g = 0.8, b = 0.5 } },
  },
})
