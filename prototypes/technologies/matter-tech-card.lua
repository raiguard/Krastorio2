data:extend({
  {
    type = "technology",
    name = "kr-advanced-pickaxe",
    icon_size = 256,
    icons = {
      {
        icon = "__Krastorio2Assets__/technologies/imersium-pickaxe.png",
        icon_size = 256,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining.png",
        icon_size = 128,
        shift = { 100, 100 },
      },
    },
    unit = {
      time = 60,
      count = 200,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "steel-axe", "kr-imersium-processing" },
    effects = {
      { type = "character-mining-speed", modifier = 2 },
    },
  },
  {
    type = "technology",
    name = "kr-advanced-tech-card",
    icon = "__Krastorio2Assets__/technologies/advanced-tech-card.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 1000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-imersium-processing" },
    effects = {
      { type = "unlock-recipe", recipe = "advanced-tech-card" },
    },
  },
  {
    type = "technology",
    name = "kr-energy-control-unit",
    icon = "__Krastorio2Assets__/technologies/energy-control-unit.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-singularity-lab", "kr-lithium-sulfur-battery", "kr-matter-tech-card" },
    effects = {
      { type = "unlock-recipe", recipe = "energy-control-unit" },
    },
  },
  {
    type = "technology",
    name = "kr-energy-storage",
    icon = "__Krastorio2Assets__/technologies/energy-storage.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "electric-energy-accumulators", "kr-matter-tech-card", "kr-energy-control-unit" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-energy-storage" },
    },
  },
  {
    type = "technology",
    name = "kr-imersium-processing",
    icon = "__Krastorio2Assets__/technologies/imersium-processing.png",
    icon_size = 256,
    unit = {
      time = 60,
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-tech-card" },
    effects = {
      { type = "unlock-recipe", recipe = "imersium-plate" },
      { type = "unlock-recipe", recipe = "imersium-gear-wheel" },
      { type = "unlock-recipe", recipe = "imersium-beam" },
    },
  },
  {
    type = "technology",
    name = "kr-improved-pollution-filter",
    icon = "__Krastorio2Assets__/technologies/improved-pollution-filter.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 200,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-tech-card", "kr-air-purification" },
    effects = {
      { type = "unlock-recipe", recipe = "improved-pollution-filter" },
      { type = "unlock-recipe", recipe = "kr-air-cleaning-2" },
      { type = "unlock-recipe", recipe = "restore-used-improved-pollution-filter" },
    },
  },
  {
    type = "technology",
    name = "kr-matter-coal-processing",
    icon = "__Krastorio2Assets__/technologies/matter-coal.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-copper-processing",
    icon = "__Krastorio2Assets__/technologies/matter-copper.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-iron-processing",
    icon = "__Krastorio2Assets__/technologies/matter-iron.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-minerals-processing",
    icon = "__Krastorio2Assets__/technologies/matter-minerals.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-oil-processing",
    icon = "__Krastorio2Assets__/technologies/matter-oil.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-processing",
    icon = "__Krastorio2Assets__/technologies/matter-processing.png",
    icon_size = 256,
    order = "g-e-d",
    unit = {
      time = 45,
      count = 1000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-tech-card", "kr-imersium-processing", "kr-energy-control-unit" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-matter-plant" },
      { type = "unlock-recipe", recipe = "kr-matter-associator" },
      { type = "unlock-recipe", recipe = "kr-stabilizer-charging-station" },
      { type = "unlock-recipe", recipe = "matter-stabilizer" },
      { type = "unlock-recipe", recipe = "charge-stabilizer" },
    },
  },
  {
    type = "technology",
    name = "kr-matter-rare-metals-processing",
    icon = "__Krastorio2Assets__/technologies/matter-rare-metals.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-rare-metals-processing",
    icon = "__Krastorio2Assets__/technologies/matter-rare-metals.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
      time = 45,
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-stone-processing",
    icon = "__Krastorio2Assets__/technologies/matter-stone.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
      time = 45,
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-stone-processing",
    icon = "__Krastorio2Assets__/technologies/matter-stone.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-uranium-processing",
    icon = "__Krastorio2Assets__/technologies/matter-uranium.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-water-processing",
    icon = "__Krastorio2Assets__/technologies/matter-water.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-matter-water-processing",
    icon = "__Krastorio2Assets__/technologies/matter-water.png",
    icon_size = 256,
    order = "g-e-e",
    unit = {
      time = 45,
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-matter-processing" },
    effects = {},
  },
  {
    type = "technology",
    name = "kr-robot-battery-plus",
    icon = "__Krastorio2Assets__/technologies/robot-battery-plus.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 1000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
      },
    },
    prerequisites = { "kr-robot-battery", "kr-advanced-roboports", "kr-energy-control-unit" },
    effects = {
      { type = "worker-robot-battery", modifier = 0.6 },
    },
  },
})