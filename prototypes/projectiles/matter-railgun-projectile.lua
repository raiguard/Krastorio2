data:extend({
  {
    type = "projectile",
    name = "matter-railgun-projectile",
    flags = { "not-on-map" },
    --collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0.25,
    --direction_only = true,
    piercing_damage = 1000,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "damage",
            damage = { amount = 3000, type = "physical" },
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
            entity_name = "rail-matter-explosion",
          },
          {
            repeat_count = 50,
            type = "create-trivial-smoke",
            smoke_name = "nuclear-smoke",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            starting_frame = 3,
            starting_frame_deviation = 5,
            starting_frame_speed = 0,
            starting_frame_speed_deviation = 5,
            speed_from_center = 0.5,
          },
          {
            type = "show-explosion-on-chart",
            scale = 1,
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 10,
              radius = 6,
              action_delivery = {
                type = "projectile",
                projectile = "matter-wave",
                starting_speed = 0.5,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              radius = 6,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = { amount = 2000, type = "explosion" },
                  },
                  {
                    type = "create-entity",
                    entity_name = "rail-matter-explosion",
                  },
                },
              },
            },
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true,
          },
          {
            type = "destroy-cliffs",
            radius = 1.5,
            explosion = "explosion",
          },
          {
            type = "destroy-decoratives",
            from_render_layer = "decorative",
            to_render_layer = "object",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = false,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 2, -- large radius for demostrative purposes
          },
        },
      },
    },
    animation = {
      filename = "__Krastorio2Assets__/buildings/missiles/missile-m.png",
      frame_count = 1,
      width = 10,
      height = 167,
      priority = "high",
    },
    light = { intensity = 0.5, size = 10, color = { r = 0.9, g = 0.1, b = 1 } },
  },
})
