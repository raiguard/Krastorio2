local sounds = require("__base__.prototypes.entity.sounds")

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

data.raw["projectile"]["atomic-rocket"].acceleration = 0.01
data.raw["projectile"]["atomic-rocket"].light = { intensity = 0.45, size = 9, color = { r = 0.5, g = 1, b = 0.75 } }
data.raw["projectile"]["atomic-rocket"].action.action_delivery.target_effects = {
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
      repeat_count = 1000,
      radius = 35,
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
      repeat_count = 1000,
      radius = 33,
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
      repeat_count = 700,
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
      repeat_count = 1000,
      radius = 8,
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
      repeat_count = 750,
      radius = 38,
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
