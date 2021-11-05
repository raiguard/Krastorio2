data:extend({
  -----------------------------------------------------------------------------------------------------------------
  ---------------------------------------------------MIXED UNLOCKING-----------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "technology",
    name = "kr-iron-pickaxe",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icons = {
      {
        icon = kr_technologies_icons_path .. "iron-pickaxe.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    effects = {
      {
        type = "character-mining-speed",
        modifier = 0.50,
      },
    },
    prerequisites = {},
    unit = {
      count = 25,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 30,
    },
    order = "b-c-a",
  },
  {
    type = "technology",
    name = "kr-advanced-pickaxe",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icons = {
      {
        icon = kr_technologies_icons_path .. "imersium-pickaxe.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    effects = {
      {
        type = "character-mining-speed",
        modifier = 2,
      },
    },
    prerequisites = { "steel-axe", "kr-imersium-processing" },
    unit = {
      count = 200,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
        { "matter-tech-card", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-tesla-coil",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "tesla-coil.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-tesla-coil",
      },
      {
        type = "unlock-recipe",
        recipe = "energy-absorber",
      },
    },
    prerequisites = { "battery-equipment", "power-armor" },
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-tesla-coil-upgrade-mk1",
    mod = "Krastorio2",
    icons = {
      { icon = kr_technologies_icons_path .. "tesla-coil.png", icon_size = 256, icon_mipmaps = 4 },
      {
        icon = kr_technologies_icons_path .. "/overlays/" .. "tesla-coil-upgrade-1.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    upgrade = false,
    effects = {},
    prerequisites = { "kr-tesla-coil" },
    unit = {
      count = 750,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-tesla-coil-upgrade-mk2",
    mod = "Krastorio2",
    icons = {
      { icon = kr_technologies_icons_path .. "tesla-coil.png", icon_size = 256, icon_mipmaps = 4 },
      {
        icon = kr_technologies_icons_path .. "/overlays/" .. "tesla-coil-upgrade-2.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    upgrade = false,
    effects = {},
    prerequisites = { "kr-tesla-coil-upgrade-mk1" },
    unit = {
      count = 800,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-tesla-coil-upgrade-mk3",
    mod = "Krastorio2",
    icons = {
      { icon = kr_technologies_icons_path .. "tesla-coil.png", icon_size = 256, icon_mipmaps = 4 },
      {
        icon = kr_technologies_icons_path .. "/overlays/" .. "tesla-coil-upgrade-3.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    upgrade = false,
    effects = {},
    prerequisites = { "kr-tesla-coil-upgrade-mk2" },
    unit = {
      count = 900,
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
    name = "kr-tesla-coil-upgrade-mk4",
    mod = "Krastorio2",
    icons = {
      { icon = kr_technologies_icons_path .. "tesla-coil.png", icon_size = 256, icon_mipmaps = 4 },
      {
        icon = kr_technologies_icons_path .. "/overlays/" .. "tesla-coil-upgrade-4.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    upgrade = false,
    effects = {},
    prerequisites = { "kr-tesla-coil-upgrade-mk3" },
    unit = {
      count = 1000,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------BUILDINGS AND PROCESS RECIPES-------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "technology",
    name = "kr-greenhouse",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "greenhouse.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-greenhouse",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-grow-wood-with-water",
      },
    },
    prerequisites = { "kr-automation-core", "kr-stone-processing" },
    unit = {
      count = 40,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-fluids-chemistry",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "fluids-chemistry.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-filtration-plant",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-electrolysis-plant",
      },
      {
        type = "unlock-recipe",
        recipe = "chemical-plant",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-water-electrolysis",
      },
    },
    prerequisites = { "kr-basic-fluid-handling", "steel-processing" },
    unit = {
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-fluid-excess-handling",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "fluid-burner.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-fluid-burner",
      },
    },
    prerequisites = { "kr-fluids-chemistry", "electronics" },
    unit = {
      count = 150,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-atmosphere-condensation",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "atmospheric-condenser.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-atmospheric-condenser",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["hydrogen"] or "hydrogen",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["oxygen"] or "oxygen",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["nitrogen"] or "nitrogen",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["water-from-atmosphere"] or "water-from-atmosphere",
      },
    },
    prerequisites = { "kr-fluids-chemistry", "electronics" },
    unit = {
      count = 175,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-air-purification",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "air-purifier.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-air-purifier",
      },
      {
        type = "unlock-recipe",
        recipe = "pollution-filter",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-air-cleaning",
      },
      {
        type = "unlock-recipe",
        recipe = "restore-used-pollution-filter",
      },
    },
    prerequisites = { "kr-advanced-chemistry", "engine" },
    order = "a-e-d",
    unit = {
      count = 275,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-fusion-energy",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "fusion-energy.png",
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
        recipe = krastorio.recipes.changed_names["heavy-water"] or "heavy-water",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["tritium"] or "tritium",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["empty-dt-fuel"] or "empty-dt-fuel",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["dt-fuel"] or "dt-fuel",
      },
    },
    prerequisites = {
      "advanced-electronics-2",
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
  ---
  -- Fuels
  ---
  {
    type = "technology",
    name = "kr-fuel",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "fuel-refinery.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-fuel-refinery",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["fuel-1"] or "fuel-1",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["fuel-2"] or "fuel-2",
      },
    },
    prerequisites = { "oil-processing" },
    unit = {
      count = 125,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 45,
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  --------------------------------------------------PURE RECIPES---------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "technology",
    name = "kr-silicon-processing",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "silicon-processing.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["silicon"] or "silicon",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["quartz"] or "quartz",
      },
    },
    prerequisites = { "kr-fluids-chemistry", "automation-2" },
    order = "c-a",
    unit = {
      count = 125,
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
    name = "kr-advanced-chemistry",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "advanced-chemistry.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-water",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-water-separation",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["ammonia"] or "ammonia",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["nitric-acid"] or "nitric-acid",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["hydrogen-chloride"] or "hydrogen-chloride",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["biomethanol"] or "biomethanol",
      },
    },
    prerequisites = { "sulfur-processing", "kr-mineral-water-gathering", "kr-atmosphere-condensation" },
    order = "d-a",
    unit = {
      count = 275,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-bio-processing",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "bio-lab.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-bio-lab",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-biomass-growing",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["first-aid-kit"] or "first-aid-kit",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["fertilizer"] or "fertilizer",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-grow-wood-plus",
      },
    },
    prerequisites = { "kr-greenhouse", "kr-advanced-chemistry", "electronics" },
    unit = {
      count = 150,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "military-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 45,
    },
  },
  -- Enriched ores, copper and iron
  {
    type = "technology",
    name = "kr-enriched-ores",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "enriched-ores.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "enriched-iron",
      },
      {
        type = "unlock-recipe",
        recipe = "enriched-copper",
      },
      {
        type = "unlock-recipe",
        recipe = "enriched-rare-metals",
      },
      {
        type = "unlock-recipe",
        recipe = "enriched-iron-plate",
      },
      {
        type = "unlock-recipe",
        recipe = "enriched-copper-plate",
      },
      {
        type = "unlock-recipe",
        recipe = "rare-metals-2",
      },
      {
        type = "unlock-recipe",
        recipe = "dirty-water-filtration-1",
      },
      {
        type = "unlock-recipe",
        recipe = "dirty-water-filtration-2",
      },
      {
        type = "unlock-recipe",
        recipe = "dirty-water-filtration-3",
      },
    },
    prerequisites = { "kr-advanced-chemistry" },
    unit = {
      count = 275,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-lithium-processing",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "lithium-processing.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["lithium"] or "lithium",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["lithium-chloride"] or "lithium-chloride",
      },
    },
    prerequisites = { "kr-advanced-chemistry" },
    unit = {
      count = 275,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-quarry-minerals-extraction",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "quarry-drill.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-quarry-drill",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["imersite-powder"] or "imersite-powder",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["imersite-crystal"] or "imersite-crystal",
      },
    },
    prerequisites = { "kr-advanced-chemistry", "advanced-electronics-2", "electric-engine" },
    order = "g-e-d",
    unit = {
      count = 350,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-automation",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "advanced-assembling-machine.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-assembling-machine",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["kr-s-c-copper-cable"] or "kr-s-c-copper-cable",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["kr-s-c-iron-stick"] or "kr-s-c-iron-stick",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["kr-s-c-iron-gear-wheel"] or "kr-s-c-iron-gear-wheel",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["kr-s-c-iron-beam"] or "kr-s-c-iron-beam",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["kr-s-c-steel-gear-wheel"] or "kr-s-c-steel-gear-wheel",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["kr-s-c-steel-beam"] or "kr-s-c-steel-beam",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["kr-s-c-imersium-gear-wheel"] or "kr-s-c-imersium-gear-wheel",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["kr-s-c-imersium-beam"] or "kr-s-c-imersium-beam",
      },
    },
    prerequisites = { "automation-3", "kr-imersium-processing", "kr-energy-control-unit", "kr-advanced-tech-card" },
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
    name = "kr-railgun-turret",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "railgun-turret.png",
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
        recipe = krastorio.recipes.changed_names["basic-railgun-shell"] or "basic-railgun-shell",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["explosion-railgun-shell"] or "explosion-railgun-shell",
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
    name = "kr-rocket-turret",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "rocket-turret.png",
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
        recipe = krastorio.recipes.changed_names["explosive-turret-rocket"] or "explosive-turret-rocket",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["nuclear-turret-rocket"] or "nuclear-turret-rocket",
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
    name = "kr-antimatter-reactor",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "antimatter-reactor.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "kr-fusion-energy", "kr-singularity-tech-card" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-antimatter-reactor",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["empty-antimatter-fuel-cell"] or "empty-antimatter-fuel-cell",
      },
      {
        type = "unlock-recipe",
        recipe = krastorio.recipes.changed_names["charged-antimatter-fuel-cell"] or "charged-antimatter-fuel-cell",
      },
    },
    order = "g-f-z",
    unit = {
      count = 2000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 60,
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  --------------------------------------------------BONUS RECIPES--------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "technology",
    name = "kr-robot-battery",
    icon = kr_technologies_icons_path .. "robot-battery.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "worker-robot-battery",
        modifier = 0.4,
      },
    },
    prerequisites = { "kr-lithium-sulfur-battery", "robotics" },
    unit = {
      count = 500,
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
    name = "kr-robot-battery-plus",
    icon = kr_technologies_icons_path .. "robot-battery-plus.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "worker-robot-battery",
        modifier = 0.6,
      },
    },
    prerequisites = { "kr-robot-battery", "kr-advanced-roboports", "kr-energy-control-unit" },
    unit = {
      count = 1000,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
        { "matter-tech-card", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-planetary-teleporter",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "planetary-teleporter.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-planetary-teleporter",
      },
      {
        type = "unlock-recipe",
        recipe = "gps-satellite",
      },
    },
    prerequisites = { "effect-transmission", "kr-singularity-tech-card" },
    unit = {
      count = 500,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 60,
    },
  },
  {
    type = "technology",
    name = "kr-efficient-fabrication",
    -- Electronic components icon overlayed with lithium
    -- TODO: Make a better icon
    -- NOTE: This cannot be directly copied from the recipe, because the lithium does not scale consistently...
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/items-with-variations/electronic-components/electronic-components.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__Krastorio2Assets__/icons/items-with-variations/lithium/lithium.png",
        icon_size = 64,
        icon_mipmaps = 4,
        scale = 0.75,
        offset = { 0.2, 0.2 },
      },
    },
    effects = {
      { type = "unlock-recipe", recipe = "electronic-components-lithium" },
    },
    unit = {
      count = 500,
      ingredients = {
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
      },
      time = 60,
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
})
