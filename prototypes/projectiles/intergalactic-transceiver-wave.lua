local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "projectile",
    name = "intergalactic-transceiver-wave",
    --flags = {"not-on-map"},
    hidden = true,
    reveal_map = true,
    map_color = { r = 1, g = 0, b = 0.8 },
    acceleration = 0.01,
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "beacon-matter-explosion",
          },
          {
            type = "create-entity",
            entity_name = "beacon-matter-explosion",
          },
          {
            type = "create-entity",
            entity_name = "small-matter-explosion",
          },
          {
            type = "camera-effect",
            effect = "screen-burn",
            duration = 250,
            ease_in_duration = 25,
            ease_out_duration = 150,
            delay = 10,
            strength = 8,
            full_strength_max_distance = 20000,
            max_distance = 50000,
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 50000,
          },
          {
            type = "show-explosion-on-chart",
            scale = 200,
          },
          {
            type = "invoke-tile-trigger",
            repeat_count = 1,
          },
          {
            type = "destroy-decoratives",
            include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
            include_decals = true,
            invoke_decorative_trigger = true,
            decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
            radius = 22, -- large radius for demostrative purposes
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 3000,
              radius = 100,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-ground-zero-projectile",
                starting_speed = 0.9 * 0.9,
                starting_speed_deviation = 0.075,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 3000,
              radius = 200,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-ground-zero-projectile",
                starting_speed = 0.9 * 0.9,
                starting_speed_deviation = 0.075,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 3000,
              radius = 250,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-ground-zero-projectile",
                starting_speed = 0.9 * 0.9,
                starting_speed_deviation = 0.075,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 7500,
              radius = 100,
              action_delivery = {
                type = "projectile",
                projectile = "beacon-wave",
                starting_speed = 0.75 * 1.2,
                starting_speed_deviation = 0.075,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 2500,
              radius = 75,
              action_delivery = {
                type = "projectile",
                projectile = "beacon-wave",
                starting_speed = 0.75 * 0.8,
                starting_speed_deviation = 0.075,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 2000,
              radius = 250,
              action_delivery = {
                type = "projectile",
                projectile = "antimatter-bomb-wave-spawns-matter-smoke",
                starting_speed = 0.6 * 0.78,
                starting_speed_deviation = 0.075,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 7500,
              radius = 125,
              action_delivery = {
                type = "projectile",
                projectile = "antimatter-bomb-wave-spawns-matter-smoke",
                starting_speed = 0.6 * 0.78,
                starting_speed_deviation = 0.075,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 2500,
              radius = 50,
              action_delivery = {
                type = "projectile",
                projectile = "antimatter-bomb-wave-spawns-matter-smoke",
                starting_speed = 0.5 * 0.75,
                starting_speed_deviation = 0.075,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 350,
              radius = 50,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "create-entity",
                    entity_name = "nuclear-smouldering-smoke-source",
                    tile_collision_mask = { layers = { water_tile = true } },
                  },
                },
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 2000,
              radius = 100,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "create-entity",
                    entity_name = "nuclear-smouldering-smoke-source",
                    tile_collision_mask = { layers = { water_tile = true } },
                  },
                },
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              show_in_tooltip = false,
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 3000,
              radius = 200,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "create-entity",
                    entity_name = "nuclear-smouldering-smoke-source",
                    tile_collision_mask = { layers = { water_tile = true } },
                  },
                },
              },
            },
          },
        },
      },
    },
    animation = util.empty_animation(),
    shadow = util.empty_animation(),
    light = { intensity = 0.5, size = 10, color = { r = 0.9, g = 0.1, b = 1 } },
  },
})
