-- -- -- Modifications to vanilla technologies

--------------------------------------------------------------------
-- -- Prerequisites
--------------------------------------------------------------------

-- Addings
krastorio.technologies.addPrerequisite("steel-axe", "kr-iron-pickaxe")
krastorio.technologies.addPrerequisite("automation", "kr-automation-core")
krastorio.technologies.addPrerequisite("automation", "automation-science-pack")
krastorio.technologies.addPrerequisite("logistics", "automation-science-pack")
krastorio.technologies.addPrerequisite("stone-wall", "military")
krastorio.technologies.addPrerequisite("gun-turret", "automation-science-pack")
krastorio.technologies.addPrerequisite("fast-inserter", "electronics")
krastorio.technologies.addPrerequisite("heavy-armor", "light-armor")
krastorio.technologies.addPrerequisite("optics", "kr-stone-processing")
krastorio.technologies.addPrerequisite("logistics-2", "steel-processing")
krastorio.technologies.addPrerequisite("nuclear-power", "kr-steam-engine")
krastorio.technologies.addPrerequisite("oil-processing", "kr-fluids-chemistry")
krastorio.technologies.addPrerequisite("fluid-handling", "kr-basic-fluid-handling")
krastorio.technologies.addPrerequisite("advanced-electronics", "electronics")
krastorio.technologies.addPrerequisite("advanced-electronics", "kr-silicon-processing")
krastorio.technologies.addPrerequisite("battery-equipment", "modular-armor")
krastorio.technologies.addPrerequisite("fusion-reactor-equipment", "kr-fusion-energy")
krastorio.technologies.addPrerequisite("automobilism", "kr-fuel")
krastorio.technologies.addPrerequisite("tank", "kr-fuel")
krastorio.technologies.addPrerequisite("fast-inserter", "steel-processing")
krastorio.technologies.addPrerequisite("modular-armor", "military-2")
krastorio.technologies.addPrerequisite("spidertron", "kr-ai-core")

-- Science
krastorio.technologies.addPrerequisite("military-science-pack", "advanced-electronics")
krastorio.technologies.addPrerequisite("logistic-science-pack", "automation-science-pack")
krastorio.technologies.addPrerequisite("logistic-science-pack", "electronics")
krastorio.technologies.addPrerequisite("production-science-pack", "kr-research-server")
krastorio.technologies.addPrerequisite("production-science-pack", "kr-advanced-lab")
krastorio.technologies.addPrerequisite("production-science-pack", "uranium-processing")
krastorio.technologies.addPrerequisite("utility-science-pack", "kr-research-server")
krastorio.technologies.addPrerequisite("utility-science-pack", "rocket-fuel")
krastorio.technologies.addPrerequisite("space-science-pack", "kr-singularity-lab")

-- Modules
krastorio.technologies.addPrerequisite("speed-module-3", "advanced-electronics-2")
krastorio.technologies.addPrerequisite("productivity-module-3", "advanced-electronics-2")
krastorio.technologies.addPrerequisite("effectivity-module-3", "advanced-electronics-2")

-- Removing
krastorio.technologies.removePrerequisite("heavy-armor", "military")
krastorio.technologies.removePrerequisite("fluid-handling", "automation-2")
krastorio.technologies.removePrerequisite("engine", "steel-processing")
krastorio.technologies.removePrerequisite("battery-equipment", "solar-panel-equipment")
krastorio.technologies.removePrerequisite("battery-mk2-equipment", "low-density-structure")
krastorio.technologies.removePrerequisite("personal-laser-defense-equipment", "low-density-structure")

-- Modules
krastorio.technologies.removePrerequisite("speed-module-2", "advanced-electronics-2")
krastorio.technologies.removePrerequisite("productivity-module-2", "advanced-electronics-2")
krastorio.technologies.removePrerequisite("effectivity-module-2", "advanced-electronics-2")

--------------------------------------------------------------------
-- -- Research unit ingredients
--------------------------------------------------------------------

-- Conversions
krastorio.technologies.convertResearchUnitIngredient("stone-wall", "automation-science-pack", "basic-tech-card")
krastorio.technologies.convertResearchUnitIngredient("military", "automation-science-pack", "basic-tech-card")

-- Addings
krastorio.technologies.addResearchUnitIngredient("automation", "basic-tech-card")
krastorio.technologies.addResearchUnitIngredient("character-logistic-trash-slots-1", "basic-tech-card")
krastorio.technologies.addResearchUnitIngredient("auto-character-logistic-trash-slots", "basic-tech-card")

-- Removing
krastorio.technologies.removeResearchUnitIngredient("automation", "automation-science-pack")
krastorio.technologies.removeResearchUnitIngredient("fluid-handling", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("oil-processing", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("engine", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("plastics", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("fusion-reactor-equipment", "military-science-pack")

--------------------------------------------------------------------
-- -- Recipes Unlocking
--------------------------------------------------------------------

-- Addings

krastorio.technologies.addUnlockRecipe("landfill", krastorio.recipes.changed_names["landfill-2"] or "landfill-2")

-- Adding coke unlocking to steel production technology and steel things
krastorio.technologies.addUnlockRecipe("steel-processing", "coke")
krastorio.technologies.addUnlockRecipe("steel-processing", "steel-gear-wheel")
krastorio.technologies.addUnlockRecipe("steel-processing", "steel-beam")

-- Moving inserters unlocking in early game
krastorio.technologies.addUnlockRecipe("logistics", "inserter")
krastorio.technologies.addUnlockRecipe("logistics", "long-handed-inserter")

-- Add Prerequisite for fast inserters
krastorio.technologies.addPrerequisite("fast-inserter", "logistics")

-- Electronics I
krastorio.technologies.addUnlockRecipe("electronics", "electronic-circuit")
-- Electronics 2
krastorio.technologies.addUnlockRecipe("advanced-electronics", "electronic-components")

-- -- EQUIPMENTS
krastorio.technologies.addUnlockRecipe("solar-panel-equipment", "big-solar-panel-equipment")

krastorio.technologies.addUnlockRecipe("battery-equipment", "big-battery-equipment")
krastorio.technologies.addUnlockRecipe("battery-equipment", "small-portable-generator")

krastorio.technologies.addUnlockRecipe("battery-mk2-equipment", "big-battery-mk2-equipment")

local personal_roboport_tech = krastorio.technologies.getTechnologyThatUnlockRecipe("personal-roboport-equipment")
if personal_roboport_tech then
  krastorio.technologies.addUnlockRecipe(personal_roboport_tech.name, "vehicle-roboport")
end
local electric_engine_unit_tech = krastorio.technologies.getTechnologyThatUnlockRecipe("personal-roboport-equipment")
if electric_engine_unit_tech then
  krastorio.technologies.addUnlockRecipe(electric_engine_unit_tech.name, "additional-engine")
end

krastorio.technologies.addUnlockRecipe(
  "personal-laser-defense-equipment",
  "personal-submachine-laser-defense-mk1-equipment"
)

-- Rocket fuel recipes
krastorio.technologies.addUnlockRecipe("rocket-fuel", "rocket-fuel-with-ammonia")
krastorio.technologies.addUnlockRecipe("rocket-fuel", "rocket-fuel-with-hydrogen-chloride")

-- Coal liquefaction
krastorio.technologies.addUnlockRecipe("coal-liquefaction", "coal-filtration")
krastorio.technologies.addUnlockRecipe("coal-liquefaction", "coke-liquefaction")

-- Science
krastorio.technologies.addUnlockRecipe("automation-science-pack", "blank-tech-card")
krastorio.technologies.addUnlockRecipe("military-science-pack", "biters-research-data")
krastorio.technologies.addUnlockRecipe("space-science-pack", "space-science-pack")

-- Slow capsule
krastorio.technologies.moveUnlockRecipe("military-3", "military", "slowdown-capsule", true)

-- Removings

-- Moving inserters unlocking in early game
krastorio.technologies.removeUnlockRecipe("automation", "long-handed-inserter")
krastorio.technologies.removeUnlockRecipe("oil-processing", "chemical-plant")

krastorio.technologies.removeUnlockRecipe("kovarex-enrichment-process", "nuclear-fuel")
krastorio.technologies.setResearchUnitCount("kovarex-enrichment-process", 500)

--------------------------------------------------------------------
-- Loaders
if krastorio.general.getSafeSettingValue("kr-loaders") then
  krastorio.technologies.addUnlockRecipe("logistics", "kr-loader")
  krastorio.technologies.addUnlockRecipe("logistics-2", "kr-fast-loader")
  krastorio.technologies.addUnlockRecipe("logistics-3", "kr-express-loader")
end
--------------------------------------------------------------------

-- -- END CHANGING (this lines must remain at the end of file)

-- Apply basic tech card to all technologies with automation science pack (T1 tier)
krastorio_utils.log.disableLogs()
for technology_name, technology in pairs(data.raw.technology) do
  if krastorio.technologies.hasIngredient(technology_name, "automation-science-pack") then
    krastorio.technologies.addResearchUnitIngredient(technology_name, "basic-tech-card")
  end
end
krastorio_utils.log.enableLogs()

-- Remove basic tech card to all technologies of T2 tier
for technology_name, technology in pairs(data.raw.technology) do
  if
    krastorio.technologies.hasIngredient(technology_name, "military-science-pack")
    or krastorio.technologies.hasIngredient(technology_name, "chemical-science-pack")
    or krastorio.technologies.hasIngredient(technology_name, "production-science-pack")
    or krastorio.technologies.hasIngredient(technology_name, "utility-science-pack")
    or krastorio.technologies.hasIngredient(technology_name, "space-science-pack")
    or krastorio.technologies.hasIngredient(technology_name, "matter-tech-card")
  then
    krastorio.technologies.removeResearchUnitIngredient(technology_name, "basic-tech-card")
  end
end

--------------------------------------------------------------------
-- --  Stats
--------------
-- rocket

krastorio.technologies.setResearchUnitCount("space-science-pack", 1000)
krastorio.technologies.setResearchUnitCount("rocket-control-unit", 500)

--------------
-- science packs

krastorio.technologies.setResearchUnitCount("production-science-pack", 250)
krastorio.technologies.setResearchUnitCount("utility-science-pack", 250)

--------------
-- military

krastorio.technologies.setResearchUnitCount("military-4", 350)
krastorio.technologies.setResearchUnitCount("discharge-defense-equipment", 300)
krastorio.technologies.setResearchUnitCount("uranium-ammo", 300)
krastorio.technologies.setResearchUnitCount("destroyer", 350)
krastorio.technologies.setResearchUnitCount("artillery", 1000)
krastorio.technologies.setResearchUnitCount("laser", 200)

--------------
-- Solar energy
krastorio.technologies.addPrerequisite("solar-energy", "kr-silicon-processing")

-- --

data.raw.technology["physical-projectile-damage-7"].unit.count_formula = "((L-6)^2)*3000"
data.raw.technology["physical-projectile-damage-7"].max_level = 10

data.raw.technology["stronger-explosives-7"].unit.count_formula = "((L-6)^2)*3000"
data.raw.technology["stronger-explosives-7"].max_level = 10

data.raw.technology["refined-flammables-7"].unit.count_formula = "((L-6)^2)*3000"
data.raw.technology["refined-flammables-7"].max_level = 10

data.raw.technology["energy-weapons-damage-7"].unit.count_formula = "((L-6)^2)*3000"
data.raw.technology["energy-weapons-damage-7"].max_level = 10

data.raw.technology["artillery-shell-range-1"].unit.count_formula = "L^2*3500"
data.raw.technology["artillery-shell-range-1"].max_level = 2

data.raw.technology["artillery-shell-speed-1"].unit.count_formula = "L^2*3500"
data.raw.technology["artillery-shell-speed-1"].max_level = 2

-- --

krastorio.technologies.removePrerequisite("gate", "military-2")
krastorio.technologies.addPrerequisite("gate", "electronics")
krastorio.technologies.removeResearchUnitIngredient("gate", "logistic-science-pack")
--------------
-- miscellaneous

krastorio.technologies.setResearchUnitCount("logistic-system", 250)
krastorio.technologies.setResearchUnitCount("coal-liquefaction", 150)
krastorio.technologies.setResearchUnitCount("automation-3", 350)
krastorio.technologies.setResearchUnitCount("effect-transmission", 500)
krastorio.technologies.setResearchUnitCount("low-density-structure", 500)

--------------
-- nuclear

krastorio.technologies.setResearchUnitCount("uranium-processing", 750)
krastorio.technologies.setResearchUnitCount("nuclear-power", 500)
krastorio.technologies.setResearchUnitCount("nuclear-fuel-reprocessing", 250)
krastorio.technologies.removePrerequisite("atomic-bomb", "military-4")
krastorio.technologies.addPrerequisite("atomic-bomb", "kr-military-5")
krastorio.technologies.addUnlockRecipe("atomic-bomb", "nuclear-artillery-shell")
krastorio.technologies.setResearchUnitCount("atomic-bomb", 1500)

--------------
-- stats

krastorio.technologies.setResearchUnitCount("fusion-reactor-equipment", 350)

krastorio.technologies.setResearchUnitCount("mining-productivity-3", 500)
data.raw.technology["mining-productivity-4"].unit.count_formula = "(L^2)*200"
data.raw.technology["mining-productivity-4"].max_level = 10

data.raw.technology["follower-robot-count-7"].unit.count_formula = "((L-6)^2)*5000"
data.raw.technology["follower-robot-count-7"].max_level = nil

data.raw.technology["worker-robots-speed-6"].unit.count_formula = "((L-5)^2)*5000"
data.raw.technology["worker-robots-speed-6"].max_level = nil

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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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

  {
    type = "technology",
    name = "follower-robot-count-8",
    icons = {
      {
        icon = "__base__/graphics/technology/follower-robots.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-count.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "maximum-following-robots-count",
        modifier = 15,
      },
    },
    prerequisites = { "follower-robot-count-7", "kr-advanced-tech-card" },
    unit = {
      count_formula = "((L-7)^2)*5000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 60,
    },
    upgrade = true,
    order = "c-k-f-w",
  },

  {
    type = "technology",
    name = "follower-robot-count-9",
    icons = {
      {
        icon = "__base__/graphics/technology/follower-robots.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-count.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "maximum-following-robots-count",
        modifier = 15,
      },
    },
    prerequisites = { "follower-robot-count-8", "kr-singularity-tech-card" },
    unit = {
      count_formula = "((L-8)^2)*5000",
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
    max_level = 10,
    upgrade = true,
    order = "c-k-f-z",
  },

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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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
    name = "energy-weapons-damage-11",
    icons = {
      {
        icon = "__base__/graphics/technology/energy-weapons-damage.png",
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
        ammo_category = "laser",
        modifier = 0.1,
      },
    },
    prerequisites = { "energy-weapons-damage-7", "kr-advanced-tech-card" },
    unit = {
      count_formula = "((L-10)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "space-science-pack", 1 },
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
    name = "energy-weapons-damage-16",
    icons = {
      {
        icon = "__base__/graphics/technology/energy-weapons-damage.png",
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
        ammo_category = "laser",
        modifier = 0.1,
      },
    },
    prerequisites = { "energy-weapons-damage-11", "kr-singularity-tech-card" },
    unit = {
      count_formula = "((L-15)^2)*3000",
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
    max_level = 18,
    upgrade = true,
    order = "c-k-f-z",
  },

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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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
        { "space-science-pack", 1 },
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
