local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "capsule",
    name = "kr-creep-virus",
    icon = kr_capsules_icons_path .. "creep-virus.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
      layers = {
        {
          size = 64,
          filename = kr_capsules_icons_path .. "creep-virus.png",
          scale = 0.25,
          mipmap_count = 4,
        },
        {
          draw_as_light = true,
          flags = { "light" },
          size = 64,
          filename = kr_capsules_icons_path .. "creep-virus-light.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
    },
    capsule_action = {
      type = "throw",
      attack_parameters = {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "capsule",
        cooldown = 60,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type = {
          category = "capsule",
          target_type = "position",
          action = {
            {
              type = "direct",
              action_delivery = {
                type = "projectile",
                projectile = "virus-capsule",
                starting_speed = 0.3,
              },
            },
            {
              type = "direct",
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile,
                  },
                },
              },
            },
          },
        },
      },
    },
    subgroup = "capsule",
    order = "c[poison-capsule]",
    stack_size = 100,
  },
  {
    type = "capsule",
    name = "kr-biter-virus",
    icon = kr_capsules_icons_path .. "biter-virus.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
      layers = {
        {
          size = 64,
          filename = kr_capsules_icons_path .. "biter-virus.png",
          scale = 0.25,
          mipmap_count = 4,
        },
        {
          draw_as_light = true,
          flags = { "light" },
          size = 64,
          filename = kr_capsules_icons_path .. "biter-virus-light.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
    },
    capsule_action = {
      type = "throw",
      attack_parameters = {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "capsule",
        cooldown = 60,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type = {
          category = "capsule",
          target_type = "position",
          action = {
            {
              type = "direct",
              action_delivery = {
                type = "projectile",
                projectile = "virus-capsule",
                starting_speed = 0.3,
              },
            },
            {
              type = "direct",
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile,
                  },
                },
              },
            },
          },
        },
      },
    },
    subgroup = "capsule",
    order = "c[poison-capsule]",
    stack_size = 100,
  },
  {
    type = "capsule",
    name = "spoiled-potato",
    icon = kr_capsules_icons_path .. "spoiled-potato.png",
    rocket_launch_product = { "poop", 1 },
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "other",
    flags = { "hidden" },
    capsule_action = {
      type = "use-on-self",
      attack_parameters = {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "capsule",
        cooldown = 30,
        range = 0,
        ammo_type = {
          category = "capsule",
          target_type = "position",
          action = {
            type = "direct",
            action_delivery = {
              type = "instant",
              target_effects = {
                type = "damage",
                damage = { type = "physical", amount = 50 },
              },
            },
          },
        },
      },
    },
    stack_size = 50,
  },
  {
    type = "capsule",
    name = "poop",
    icon = kr_capsules_icons_path .. "poop.png",
    rocket_launch_product = { "kr-note-1", 1 },
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "other",
    flags = { "hidden" },
    capsule_action = {
      type = "throw",
      attack_parameters = {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "capsule",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 25,
        ammo_type = {
          category = "capsule",
          target_type = "position",
          action = {
            {
              type = "direct",
              action_delivery = {
                type = "projectile",
                projectile = "poop-projectile",
                starting_speed = 0.3,
              },
            },
            {
              type = "direct",
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "play-sound",
                    sound = sounds.throw_projectile,
                  },
                },
              },
            },
          },
        },
      },
    },
    stack_size = 50,
  },
  {
    type = "capsule",
    name = "first-aid-kit",
    icon = kr_icons_path .. "items/first-aid-kit.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "raw-resource",
    capsule_action = {
      type = "use-on-self",
      attack_parameters = {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 300,
        range = 0,
        ammo_type = {
          category = "capsule",
          target_type = "position",
          action = {
            type = "direct",
            action_delivery = {
              type = "instant",
              target_effects = {
                type = "damage",
                damage = { type = "physical", amount = -300 },
              },
            },
          },
        },
      },
    },
    order = "h[first-aid-kit]",
    stack_size = 50,
  },
  {
    type = "capsule",
    name = "potato",
    icon = kr_icons_path .. "items/potato.png",
    rocket_launch_product = { "cyber-potato-equipment", 1 },
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "other",
    flags = { "hidden" },
    capsule_action = {
      type = "use-on-self",
      attack_parameters = {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 30,
        range = 0,
        ammo_type = {
          category = "capsule",
          target_type = "position",
          action = {
            type = "direct",
            action_delivery = {
              type = "instant",
              target_effects = {
                type = "damage",
                damage = { type = "physical", amount = -50 },
              },
            },
          },
        },
      },
    },
    stack_size = 50,
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
})
