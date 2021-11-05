local particle_animations = require("__Krastorio2__/prototypes/entities/explosions&projectiles/particle-animations")

local smoke_animations = require("__base__/prototypes/entity/smoke-animations")
local sounds = require("__base__/prototypes/entity/sounds")

local max_nuke_shockwave_movement_distance_deviation = 2

local max_nuke_shockwave_movement_distance = 19 + max_nuke_shockwave_movement_distance_deviation / 6

local nuke_shockwave_starting_speed_deviation = 0.075

local smoke_fast_animation = function(opts)
  local opts = opts or {}
  return {
    filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
    priority = "high",
    width = 50,
    height = 50,
    frame_count = 16,
    animation_speed = opts.animation_speed or (16 / 60),
    scale = opts.scale,
    tint = opts.tint,
  }
end

-- Copy of main Factorio function to make standard water reflect

local default_ended_in_water_trigger_effect = function()
  return {

    {

      type = "create-particle",
      probability = 1,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "deep-water-particle",
      offset_deviation = { { -0.05, -0.05 }, { 0.05, 0.05 } },
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.05,
      initial_vertical_speed_deviation = 0.05,
      speed_from_center = 0.01,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 2,
      tail_length_deviation = 1,
      tail_width = 3,
    },
    {
      type = "create-particle",
      repeat_count = 10,
      repeat_count_deviation = 6,
      probability = 0.03,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "deep-water-particle",
      offsets = {
        { 0, 0 },
        { 0.01563, -0.09375 },
        { 0.0625, 0.09375 },
        { -0.1094, 0.0625 },
      },
      offset_deviation = { { -0.2969, -0.1992 }, { 0.2969, 0.1992 } },
      tile_collision_mask = nil,
      initial_height = 0,
      initial_height_deviation = 0.02,
      initial_vertical_speed = 0.053,
      initial_vertical_speed_deviation = 0.005,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.006,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 9,
      tail_length_deviation = 0,
      tail_width = 1,
    },
    {
      type = "play-sound",
      sound = sounds.small_splash,
    },
  }
end

-- Copy of main Factorio function to make particle

local make_particle = function(params)
  if not params then
    error("No params given to make_particle function")
  end
  local name = params.name or error("No name given")

  local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect or default_ended_in_water_trigger_effect()
  if params.ended_in_water_trigger_effect == false then
    ended_in_water_trigger_effect = nil
  end

  local particle = {

    type = "optimized-particle",
    name = name,

    life_time = params.life_time or (60 * 15),
    fade_away_duration = params.fade_away_duration,

    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",

    regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = ended_in_water_trigger_effect,

    pictures = params.pictures,
    shadows = params.shadows,
    draw_shadow_when_on_ground = params.draw_shadow_when_on_ground,

    movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
    movement_modifier = params.movement_modifier,
    vertical_acceleration = params.vertical_acceleration,

    mining_particle_frame_speed = params.mining_particle_frame_speed,
  }

  return particle
end

data:extend({
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------

  {
    type = "projectile",
    name = "heavy-explosive-rocket-projectile",
    --flags = {"not-on-map"},
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
    animation = {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 8,
      line_length = 8,
      width = 9,
      height = 35,
      shift = { 0, 0 },
      priority = "high",
    },
    shadow = {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      width = 7,
      height = 24,
      priority = "high",
      shift = { 0, 0 },
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
    light = { intensity = 0.5, size = 10, color = { r = 1.0, g = 1.0, b = 0.5 } },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "projectile",
    name = "antimatter-bomb-wave-spawns-matter-shockwave-explosion",
    flags = { "not-on-map" },
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-explosion",
              entity_name = "matter-shockwave",
              max_movement_distance = max_nuke_shockwave_movement_distance,
              max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true,
            },
          },
        },
      },
    },
    animation = nil,
    shadow = nil,
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "projectile",
    name = "antimatter-bomb-wave-spawns-fire-smoke-explosion",
    flags = { "not-on-map" },
    acceleration = 0,
    speed_modifier = { 1, 0.707 },
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-explosion",
              entity_name = "matter-fire-smoke",
              max_movement_distance = max_nuke_shockwave_movement_distance,
              max_movement_distance_deviation = max_nuke_shockwave_movement_distance_deviation,
              inherit_movement_distance_from_projectile = true,
              cycle_while_moving = true,
            },
          },
        },
      },
    },
    animation = nil,
    shadow = nil,
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "trivial-smoke",
    name = "matter-smoke",
    spread_duration = 100,
    duration = 30,
    fade_in_duration = 10,
    fade_away_duration = 20,
    start_scale = 1.5,
    -- scale_deviation = 0.5, -- FIXME: add support for scale deviation to trivial-smoke?
    end_scale = 0.2,
    render_layer = "higher-object-under",
    color = { r = 0.15, g = 0.09, b = 0.12, a = 0.5 },
    affected_by_wind = true,
    cyclic = true,
    animation = smoke_animations.trivial_smoke_fast({
      animation_speed = 1 / 6,
      scale = 2,
      flags = { "smoke", "linear-magnification" },
    }),
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "projectile",
    name = "antimatter-bomb-wave-spawns-matter-smoke",
    flags = { "not-on-map" },
    acceleration = 0,
    speed_modifier = { 1.000, 0.707 },
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              repeat_count = 10,
              type = "create-trivial-smoke",
              smoke_name = "matter-smoke",
              offset_deviation = { { -2, -2 }, { 2, 2 } },
              starting_frame = 10,
              starting_frame_deviation = 20,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.035,
            },
          },
        },
      },
    },
    animation = nil,
    shadow = nil,
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "projectile",
    name = "antimatter-bomb-wave",
    flags = { "not-on-map" },
    acceleration = 0,
    speed_modifier = { 1.0, 0.707 },
    action = {
      {
        type = "area",
        radius = 3,
        ignore_collision_condition = true,
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "damage",
            vaporize = false,
            lower_distance_threshold = 0,
            upper_distance_threshold = 50,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.1,
            damage = { amount = 200, type = "explosion" },
          },
          {
            type = "damage",
            vaporize = false,
            lower_distance_threshold = 0,
            upper_distance_threshold = 50,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.25,
            damage = { amount = 200, type = "radioactive" },
          },
          {
            type = "damage",
            vaporize = false,
            lower_distance_threshold = 0,
            upper_distance_threshold = 50,
            lower_damage_modifier = 1,
            upper_damage_modifier = 0.1,
            damage = { amount = 200, type = "kr-explosion" },
          },
        },
      },
    },
    animation = nil,
    shadow = nil,
  },

  {
    type = "projectile",
    name = "beacon-wave",
    flags = { "not-on-map" },
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

  {
    type = "projectile",
    name = "antimatter-rocket-projectile",
    --flags = {"not-on-map"},
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
            tile_collision_mask = { "water-tile" },
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
            -- volume_modifier = 1,
            audible_distance_modifier = 3,
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                    tile_collision_mask = { "water-tile" },
                  },
                },
              },
            },
          },
        },
      },
    },
    animation = {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 8,
      line_length = 8,
      width = 9,
      height = 35,
      shift = { 0, 0 },
      priority = "high",
    },
    shadow = {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      width = 7,
      height = 24,
      priority = "high",
      shift = { 0, 0 },
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
    light = { intensity = 0.5, size = 10, color = { r = 0.9, g = 0.1, b = 1 } },
  },

  ---------------

  {
    type = "projectile",
    name = "intergalactic-transceiver-wave",
    --flags = {"not-on-map"},
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
            -- volume_modifier = 1,
            audible_distance_modifier = 1000,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                    tile_collision_mask = { "water-tile" },
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
                    tile_collision_mask = { "water-tile" },
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
                    tile_collision_mask = { "water-tile" },
                  },
                },
              },
            },
          },
        },
      },
    },
    animation = {
      filename = kr_entities_path .. "empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      shift = { 0, 0 },
      priority = "low",
    },
    shadow = {
      filename = kr_entities_path .. "empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      shift = { 0, 0 },
      priority = "low",
    },
    light = { intensity = 0.5, size = 10, color = { r = 0.9, g = 0.1, b = 1 } },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "artillery-projectile",
    name = "antimatter-artillery-projectile",
    flags = { "not-on-map" },
    acceleration = 0,
    direction_only = true,
    reveal_map = true,
    map_color = { r = 1, g = 1, b = 0 },
    picture = {
      filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
      width = 64,
      height = 64,
      scale = 0.5,
    },
    shadow = {
      filename = "__base__/graphics/entity/artillery-projectile/hr-shell-shadow.png",
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
            tile_collision_mask = { "water-tile" },
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
            -- volume_modifier = 1,
            audible_distance_modifier = 3,
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                    tile_collision_mask = { "water-tile" },
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

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "projectile",
    name = "matter-wave",
    flags = { "not-on-map" },
    acceleration = 0,
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "small-matter-explosion",
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
      {
        type = "area",
        radius = 6,
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "damage",
            damage = { amount = 3000, type = "explosion" },
          },
        },
      },
    },
    animation = {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high",
    },
    shadow = {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      width = 1,
      height = 1,
      priority = "high",
    },
  },

  -----------------------------------------------------------------------------------------------------------------

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
      filename = kr_entities_path .. "missiles/laser.png",
      frame_count = 1,
      width = 6,
      height = 90,
      priority = "high",
    },
    light = { intensity = 2, size = 15, color = { r = 1, g = 0.1, b = 0.1 } },
  },

  -----------------------------------------------------------------------------------------------------------------

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
      filename = kr_entities_path .. "missiles/railbullet.png",
      frame_count = 1,
      width = 5,
      height = 90,
      priority = "high",
    },
    light = { intensity = 0.5, size = 10, color = { r = 0.8, g = 0.8, b = 0.5 } },
  },

  {
    type = "projectile",
    name = "explosion-railgun-projectile",
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
            entity_name = "big-explosion",
          },
          {
            type = "show-explosion-on-chart",
            scale = 0.5,
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
                    damage = { amount = 2000, type = "kr-explosion" },
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
      filename = kr_entities_path .. "missiles/missile-e.png",
      frame_count = 1,
      width = 5,
      height = 90,
      priority = "high",
    },
    light = { intensity = 0.5, size = 10, color = { r = 1.0, g = 0.8, b = 0.5 } },
  },

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
      filename = kr_entities_path .. "missiles/missile-m.png",
      frame_count = 1,
      width = 10,
      height = 167,
      priority = "high",
    },
    light = { intensity = 0.5, size = 10, color = { r = 0.9, g = 0.1, b = 1 } },
  },

  -----------------------------------------------------------------------------------------------------------------

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
      filename = kr_entities_path .. "missiles/rocket.png",
      frame_count = 5,
      line_length = 5,
      width = 13,
      height = 100,
      shift = { 0, 0 },
      priority = "high",
    },
    shadow = {
      filename = kr_entities_path .. "missiles/rocket-shadow.png",
      frame_count = 1,
      width = 12,
      height = 40,
      priority = "high",
      shift = { 0, 0 },
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

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "projectile",
    name = "nuclear-turret-rocket-projectile",
    flags = { "not-on-map" },
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
            tile_collision_mask = { "water-tile" },
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
            -- volume_modifier = 1,
            audible_distance_modifier = 3,
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                    tile_collision_mask = { "water-tile" },
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
      filename = kr_entities_path .. "missiles/rocket-n.png",
      frame_count = 5,
      line_length = 5,
      width = 13,
      height = 100,
      shift = { 0, 0 },
      priority = "high",
    },
    shadow = {
      filename = kr_entities_path .. "missiles/rocket-shadow.png",
      frame_count = 1,
      width = 12,
      height = 40,
      priority = "high",
      shift = { 0, 0 },
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

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "projectile",
    name = "matter-turret-rocket-projectile",
    flags = { "not-on-map" },
    acceleration = 0.1,
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
            tile_collision_mask = { "water-tile" },
          },
          {
            type = "destroy-cliffs",
            radius = 10,
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
            strength = 5,
            full_strength_max_distance = 150,
            max_distance = 750,
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3,
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3,
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
            spawn_min_radius = 12.5,
            spawn_max_radius = 13.5,
            spawn_min = 80,
            spawn_max = 100,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1500,
              radius = 35,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.5 * 0.8,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              repeat_count = 700,
              radius = 40,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 5,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              radius = 38,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 4,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              radius = 37,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 3,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              radius = 36,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 2,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              radius = 35,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 1,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              radius = 35,
              action_delivery = {
                type = "projectile",
                projectile = "antimatter-bomb-wave-spawns-matter-smoke",
                starting_speed = 0.5 * 0.78,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                    tile_collision_mask = { "water-tile" },
                  },
                },
              },
            },
          },
        },
      },
    },
    animation = {
      filename = kr_entities_path .. "missiles/rocket-m.png",
      frame_count = 5,
      line_length = 5,
      width = 13,
      height = 100,
      shift = { 0, 0 },
      priority = "high",
    },
    shadow = {
      filename = kr_entities_path .. "missiles/rocket-shadow.png",
      frame_count = 1,
      width = 12,
      height = 40,
      priority = "high",
      shift = { 0, 0 },
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
    light = { intensity = 0.5, size = 10, color = { r = 0.75, g = 0.8, b = 1 } },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "artillery-projectile",
    name = "atomic-artillery",
    flags = { "not-on-map" },
    reveal_map = true,
    map_color = { r = 1, g = 1, b = 0 },
    acceleration = 0.005,
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
            tile_collision_mask = { "water-tile" },
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
            strength = 6,
            full_strength_max_distance = 150,
            max_distance = 700,
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion(0.9),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3,
          },
          {
            type = "play-sound",
            sound = sounds.nuclear_explosion_aftershock(0.4),
            play_on_target_position = false,
            -- min_distance = 200,
            max_distance = 1000,
            -- volume_modifier = 1,
            audible_distance_modifier = 3,
          },
          {
            type = "damage",
            damage = { amount = 1250, type = "explosion" },
          },
          {
            type = "damage",
            damage = { amount = 1250, type = "radioactive" },
          },
          {
            type = "show-explosion-on-chart",
            scale = 3,
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
              repeat_count = 1000,
              radius = 7,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-ground-zero-projectile",
                starting_speed = 0.6 * 0.8,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
              },
            },
          },
          {
            type = "nested-result",
            action = {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 1000,
              radius = 30,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.5 * 0.7,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              radius = 29,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                starting_speed = 0.5 * 0.7,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              radius = 4,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-fire-smoke-explosion",
                starting_speed = 0.5 * 0.65,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
                starting_speed = 0.5 * 0.65,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
              repeat_count = 300,
              radius = 26,
              action_delivery = {
                type = "projectile",
                projectile = "atomic-bomb-wave-spawns-nuclear-smoke",
                starting_speed = 0.55 * 0.65,
                starting_speed_deviation = nuke_shockwave_starting_speed_deviation,
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
                    tile_collision_mask = { "water-tile" },
                  },
                },
              },
            },
          },
        },
      },
    },
    light = { intensity = 0.8, size = 15 },
    picture = {
      filename = "__base__/graphics/entity/artillery-projectile/hr-shell.png",
      width = 64,
      height = 64,
      scale = 0.5,
    },
    shadow = {
      filename = "__base__/graphics/entity/artillery-projectile/hr-shell-shadow.png",
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

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "trivial-smoke",
    name = "poop-particle-smoke",
    animation = smoke_fast_animation({
      scale = 0.2,
    }),
    duration = 60,
    fade_away_duration = 60,
    render_layer = "higher-object-above",
    color = { r = 0.5, g = 0.4, b = 0.35, a = 0.690 },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "smoke-with-trigger",
    name = "poop-cloud-visual-dummy",
    flags = { "not-on-map" },
    show_when_smoke_off = true,
    particle_count = 24,
    particle_spread = { 3.6 * 1.05, 3.6 * 0.6 * 1.05 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    particle_duration_variation = 60 * 3,
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 1, 0.5 },
    spread_duration_variation = 300 - 20,

    render_layer = "object",

    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20 + 4 * 60,
    fade_away_duration = 3 * 60,
    spread_duration = (300 - 20) / 2,
    color = { r = 0.5, g = 0.4, b = 0.35, a = 0.690 }, -- #035b6452

    animation = {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = { -0.53125, -0.4375 },
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" },
    },

    --working_sound =
    --{
    --  sound =
    --  {
    --    filename = "__base__/sound/fight/poison-cloud.ogg",
    --    volume = 0.5
    --  },
    --},
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    name = "poop-cloud",
    type = "smoke-with-trigger",
    flags = { "not-on-map" },
    show_when_smoke_off = true,
    particle_count = 16,
    particle_spread = { 3.6 * 1.05, 3.6 * 0.6 * 1.05 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    wave_speed = { 1 / 80, 1 / 60 },
    wave_distance = { 0.3, 0.2 },
    spread_duration_variation = 20,
    particle_duration_variation = 60 * 3,
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20,
    fade_away_duration = 2 * 60,
    spread_duration = 20,
    color = { r = 0.5, g = 0.4, b = 0.35, a = 0.690 }, -- #3ddffdb0,
    animation = {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = { -0.53125, -0.4375 },
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" },
    },
    created_effect = {
      {
        type = "cluster",
        cluster_count = 10,
        distance = 4,
        distance_deviation = 5,
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "poop-cloud-visual-dummy",
            initial_height = 0,
          },
        },
      },
      {
        type = "cluster",
        cluster_count = 11,
        distance = 8 * 1.1,
        distance_deviation = 2,
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "poop-cloud-visual-dummy",
            initial_height = 0,
          },
        },
      },
    },
    working_sound = {
      sound = {
        filename = "__base__/sound/fight/poison-cloud.ogg",
        volume = 0.7,
      },
    },
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          type = "nested-result",
          action = {
            type = "area",
            radius = 11,
            entity_flags = { "breaths-air" },
            action_delivery = {
              type = "instant",
              target_effects = {
                type = "damage",
                damage = { amount = 8, type = "poison" },
              },
            },
          },
        },
      },
    },
    action_cooldown = 30,
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "projectile",
    name = "poop-projectile",
    flags = { "not-on-map" },
    acceleration = 0.005,
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-smoke",
              show_in_tooltip = true,
              entity_name = "poop-cloud",
              initial_height = 0,
            },
          },
        },
      },
    },
    light = { intensity = 0.5, size = 4 },
    animation = {
      filename = kr_entities_path .. "bullets/poop.png",
      frame_count = 12,
      animation_speed = 0.3,
      width = 32,
      height = 32,
      shift = util.by_pixel(1, 0.5),
      priority = "high",
      scale = 0.7,
      hr_version = {
        filename = kr_entities_path .. "bullets/hr-poop.png",
        frame_count = 12,
        animation_speed = 0.3,
        width = 64,
        height = 64,
        shift = util.by_pixel(1, 0.5),
        priority = "high",
        scale = 0.35,
      },
    },
    shadow = {
      filename = kr_entities_path .. "bullets/poop.png",
      frame_count = 12,
      animation_speed = 0.3,
      width = 32,
      height = 32,
      shift = util.by_pixel(1, 2),
      priority = "high",
      draw_as_shadow = true,
      scale = 0.7,
      hr_version = {
        filename = kr_entities_path .. "bullets/hr-poop.png",
        frame_count = 12,
        animation_speed = 0.3,
        width = 64,
        height = 64,
        shift = util.by_pixel(1, 2),
        priority = "high",
        draw_as_shadow = true,
        scale = 0.35,
      },
    },
    smoke = {
      {
        name = "poop-particle-smoke",
        deviation = { 0.15, 0.15 },
        frequency = 1,
        position = { 0, 0 },
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed_deviation = 5,
      },
    },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "trivial-smoke",
    name = "virus-particle-smoke",
    animation = smoke_fast_animation({
      scale = 0.2,
    }),
    duration = 60,
    fade_away_duration = 60,
    render_layer = "higher-object-above",
    color = { r = 0.5, g = 0.4, b = 0.35, a = 0.690 },
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "smoke-with-trigger",
    name = "virus-cloud-visual-dummy",
    flags = { "not-on-map" },
    show_when_smoke_off = true,
    particle_count = 24,
    particle_spread = { 3.6 * 1.05, 3.6 * 0.6 * 1.05 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    particle_duration_variation = 60 * 3,
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 1, 0.5 },
    spread_duration_variation = 300 - 20,
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20 + 4 * 60,
    fade_away_duration = 3 * 60,
    spread_duration = (300 - 20) / 2,
    color = { r = 0.6, g = 0.2, b = 0.4, a = 0.5 }, -- #0
    animation = {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = { -0.53125, -0.4375 },
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" },
    },
    --working_sound =
    --{
    --  sound =
    --  {
    --    filename = "__base__/sound/fight/poison-cloud.ogg",
    --    volume = 0.5
    --  },
    --},
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    name = "virus-cloud",
    type = "smoke-with-trigger",
    flags = { "not-on-map" },
    show_when_smoke_off = true,
    particle_count = 20,
    particle_spread = { 3.6 * 1.05, 3.6 * 0.6 * 1.05 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    wave_speed = { 1 / 80, 1 / 60 },
    wave_distance = { 0.3, 0.2 },
    spread_duration_variation = 20,
    particle_duration_variation = 60 * 3,
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20,
    fade_away_duration = 2 * 60,
    spread_duration = 20,
    color = { r = 0.75, g = 0.2, b = 0.5, a = 0.5 }, -- #
    animation = {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = { -0.53125, -0.4375 },
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" },
    },
    created_effect = {
      {
        type = "cluster",
        cluster_count = 20,
        distance = 5,
        distance_deviation = 5.5,
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "virus-cloud-visual-dummy",
            initial_height = 0,
          },
        },
      },
      {
        type = "cluster",
        cluster_count = 20,
        distance = 9 * 1.1,
        distance_deviation = 3.5,
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "virus-cloud-visual-dummy",
            initial_height = 0,
          },
        },
      },
    },
    working_sound = {
      sound = {
        filename = "__base__/sound/fight/poison-cloud.ogg",
        volume = 0.7,
      },
    },
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          type = "nested-result",
          action = {
            type = "area",
            radius = 60,
            entity_flags = { "breaths-air" },
            action_delivery = {
              type = "instant",
              target_effects = {
                type = "damage",
                damage = { amount = 30, type = "poison" },
              },
            },
          },
        },
      },
    },
    action_cooldown = 30,
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "trivial-smoke",
    name = "poison-capsule-particle-smoke",
    animation = smoke_fast_animation({
      scale = 0.2,
    }),
    duration = 360,
    fade_away_duration = 60,
    render_layer = "higher-object-above",
    color = { r = 0.75, g = 0.2, b = 0.5, a = 0.5 },
  },
  make_particle({
    name = "virus-capsule-metal-particle",
    pictures = particle_animations.get_metal_particle_small_pictures({}),
    shadows = particle_animations.get_metal_particle_small_pictures({
      tint = shadowtint(),
      shift = util.by_pixel(1, 0),
    }),
    regular_trigger_effect = {
      type = "create-trivial-smoke",
      smoke_name = "poison-capsule-particle-smoke",
      starting_frame_deviation = 0,
      starting_frame_speed_deviation = 0,
      offset_deviation = { { -0.03, -0.03 }, { 0.03, 0.03 } },
      speed_from_center = nil,
    },
    ended_in_water_trigger_effect = default_ended_in_water_trigger_effect(),
  }),

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "projectile",
    name = "virus-capsule",
    flags = { "not-on-map" },
    acceleration = 0.005,
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-smoke",
              show_in_tooltip = true,
              entity_name = "virus-cloud",
              initial_height = 0,
            },
            {
              type = "create-particle",
              particle_name = "virus-capsule-metal-particle",
              repeat_count = 8,
              initial_height = 1,
              initial_vertical_speed = 0.1,
              initial_vertical_speed_deviation = 0.05,
              offset_deviation = { { -0.1, -0.1 }, { 0.1, 0.1 } },
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.01,
            },
          },
        },
      },
    },
    light = { intensity = 0.5, size = 4 },
    animation = {
      filename = kr_entities_path .. "bullets/virus-capsule.png",
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.250,
      width = 29,
      height = 29,
      shift = util.by_pixel(1, 0.5),
      priority = "high",
      hr_version = {
        filename = kr_entities_path .. "bullets/hr-virus-capsule.png",
        frame_count = 16,
        line_length = 8,
        animation_speed = 0.250,
        width = 58,
        height = 59,
        shift = util.by_pixel(1, 0.5),
        priority = "high",
        scale = 0.5,
      },
    },
    shadow = {
      filename = kr_entities_path .. "bullets/virus-capsule-sh.png",
      frame_count = 16,
      line_length = 8,
      animation_speed = 0.25,
      width = 27,
      height = 21,
      shift = util.by_pixel(1, 2),
      priority = "high",
      draw_as_shadow = true,
      hr_version = {
        filename = kr_entities_path .. "bullets/hr-virus-capsule-sh.png",
        frame_count = 16,
        line_length = 8,
        animation_speed = 0.25,
        width = 54,
        height = 42,
        shift = util.by_pixel(1, 2),
        priority = "high",
        draw_as_shadow = true,
        scale = 0.5,
      },
    },
    smoke = {
      {
        name = "poop-particle-smoke",
        deviation = { 0.15, 0.15 },
        frequency = 1,
        position = { 0, 0 },
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed_deviation = 5,
      },
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
})
