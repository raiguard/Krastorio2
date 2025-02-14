local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "projectile",
    name = "nuclear-turret-rocket-projectile",
    flags = { "not-on-map" },
    hidden = true,
    --collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0.1,
    --direction_only = true,
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
            radius = 9,
            explosion = "explosion",
          },
          {
            type = "create-entity",
            entity_name = "nuke-explosion",
          },
          {
            type = "camera-effect",
            effect = "screen-burn",
            duration = 60,
            ease_in_duration = 5,
            ease_out_duration = 60,
            delay = 0,
            strength = 5,
            full_strength_max_distance = 150,
            max_distance = 700,
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
            damage = { amount = 1000, type = "explosion" },
          },
          {
            type = "damage",
            damage = { amount = 1000, type = "radioactive" },
          },
          {
            type = "show-explosion-on-chart",
            scale = 2,
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
            radius = 15, -- large radius for demostrative purposes
          },
          {
            type = "create-decorative",
            decorative = "nuclear-ground-patch",
            spawn_min_radius = 11.5,
            spawn_max_radius = 12.5,
            spawn_min = 30,
            spawn_max = 40,
            apply_projection = true,
            spread_evenly = true,
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 900,
              radius = 6,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-ground-zero-projectile",
                starting_speed = 0.6 * 0.8,
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
              repeat_count = 750,
              radius = 20,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.5 * 0.7,
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
              repeat_count = 750,
              radius = 19,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 0.7,
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
              repeat_count = 650,
              radius = 4,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-fire-smoke-explosion",
                starting_speed = 0.5 * 0.65,
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
              radius = 6,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
                starting_speed = 0.5 * 0.65,
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
              repeat_count = 250,
              radius = 19,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-nuclear-smoke",
                starting_speed = 0.55 * 0.65,
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
              repeat_count = 10,
              radius = 8,
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
      light = { intensity = 0.5, size = 10, color = { r = 0.5, g = 1.0, b = 0.75 } },
    },
    animation = {
      filename = "__Krastorio2Assets__/projectiles/rocket-n.png",
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
  },
})
