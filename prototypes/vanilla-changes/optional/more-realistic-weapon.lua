if krastorio.general.getSafeSettingValue("kr-more-realistic-weapon") then
  -- -- --

  local pistol_range = 22
  local rifle_range = 30
  local sniper_range = 70

  -- -- --

  local bullets_collision_box = { { -0.5, -1 }, { 0.5, 1 } }
  local k_target_type = "direction" -- "entity", "position" or "direction"
  local k_d_radius = 0.5
  local k_pistol_min_range = 0.5
  local k_rifle_min_range = 0.5
  local k_s_rifle_min_range = 1
  local turret_range = 0

  if krastorio.general.getSafeSettingValue("kr-more-realistic-weapon-auto-aim") then
    pistol_range = 20
    rifle_range = 25
    sniper_range = 50
    bullets_collision_box = { { -0.1, -0.5 }, { 0.1, 0.5 } }
    k_target_type = "entity" -- "entity", "position" or "direction"
    k_d_radius = 0.25
    k_pistol_min_range = 0.25
    k_rifle_min_range = 0.25
    k_s_rifle_min_range = 0.5
    turret_range = 0
  end

  -- -- --

  ----------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------- -- NEW EXPLOSION -- ---------------------------------------------------
  ----------------------------------------------------------------------------------------------------------------------

  data:extend({
    {
      type = "explosion",
      name = "explosion-hit-p",
      flags = { "not-on-map" },
      subgroup = "explosions",
      animations = {
        {
          filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          frame_count = 13,
          animation_speed = 1.5,
          shift = { 0, -0.3125 },
        },
      },
      light = { intensity = 1, size = 9, color = { r = 1.0, g = 0.8, b = 0.5 } },
      smoke = "smoke-fast",
      smoke_count = 1,
      smoke_slow_down_factor = 1,
    },
    {
      type = "explosion",
      name = "explosion-hit-u",
      flags = { "not-on-map" },
      subgroup = "explosions",
      animations = {
        {
          filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          frame_count = 13,
          animation_speed = 1.5,
          shift = { 0, -0.3125 },
        },
      },
      light = { intensity = 1, size = 9, color = { r = 0.5, g = 1, b = 0.5 } },
      smoke = "smoke-fast",
      smoke_count = 2,
      smoke_slow_down_factor = 0.75,
    },
    {
      type = "explosion",
      name = "explosion-hit-i",
      flags = { "not-on-map" },
      subgroup = "explosions",
      animations = {
        {
          filename = "__base__/graphics/entity/explosion-hit/explosion-hit.png",
          priority = "extra-high",
          width = 34,
          height = 38,
          frame_count = 13,
          animation_speed = 1.5,
          shift = { 0, -0.3125 },
        },
      },
      light = { intensity = 1.5, size = 10, color = { r = 1, g = 0.45, b = 0.8 } },
      smoke = "smoke-fast",
      smoke_count = 3,
      smoke_slow_down_factor = 0.5,
    },
  })

  data.raw.gun["submachine-gun"].attack_parameters.range = 50
  data.raw.gun["submachine-gun"].attack_parameters.movement_slow_down_factor = 0.25

  ----------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------- -- PISTOL STUFF -- ----------------------------------------------------
  ----------------------------------------------------------------------------------------------------------------------

  data.raw.gun["pistol"].attack_parameters.ammo_category = "pistol-ammo"
  data.raw.gun["pistol"].attack_parameters.range = pistol_range - 2
  data.raw.gun["pistol"].attack_parameters.min_range = k_pistol_min_range
  data.raw.gun["pistol"].attack_parameters.cooldown = 20
  data.raw.gun["pistol"].attack_parameters.movement_slow_down_factor = 0.15

  data.raw.gun["kr-accelerator"].attack_parameters.ammo_category = "pistol-ammo"
  data.raw.gun["kr-accelerator"].attack_parameters.range = pistol_range
  data.raw.gun["kr-accelerator"].min_range = k_pistol_min_range

  data:extend({

    {
      type = "ammo",
      name = "firearm-magazine",
      icon = kr_items_with_variations_icons_path .. "ammo/pistol-ammo-1.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          size = 64,
          filename = kr_items_with_variations_icons_path .. "ammo/pistol-ammo-1.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      ammo_type = {
        category = "pistol-ammo",
        cooldown_modifier = 0.8,
        target_type = k_target_type,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "pistol-ammo-1",
                starting_speed = 1,
                direction_deviation = 0.15,
                range_deviation = 0.15,
                max_range = pistol_range,
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-gunshot",
                  },
                },
              },
            },
          },
        },
      },
      magazine_size = 12,
      subgroup = "ammo",
      order = "a[basic-clips]-a01[pistol-magazine]",
      stack_size = 200,
    },

    {
      type = "projectile",
      name = "pistol-ammo-1",
      flags = { "not-on-map" },
      collision_box = bullets_collision_box,
      acceleration = -0.015,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
            },
            {
              type = "damage",
              damage = { amount = 8, type = "physical" },
            },
          },
        },
      },
      animation = {
        filename = kr_entities_path .. "bullets/pistol-bullet-1.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
      },
      shadow = {
        filename = kr_entities_path .. "bullets/pistol-bullet-1.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
        draw_as_shadow = true,
      },
      --hit_at_collision_position = true,
      force_condition = "not-same",
      light = { intensity = 0.45, size = 5, color = { r = 1.0, g = 1.0, b = 0.5 } },
    },

    {
      type = "recipe",
      name = "firearm-magazine",
      energy_required = 0.5,
      enabled = true,
      ingredients = {
        { "coal", 1 },
        { "iron-plate", 1 },
      },
      result = "firearm-magazine",
    },

    -- ---------------------------------------------------------------------------------------------------------------- --

    {
      type = "ammo",
      name = "piercing-rounds-magazine",
      icon = kr_items_with_variations_icons_path .. "ammo/pistol-ammo-2.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          size = 64,
          filename = kr_items_with_variations_icons_path .. "ammo/pistol-ammo-2.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      ammo_type = {
        category = "pistol-ammo",
        target_type = k_target_type,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "pistol-ammo-2",
                starting_speed = 1.1,
                direction_deviation = 0.15,
                range_deviation = 0.15,
                max_range = pistol_range,
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-gunshot",
                  },
                },
              },
            },
          },
        },
      },
      magazine_size = 10,
      subgroup = "ammo",
      order = "a[basic-clips]-a02[pistol-magazine]",
      stack_size = 200,
    },

    {
      type = "projectile",
      name = "pistol-ammo-2",
      flags = { "not-on-map" },
      collision_box = bullets_collision_box,
      acceleration = -0.015,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit-p",
            },
            {
              type = "damage",
              damage = { amount = 12, type = "physical" },
            },
          },
        },
      },
      animation = {
        filename = kr_entities_path .. "bullets/pistol-bullet-2.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
      },
      shadow = {
        filename = kr_entities_path .. "bullets/pistol-bullet-2.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
        draw_as_shadow = true,
      },
      --hit_at_collision_position = true,
      force_condition = "not-same",
      light = { intensity = 0.35, size = 7, color = { r = 1.0, g = 0.8, b = 0.5 } },
    },

    {
      type = "recipe",
      name = "piercing-rounds-magazine",
      energy_required = 1,
      enabled = false,
      ingredients = {
        { "firearm-magazine", 1 },
        { "steel-plate", 1 },
      },
      result = "piercing-rounds-magazine",
    },
  })

  data.raw.ammo["firearm-magazine"].localised_name = { "item-name.pistol-magazine" }
  data.raw.ammo["piercing-rounds-magazine"].localised_name = { "item-name.armor-piercing-pistol-magazine" }

  ----------------------------------------------------------------------------------------------------------------------
  ---------------------------------------------- -- RIFLE STUFF -- -----------------------------------------------------
  ----------------------------------------------------------------------------------------------------------------------
  data.raw.gun["submachine-gun"].attack_parameters.ammo_category = "bullet"
  data.raw.gun["submachine-gun"].attack_parameters.range = rifle_range
  data.raw.gun["submachine-gun"].attack_parameters.min_range = k_rifle_min_range
  data.raw.gun["submachine-gun"].attack_parameters.cooldown = 8
  data.raw.gun["submachine-gun"].attack_parameters.movement_slow_down_factor = 0.15

  data:extend({
    {
      type = "ammo",
      name = "rifle-magazine",
      icon = kr_items_with_variations_icons_path .. "ammo/rifle-ammo-1.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          size = 64,
          filename = kr_items_with_variations_icons_path .. "ammo/rifle-ammo-1.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      ammo_type = {
        category = "bullet",
        cooldown_modifier = 0.8,
        target_type = k_target_type,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "rifle-ammo-1",
                starting_speed = 1.5,
                direction_deviation = 0.15,
                range_deviation = 0.15,
                max_range = rifle_range,
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-gunshot",
                  },
                },
              },
            },
          },
        },
      },
      magazine_size = 30,
      subgroup = "ammo",
      order = "a[basic-clips]-a03[rifle-magazine]",
      stack_size = 200,
    },

    {
      type = "projectile",
      name = "rifle-ammo-1",
      flags = { "not-on-map" },
      collision_box = bullets_collision_box,
      acceleration = -0.018,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
            },
            {
              type = "damage",
              damage = { amount = 10, type = "physical" },
            },
          },
        },
      },
      animation = {
        filename = kr_entities_path .. "bullets/rifle-bullet-1.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
      },
      shadow = {
        filename = kr_entities_path .. "bullets/rifle-bullet-1.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
        draw_as_shadow = true,
      },
      --hit_at_collision_position = true,
      force_condition = "not-same",
      light = { intensity = 0.45, size = 5, color = { r = 1.0, g = 1.0, b = 0.5 } },
    },

    {
      type = "recipe",
      name = "rifle-magazine",
      energy_required = 1,
      enabled = false,
      ingredients = {
        { "coal", 2 },
        { "iron-plate", 1 },
        { "copper-plate", 1 },
      },
      result = "rifle-magazine",
    },

    -- ---------------------------------------------------------------------------------------------------------------- --

    {
      type = "ammo",
      name = "armor-piercing-rifle-magazine",
      icon = kr_items_with_variations_icons_path .. "ammo/rifle-ammo-2.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          size = 64,
          filename = kr_items_with_variations_icons_path .. "ammo/rifle-ammo-2.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      ammo_type = {
        category = "bullet",
        target_type = k_target_type,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "rifle-ammo-2",
                starting_speed = 1.75,
                direction_deviation = 0.15,
                range_deviation = 0.15,
                max_range = rifle_range,
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-gunshot",
                  },
                },
              },
            },
          },
        },
      },
      magazine_size = 30,
      subgroup = "ammo",
      order = "a[basic-clips]-a04[rifle-magazine]",
      stack_size = 200,
    },

    {
      type = "projectile",
      name = "rifle-ammo-2",
      flags = { "not-on-map" },
      collision_box = bullets_collision_box,
      acceleration = -0.02,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit-p",
            },
            {
              type = "damage",
              damage = { amount = 14, type = "physical" },
            },
          },
        },
      },
      animation = {
        filename = kr_entities_path .. "bullets/rifle-bullet-2.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
      },
      shadow = {
        filename = kr_entities_path .. "bullets/rifle-bullet-2.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
        draw_as_shadow = true,
      },
      --hit_at_collision_position = true,
      force_condition = "not-same",
      light = { intensity = 0.25, size = 7, color = { r = 1.0, g = 0.8, b = 0.5 } },
    },

    {
      type = "recipe",
      name = "armor-piercing-rifle-magazine",
      energy_required = 2,
      enabled = false,
      ingredients = {
        { "rifle-magazine", 1 },
        { "steel-plate", 2 },
      },
      result = "armor-piercing-rifle-magazine",
    },

    -- ---------------------------------------------------------------------------------------------------------------- --

    {
      type = "ammo",
      name = "uranium-rifle-magazine",
      icon = kr_items_with_variations_icons_path .. "ammo/rifle-ammo-3.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          size = 64,
          filename = kr_items_with_variations_icons_path .. "ammo/rifle-ammo-3.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      ammo_type = {
        category = "bullet",
        target_type = k_target_type,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "rifle-ammo-3",
                starting_speed = 1.75,
                direction_deviation = 0.15,
                range_deviation = 0.15,
                max_range = rifle_range,
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-gunshot",
                  },
                },
              },
            },
          },
        },
      },
      magazine_size = 30,
      subgroup = "ammo",
      order = "a[basic-clips]-a05[rifle-magazine]",
      stack_size = 200,
    },

    {
      type = "projectile",
      name = "rifle-ammo-3",
      flags = { "not-on-map" },
      collision_box = bullets_collision_box,
      acceleration = -0.02,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit-u",
            },
            {
              type = "damage",
              damage = { amount = 14, type = "physical" },
            },
            {
              type = "damage",
              damage = { amount = 6, type = "radioactive" },
            },
          },
        },
      },
      animation = {
        filename = kr_entities_path .. "bullets/rifle-bullet-3.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
      },
      shadow = {
        filename = kr_entities_path .. "bullets/rifle-bullet-3.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
        draw_as_shadow = true,
      },
      --hit_at_collision_position = true,
      force_condition = "not-same",
      light = { intensity = 0.25, size = 7, color = { r = 0.5, g = 1, b = 0.5 } },
    },

    {
      type = "recipe",
      name = "uranium-rifle-magazine",
      energy_required = 3,
      enabled = false,
      ingredients = {
        { "rifle-magazine", 1 },
        { "uranium-238", 2 },
      },
      result = "uranium-rifle-magazine",
    },

    -- ---------------------------------------------------------------------------------------------------------------- --

    {
      type = "ammo",
      name = "imersite-rifle-magazine",
      icon = kr_items_with_variations_icons_path .. "ammo/rifle-ammo-4.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          size = 64,
          filename = kr_items_with_variations_icons_path .. "ammo/rifle-ammo-4.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      ammo_type = {
        category = "bullet",
        target_type = k_target_type,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "rifle-ammo-4",
                starting_speed = 2.25,
                direction_deviation = 0.1,
                range_deviation = 0.1,
                max_range = rifle_range,
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-gunshot",
                  },
                },
              },
            },
          },
        },
      },
      magazine_size = 30,
      subgroup = "ammo",
      order = "a[basic-clips]-a06[rifle-magazine]",
      stack_size = 200,
    },

    {
      type = "projectile",
      name = "rifle-ammo-4",
      flags = { "not-on-map" },
      collision_box = bullets_collision_box,
      acceleration = -0.02,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit-i",
            },
            {
              type = "damage",
              damage = { amount = 14, type = "physical" },
            },
            {
              type = "damage",
              damage = { amount = 10, type = "laser" },
            },
          },
        },
      },
      animation = {
        filename = kr_entities_path .. "bullets/rifle-bullet-4.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
      },
      shadow = {
        filename = kr_entities_path .. "bullets/rifle-bullet-4.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
        draw_as_shadow = true,
      },
      --hit_at_collision_position = true,
      force_condition = "not-same",
      light = { intensity = 0.25, size = 8, color = { r = 1, g = 0.45, b = 0.8 } },
    },

    {
      type = "recipe",
      name = "imersite-rifle-magazine",
      energy_required = 4,
      enabled = false,
      ingredients = {
        { "rifle-magazine", 1 },
        { "imersite-crystal", 2 },
      },
      result = "imersite-rifle-magazine",
    },
  })

  ----------------------------------------------------------------------------------------------------------------------
  ----------------------------------------- -- ANTI-MATERIAL RIFLE STUFF -- --------------------------------------------
  ----------------------------------------------------------------------------------------------------------------------

  data:extend({

    {
      type = "gun",
      name = "anti-material-rifle",
      icon = kr_guns_icons_path .. "anti-material-rifle.png",
      icon_size = 64,
      subgroup = "gun",
      order = "c1[anti-material-rifle]",
      attack_parameters = {
        type = "projectile",
        ammo_category = "anti-material-rifle-ammo",
        cooldown = 60,
        movement_slow_down_factor = 0.75,
        shell_particle = {
          name = "shell-particle",
          direction_deviation = 0.1,
          speed = 0.1,
          speed_deviation = 0.03,
          center = { 0, 0.1 },
          creation_distance = -0.5,
          starting_frame_speed = 0.4,
          starting_frame_speed_deviation = 0.1,
        },
        projectile_creation_distance = 1.125,
        min_range = k_s_rifle_min_range,
        range = sniper_range,
        sound = {
          {
            filename = kr_weapons_sounds_path .. "anti-material-rifle.ogg",
            volume = 0.5,
          },
        },
      },
      stack_size = 10,
    },

    {
      type = "recipe",
      name = "anti-material-rifle",
      energy_required = 10,
      enabled = false,
      ingredients = {
        { "submachine-gun", 2 },
        { "steel-plate", 4 },
      },
      result = "anti-material-rifle",
    },

    -- ---------------------------------------------------------------------------------------------------------------- --

    {
      type = "ammo",
      name = "anti-material-rifle-magazine",
      icon = kr_items_with_variations_icons_path .. "ammo/anti-material-rifle-ammo-1.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          size = 64,
          filename = kr_items_with_variations_icons_path .. "ammo/anti-material-rifle-ammo-1.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      ammo_type = {
        category = "anti-material-rifle-ammo",
        cooldown_modifier = 0.8,
        target_type = k_target_type,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "anti-material-rifle-ammo-1",
                starting_speed = 3,
                direction_deviation = 0.02,
                range_deviation = 0.02,
                max_range = sniper_range,
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-gunshot",
                  },
                },
              },
            },
            force = "not-same",
          },
        },
      },
      magazine_size = 7,
      subgroup = "ammo",
      order = "a[basic-clips]-a07[anti-material-rifle-magazine]",
      stack_size = 200,
    },

    {
      type = "projectile",
      name = "anti-material-rifle-ammo-1",
      flags = { "not-on-map" },
      collision_box = bullets_collision_box,
      acceleration = -0.025,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
            },
            {
              type = "nested-result",
              action = {
                type = "area",
                radius = k_d_radius + 0.25,
                action_delivery = {
                  type = "instant",
                  target_effects = {
                    {
                      type = "damage",
                      damage = { amount = 80, type = "physical" },
                    },
                  },
                },
                force = "not-same",
              },
            },
          },
        },
      },
      animation = {
        filename = kr_entities_path .. "bullets/anti-material-rifle-bullet-1.png",
        frame_count = 1,
        width = 3,
        height = 100,
        priority = "high",
      },
      shadow = {
        filename = kr_entities_path .. "bullets/anti-material-rifle-bullet-1.png",
        frame_count = 1,
        width = 3,
        height = 100,
        priority = "high",
        draw_as_shadow = true,
      },
      --hit_at_collision_position = true,
      force_condition = "not-same",
      light = { intensity = 0.45, size = 8, color = { r = 1.0, g = 1.0, b = 0.5 } },
    },

    {
      type = "recipe",
      name = "anti-material-rifle-magazine",
      energy_required = 2,
      enabled = false,
      ingredients = {
        { "coal", 3 },
        { "iron-plate", 2 },
        { "copper-plate", 1 },
      },
      result = "anti-material-rifle-magazine",
    },

    -- ---------------------------------------------------------------------------------------------------------------- --

    {
      type = "ammo",
      name = "armor-piercing-anti-material-rifle-magazine",
      icon = kr_items_with_variations_icons_path .. "ammo/anti-material-rifle-ammo-2.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          size = 64,
          filename = kr_items_with_variations_icons_path .. "ammo/anti-material-rifle-ammo-2.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      ammo_type = {
        category = "anti-material-rifle-ammo",
        target_type = k_target_type,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "anti-material-rifle-ammo-2",
                starting_speed = 3,
                direction_deviation = 0.02,
                range_deviation = 0.02,
                max_range = sniper_range,
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-gunshot",
                  },
                },
              },
            },
            force = "not-same",
          },
        },
      },
      magazine_size = 7,
      subgroup = "ammo",
      order = "a[basic-clips]-a08[anti-material-rifle-magazine]",
      stack_size = 200,
    },

    {
      type = "projectile",
      name = "anti-material-rifle-ammo-2",
      flags = { "not-on-map" },
      collision_box = bullets_collision_box,
      acceleration = -0.025,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit-p",
            },
            {
              type = "nested-result",
              action = {
                type = "area",
                radius = k_d_radius + 0.25,
                action_delivery = {
                  type = "instant",
                  target_effects = {
                    {
                      type = "damage",
                      damage = { amount = 125, type = "physical" },
                    },
                  },
                },
                force = "not-same",
              },
            },
          },
        },
        force = "not-same",
      },
      animation = {
        filename = kr_entities_path .. "bullets/anti-material-rifle-bullet-2.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
      },
      shadow = {
        filename = kr_entities_path .. "bullets/anti-material-rifle-bullet-2.png",
        frame_count = 1,
        width = 3,
        height = 50,
        priority = "high",
        draw_as_shadow = true,
      },
      --hit_at_collision_position = true,
      force_condition = "not-same",
      light = { intensity = 0.45, size = 8, color = { r = 1.0, g = 0.8, b = 0.5 } },
    },

    {
      type = "recipe",
      name = "armor-piercing-anti-material-rifle-magazine",
      energy_required = 3,
      enabled = false,
      ingredients = {
        { "anti-material-rifle-magazine", 1 },
        { "steel-plate", 3 },
      },
      result = "armor-piercing-anti-material-rifle-magazine",
    },

    -- ---------------------------------------------------------------------------------------------------------------- --

    {
      type = "ammo",
      name = "uranium-anti-material-rifle-magazine",
      icon = kr_items_with_variations_icons_path .. "ammo/anti-material-rifle-ammo-3.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          size = 64,
          filename = kr_items_with_variations_icons_path .. "ammo/anti-material-rifle-ammo-3.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      ammo_type = {
        category = "anti-material-rifle-ammo",
        target_type = k_target_type,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "anti-material-rifle-ammo-3",
                starting_speed = 3,
                direction_deviation = 0.02,
                range_deviation = 0.02,
                max_range = sniper_range,
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-gunshot",
                  },
                },
              },
            },
            force = "not-same",
          },
        },
      },
      magazine_size = 7,
      subgroup = "ammo",
      order = "a[basic-clips]-a09[anti-material-rifle-magazine]",
      stack_size = 200,
    },

    {
      type = "projectile",
      name = "anti-material-rifle-ammo-3",
      flags = { "not-on-map" },
      collision_box = bullets_collision_box,
      acceleration = -0.025,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit-u",
            },
            {
              type = "nested-result",
              action = {
                type = "area",
                radius = k_d_radius + 0.25,
                action_delivery = {
                  type = "instant",
                  target_effects = {
                    {
                      type = "damage",
                      damage = { amount = 125, type = "physical" },
                    },
                    {
                      type = "damage",
                      damage = { amount = 75, type = "radioactive" },
                    },
                  },
                },
                force = "not-same",
              },
            },
          },
        },
        force = "not-same",
      },
      animation = {
        filename = kr_entities_path .. "bullets/anti-material-rifle-bullet-3.png",
        frame_count = 1,
        width = 3,
        height = 100,
        priority = "high",
      },
      shadow = {
        filename = kr_entities_path .. "bullets/anti-material-rifle-bullet-3.png",
        frame_count = 1,
        width = 3,
        height = 100,
        priority = "high",
        draw_as_shadow = true,
      },
      --hit_at_collision_position = true,
      force_condition = "not-same",
      light = { intensity = 0.45, size = 8, color = { r = 0.5, g = 1, b = 0.5 } },
    },

    {
      type = "recipe",
      name = "uranium-anti-material-rifle-magazine",
      energy_required = 4,
      enabled = false,
      ingredients = {
        { "anti-material-rifle-magazine", 1 },
        { "uranium-238", 3 },
      },
      result = "uranium-anti-material-rifle-magazine",
    },

    -- ---------------------------------------------------------------------------------------------------------------- --

    {
      type = "ammo",
      name = "imersite-anti-material-rifle-magazine",
      icon = kr_items_with_variations_icons_path .. "ammo/anti-material-rifle-ammo-4.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          size = 64,
          filename = kr_items_with_variations_icons_path .. "ammo/anti-material-rifle-ammo-4.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      ammo_type = {
        category = "anti-material-rifle-ammo",
        target_type = k_target_type,
        action = {
          {
            type = "direct",
            action_delivery = {
              {
                type = "projectile",
                projectile = "anti-material-rifle-ammo-4",
                starting_speed = 5,
                direction_deviation = 0.02,
                range_deviation = 0.02,
                max_range = sniper_range,
                source_effects = {
                  {
                    type = "create-explosion",
                    entity_name = "explosion-gunshot",
                  },
                },
              },
            },
            force = "not-same",
          },
        },
      },
      magazine_size = 7,
      subgroup = "ammo",
      order = "a[basic-clips]-a10[anti-material-rifle-magazine]",
      stack_size = 200,
    },

    {
      type = "projectile",
      name = "anti-material-rifle-ammo-4",
      flags = { "not-on-map" },
      collision_box = bullets_collision_box,
      acceleration = -0.02,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit-i",
            },
            {
              type = "nested-result",
              action = {
                type = "area",
                radius = k_d_radius + 0.25,
                action_delivery = {
                  type = "instant",
                  target_effects = {
                    {
                      type = "damage",
                      damage = { amount = 125, type = "physical" },
                    },
                    {
                      type = "damage",
                      damage = { amount = 50, type = "laser" },
                    },
                    {
                      type = "damage",
                      damage = { amount = 25, type = "radioactive" },
                    },
                  },
                },
                force = "not-same",
              },
            },
          },
        },
      },
      animation = {
        filename = kr_entities_path .. "bullets/anti-material-rifle-bullet-4.png",
        frame_count = 1,
        width = 3,
        height = 100,
        priority = "high",
      },
      shadow = {
        filename = kr_entities_path .. "bullets/anti-material-rifle-bullet-4.png",
        frame_count = 1,
        width = 3,
        height = 100,
        priority = "high",
        draw_as_shadow = true,
      },
      --hit_at_collision_position = true,
      force_condition = "not-same",
      light = { intensity = 0.5, size = 9, color = { r = 1, g = 0.45, b = 0.8 } },
    },

    {
      type = "recipe",
      name = "imersite-anti-material-rifle-magazine",
      energy_required = 5,
      enabled = false,
      ingredients = {
        { "anti-material-rifle-magazine", 1 },
        { "imersite-crystal", 3 },
      },
      result = "imersite-anti-material-rifle-magazine",
    },
  })

  ----------------------------------------------------------------------------------------------------------------------
  ----------------------------------------------- -- EDIT THINGS -- ----------------------------------------------------
  ----------------------------------------------------------------------------------------------------------------------

  -- -- Vanilla

  data.raw.gun["shotgun"].attack_parameters.cooldown = 60
  data.raw.gun["shotgun"].movement_slow_down_factor = 0.2
  data.raw.gun["shotgun"].attack_parameters.damage_modifier = 1.5

  data.raw.gun["combat-shotgun"].attack_parameters.cooldown = 30
  data.raw.gun["combat-shotgun"].movement_slow_down_factor = 0.3
  data.raw.gun["combat-shotgun"].attack_parameters.damage_modifier = 1.5

  data.raw.ammo["shotgun-shell"].magazine_size = 6
  data.raw.ammo["piercing-shotgun-shell"].magazine_size = 6
  data.raw.ammo["shotgun-shell"].ammo_type.action = {
    {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
    {
      type = "direct",
      repeat_count = 16,
      action_delivery = {
        type = "projectile",
        projectile = "shotgun-pellet",
        starting_speed = 1,
        starting_speed_deviation = 0.1,
        direction_deviation = 0.3,
        range_deviation = 0.3,
        max_range = 15,
      },
    },
  }

  data.raw.projectile["shotgun-pellet"].acceleration = -0.01
  data.raw.projectile["shotgun-pellet"].action.action_delivery.target_effects.damage = { amount = 6, type = "physical" }

  data.raw.projectile["piercing-shotgun-pellet"].acceleration = -0.01
  data.raw.projectile["piercing-shotgun-pellet"].action.action_delivery.target_effects.damage = {
    amount = 10,
    type = "physical",
  }

  --data.raw["ammo-turret"]["gun-turret"].localised_name={"kr-gun-turret"}
  data.raw["ammo-turret"]["gun-turret"].attack_parameters.range = 25
  data.raw["ammo-turret"]["gun-turret"].attack_parameters.ammo_category = "bullet"
  data.raw["ammo-turret"]["gun-turret"].attack_parameters.min_range = turret_range

  data.raw["ammo"]["cannon-shell"].ammo_type.action.action_delivery.max_range = 50
  data.raw["ammo"]["explosive-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
  data.raw["ammo"]["uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50
  data.raw["ammo"]["explosive-uranium-cannon-shell"].ammo_type.action.action_delivery.max_range = 50

  data.raw.gun["artillery-wagon-cannon"].attack_parameters.range = 6 * 32

  data.raw.gun["vehicle-machine-gun"].attack_parameters.range = rifle_range
  data.raw.gun["vehicle-machine-gun"].attack_parameters.min_range = 1.75
  data.raw.gun["vehicle-machine-gun"].attack_parameters.ammo_category = "bullet"
  data.raw.gun["tank-machine-gun"].attack_parameters.range = rifle_range
  data.raw.gun["tank-machine-gun"].attack_parameters.min_range = 2
  data.raw.gun["tank-machine-gun"].attack_parameters.ammo_category = "bullet"
  data.raw.gun["tank-cannon"].attack_parameters.range = 50
  data.raw.gun["rocket-launcher"].attack_parameters.range = 50

  -- -- Vanilla worms

  data.raw.turret["small-worm-turret"].attack_parameters.range = 30
  data.raw.turret["small-worm-turret"].call_for_help_radius = 40

  data.raw.turret["medium-worm-turret"].attack_parameters.range = 35
  data.raw.turret["medium-worm-turret"].call_for_help_radius = 45

  data.raw.turret["big-worm-turret"].attack_parameters.range = 40
  data.raw.turret["big-worm-turret"].call_for_help_radius = 50

  data.raw.turret["behemoth-worm-turret"].attack_parameters.range = 55
  data.raw.turret["behemoth-worm-turret"].call_for_help_radius = 65

  -- -- Krastorio

  data.raw.ammo["uranium-rounds-magazine"].flags = { "hidden" }
  data.raw.ammo["imersite-rounds-magazine"].flags = { "hidden" }

  data.raw.gun["advanced-tank-machine-gun"].attack_parameters.ammo_category = "anti-material-rifle-ammo"
  data.raw.gun["advanced-tank-machine-gun"].attack_parameters.range = sniper_range
  data.raw.gun["advanced-tank-machine-gun"].attack_parameters.min_range = 3.5
  data.raw.gun["advanced-tank-machine-gun"].attack_parameters.cooldown = 15
  data.raw.gun["advanced-tank-machine-gun"].sound = {
    {
      filename = kr_weapons_sounds_path .. "anti-material-rifle.ogg",
      volume = 0.8,
    },
  }

  -- Technologies

  krastorio.technologies.removeUnlockRecipe("uranium-ammo", "uranium-rounds-magazine")
  krastorio.technologies.removeUnlockRecipe("kr-military-5", "imersite-rounds-magazine")

  krastorio.technologies.addUnlockRecipe("military", "rifle-magazine")

  krastorio.technologies.addUnlockRecipe("military-2", "armor-piercing-rifle-magazine")

  krastorio.technologies.addUnlockRecipe("military-2", "anti-material-rifle")
  krastorio.technologies.addUnlockRecipe("military-2", "anti-material-rifle-magazine")

  krastorio.technologies.addUnlockRecipe("military-3", "armor-piercing-anti-material-rifle-magazine")

  krastorio.technologies.addUnlockRecipe("uranium-ammo", "uranium-rifle-magazine")
  krastorio.technologies.addUnlockRecipe("uranium-ammo", "uranium-anti-material-rifle-magazine")

  krastorio.technologies.addUnlockRecipe("kr-military-5", "imersite-rifle-magazine")
  krastorio.technologies.addUnlockRecipe("kr-military-5", "imersite-anti-material-rifle-magazine")

  krastorio.technologies.addPrerequisite("gun-turret", "military")
end
