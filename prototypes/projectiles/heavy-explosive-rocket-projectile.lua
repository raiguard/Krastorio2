data:extend({
  {
    type = "projectile",
    name = "heavy-explosive-rocket-projectile",
    --flags = {"not-on-map"},
    hidden = true,
    reveal_map = true,
    map_color = { r = 1, g = 0, b = 0 },
    acceleration = 0.075,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-trivial-smoke",
            smoke_name = "artillery-smoke",
            initial_height = 0,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.005,
            offset_deviation = { { -4, -4 }, { 4, 4 } },
            max_radius = 12,
            repeat_count = 4 * 4 * 15,
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true,
          },
          {
            repeat_count = 100,
            type = "create-trivial-smoke",
            smoke_name = "nuclear-smoke",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            starting_frame = 3,
            starting_frame_deviation = 5,
            starting_frame_speed = 0,
            starting_frame_speed_deviation = 5,
            speed_from_center = 0.75,
          },
          {
            type = "create-entity",
            entity_name = "big-explosion",
          },
          {
            type = "create-entity",
            entity_name = "big-artillery-explosion",
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
              repeat_count = 25,
              radius = 10,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.35,
              },
            },
          },
        },
      },
    },
    animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({ 1, 0.8, 0.3 }),
    shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
    smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
    light = { intensity = 0.5, size = 10, color = { r = 1.0, g = 1.0, b = 0.5 } },
  },
})
