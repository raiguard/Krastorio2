data:extend({
  -----------------------------------------------------------------------------------------------------------------
  ---------------------------------------------ONLY BUILDINGS UNLOCKING--------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
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
    name = "kr-basic-fluid-handling",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/basic-fluid-handling.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "pipe",
      },
      {
        type = "unlock-recipe",
        recipe = "pipe-to-ground",
      },
      {
        type = "unlock-recipe",
        recipe = "offshore-pump",
      },
    },
    prerequisites = { "kr-automation-core" },
    unit = {
      count = 10,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 20,
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = not krastorio.general.getSafeSettingValue("kr-tech-multiplier-everywhere"),
  },
  {
    type = "technology",
    name = "kr-steam-engine",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/steam-engine.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "boiler",
      },
      {
        type = "unlock-recipe",
        recipe = "steam-engine",
      },
    },
    prerequisites = { "kr-basic-fluid-handling" },
    unit = {
      count = 20,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-decorations",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/decorations.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {}, -- This is populated during data-updates by prototypes/others/greenhouse.lua
    prerequisites = { "kr-greenhouse" },
    unit = {
      count = 30,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-crusher",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/crusher.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-crusher",
      },
    },
    prerequisites = { "kr-automation-core" },
    unit = {
      count = 30,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 30,
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = not krastorio.general.getSafeSettingValue("kr-tech-multiplier-everywhere"),
  },
  -----------------------------------------------------------------------
  -- AUTOMATION TIER AND UPPER
  -----------------------------------------------------------------------
  {
    type = "technology",
    name = "kr-shelter",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/shelter.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-shelter",
      },
    },
    prerequisites = { "automation-science-pack" },
    unit = {
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-electric-mining-drill",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/electric-mining-drill.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "electric-mining-drill",
      },
    },
    prerequisites = { "automation-science-pack" },
    unit = {
      count = 20,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-mineral-water-gathering",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/mineral-water-gathering.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "fluid-handling", "kr-fluids-chemistry" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-mineral-water-pumpjack",
      },
    },
    unit = {
      count = 50,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 30,
    },
  },
  -----------------------------------------------------------------------
  -- LOGISTIC TIER AND UPPER
  -----------------------------------------------------------------------

  {
    type = "technology",
    name = "kr-sentinel",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/sentinel.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "lamp", "kr-stone-processing" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-sentinel",
      },
    },
    unit = {
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-radar",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/radar.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "kr-sentinel", "electronics", "steel-processing" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "radar",
      },
    },
    unit = {
      count = 200,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-steel-fluid-handling",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/steel-fluid-handling.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-steel-pipe",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-steel-pipe-to-ground",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-steel-pump",
      },
    },
    prerequisites = { "steel-processing", "fluid-handling" },
    unit = {
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-steel-fluid-tanks",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/steel-fluid-tanks.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-big-storage-tank",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-huge-storage-tank",
      },
    },
    prerequisites = { "kr-steel-fluid-handling" },
    unit = {
      count = 120,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-gas-power-station",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/gas-power-station.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-gas-power-station",
      },
    },
    prerequisites = { "oil-processing", "engine" },
    unit = {
      count = 250,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 30,
    },
  },
  -----------------------------------------------------------------------
  -- CHEMICAL TIER AND UPPER
  -----------------------------------------------------------------------
  {
    type = "technology",
    name = "kr-advanced-lab",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/biusart-lab.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "advanced-circuit" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "biusart-lab",
      },
    },
    unit = {
      count = 300,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-research-server",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/research-server.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "advanced-circuit" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-research-server",
      },
    },
    unit = {
      count = 350,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-electric-mining-drill-mk2",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/electric-mining-drill-mk2.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-electric-mining-drill-mk2",
      },
    },
    prerequisites = { "kr-electric-mining-drill", "engine" },
    unit = {
      count = 300,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 45,
    },
  },
  -----------------------------------------------------------------------
  -- PRODUCTION TIER AND UPPER
  -----------------------------------------------------------------------
  {
    type = "technology",
    name = "kr-advanced-solar-panel",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/advanced-solar-panel.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "solar-energy", "kr-quarry-minerals-extraction" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-solar-panel",
      },
    },
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
      time = 45,
    },
  },
  -----------------------------------------------------------------------
  -- UTILITY TIER AND UPPER
  -----------------------------------------------------------------------
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
    name = "kr-energy-storage",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/energy-storage.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-energy-storage",
      },
    },
    prerequisites = { "electric-energy-accumulators", "kr-matter-tech-card", "kr-energy-control-unit" },
    unit = {
      count = 350,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "matter-tech-card", 1 },
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
    name = "kr-singularity-beacon",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/singularity-beacon.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-singularity-beacon",
      },
    },
    prerequisites = { "effect-transmission", "kr-singularity-tech-card" },
    unit = {
      count = 1000,
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
  },
  {
    type = "technology",
    name = "kr-intergalactic-transceiver",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/intergalactic-transceiver.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-intergalactic-transceiver",
      },
    },
    prerequisites = { "kr-singularity-tech-card" },
    unit = {
      count = 3000,
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
  },
  {
    type = "technology",
    name = "kr-logo",
    mod = "Krastorio2",
    enabled = false,
    icon = "__Krastorio2Assets__/technologies/k-logo.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-logo",
      },
    },
    prerequisites = { "kr-intergalactic-transceiver" },
    unit = {
      count = 666000,
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
  },

  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
})

-- Loader recipes
if krastorio.general.getSafeSettingValue("kr-loaders") then
  krastorio.technologies.addUnlockRecipe("kr-logistic-4", "kr-advanced-loader")
  krastorio.technologies.addUnlockRecipe("kr-logistic-5", "kr-superior-loader")
end

-- Containers
if krastorio.general.getSafeSettingValue("kr-containers") then
  data:extend({
    {
      type = "technology",
      name = "kr-containers",
      mod = "Krastorio2",
      icon = "__Krastorio2Assets__/technologies/containers.png",
      icon_size = 256,
      icon_mipmaps = 4,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "kr-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-warehouse",
        },
      },
      prerequisites = { "steel-processing" },
      unit = {
        count = 100,
        ingredients = {
          { "basic-tech-card", 1 },
          { "automation-science-pack", 1 },
        },
        time = 30,
      },
    },
    {
      type = "technology",
      name = "kr-logistic-containers-1",
      mod = "Krastorio2",
      localised_name = { "technology-name.kr-logistic-containers-1" },
      localised_description = { "technology-description.kr-logistic-containers-1" },
      icon = "__Krastorio2Assets__/technologies/logistic-containers-1.png",
      icon_size = 256,
      icon_mipmaps = 4,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "kr-passive-provider-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-storage-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-passive-provider-warehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-storage-warehouse",
        },
      },
      prerequisites = { "kr-containers", "logistic-robotics" },
      unit = {
        count = 250,
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "chemical-science-pack", 1 },
        },
        time = 30,
      },
    },
    {
      type = "technology",
      name = "kr-logistic-containers-2",
      mod = "Krastorio2",
      localised_name = { "technology-name.kr-logistic-containers-2" },
      localised_description = { "technology-description.kr-logistic-containers-2" },
      icon = "__Krastorio2Assets__/technologies/logistic-containers-2.png",
      icon_size = 256,
      icon_mipmaps = 4,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "kr-active-provider-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-buffer-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-requester-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-active-provider-warehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-buffer-warehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-requester-warehouse",
        },
      },
      prerequisites = { "kr-containers", "logistic-system" },
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
  })
end
