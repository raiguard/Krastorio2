data:extend({
  {
    type = "ammo",
    name = "imersite-rounds-magazine",
    icon = "__Krastorio2Assets__/icons/ammo/imersite-rounds-magazine.png",
    subgroup = "ammo",
    order = "a[basic-clips]-d[imersite-rounds-magazine]",
    stack_size = 200,
    magazine_size = 10,
    ammo_category = "bullet",
    ammo_type = {
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
          target_effects = {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
            },
            {
              type = "damage",
              damage = { amount = 28, type = "physical" },
            },
          },
        },
      },
    },
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/ammo/imersite-rounds-magazine.png",
          size = 64,
          scale = 0.5,
          mipmap_count = 4,
        },
        {
          filename = "__Krastorio2Assets__/icons/ammo/imersite-rounds-magazine-light.png",
          size = 64,
          scale = 0.5,
          mipmap_count = 4,
          flags = { "light" },
          draw_as_light = true,
        },
      },
    },
  },
  {
    type = "ammo",
    name = "antimatter-artillery-shell",
    icon = "__Krastorio2Assets__/icons/ammo/antimatter-artillery-shell.png",
    subgroup = "ammo",
    order = "d[explosive-cannon-shell]-e[antimatter-artillery-shell]",
    stack_size = 25,
    ammo_category = "artillery-shell",
    ammo_type = {
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "artillery",
          projectile = "antimatter-artillery-projectile",
          starting_speed = 1,
          direction_deviation = 0,
          range_deviation = 0,
          source_effects = {
            type = "create-explosion",
            entity_name = "artillery-cannon-muzzle-flash",
          },
        },
      },
    },
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/ammo/antimatter-artillery-shell.png",
          size = 64,
          scale = 0.5,
          mipmap_count = 4,
        },
        {
          filename = "__Krastorio2Assets__/icons/ammo/antimatter-artillery-shell-light.png",
          size = 64,
          scale = 0.5,
          mipmap_count = 4,
          flags = { "light" },
          draw_as_light = true,
        },
      },
    },
  },
  {
    type = "ammo",
    name = "impulse-rifle-ammo",
    icon = "__Krastorio2Assets__/icons/ammo/impulse-rifle-ammo.png",
    subgroup = "ammo",
    order = "c[impulse-rifle-ammo]",
    stack_size = 200,
    magazine_size = 3,
    ammo_category = "impulse-rifle",
    ammo_type = {
      target_type = "direction",
      clamp_position = true,
      action = {
        type = "line",
        range = 50,
        width = 2,
        range_effects = {
          type = "create-explosion",
          entity_name = "impulse-rifle-beam",
        },
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "damage",
            damage = { amount = 500, type = "laser" },
          },
        },
      },
    },
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/ammo/impulse-rifle-ammo.png",
          size = 64,
          scale = 0.5,
          mipmap_count = 4,
        },
        {
          filename = "__Krastorio2Assets__/icons/ammo/impulse-rifle-ammo-light.png",
          size = 64,
          scale = 0.5,
          mipmap_count = 4,
          flags = { "light" },
          draw_as_light = true,
        },
      },
    },
  },
  {
    type = "ammo",
    name = "heavy-rocket",
    icon = "__Krastorio2Assets__/icons/ammo/heavy-rocket.png",
    subgroup = "ammo",
    order = "d[rocket-launcher]-b[explosive]",
    stack_size = 50,
    ammo_category = "heavy-rocket",
    ammo_type = {
      cooldown_modifier = 0.75,
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "heavy-explosive-rocket-projectile",
          starting_speed = 0,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
  },
  {
    type = "ammo",
    name = "antimatter-rocket",
    icon = "__Krastorio2Assets__/icons/ammo/antimatter-rocket.png",
    subgroup = "ammo",
    order = "d[rocket-launcher]-d[antimatter-rocket]",
    stack_size = 10,
    ammo_category = "heavy-rocket",
    ammo_type = {
      range_modifier = 3,
      cooldown_modifier = 3,
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "antimatter-rocket-projectile",
          starting_speed = 0,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          --max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/ammo/antimatter-rocket.png",
          size = 64,
          scale = 0.5,
          mipmap_count = 4,
        },
        {
          filename = "__Krastorio2Assets__/icons/ammo/antimatter-rocket-light.png",
          size = 64,
          scale = 0.5,
          mipmap_count = 4,
          flags = { "light" },
          draw_as_light = true,
        },
      },
    },
  },
  {
    type = "ammo",
    name = "basic-railgun-shell",
    icon = "__Krastorio2Assets__/icons/ammo/basic-railgun-shell.png",
    subgroup = "railgun-turret",
    order = "b01[basic-railgun-shell]",
    stack_size = 100,
    magazine_size = 1,
    ammo_category = "railgun-shell",
    ammo_type = {
      target_type = "entity",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "basic-railgun-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
  },
  {
    type = "ammo",
    name = "explosion-railgun-shell",
    icon = "__Krastorio2Assets__/icons/ammo/explosion-railgun-shell.png",
    subgroup = "railgun-turret",
    order = "b02[explosion-railgun-shell]",
    stack_size = 100,
    magazine_size = 1,
    ammo_category = "railgun-shell",
    ammo_type = {
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "explosion-railgun-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
  },
  {
    type = "ammo",
    name = "antimatter-railgun-shell",
    icon = "__Krastorio2Assets__/icons/ammo/antimatter-railgun-shell.png",
    subgroup = "railgun-turret",
    order = "b03[antimatter-railgun-shell]",
    stack_size = 100,
    magazine_size = 1,
    ammo_category = "railgun-shell",
    ammo_type = {
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "matter-railgun-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
    pictures = {
      layers = {
        {
          size = 64,
          filename = "__Krastorio2Assets__/icons/ammo/antimatter-railgun-shell.png",
          scale = 0.5,
          mipmap_count = 4,
        },
        {
          draw_as_light = true,
          flags = { "light" },
          size = 64,
          filename = "__Krastorio2Assets__/icons/ammo/antimatter-railgun-shell-light.png",
          scale = 0.5,
          mipmap_count = 4,
        },
      },
    },
  },
  {
    type = "ammo",
    name = "explosive-turret-rocket",
    icon = "__Krastorio2Assets__/icons/ammo/explosion-rocket-for-turret.png",
    subgroup = "rocket-turret",
    order = "b01[explosion-rocket-for-turret]",
    stack_size = 25,
    magazine_size = 1,
    ammo_category = "missiles-for-turrets",
    ammo_type = {
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "explosion-turret-rocket-projectile",
          starting_speed = 0,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
  },
  {
    type = "ammo",
    name = "nuclear-turret-rocket",
    icon = "__Krastorio2Assets__/icons/ammo/nuclear-rocket-for-turret.png",
    subgroup = "rocket-turret",
    order = "b02[nuclear-rocket-for-turret]",
    stack_size = 25,
    magazine_size = 1,
    ammo_category = "missiles-for-turrets",
    ammo_type = {
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "nuclear-turret-rocket-projectile",
          starting_speed = 0,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
    pictures = {
      layers = {
        {
          size = 64,
          filename = "__Krastorio2Assets__/icons/ammo/nuclear-rocket-for-turret.png",
          scale = 0.5,
          mipmap_count = 4,
        },
        {
          draw_as_light = true,
          flags = { "light" },
          size = 64,
          filename = "__Krastorio2Assets__/icons/ammo/nuclear-rocket-for-turret-light.png",
          scale = 0.5,
          mipmap_count = 4,
        },
      },
    },
  },
  {
    type = "ammo",
    name = "antimatter-turret-rocket",
    icon = "__Krastorio2Assets__/icons/ammo/antimatter-rocket-for-turret.png",
    subgroup = "rocket-turret",
    order = "b03[antimatter-rocket-for-turret]",
    stack_size = 25,
    magazine_size = 1,
    ammo_category = "missiles-for-turrets",
    ammo_type = {
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "matter-turret-rocket-projectile",
          starting_speed = 0,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100,
          source_effects = {
            type = "create-explosion",
            entity_name = "explosion-gunshot",
          },
        },
      },
    },
    pictures = {
      layers = {
        {
          size = 64,
          filename = "__Krastorio2Assets__/icons/ammo/antimatter-rocket-for-turret.png",
          scale = 0.5,
          mipmap_count = 4,
        },
        {
          draw_as_light = true,
          flags = { "light" },
          size = 64,
          filename = "__Krastorio2Assets__/icons/ammo/antimatter-rocket-for-turret-light.png",
          scale = 0.5,
          mipmap_count = 4,
        },
      },
    },
  },
  {
    type = "ammo",
    name = "nuclear-artillery-shell",
    icon = "__Krastorio2Assets__/icons/ammo/nuclear-artillery-shell.png",
    subgroup = "ammo",
    order = "d[explosive-cannon-shell]-d[artillery]-a2[nuclear-artillery]",
    stack_size = 25,
    ammo_category = "artillery-shell",
    ammo_type = {
      target_type = "position",
      action = {
        type = "direct",
        action_delivery = {
          type = "artillery",
          projectile = "atomic-artillery",
          starting_speed = 1,
          direction_deviation = 0,
          range_deviation = 0,
          source_effects = {
            type = "create-entity",
            entity_name = "artillery-cannon-muzzle-flash",
          },
        },
      },
    },
    pictures = {
      layers = {
        {
          size = 64,
          filename = "__Krastorio2Assets__/icons/ammo/nuclear-artillery-shell.png",
          scale = 0.5,
          mipmap_count = 4,
        },
        {
          draw_as_light = true,
          flags = { "light" },
          size = 64,
          filename = "__Krastorio2Assets__/icons/ammo/nuclear-artillery-shell-light.png",
          scale = 0.5,
          mipmap_count = 4,
        },
      },
    },
  },
})
