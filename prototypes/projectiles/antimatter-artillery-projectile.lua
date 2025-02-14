local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "artillery-projectile",
    name = "antimatter-artillery-projectile",
    flags = { "not-on-map" },
    hidden = true,
    acceleration = 0,
    direction_only = true,
    reveal_map = true,
    map_color = { r = 1, g = 1, b = 0 },
    picture = {
      filename = "__base__/graphics/entity/artillery-projectile/shell.png",
      width = 64,
      height = 64,
      scale = 0.5,
    },
    shadow = {
      filename = "__base__/graphics/entity/artillery-projectile/shell-shadow.png",
      width = 64,
      height = 64,
      scale = 0.5,
    },
    chart_picture = {
      filename = "__base__/graphics/entity/artillery-projectile/artillery-shoot-map-visualization.png",
      flags = { "icon" },
      frame_count = 1,
      width = 64,
      height = 64,
      priority = "high",
      scale = 0.25,
    },
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "set-tile",
            tile_name = "nuclear-ground",
            radius = 12,
            apply_projection = true,
            tile_collision_mask = { layers = { water_tile = true } },
          },
          {
            type = "destroy-cliffs",
            radius = 11,
            explosion = "explosion",
          },
          {
            type = "create-entity",
            entity_name = "matter-explosion",
          },
          {
            type = "camera-effect",
            effect = "screen-burn",
            duration = 80,
            ease_in_duration = 5,
            ease_out_duration = 60,
            delay = 0,
            strength = 6,
            full_strength_max_distance = 150,
            max_distance = 750,
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
            damage = { amount = 4500, type = "explosion" },
          },
          {
            type = "damage",
            damage = { amount = 3000, type = "radioactive" },
          },
          {
            type = "show-explosion-on-chart",
            scale = 4.5,
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
            spawn_min_radius = 12.5,
            spawn_max_radius = 13.5,
            spawn_min = 80,
            spawn_max = 120,
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
              radius = 15,
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
              repeat_count = 2000,
              radius = 40,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave",
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
              repeat_count = 900,
              radius = 50,
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
              repeat_count = 400,
              radius = 47,
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
              repeat_count = 400,
              radius = 45,
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
              repeat_count = 400,
              radius = 41,
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
              repeat_count = 400,
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
              repeat_count = 1000,
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
              repeat_count = 1000,
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
              repeat_count = 950,
              radius = 40,
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
              repeat_count = 15,
              radius = 14,
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
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high",
    },
    height_from_ground = 280 / 64,
  },
})
