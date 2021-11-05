local sounds = require("__base__/prototypes/entity/sounds")

-- -- Rebalance all damage done by player weapons (Turrets, ammo...)
if krastorio.general.getSafeSettingValue("kr-damage-and-ammo") then
  local max_nuke_shockwave_movement_distance_deviation = 2

  local max_nuke_shockwave_movement_distance = 19 + max_nuke_shockwave_movement_distance_deviation / 6

  local nuke_shockwave_starting_speed_deviation = 0.075

  -----------------------------------------------------------------------------
  -- -- -- Turrets
  -----------------------------------------------------------------------------

  -- Artillery wagon gun
  data.raw["artillery-turret"]["artillery-turret"].turn_after_shooting_cooldown = 120
  data.raw["artillery-turret"]["artillery-turret"].manual_range_modifier = 5

  data.raw["artillery-wagon"]["artillery-wagon"].turn_after_shooting_cooldown = 120
  data.raw["artillery-wagon"]["artillery-wagon"].manual_range_modifier = 3.5

  data.raw.gun["artillery-wagon-cannon"].attack_parameters.min_range = 3 * 32
  data.raw.gun["artillery-wagon-cannon"].attack_parameters.cooldown = 300

  -- Vehicles guns
  data.raw.gun["vehicle-machine-gun"].attack_parameters.cooldown = 8
  data.raw.gun["vehicle-machine-gun"].attack_parameters.damage_modifier = 1.25
  data.raw.gun["tank-machine-gun"].attack_parameters.cooldown = 8
  data.raw.gun["tank-machine-gun"].attack_parameters.damage_modifier = 1.25
  data.raw.gun["tank-cannon"].attack_parameters.cooldown = 120
  data.raw.gun["rocket-launcher"].attack_parameters.cooldown = 60
  data.raw.gun["pistol"].attack_parameters.cooldown = 20

  data.raw.gun["spidertron-rocket-launcher-1"].attack_parameters.cooldown = 90
  data.raw.gun["spidertron-rocket-launcher-1"].attack_parameters.range = 40
  data.raw.gun["spidertron-rocket-launcher-2"].attack_parameters.cooldown = 90
  data.raw.gun["spidertron-rocket-launcher-2"].attack_parameters.range = 40
  data.raw.gun["spidertron-rocket-launcher-3"].attack_parameters.cooldown = 90
  data.raw.gun["spidertron-rocket-launcher-3"].attack_parameters.range = 40
  data.raw.gun["spidertron-rocket-launcher-4"].attack_parameters.cooldown = 90
  data.raw.gun["spidertron-rocket-launcher-4"].attack_parameters.range = 40

  -- Gun turret
  data.raw["ammo-turret"]["gun-turret"].attack_parameters.cooldown = 10
  data.raw["ammo-turret"]["gun-turret"].attack_parameters.call_for_help_radius = 25
  data.raw["ammo-turret"]["gun-turret"].max_health = 500

  -- Laser turret
  data.raw["electric-turret"]["laser-turret"].max_health = 500 -- nerf /2
  data.raw["electric-turret"]["laser-turret"].call_for_help_radius = 35 -- nerf -5
  data.raw["electric-turret"]["laser-turret"].energy_source = { -- nerf x2
    type = "electric",
    buffer_capacity = "2000kJ",
    input_flow_limit = "4000kW",
    drain = "100kW",
    usage_priority = "primary-input",
  }

  data.raw["electric-turret"]["laser-turret"].attack_parameters = {
    type = "beam",
    cooldown = 30,
    range = 30,
    source_direction_count = 64,
    source_offset = { 0, -3.423489 / 4 },
    damage_modifier = 3,
    ammo_type = {
      category = "laser",
      energy_consumption = "975kJ",
      action = {
        type = "direct",
        action_delivery = {
          type = "beam",
          beam = "laser-beam",
          max_length = 30,
          duration = 30,
          source_offset = { 0, -1.31439 },
        },
      },
    },
  }

  data.raw.recipe["gun-turret"].energy_required = 10
  data.raw.recipe["flamethrower-turret"].energy_required = 20
  data.raw.recipe["laser-turret"].energy_required = 30
  data.raw.recipe["artillery-turret"].energy_required = 60

  -----------------------------------------------------------------------------
  -- -- -- Projectile
  -----------------------------------------------------------------------------

  -- Projectile accelerations
  data.raw.projectile["cannon-projectile"].acceleration = 0.1
  data.raw.projectile["cannon-projectile"].light = { intensity = 0.45, size = 8, color = { r = 0.8, g = 0.8, b = 0.8 } }
  data.raw.projectile["explosive-cannon-projectile"].acceleration = 0.1
  data.raw.projectile["explosive-cannon-projectile"].light = {
    intensity = 0.45,
    size = 8,
    color = { r = 1.0, g = 0.75, b = 0.75 },
  }
  data.raw.projectile["uranium-cannon-projectile"].acceleration = 0.1
  data.raw.projectile["uranium-cannon-projectile"].light = {
    intensity = 0.45,
    size = 8,
    color = { r = 0.5, g = 0.75, b = 0.75 },
  }
  data.raw.projectile["explosive-uranium-cannon-projectile"].acceleration = 0.1
  data.raw.projectile["explosive-uranium-cannon-projectile"].light = {
    intensity = 0.45,
    size = 8,
    color = { r = 0.5, g = 1.0, b = 0.75 },
  }

  -- Grenade (normal)
  data.raw["projectile"]["grenade"].action = {
    {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-entity",
            entity_name = "medium-explosion",
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
        },
      },
    },
    {
      type = "area",
      radius = 6.5,
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "damage",
            damage = { amount = 100, type = "explosion" },
          },
          {
            type = "create-entity",
            entity_name = "explosion",
          },
        },
      },
    },
  }

  -- Artillery projectile
  data.raw["artillery-projectile"]["artillery-projectile"].action.action_delivery.target_effects = {
    {
      type = "nested-result",
      action = {
        type = "area",
        radius = 8.0,
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "damage",
              damage = { amount = 1000, type = "physical" },
            },
            {
              type = "damage",
              damage = { amount = 1000, type = "explosion" },
            },
          },
        },
      },
    },
    {
      type = "create-trivial-smoke",
      smoke_name = "artillery-smoke",
      initial_height = 0,
      speed_from_center = 0.05,
      speed_from_center_deviation = 0.005,
      offset_deviation = { { -4, -4 }, { 4, 4 } },
      max_radius = 5,
      repeat_count = 4 * 4 * 15,
    },
    {
      type = "create-entity",
      entity_name = "big-artillery-explosion",
    },
    {
      type = "show-explosion-on-chart",
      scale = 1,
    },
  }

  -- Rocket
  data.raw["projectile"]["rocket"].acceleration = 0.05
  data.raw["projectile"]["rocket"].light = { intensity = 0.45, size = 8, color = { r = 0.8, g = 0.8, b = 0.8 } }
  data.raw["projectile"]["rocket"].action.action_delivery.target_effects = {
    {
      type = "create-entity",
      entity_name = "explosion",
    },
    {
      type = "damage",
      damage = { amount = 300, type = "explosion" },
    },
    {
      type = "create-entity",
      entity_name = "small-scorchmark",
      check_buildability = true,
    },
  }

  -- Explosive rocket
  data.raw["projectile"]["explosive-rocket"].acceleration = 0.05
  data.raw["projectile"]["explosive-rocket"].light = {
    intensity = 0.45,
    size = 8,
    color = { r = 1, g = 0.75, b = 0.8 },
  }
  data.raw["projectile"]["explosive-rocket"].action.action_delivery.target_effects = {
    {
      type = "create-entity",
      entity_name = "big-explosion",
    },
    {
      type = "damage",
      damage = { amount = 75, type = "explosion" },
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
        radius = 6.5,
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "damage",
              damage = { amount = 200, type = "explosion" },
            },
            {
              type = "create-entity",
              entity_name = "explosion",
            },
          },
        },
      },
    },
  }

  data.raw.ammo["atomic-bomb"].ammo_type.range_modifier = 3
  data.raw["projectile"]["atomic-rocket"].acceleration = 0.01
  data.raw["projectile"]["atomic-rocket"].light = { intensity = 0.45, size = 9, color = { r = 0.5, g = 1, b = 0.75 } }
  data.raw["projectile"]["atomic-rocket"].action.action_delivery.target_effects = {
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
      damage = { amount = 1500, type = "explosion" },
    },
    {
      type = "damage",
      damage = { amount = 1500, type = "radioactive" },
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
        radius = 8,
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
        radius = 35,
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
        radius = 33,
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
        repeat_count = 700,
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
        repeat_count = 750,
        radius = 38,
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
  }

  data.raw["projectile"]["atomic-bomb-wave"].action = {
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
          upper_distance_threshold = 35,
          lower_damage_modifier = 1,
          upper_damage_modifier = 0.1,
          damage = { amount = 100, type = "explosion" },
        },
        {
          type = "damage",
          vaporize = false,
          lower_distance_threshold = 0,
          upper_distance_threshold = 35,
          lower_damage_modifier = 1,
          upper_damage_modifier = 0.25,
          damage = { amount = 100, type = "radioactive" },
        },
        {
          type = "damage",
          vaporize = false,
          lower_distance_threshold = 0,
          upper_distance_threshold = 35,
          lower_damage_modifier = 1,
          upper_damage_modifier = 0.1,
          damage = { amount = 100, type = "kr-explosion" },
        },
      },
    },
  }

  -----------------------------------------------------------------------------
  -- -- -- AMMO

  data.raw.ammo["atomic-bomb"].ammo_type.category = "heavy-rocket"
  data.raw.ammo["atomic-bomb"].ammo_type.range_modifier = 1
  data.raw.ammo["atomic-bomb"].ammo_type.cooldown_modifier = 3

  -- Firearm magazine (normal ammo)
  data.raw["ammo"]["firearm-magazine"].ammo_type.action = {
    type = "direct",
    action_delivery = {
      {
        type = "instant",
        source_effects = {
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit",
            offsets = { { 0, 1 } },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
          },
          {
            type = "damage",
            damage = { amount = 8, type = "physical" },
          },
        },
      },
    },
  }

  -- Piercing rounds magazine
  data.raw["ammo"]["piercing-rounds-magazine"].ammo_type.action.action_delivery = {
    type = "instant",
    source_effects = {
      type = "create-explosion",
      entity_name = "explosion-gunshot",
    },
    target_effects = {
      {
        type = "create-entity",
        entity_name = "explosion-hit",
        offsets = { { 0, 1 } },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
      },
      {
        type = "damage",
        damage = { amount = 12, type = "physical" },
      },
    },
  }

  -- Uranium rounds magazine
  data.raw["ammo"]["uranium-rounds-magazine"].ammo_type.action.action_delivery = {
    type = "instant",
    source_effects = {
      type = "create-explosion",
      entity_name = "explosion-gunshot",
    },
    target_effects = {
      {
        type = "create-entity",
        entity_name = "explosion-hit",
        offsets = { { 0, 1 } },
        offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
      },
      {
        type = "damage",
        damage = { amount = 9, type = "physical" },
      },
      {
        type = "damage",
        damage = { amount = 9, type = "radioactive" },
      },
    },
  }

  data.raw["ammo"]["cannon-shell"].ammo_type.action.action_delivery.max_range = 50
  data.raw["ammo"]["explosive-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
  data.raw["ammo"]["uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
  data.raw["ammo"]["explosive-uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
  -----------------------------------------------------------------------------
end
