local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "projectile",
    name = "antimatter-rocket-projectile",
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
            type = "set-tile",
            tile_name = "nuclear-ground",
            radius = 13,
            apply_projection = true,
            tile_collision_mask = { layers = { water_tile = true } },
          },
          {
            type = "destroy-cliffs",
            radius = 12,
            explosion = "explosion",
          },
          {
            type = "create-entity",
            entity_name = "matter-explosion",
          },
          {
            type = "camera-effect",
            effect = "screen-burn",
            duration = 100,
            ease_in_duration = 5,
            ease_out_duration = 60,
            delay = 0,
            strength = 6,
            full_strength_max_distance = 200,
            max_distance = 800,
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
          },
          {
            type = "damage",
            damage = { amount = 5000, type = "explosion" },
          },
          {
            type = "damage",
            damage = { amount = 3500, type = "radioactive" },
          },
          {
            type = "show-explosion-on-chart",
            scale = 5,
          },
          {
            type = "create-entity",
            entity_name = "huge-scorchmark",
            check_buildability = true,
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
            radius = 25, -- large radius for demostrative purposes
          },
          {
            type = "create-decorative",
            decorative = "nuclear-ground-patch",
            spawn_min_radius = 13.5,
            spawn_max_radius = 14.5,
            spawn_min = 100,
            spawn_max = 150,
            apply_projection = true,
            spread_evenly = true,
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1500,
              radius = 16,
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
              repeat_count = 2500,
              radius = 50,
              action_delivery = {
                type = "projectile",
                projectile = "antimatter-bomb-wave",
                starting_speed = 0.5 * 0.8,
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
              repeat_count = 1000,
              radius = 60,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 5,
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
              repeat_count = 500,
              radius = 57,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 4,
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
              repeat_count = 500,
              radius = 55,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 3,
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
              repeat_count = 500,
              radius = 51,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 2,
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
              repeat_count = 500,
              radius = 50,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 1,
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
              repeat_count = 1250,
              radius = 6,
              action_delivery = {
                type = "projectile",
                projectile = "antimatter-bomb-wave-spawns-fire-smoke-explosion",
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
              repeat_count = 1250,
              radius = 8,
              action_delivery = {
                type = "projectile",
                projectile = "antimatter-bomb-wave-spawns-matter-shockwave-explosion",
                starting_speed = 0.5 * 0.8,
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
              repeat_count = 1000,
              radius = 50,
              action_delivery = {
                type = "projectile",
                projectile = "antimatter-bomb-wave-spawns-matter-smoke",
                starting_speed = 0.5 * 0.78,
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
              repeat_count = 20,
              radius = 16,
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
    -- TODO: Different tint
    animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({ 1, 0.8, 0.3 }),
    shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
    smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
    light = { intensity = 0.5, size = 10, color = { r = 0.9, g = 0.1, b = 1 } },
  },
})
