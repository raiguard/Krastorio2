data:extend({
  -----------------------------------------------------------------------------------------------------------------
  --------------------------------------------------CHARACTER EQUIPMENTS-------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -- -- Armors
  -- power armor mk3
  {
    type = "technology",
    name = "kr-power-armor-mk3",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "power-armor-mk3.png",
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
        { "space-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
  },
  -- power armor mk4
  {
    type = "technology",
    name = "kr-power-armor-mk4",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "power-armor-mk4.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "power-armor-mk4",
      },
    },
    prerequisites = { "kr-power-armor-mk3", "kr-singularity-tech-card" },
    unit = {
      count = 750,
      ingredients = {
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 90,
    },
  },
  -- -- Exoskeletons
  {
    type = "technology",
    name = "kr-advanced-exoskeleton-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "advanced-exoskeleton-equipment.png",
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
    name = "kr-superior-exoskeleton-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "superior-exoskeleton-equipment.png",
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
        { "space-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
  -- -- Imersite night visor
  {
    type = "technology",
    name = "kr-imersite-night-vision-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "imersite-night-vision-equipment.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "imersite-night-vision-equipment",
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
  -----------------------------------------------------------------------------------------------------------------
  --------------------------------------------------VEHICLES EQUIPMENTS--------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "technology",
    name = "kr-advanced-additional-engine",
    mod = "Krastorio2",
    icons = {
      { icon = kr_technologies_icons_path .. "advanced-additional-engine.png", icon_size = 256, icon_mipmaps = 4 },
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
        recipe = "advanced-additional-engine",
      },
    },
    prerequisites = { "electric-engine", "advanced-electronics-2", "utility-science-pack" },
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
  -----------------------------------------------------------------------------------------------------------------
  --------------------------------------------------UNIVERSAL EQUIPMENTS-------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  --GENERATORS
  {
    type = "technology",
    name = "kr-portable-generator",
    mod = "Krastorio2",
    icons = {
      { icon = kr_technologies_icons_path .. "portable-generator.png", icon_size = 256, icon_mipmaps = 4 },
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
        recipe = "portable-generator",
      },
    },
    prerequisites = { "battery-equipment", "chemical-science-pack" },
    unit = {
      count = 50,
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
    name = "kr-nuclear-reactor-equipment",
    mod = "Krastorio2",
    icons = {
      { icon = kr_technologies_icons_path .. "nuclear-reactor-equipment.png", icon_size = 256, icon_mipmaps = 4 },
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
        recipe = "nuclear-reactor-equipment",
      },
    },
    prerequisites = { "nuclear-power", "power-armor" },
    unit = {
      count = 250,
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
    name = "kr-antimatter-reactor-equipment",
    mod = "Krastorio2",
    icons = {
      { icon = kr_technologies_icons_path .. "antimatter-reactor-equipment.png", icon_size = 256, icon_mipmaps = 4 },
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
        recipe = "antimatter-reactor-equipment",
      },
    },
    prerequisites = { "kr-nuclear-reactor-equipment", "kr-antimatter-reactor" },
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
      time = 45,
    },
  },
  -- -- BATTERIES
  {
    type = "technology",
    name = "kr-battery-mk3-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "battery-mk3-equipment.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "battery-mk3-equipment",
      },
      {
        type = "unlock-recipe",
        recipe = "big-battery-mk3-equipment",
      },
    },
    prerequisites = {
      "kr-quarry-minerals-extraction",
      "kr-lithium-sulfur-battery",
      "battery-mk2-equipment",
      "advanced-electronics-2",
    },
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
      time = 60,
    },
  },
  -- -- SOLAR PANELS
  {
    type = "technology",
    name = "kr-imersite-solar-panel-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "imersite-solar-panel-equipment.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "imersite-solar-panel-equipment",
      },
      {
        type = "unlock-recipe",
        recipe = "big-imersite-solar-panel-equipment",
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
  -- -- PERSONAL LASERS
  -- personal-laser-defense-mk2-equipment
  {
    type = "technology",
    name = "kr-personal-laser-defense-mk2-equipment",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "personal-laser-defense-mk2-equipments.png",
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
  -- personal-laser-defense-mk3-equipment
  {
    type = "technology",
    name = "kr-personal-laser-defense-mk3-equipment",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "personal-laser-defense-mk3-equipments.png",
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
        { "space-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 75,
    },
  },
  -- personal-laser-defense-mk4-equipment
  {
    type = "technology",
    name = "kr-personal-laser-defense-mk4-equipment",
    mod = "Krastorio2",
    icon = kr_technologies_icons_path .. "personal-laser-defense-mk4-equipments.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        recipe = "personal-submachine-laser-defense-mk4-equipment",
        type = "unlock-recipe",
      },
      {
        type = "unlock-recipe",
        recipe = "personal-laser-defense-mk4-equipment",
      },
    },
    order = "g-m",
    prerequisites = {
      "kr-personal-laser-defense-mk3-equipment",
      "kr-singularity-tech-card",
    },
    unit = {
      count = 500,
      ingredients = {
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
      time = 90,
    },
  },
  -- -- SHIELDS
  -- energy-shield-mk3-equipment
  {
    type = "technology",
    name = "kr-energy-shield-mk3-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "energy-shield-mk3-equipment.png",
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
  -- energy-shield-mk4-equipment
  {
    type = "technology",
    name = "kr-energy-shield-mk4-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "energy-shield-mk4-equipment.png",
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
        { "space-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 90,
    },
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
})
