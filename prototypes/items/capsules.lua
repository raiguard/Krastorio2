local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "capsule",
    name = "kr-biter-virus",
    icon = "__Krastorio2Assets__/icons/capsules/biter-virus.png",
    subgroup = "capsule",
    order = "c[poison-capsule]",
    stack_size = 100,
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/capsules/biter-virus.png",
          size = 64,
          scale = 0.5,
          mipmap_count = 4,
        },
        {
          filename = "__Krastorio2Assets__/icons/capsules/biter-virus-light.png",
          size = 64,
          scale = 0.5,
          mipmap_count = 4,
          flags = { "light" },
          draw_as_light = true,
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
  },
  {
    type = "capsule",
    name = "spoiled-potato",
    icon = "__Krastorio2Assets__/icons/capsules/spoiled-potato.png",
    hidden = true,
    subgroup = "other",
    stack_size = 50,
    rocket_launch_products = { { type = "item", name = "poop", amount = 1 } },
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
  },
  {
    type = "capsule",
    name = "poop",
    icon = "__Krastorio2Assets__/icons/capsules/poop.png",
    subgroup = "other",
    hidden = true,
    stack_size = 50,
    rocket_launch_products = { { type = "item", name = "kr-note-1", amount = 1 } },
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
  },
  {
    type = "capsule",
    name = "first-aid-kit",
    icon = "__Krastorio2Assets__/icons/items/first-aid-kit.png",
    subgroup = "raw-resource",
    order = "h[first-aid-kit]",
    stack_size = 50,
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
  },
  {
    type = "capsule",
    name = "potato",
    icon = "__Krastorio2Assets__/icons/items/potato.png",
    subgroup = "other",
    hidden = true,
    stack_size = 50,
    rocket_launch_products = { { type = "item", name = "cyber-potato-equipment", amount = 1 } },
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
  },
})
