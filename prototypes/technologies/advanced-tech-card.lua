data:extend({
  {
    type = "technology",
    name = "electric-energy-distribution-3",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/electric-energy-distribution.png",
    effects = { { type = "unlock-recipe", recipe = "kr-superior-substation" } },
    prerequisites = { "electric-energy-distribution-2", "kr-advanced-tech-card" },
    unit = {
      count = 300,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-advanced-chemical-plant",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/advanced-chemical-plant.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-chemical-plant",
      },
    },
    prerequisites = { "kr-imersium-processing", "kr-advanced-tech-card" },
    unit = {
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-advanced-furnace",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/advanced-furnace.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-furnace",
      },
    },
    prerequisites = {
      "kr-imersium-processing",
      "kr-energy-control-unit",
      "kr-advanced-tech-card",
    },
    unit = {
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-advanced-roboports",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/advanced-roboports.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-small-roboport",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-big-roboport",
      },
    },
    prerequisites = { "kr-imersium-processing", "kr-advanced-tech-card" },
    unit = {
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-advanced-tank",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/advanced-tank.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-tank",
      },
    },
    prerequisites = { "tank", "kr-imersium-processing", "kr-advanced-tech-card", "kr-railgun-turret" },
    unit = {
      count = 750,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-automation",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/advanced-assembling-machine.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-assembling-machine",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-copper-cable",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-copper-cable-enriched",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-iron-stick",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-iron-stick-enriched",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-iron-gear-wheel",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-iron-gear-wheel-enriched",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-iron-beam",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-iron-beam-enriched",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-steel-gear-wheel",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-steel-beam",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-imersium-gear-wheel",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-imersium-beam",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-s-c-electronic-components",
      },
    },
    prerequisites = {
      "automation-3",
      "kr-imersium-processing",
      "kr-energy-control-unit",
      "kr-advanced-tech-card",
      "kr-enriched-ores",
    },
    unit = {
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-biter-virus",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/biter-virus.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-biter-virus",
      },
    },
    prerequisites = { "kr-creep-virus" },
    unit = {
      count = 3000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-creep-virus",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/creep-virus.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-creep-virus",
      },
    },
    prerequisites = { "kr-advanced-tech-card", "kr-military-5" },
    unit = {
      count = 2000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-electric-mining-drill-mk3",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/electric-mining-drill-mk3.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-electric-mining-drill-mk3",
      },
    },
    prerequisites = { "kr-electric-mining-drill-mk2", "kr-imersium-processing" },
    unit = {
      count = 300,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-energy-shield-mk4-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/energy-shield-mk4-equipment.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "energy-shield-mk4-equipment",
      },
    },
    prerequisites = { "kr-energy-shield-mk3-equipment", "kr-advanced-tech-card" },
    unit = {
      count = 500,
      ingredients = {
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "advanced-tech-card", 1 },
      },
      time = 90,
    },
  },
  {
    type = "technology",
    name = "kr-laser-artillery-turret",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/laser-artillery-turret.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "kr-military-5", "kr-advanced-tech-card", "kr-railgun-turret", "kr-energy-control-unit" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-laser-artillery-turret",
      },
    },
    order = "g-f-z",
    unit = {
      count = 750,
      ingredients = {
        { "military-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-logistic-5",
    localised_description = { "technology-description.logistics" },
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/logistics-5.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-superior-splitter",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-superior-transport-belt",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-superior-underground-belt",
      },
    },
    prerequisites = { "kr-logistic-4", "kr-imersium-processing", "kr-advanced-tech-card" },
    unit = {
      count = 750,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-personal-laser-defense-mk3-equipment",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/personal-laser-defense-mk3-equipments.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        recipe = "personal-submachine-laser-defense-mk3-equipment",
        type = "unlock-recipe",
      },
      {
        type = "unlock-recipe",
        recipe = "personal-laser-defense-mk3-equipment",
      },
    },
    order = "g-m",
    prerequisites = {
      "kr-personal-laser-defense-mk2-equipment",
      "kr-military-5",
      "kr-lithium-sulfur-battery",
      "kr-imersium-processing",
    },
    unit = {
      count = 450,
      ingredients = {
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "advanced-tech-card", 1 },
      },
      time = 75,
    },
  },
  {
    type = "technology",
    name = "kr-power-armor-mk3",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/power-armor-mk3.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "power-armor-mk3",
      },
    },
    prerequisites = { "power-armor-mk2", "kr-energy-control-unit" },
    unit = {
      count = 500,
      ingredients = {
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-rocket-turret",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/rocket-turret.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "kr-military-5", "kr-advanced-tech-card", "kr-railgun-turret", "atomic-bomb" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-rocket-turret",
      },
      {
        type = "unlock-recipe",
        recipe = "explosive-turret-rocket",
      },
      {
        type = "unlock-recipe",
        recipe = "nuclear-turret-rocket",
      },
    },
    order = "g-f-z",
    unit = {
      count = 750,
      ingredients = {
        { "military-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-singularity-tech-card",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/singularity-tech-card.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "singularity-tech-card",
      },
    },
    prerequisites = { "kr-advanced-tech-card", "kr-matter-processing" },
    unit = {
      count = 1250,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-superior-exoskeleton-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/superior-exoskeleton-equipment.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "superior-exoskeleton-equipment",
      },
    },
    prerequisites = { "kr-advanced-exoskeleton-equipment", "kr-imersium-processing" },
    unit = {
      count = 500,
      ingredients = {
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-superior-inserters",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/superior-inserters.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-superior-inserter",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-superior-long-inserter",
      },
    },
    prerequisites = { "bulk-inserter", "kr-imersium-processing", "kr-advanced-tech-card" },
    unit = {
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
})
