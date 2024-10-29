--------------
-- stats

--------------------------------------------------------------------
-- stats

data:extend({

  -- -- -- -- -- -- --

  {
    type = "technology",
    name = "mining-productivity-11",
    icons = {
      {
        icon = "__base__/graphics/technology/mining-productivity.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.1,
      },
    },
    prerequisites = { "mining-productivity-4", "kr-advanced-tech-card" },
    unit = {
      count_formula = "(L^2)*200",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 15,
    upgrade = true,
    order = "c-k-f-w",
  },
  {
    type = "technology",
    name = "mining-productivity-16",
    icons = {
      {
        icon = "__base__/graphics/technology/mining-productivity.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "mining-drill-productivity-bonus",
        modifier = 0.1,
      },
    },
    prerequisites = { "mining-productivity-11", "kr-singularity-tech-card" },
    unit = {
      count_formula = "(L^2)*200",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 100,
    upgrade = true,
    order = "c-k-f-z",
  },

  -- -- -- -- -- -- --

  {
    type = "technology",
    name = "worker-robots-speed-7",
    icons = {
      {
        icon = "__base__/graphics/technology/worker-robots-speed.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "worker-robot-speed",
        modifier = 0.60,
      },
    },
    prerequisites = { "worker-robots-speed-6", "kr-advanced-tech-card" },
    unit = {
      count_formula = "((L-6)^2)*5000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 8,
    upgrade = true,
    order = "c-k-f-w",
  },

  {
    type = "technology",
    name = "worker-robots-speed-9",
    icons = {
      {
        icon = "__base__/graphics/technology/worker-robots-speed.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "worker-robot-speed",
        modifier = 0.375,
      },
    },
    prerequisites = { "worker-robots-speed-7", "kr-singularity-tech-card" },
    unit = {
      count_formula = "((L-8)^2)*5000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 10,
    upgrade = true,
    order = "c-k-f-z",
  },

  -- -- -- -- -- -- --

  -- TODO:
  -- {
  --   type = "technology",
  --   name = "follower-robot-count-8",
  --   icons = {
  --     {
  --       icon = "__base__/graphics/technology/follower-robots.png",
  --       icon_size = 256,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__core__/graphics/icons/technology/constants/constant-count.png",
  --       icon_size = 128,
  --       icon_mipmaps = 3,
  --       shift = { 100, 100 },
  --     },
  --   },
  --   icon_size = 256,
  --   icon_mipmaps = 4,
  --   effects = {
  --     {
  --       type = "maximum-following-robots-count",
  --       modifier = 15,
  --     },
  --   },
  --   prerequisites = { "follower-robot-count-7", "kr-advanced-tech-card" },
  --   unit = {
  --     count_formula = "((L-7)^2)*5000",
  --     ingredients = {
  --       { "production-science-pack", 1 },
  --       { "utility-science-pack", 1 },
  --       { kr_optimization_tech_card_name, 1 },
  --       { "matter-tech-card", 1 },
  --       { "advanced-tech-card", 1 },
  --     },
  --     time = 60,
  --   },
  --   upgrade = true,
  --   order = "c-k-f-w",
  -- },

  -- {
  --   type = "technology",
  --   name = "follower-robot-count-9",
  --   icons = {
  --     {
  --       icon = "__base__/graphics/technology/follower-robots.png",
  --       icon_size = 256,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__core__/graphics/icons/technology/constants/constant-count.png",
  --       icon_size = 128,
  --       icon_mipmaps = 3,
  --       shift = { 100, 100 },
  --     },
  --   },
  --   icon_size = 256,
  --   icon_mipmaps = 4,
  --   effects = {
  --     {
  --       type = "maximum-following-robots-count",
  --       modifier = 15,
  --     },
  --   },
  --   prerequisites = { "follower-robot-count-8", "kr-singularity-tech-card" },
  --   unit = {
  --     count_formula = "((L-8)^2)*5000",
  --     ingredients = {
  --       { "production-science-pack", 1 },
  --       { "utility-science-pack", 1 },
  --       { kr_optimization_tech_card_name, 1 },
  --       { "matter-tech-card", 1 },
  --       { "advanced-tech-card", 1 },
  --       { "singularity-tech-card", 1 },
  --     },
  --     time = 60,
  --   },
  --   max_level = 10,
  --   upgrade = true,
  --   order = "c-k-f-z",
  -- },

  -- -- -- -- -- -- --

  {
    type = "technology",
    name = "physical-projectile-damage-11",
    icons = {
      {
        icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = 0.1,
      },
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = 0.1,
      },
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.1,
      },
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 0.1,
      },
    },
    prerequisites = { "physical-projectile-damage-7", "kr-advanced-tech-card" },
    unit = {
      count_formula = "((L-10)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 15,
    upgrade = true,
    order = "c-k-f-w",
  },
  {
    type = "technology",
    name = "physical-projectile-damage-16",
    icons = {
      {
        icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "ammo-damage",
        ammo_category = "bullet",
        modifier = 0.1,
      },
      {
        type = "turret-attack",
        turret_id = "gun-turret",
        modifier = 0.1,
      },
      {
        type = "ammo-damage",
        ammo_category = "shotgun-shell",
        modifier = 0.1,
      },
      {
        type = "ammo-damage",
        ammo_category = "cannon-shell",
        modifier = 0.1,
      },
    },
    prerequisites = { "physical-projectile-damage-11", "kr-singularity-tech-card" },
    unit = {
      count_formula = "((L-15)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 18,
    upgrade = true,
    order = "c-k-f-z",
  },

  -- -- -- -- -- -- --

  {
    type = "technology",
    name = "stronger-explosives-11",
    icons = {
      {
        icon = "__base__/graphics/technology/stronger-explosives-3.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.1,
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.1,
      },
      {
        type = "ammo-damage",
        ammo_category = "artillery-shell",
        modifier = 0.1,
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.1,
      },
    },
    prerequisites = { "stronger-explosives-7", "kr-advanced-tech-card" },
    unit = {
      count_formula = "((L-10)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 15,
    upgrade = true,
    order = "c-k-f-w",
  },
  {
    type = "technology",
    name = "stronger-explosives-16",
    icons = {
      {
        icon = "__base__/graphics/technology/stronger-explosives-3.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "ammo-damage",
        ammo_category = "rocket",
        modifier = 0.1,
      },
      {
        type = "ammo-damage",
        ammo_category = "grenade",
        modifier = 0.1,
      },
      {
        type = "ammo-damage",
        ammo_category = "artillery-shell",
        modifier = 0.1,
      },
      {
        type = "ammo-damage",
        ammo_category = "landmine",
        modifier = 0.1,
      },
    },
    prerequisites = { "stronger-explosives-11", "kr-singularity-tech-card" },
    unit = {
      count_formula = "((L-15)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 18,
    upgrade = true,
    order = "c-k-f-z",
  },

  -- -- -- -- -- -- --

  {
    type = "technology",
    name = "refined-flammables-11",
    icons = {
      {
        icon = "__base__/graphics/technology/refined-flammables.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "ammo-damage",
        ammo_category = "flamethrower",
        modifier = 0.1,
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.1,
      },
    },
    prerequisites = { "refined-flammables-7", "kr-advanced-tech-card" },
    unit = {
      count_formula = "((L-10)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 15,
    upgrade = true,
    order = "c-k-f-w",
  },
  {
    type = "technology",
    name = "refined-flammables-16",
    icons = {
      {
        icon = "__base__/graphics/technology/refined-flammables.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "ammo-damage",
        ammo_category = "flamethrower",
        modifier = 0.1,
      },
      {
        type = "turret-attack",
        turret_id = "flamethrower-turret",
        modifier = 0.1,
      },
    },
    prerequisites = { "refined-flammables-11", "kr-singularity-tech-card" },
    unit = {
      count_formula = "((L-15)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 18,
    upgrade = true,
    order = "c-k-f-z",
  },

  -- -- -- -- -- -- --

  -- TODO:
  -- {
  --   type = "technology",
  --   name = "laser-weapons-damage-11",
  --   icons = {
  --     {
  --       icon = "__base__/graphics/technology/laser-weapons-damage.png",
  --       icon_size = 256,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
  --       icon_size = 128,
  --       icon_mipmaps = 3,
  --       shift = { 100, 100 },
  --     },
  --   },
  --   icon_size = 256,
  --   icon_mipmaps = 4,
  --   effects = {
  --     {
  --       type = "ammo-damage",
  --       ammo_category = "laser",
  --       modifier = 0.1,
  --     },
  --   },
  --   prerequisites = { "laser-weapons-damage-7", "kr-advanced-tech-card" },
  --   unit = {
  --     count_formula = "((L-10)^2)*3000",
  --     ingredients = {
  --       { "production-science-pack", 1 },
  --       { "utility-science-pack", 1 },
  --       { kr_optimization_tech_card_name, 1 },
  --       { "matter-tech-card", 1 },
  --       { "advanced-tech-card", 1 },
  --     },
  --     time = 60,
  --   },
  --   max_level = 15,
  --   upgrade = true,
  --   order = "c-k-f-w",
  -- },
  -- {
  --   type = "technology",
  --   name = "laser-weapons-damage-16",
  --   icons = {
  --     {
  --       icon = "__base__/graphics/technology/laser-weapons-damage.png",
  --       icon_size = 256,
  --       icon_mipmaps = 4,
  --     },
  --     {
  --       icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
  --       icon_size = 128,
  --       icon_mipmaps = 3,
  --       shift = { 100, 100 },
  --     },
  --   },
  --   icon_size = 256,
  --   icon_mipmaps = 4,
  --   effects = {
  --     {
  --       type = "ammo-damage",
  --       ammo_category = "laser",
  --       modifier = 0.1,
  --     },
  --   },
  --   prerequisites = { "laser-weapons-damage-11", "kr-singularity-tech-card" },
  --   unit = {
  --     count_formula = "((L-15)^2)*3000",
  --     ingredients = {
  --       { "production-science-pack", 1 },
  --       { "utility-science-pack", 1 },
  --       { kr_optimization_tech_card_name, 1 },
  --       { "matter-tech-card", 1 },
  --       { "advanced-tech-card", 1 },
  --       { "singularity-tech-card", 1 },
  --     },
  --     time = 60,
  --   },
  --   max_level = 18,
  --   upgrade = true,
  --   order = "c-k-f-z",
  -- },

  -- -- -- -- -- -- --

  {
    type = "technology",
    name = "artillery-shell-range-3",
    icons = {
      {
        icon = "__base__/graphics/technology/artillery-range.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-range.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "artillery-range",
        modifier = 0.3,
      },
    },
    prerequisites = { "artillery-shell-range-1", "kr-advanced-tech-card" },
    unit = {
      count_formula = "((L-2)^2)*3500",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 4,
    upgrade = true,
    order = "c-k-f-w",
  },
  {
    type = "technology",
    name = "artillery-shell-range-5",
    icons = {
      {
        icon = "__base__/graphics/technology/artillery-range.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-range.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "artillery-range",
        modifier = 0.2,
      },
    },
    prerequisites = { "artillery-shell-range-3", "kr-singularity-tech-card" },
    unit = {
      count_formula = "((L-4)^2)*3500",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 7,
    upgrade = true,
    order = "c-k-f-z",
  },

  -- -- -- -- -- -- --

  {
    type = "technology",
    name = "artillery-shell-speed-3",
    icons = {
      {
        icon = "__base__/graphics/technology/artillery-speed.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "gun-speed",
        ammo_category = "artillery-shell",
        modifier = 0.1,
      },
    },
    prerequisites = { "artillery-shell-speed-1", "kr-advanced-tech-card" },
    unit = {
      count_formula = "((L-2)^2)*3500",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 4,
    upgrade = true,
    order = "c-k-f-w",
  },
  {
    type = "technology",
    name = "artillery-shell-speed-5",
    icons = {
      {
        icon = "__base__/graphics/technology/artillery-speed.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "gun-speed",
        ammo_category = "artillery-shell",
        modifier = 0.1,
      },
    },
    prerequisites = { "artillery-shell-speed-3", "kr-singularity-tech-card" },
    unit = {
      count_formula = "((L-4)^2)*3500",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 60,
    },
    max_level = 7,
    upgrade = true,
    order = "c-k-f-z",
  },
})
