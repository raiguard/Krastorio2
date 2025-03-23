data:extend({
  {
    type = "technology",
    name = "electric-energy-distribution-3",
    icon = "__Krastorio2Assets__/technologies/electric-energy-distribution.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 300,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "electric-energy-distribution-2", "kr-advanced-tech-card" },
    effects = { { type = "unlock-recipe", recipe = "kr-superior-substation" } },
  },
  {
    type = "technology",
    name = "kr-advanced-chemical-plant",
    icon = "__Krastorio2Assets__/technologies/advanced-chemical-plant.png",
    icon_size = 256,
    unit = {
      time = 60,
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "kr-imersium-processing", "kr-advanced-tech-card" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-advanced-chemical-plant" },
      { type = "unlock-recipe", recipe = "electronic-components-with-lithium" },
    },
  },
  {
    type = "technology",
    name = "kr-advanced-furnace",
    icon = "__Krastorio2Assets__/technologies/advanced-furnace.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = {
      "kr-imersium-processing",
      "kr-energy-control-unit",
      "kr-advanced-tech-card",
    },
    effects = {
      { type = "unlock-recipe", recipe = "kr-advanced-furnace" },
    },
  },
  {
    type = "technology",
    name = "kr-advanced-roboports",
    icon = "__Krastorio2Assets__/technologies/advanced-roboports.png",
    icon_size = 256,
    unit = {
      time = 60,
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "kr-imersium-processing", "kr-advanced-tech-card" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-small-roboport" },
      { type = "unlock-recipe", recipe = "kr-big-roboport" },
    },
  },
  {
    type = "technology",
    name = "kr-advanced-tank",
    icon = "__Krastorio2Assets__/technologies/advanced-tank.png",
    icon_size = 256,
    unit = {
      time = 60,
      count = 750,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "tank", "kr-imersium-processing", "kr-advanced-tech-card", "kr-railgun-turret" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-advanced-tank" },
    },
  },
  {
    type = "technology",
    name = "kr-automation",
    icon = "__Krastorio2Assets__/technologies/advanced-assembling-machine.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = {
      "automation-3",
      "kr-imersium-processing",
      "kr-energy-control-unit",
      "kr-advanced-tech-card",
      "kr-enriched-ores",
    },
    effects = {
      { type = "unlock-recipe", recipe = "kr-advanced-assembling-machine" },
      { type = "unlock-recipe", recipe = "kr-s-c-copper-cable" },
      { type = "unlock-recipe", recipe = "kr-s-c-copper-cable-enriched" },
      { type = "unlock-recipe", recipe = "kr-s-c-iron-stick" },
      { type = "unlock-recipe", recipe = "kr-s-c-iron-stick-enriched" },
      { type = "unlock-recipe", recipe = "kr-s-c-iron-gear-wheel" },
      { type = "unlock-recipe", recipe = "kr-s-c-iron-gear-wheel-enriched" },
      { type = "unlock-recipe", recipe = "kr-s-c-iron-beam" },
      { type = "unlock-recipe", recipe = "kr-s-c-iron-beam-enriched" },
      { type = "unlock-recipe", recipe = "kr-s-c-steel-gear-wheel" },
      { type = "unlock-recipe", recipe = "kr-s-c-steel-beam" },
      { type = "unlock-recipe", recipe = "kr-s-c-imersium-gear-wheel" },
      { type = "unlock-recipe", recipe = "kr-s-c-imersium-beam" },
      { type = "unlock-recipe", recipe = "kr-s-c-electronic-components" },
    },
  },
  {
    type = "technology",
    name = "kr-biter-virus",
    icon = "__Krastorio2Assets__/technologies/biter-virus.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 3000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "kr-advanced-tech-card", "kr-military-5" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-biter-virus" },
    },
  },
  {
    type = "technology",
    name = "kr-electric-mining-drill-mk3",
    icon = "__Krastorio2Assets__/technologies/electric-mining-drill-mk3.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 300,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "kr-electric-mining-drill-mk2", "kr-imersium-processing" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-electric-mining-drill-mk3" },
    },
  },
  {
    type = "technology",
    name = "kr-energy-shield-mk4-equipment",
    icon_size = 256,
    icons = util.technology_icon_constant_equipment(
      "__Krastorio2Assets__/technologies/energy-shield-mk4-equipment.png"
    ),
    upgrade = false,
    unit = {
      time = 90,
      count = 500,
      ingredients = {
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "kr-energy-shield-mk3-equipment", "kr-advanced-tech-card" },
    effects = {
      { type = "unlock-recipe", recipe = "energy-shield-mk4-equipment" },
    },
  },
  {
    type = "technology",
    name = "kr-laser-artillery-turret",
    icon = "__Krastorio2Assets__/technologies/laser-artillery-turret.png",
    icon_size = 256,
    order = "g-f-z",
    unit = {
      time = 60,
      count = 750,
      ingredients = {
        { "military-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "kr-military-5", "kr-advanced-tech-card", "kr-railgun-turret", "kr-energy-control-unit" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-laser-artillery-turret" },
    },
  },
  {
    type = "technology",
    name = "kr-logistic-5",
    localised_description = { "technology-description.logistics" },
    icon = "__Krastorio2Assets__/technologies/logistics-5.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 750,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "kr-logistic-4", "kr-imersium-processing", "kr-advanced-tech-card" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-superior-splitter" },
      { type = "unlock-recipe", recipe = "kr-superior-transport-belt" },
      { type = "unlock-recipe", recipe = "kr-superior-underground-belt" },
    },
  },
  {
    type = "technology",
    name = "kr-personal-laser-defense-mk3-equipment",
    icons = util.technology_icon_constant_equipment(
      "__Krastorio2Assets__/technologies/personal-laser-defense-mk3-equipments.png"
    ),
    icon_size = 256,
    order = "g-m",
    unit = {
      time = 75,
      count = 450,
      ingredients = {
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = {
      "kr-personal-laser-defense-mk2-equipment",
      "kr-military-5",
      "kr-lithium-sulfur-battery",
      "kr-imersium-processing",
    },
    effects = {
      {
        recipe = "personal-submachine-laser-defense-mk3-equipment",
        type = "unlock-recipe",
      },
      { type = "unlock-recipe", recipe = "personal-laser-defense-mk3-equipment" },
    },
  },
  {
    type = "technology",
    name = "kr-power-armor-mk3",
    icon = "__Krastorio2Assets__/technologies/power-armor-mk3.png",
    icon_size = 256,
    upgrade = false,
    unit = {
      time = 60,
      count = 500,
      ingredients = {
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "power-armor-mk2", "kr-energy-control-unit" },
    effects = {
      { type = "unlock-recipe", recipe = "power-armor-mk3" },
    },
  },
  {
    type = "technology",
    name = "kr-rocket-turret",
    icon = "__Krastorio2Assets__/technologies/rocket-turret.png",
    icon_size = 256,
    order = "g-f-z",
    unit = {
      time = 60,
      count = 750,
      ingredients = {
        { "military-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "kr-military-5", "kr-advanced-tech-card", "kr-railgun-turret", "atomic-bomb" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-rocket-turret" },
      { type = "unlock-recipe", recipe = "explosive-turret-rocket" },
      { type = "unlock-recipe", recipe = "nuclear-turret-rocket" },
    },
  },
  {
    type = "technology",
    name = "kr-singularity-tech-card",
    icon = "__Krastorio2Assets__/technologies/singularity-tech-card.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 1250,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "kr-advanced-tech-card", "kr-matter-processing" },
    effects = {
      { type = "unlock-recipe", recipe = "singularity-tech-card" },
    },
  },
  {
    type = "technology",
    name = "kr-superior-exoskeleton-equipment",
    icons = util.technology_icon_constant_equipment(
      "__Krastorio2Assets__/technologies/superior-exoskeleton-equipment.png"
    ),
    icon_size = 256,
    upgrade = false,
    unit = {
      time = 45,
      count = 500,
      ingredients = {
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "kr-advanced-exoskeleton-equipment", "kr-imersium-processing" },
    effects = {
      { type = "unlock-recipe", recipe = "superior-exoskeleton-equipment" },
    },
  },
  {
    type = "technology",
    name = "kr-superior-inserters",
    icon = "__Krastorio2Assets__/technologies/superior-inserters.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "bulk-inserter", "kr-imersium-processing", "kr-advanced-tech-card" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-superior-inserter" },
      { type = "unlock-recipe", recipe = "kr-superior-long-inserter" },
    },
  },
})
