data:extend({
  {
    type = "technology",
    name = "kr-advanced-chemistry",
    icon = "__Krastorio2Assets__/technologies/advanced-chemistry.png",
    icon_size = 256,
    order = "d-a",
    unit = {
      time = 60,
      count = 275,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "sulfur-processing", "kr-mineral-water-gathering", "kr-atmosphere-condensation" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-water" },
      { type = "unlock-recipe", recipe = "kr-water-separation" },
      { type = "unlock-recipe", recipe = "ammonia" },
      { type = "unlock-recipe", recipe = "nitric-acid" },
      { type = "unlock-recipe", recipe = "hydrogen-chloride" },
      { type = "unlock-recipe", recipe = "biomethanol" },
    },
  },
  {
    type = "technology",
    name = "kr-advanced-lab",
    icon = "__Krastorio2Assets__/technologies/biusart-lab.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 300,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "advanced-circuit" },
    effects = {
      { type = "unlock-recipe", recipe = "biusart-lab" },
    },
  },
  {
    type = "technology",
    name = "kr-air-purification",
    icon = "__Krastorio2Assets__/technologies/air-purifier.png",
    icon_size = 256,
    order = "a-e-d",
    unit = {
      time = 45,
      count = 275,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-advanced-chemistry", "engine" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-air-purifier" },
      { type = "unlock-recipe", recipe = "pollution-filter" },
      { type = "unlock-recipe", recipe = "kr-air-cleaning" },
      { type = "unlock-recipe", recipe = "restore-used-pollution-filter" },
    },
  },
  {
    type = "technology",
    name = "kr-atmosphere-condensation",
    icon = "__Krastorio2Assets__/technologies/atmospheric-condenser.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 175,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-fluids-chemistry", "electronics" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-atmospheric-condenser" },
      { type = "unlock-recipe", recipe = "hydrogen" },
      { type = "unlock-recipe", recipe = "oxygen" },
      { type = "unlock-recipe", recipe = "nitrogen" },
      { type = "unlock-recipe", recipe = "water-from-atmosphere" },
    },
  },
  {
    type = "technology",
    name = "kr-bio-fuel",
    icon = "__Krastorio2Assets__/technologies/bio-fuel.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 200,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-fuel", "kr-advanced-chemistry" },
    effects = {
      { type = "unlock-recipe", recipe = "bio-fuel" },
    },
  },
  {
    type = "technology",
    name = "kr-bio-processing",
    icon = "__Krastorio2Assets__/technologies/bio-lab.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 150,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "military-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-greenhouse", "kr-advanced-chemistry", "electronics" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-bio-lab" },
      { type = "unlock-recipe", recipe = "kr-biomass-growing" },
      { type = "unlock-recipe", recipe = "first-aid-kit" },
      { type = "unlock-recipe", recipe = "fertilizer" },
      { type = "unlock-recipe", recipe = "kr-grow-wood-plus" },
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of Bio matter.
    ignore_tech_cost_multiplier = true,
  },
  {
    type = "technology",
    name = "kr-electric-mining-drill-mk2",
    icon = "__Krastorio2Assets__/technologies/electric-mining-drill-mk2.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 300,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-electric-mining-drill", "engine" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-electric-mining-drill-mk2" },
    },
  },
  {
    type = "technology",
    name = "kr-enriched-ores",
    icon = "__Krastorio2Assets__/technologies/enriched-ores.png",
    icon_size = 256,
    unit = {
      time = 60,
      count = 275,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-advanced-chemistry" },
    effects = {
      { type = "unlock-recipe", recipe = "enriched-iron" },
      { type = "unlock-recipe", recipe = "enriched-copper" },
      { type = "unlock-recipe", recipe = "enriched-rare-metals" },
      { type = "unlock-recipe", recipe = "enriched-iron-plate" },
      { type = "unlock-recipe", recipe = "enriched-copper-plate" },
      { type = "unlock-recipe", recipe = "rare-metals-2" },
      { type = "unlock-recipe", recipe = "dirty-water-filtration-1" },
      { type = "unlock-recipe", recipe = "dirty-water-filtration-2" },
      { type = "unlock-recipe", recipe = "dirty-water-filtration-3" },
    },
  },
  {
    type = "technology",
    name = "kr-lithium-processing",
    icon = "__Krastorio2Assets__/technologies/lithium-processing.png",
    icon_size = 256,
    unit = {
      time = 60,
      count = 275,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-advanced-chemistry" },
    effects = {
      { type = "unlock-recipe", recipe = "lithium" },
      { type = "unlock-recipe", recipe = "lithium-chloride" },
    },
  },
  {
    type = "technology",
    name = "kr-lithium-sulfur-battery",
    icon = "__Krastorio2Assets__/technologies/lithium-sulfur-battery.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 200,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-lithium-processing" },
    effects = {
      { type = "unlock-recipe", recipe = "lithium-sulfur-battery" },
    },
  },
  {
    type = "technology",
    name = "kr-nuclear-reactor-equipment",
    icons = {
      {
        icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
        icon_size = 128,
        shift = { 100, 100 },
      },
    },
    upgrade = false,
    unit = {
      time = 60,
      count = 250,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "nuclear-power", "power-armor" },
    effects = {
      { type = "unlock-recipe", recipe = "nuclear-reactor-equipment" },
    },
  },
  {
    type = "technology",
    name = "kr-portable-generator-equipment",
    icons = {
      {
        icon = "__Krastorio2Assets__/technologies/portable-generator-equipment.png",
        icon_size = 256,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
        icon_size = 128,
        shift = { 100, 100 },
      },
    },
    upgrade = false,
    unit = {
      time = 60,
      count = 50,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "battery-equipment", "chemical-science-pack" },
    effects = {
      { type = "unlock-recipe", recipe = "portable-generator-equipment" },
    },
  },
  {
    type = "technology",
    name = "kr-radar",
    icon = "__Krastorio2Assets__/technologies/radar.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 200,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-sentinel", "electronics", "steel-processing" },
    effects = {
      { type = "unlock-recipe", recipe = "radar" },
    },
  },
  {
    type = "technology",
    name = "kr-reinforced-plates",
    icon = "__Krastorio2Assets__/technologies/reinforced-plates.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 200,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "concrete", "steel-processing" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-black-reinforced-plate" },
      { type = "unlock-recipe", recipe = "kr-white-reinforced-plate" },
    },
  },
  {
    type = "technology",
    name = "kr-research-server",
    icon = "__Krastorio2Assets__/technologies/research-server.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 350,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "advanced-circuit" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-research-server" },
    },
  },
  {
    type = "technology",
    name = "kr-robot-battery",
    icon = "__Krastorio2Assets__/technologies/robot-battery.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-lithium-sulfur-battery", "robotics" },
    effects = {
      { type = "worker-robot-battery", modifier = 0.4 },
    },
  },
  {
    type = "technology",
    name = "kr-tesla-coil",
    icon = "__Krastorio2Assets__/technologies/tesla-coil.png",
    icon_size = 256,
    upgrade = false,
    unit = {
      time = 60,
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "battery-equipment", "power-armor" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-tesla-coil" },
      { type = "unlock-recipe", recipe = "energy-absorber-equipment" },
    },
  },
})
