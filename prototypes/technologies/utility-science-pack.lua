data:extend({
  {
    type = "technology",
    name = "kr-advanced-additional-engine-equipment",
    mod = "Krastorio2",
    icons = {
      {
        icon = "__Krastorio2Assets__/technologies/advanced-additional-engine-equipment.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "advanced-additional-engine-equipment",
      },
    },
    prerequisites = { "electric-engine", "processing-unit", "utility-science-pack" },
    unit = {
      count = 250,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-advanced-exoskeleton-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/advanced-exoskeleton-equipment.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "advanced-exoskeleton-equipment",
      },
    },
    prerequisites = { "exoskeleton-equipment", "speed-module-2" },
    unit = {
      count = 250,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-ai-core",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/ai-core.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "ai-core",
      },
    },
    prerequisites = { "kr-quarry-minerals-extraction" },
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-energy-shield-mk3-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/energy-shield-mk3-equipment.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "energy-shield-mk3-equipment",
      },
    },
    prerequisites = { "energy-shield-mk2-equipment", "kr-lithium-sulfur-battery" },
    unit = {
      count = 350,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-fusion-energy",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/fusion-energy.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-fusion-reactor",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-steam-turbine",
      },
      {
        type = "unlock-recipe",
        recipe = "heavy-water",
      },
      {
        type = "unlock-recipe",
        recipe = "tritium",
      },
      {
        type = "unlock-recipe",
        recipe = "empty-dt-fuel",
      },
      {
        type = "unlock-recipe",
        recipe = "dt-fuel",
      },
    },
    prerequisites = {
      "processing-unit",
      "kr-lithium-processing",
      "nuclear-power",
      "utility-science-pack",
      "low-density-structure",
      "kovarex-enrichment-process",
    },
    unit = {
      count = 1500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-logistic-4",
    localised_description = { "technology-description.logistics" },
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/logistics-4.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-splitter",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-transport-belt",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-underground-belt",
      },
    },
    prerequisites = { "logistics-3" },
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-matter-tech-card",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/matter-tech-card.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "matter-research-data",
      },
      {
        type = "unlock-recipe",
        recipe = "matter-tech-card",
      },
    },
    prerequisites = { "kr-singularity-lab" },
    unit = {
      count = 750,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-military-5",
    localised_description = { "technology-description.military" },
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/military-5.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "impulse-rifle",
      },
      {
        type = "unlock-recipe",
        recipe = "impulse-rifle-ammo",
      },
      {
        type = "unlock-recipe",
        recipe = "imersite-rounds-magazine",
      },
      {
        type = "unlock-recipe",
        recipe = "heavy-rocket-launcher",
      },
      {
        type = "unlock-recipe",
        recipe = "heavy-rocket",
      },
    },
    prerequisites = {
      "military-4",
      "kr-lithium-sulfur-battery",
      "kr-quarry-minerals-extraction",
      "personal-laser-defense-equipment",
    },
    order = "g-d-d",
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "military-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-personal-laser-defense-mk2-equipment",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/personal-laser-defense-mk2-equipments.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        recipe = "personal-submachine-laser-defense-mk2-equipment",
        type = "unlock-recipe",
      },
      {
        type = "unlock-recipe",
        recipe = "personal-laser-defense-mk2-equipment",
      },
    },
    order = "g-m",
    prerequisites = {
      "personal-laser-defense-equipment",
      "military-4",
      "low-density-structure",
      "power-armor-mk2",
    },
    unit = {
      count = 350,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "military-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-quantum-computer",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/quantum-computer.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-quantum-computer",
      },
    },
    prerequisites = { "kr-ai-core" },
    unit = {
      count = 750,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-railgun-turret",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/railgun-turret.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "military-4", "utility-science-pack" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-railgun-turret",
      },
      {
        type = "unlock-recipe",
        recipe = "basic-railgun-shell",
      },
      {
        type = "unlock-recipe",
        recipe = "explosion-railgun-shell",
      },
    },
    order = "g-f-z",
    unit = {
      count = 500,
      ingredients = {
        { "military-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-singularity-lab",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/singularity-lab.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-singularity-lab",
      },
    },
    prerequisites = { "kr-quantum-computer", "rocket-silo" },
    unit = {
      count = 750,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-superior-night-vision-equipment",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/superior-night-vision-equipment.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "superior-night-vision-equipment",
      },
    },
    prerequisites = { "night-vision-equipment", "kr-quarry-minerals-extraction" },
    unit = {
      count = 250,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-superior-solar-panel-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/superior-solar-panel-equipment.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "superior-solar-panel-equipment",
      },
      {
        type = "unlock-recipe",
        recipe = "big-superior-solar-panel-equipment",
      },
    },
    prerequisites = { "kr-quarry-minerals-extraction", "solar-panel-equipment" },
    unit = {
      count = 250,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
      time = 30,
    },
  },
})
