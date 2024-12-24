local data_util = require("data-util")

data_util.add_prerequisite("advanced-circuit", "electronics")
data_util.add_prerequisite("advanced-circuit", "kr-silicon-processing")
data_util.add_prerequisite("atomic-bomb", "kr-military-5")
data_util.add_prerequisite("automation", "kr-automation-core")
data_util.add_prerequisite("automobilism", "kr-fuel")
data_util.add_prerequisite("battery-equipment", "modular-armor")
data_util.add_prerequisite("efficiency-module-3", "processing-unit")
data_util.add_prerequisite("fast-inserter", "electronics")
data_util.add_prerequisite("fast-inserter", "logistics")
data_util.add_prerequisite("fast-inserter", "steel-processing")
data_util.add_prerequisite("fission-reactor-equipment", "kr-fusion-energy")
data_util.add_prerequisite("fluid-handling", "kr-basic-fluid-handling")
data_util.add_prerequisite("gate", "electronics")
data_util.add_prerequisite("heavy-armor", "light-armor")
data_util.add_prerequisite(kr_optimization_tech_card_name, "kr-singularity-lab")
data_util.add_prerequisite("lamp", "kr-stone-processing")
data_util.add_prerequisite("logistics-2", "steel-processing")
data_util.add_prerequisite("logistic-science-pack", "electronics")
data_util.add_prerequisite("military-science-pack", "advanced-circuit")
data_util.add_prerequisite("modular-armor", "military-2")
data_util.add_prerequisite("oil-processing", "kr-fluids-chemistry")
data_util.add_prerequisite("production-science-pack", "kr-advanced-lab")
data_util.add_prerequisite("production-science-pack", "kr-research-server")
data_util.add_prerequisite("production-science-pack", "uranium-processing")
data_util.add_prerequisite("productivity-module-3", "processing-unit")
data_util.add_prerequisite("solar-energy", "kr-silicon-processing")
data_util.add_prerequisite("speed-module-3", "processing-unit")
data_util.add_prerequisite("spidertron", "kr-ai-core")
data_util.add_prerequisite("steel-axe", "kr-iron-pickaxe")
data_util.add_prerequisite("stone-wall", "military")
data_util.add_prerequisite("tank", "kr-fuel")
data_util.add_prerequisite("utility-science-pack", "kr-research-server")
data_util.add_prerequisite("utility-science-pack", "rocket-fuel")

data_util.remove_prerequisite("atomic-bomb", "military-4")
data_util.remove_prerequisite("battery-equipment", "solar-panel-equipment")
data_util.remove_prerequisite("battery-mk2-equipment", "low-density-structure")
data_util.remove_prerequisite("efficiency-module-2", "processing-unit")
data_util.remove_prerequisite("engine", "steel-processing")
data_util.remove_prerequisite("fluid-handling", "automation-2")
data_util.remove_prerequisite("gate", "military-2")
data_util.remove_prerequisite("heavy-armor", "military")
data_util.remove_prerequisite("productivity-module-2", "processing-unit")
data_util.remove_prerequisite("speed-module-2", "processing-unit")

data_util.convert_research_unit_ingredient("military", "automation-science-pack", "basic-tech-card")
data_util.convert_research_unit_ingredient("stone-wall", "automation-science-pack", "basic-tech-card")

data_util.add_research_unit_ingredient("automation", "basic-tech-card")

data_util.remove_research_unit_ingredient("automation", "automation-science-pack")
data_util.remove_research_unit_ingredient("engine", "logistic-science-pack")
data_util.remove_research_unit_ingredient("fission-reactor-equipment", "military-science-pack")
data_util.remove_research_unit_ingredient("fluid-handling", "logistic-science-pack")
data_util.remove_research_unit_ingredient("gate", "logistic-science-pack")
data_util.remove_research_unit_ingredient("plastics", "logistic-science-pack")

data_util.add_recipe_unlock("advanced-circuit", "electronic-components")
data_util.add_recipe_unlock("atomic-bomb", "nuclear-artillery-shell")
data_util.add_recipe_unlock("automation-science-pack", "blank-tech-card")
data_util.add_recipe_unlock("battery-equipment", "big-battery-equipment")
data_util.add_recipe_unlock("battery-equipment", "small-portable-generator-equipment")
data_util.add_recipe_unlock("battery-mk2-equipment", "big-battery-mk2-equipment")
data_util.add_recipe_unlock("coal-liquefaction", "coal-filtration")
data_util.add_recipe_unlock("coal-liquefaction", "coke-liquefaction")
data_util.add_recipe_unlock("electric-engine", "additional-engine-equipment")
data_util.add_recipe_unlock(kr_optimization_tech_card_name, kr_optimization_tech_card_name)
data_util.add_recipe_unlock("landfill", "landfill-2")
data_util.add_recipe_unlock("logistics", "inserter")
data_util.add_recipe_unlock("logistics", "long-handed-inserter")
data_util.add_recipe_unlock("military-science-pack", "biters-research-data")
data_util.add_recipe_unlock("military", "slowdown-capsule")
data_util.add_recipe_unlock("personal-laser-defense-equipment", "personal-submachine-laser-defense-mk1-equipment")
data_util.add_recipe_unlock("personal-roboport-equipment", "vehicle-roboport-equipment")
data_util.add_recipe_unlock("rocket-fuel", "rocket-fuel-with-ammonia")
data_util.add_recipe_unlock("rocket-fuel", "rocket-fuel-with-hydrogen-chloride")
data_util.add_recipe_unlock("solar-panel-equipment", "big-solar-panel-equipment")
data_util.add_recipe_unlock("steel-processing", "coke")
data_util.add_recipe_unlock("steel-processing", "steel-beam")
data_util.add_recipe_unlock("steel-processing", "steel-gear-wheel")

if settings.startup["kr-loaders"].value then
  data_util.add_recipe_unlock("logistics", "kr-loader")
  data_util.add_recipe_unlock("logistics-2", "kr-fast-loader")
  data_util.add_recipe_unlock("logistics-3", "kr-express-loader")
end

data_util.remove_recipe_unlock("automation", "long-handed-inserter")
data_util.remove_recipe_unlock("kovarex-enrichment-process", "nuclear-fuel")
data_util.remove_recipe_unlock("military-3", "slowdown-capsule")
data_util.remove_recipe_unlock("oil-processing", "chemical-plant")

data.raw.technology["steam-power"].research_trigger = nil
data.raw.technology["steam-power"].unit = {
  time = 10,
  count = 10,
  ingredients = {
    { "basic-tech-card", 1 },
  },
}

data.raw.technology["artillery"].unit.count = 1000
data.raw.technology["atomic-bomb"].unit.count = 1500
data.raw.technology["automation-3"].unit.count = 350
data.raw.technology["coal-liquefaction"].unit.count = 150
data.raw.technology["destroyer"].unit.count = 350
data.raw.technology["discharge-defense-equipment"].unit.count = 300
data.raw.technology["effect-transmission"].unit.count = 500
data.raw.technology["fission-reactor-equipment"].unit.count = 350
data.raw.technology["kovarex-enrichment-process"].unit.count = 500
data.raw.technology["laser"].unit.count = 200
data.raw.technology["logistic-system"].unit.count = 250
data.raw.technology["low-density-structure"].unit.count = 500
data.raw.technology["military-4"].unit.count = 350
data.raw.technology["mining-productivity-3"].unit.count = 500
data.raw.technology["nuclear-fuel-reprocessing"].unit.count = 250
data.raw.technology["nuclear-power"].unit.count = 500
data.raw.technology["production-science-pack"].unit.count = 250
data.raw.technology["uranium-ammo"].unit.count = 300
data.raw.technology["utility-science-pack"].unit.count = 250

data.raw.technology["artillery-shell-range-1"].max_level = 2
data.raw.technology["artillery-shell-range-1"].unit.count_formula = "L^2*3500"
data.raw.technology["artillery-shell-speed-1"].max_level = 2
data.raw.technology["artillery-shell-speed-1"].unit.count_formula = "L^2*3500"

data.raw.technology["follower-robot-count-5"].unit.count_formula = "((L-6)^2)*5000"
data.raw.technology["follower-robot-count-5"].max_level = nil

data.raw.technology["laser-weapons-damage-7"].max_level = 10
data.raw.technology["laser-weapons-damage-7"].unit.count_formula = "((L-6)^2)*3000"
data.raw.technology["laser-weapons-damage-7"].unit.count = nil

data.raw.technology["mining-productivity-4"].unit.count_formula = "(L^2)*200"
data.raw.technology["mining-productivity-4"].max_level = 10

data.raw.technology["physical-projectile-damage-7"].max_level = 10
data.raw.technology["physical-projectile-damage-7"].unit.count_formula = "((L-6)^2)*3000"

data.raw.technology["refined-flammables-7"].max_level = 10
data.raw.technology["refined-flammables-7"].unit.count_formula = "((L-6)^2)*3000"

data.raw.technology["stronger-explosives-7"].max_level = 10
data.raw.technology["stronger-explosives-7"].unit.count_formula = "((L-6)^2)*3000"

data.raw.technology["worker-robots-speed-6"].unit.count_formula = "((L-5)^2)*5000"
data.raw.technology["worker-robots-speed-6"].max_level = nil

data_util.set_icons(data.raw.technology["fission-reactor-equipment"], {
  { icon = "__Krastorio2Assets__/technologies/fission-reactor-equipment.png", icon_size = 256 },
  { icon = "__Krastorio2Assets__/technologies/overlays/equipment-overlay.png", icon_size = 256 },
})

data.raw.technology["personal-laser-defense-equipment"].localised_name = {
  "technology-name.kr-personal-laser-defense-mk1-equipment",
}

data.raw.technology["logistic-science-pack"].localised_name = { "item-name.logistic-tech-card" }
data.raw.technology["military-science-pack"].localised_name = { "item-name.military-tech-card" }
data.raw.technology["chemical-science-pack"].localised_name = { "item-name.chemical-tech-card" }
data.raw.technology["production-science-pack"].localised_name = { "item-name.production-tech-card" }
data.raw.technology["utility-science-pack"].localised_name = { "item-name.utility-tech-card" }
data.raw.technology[kr_optimization_tech_card_name].localised_name = { "item-name.optimization-tech-card" }
data.raw.technology[kr_optimization_tech_card_name].localised_description =
  { "technology-description.optimization-tech-card" }

-- stylua: ignore start
data_util.set_icon(data.raw.technology["battery-mk2-equipment"], "__Krastorio2Assets__/technologies/battery-mk2-equipment.png", 256)
data_util.set_icon(data.raw.technology["chemical-science-pack"], "__Krastorio2Assets__/technologies/chemical-tech-card.png", 256)
data_util.set_icon(data.raw.technology["coal-liquefaction"], "__Krastorio2Assets__/technologies/coal-liquefaction.png", 256)
data_util.set_icon(data.raw.technology["energy-shield-equipment"], "__Krastorio2Assets__/technologies/energy-shield-mk1-equipment.png", 256)
data_util.set_icon(data.raw.technology["energy-shield-mk2-equipment"], "__Krastorio2Assets__/technologies/energy-shield-mk2-equipment.png", 256)
data_util.set_icon(data.raw.technology["heavy-armor"], "__Krastorio2Assets__/technologies/heavy-armor.png", 256)
data_util.set_icon(data.raw.technology[kr_optimization_tech_card_name], "__Krastorio2Assets__/technologies/optimization-tech-card.png", 256)
data_util.set_icon(data.raw.technology["logistics-2"], "__Krastorio2Assets__/technologies/logistics-2.png", 256)
data_util.set_icon(data.raw.technology["logistics-3"], "__Krastorio2Assets__/technologies/logistics-3.png", 256)
data_util.set_icon(data.raw.technology["logistic-science-pack"], "__Krastorio2Assets__/technologies/logistic-tech-card.png", 256)
data_util.set_icon(data.raw.technology["logistics"], "__Krastorio2Assets__/technologies/logistics-1.png", 256)
data_util.set_icon(data.raw.technology["military-science-pack"], "__Krastorio2Assets__/technologies/military-tech-card.png", 256)
data_util.set_icon(data.raw.technology["night-vision-equipment"], "__Krastorio2Assets__/technologies/night-vision-equipment.png", 256)
data_util.set_icon(data.raw.technology["oil-processing"], "__Krastorio2Assets__/technologies/oil-gathering.png", 256)
data_util.set_icon(data.raw.technology["personal-laser-defense-equipment"], "__Krastorio2Assets__/technologies/personal-laser-defense-mk1-equipments.png", 256)
data_util.set_icon(data.raw.technology["production-science-pack"], "__Krastorio2Assets__/technologies/production-tech-card.png", 256)
data_util.set_icon(data.raw.technology["steel-processing"], "__Krastorio2Assets__/technologies/steel-processing.png", 256)
data_util.set_icon(data.raw.technology["utility-science-pack"], "__Krastorio2Assets__/technologies/utility-tech-card.png", 256)
-- stylua: ignore end

data:extend({
  {
    type = "technology",
    name = "mining-productivity-11",
    icons = {
      { icon = "__base__/graphics/technology/mining-productivity.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-w",
    max_level = 15,
    upgrade = true,
    unit = {
      time = 60,
      count_formula = "(L^2)*200",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "mining-productivity-4", "kr-advanced-tech-card" },
    effects = {
      { type = "mining-drill-productivity-bonus", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "mining-productivity-16",
    icons = {
      { icon = "__base__/graphics/technology/mining-productivity.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining-productivity.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-z",
    upgrade = true,
    max_level = 100,
    unit = {
      time = 60,
      count_formula = "(L^2)*200",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
    },
    prerequisites = { "mining-productivity-11", "kr-singularity-tech-card" },
    effects = {
      { type = "mining-drill-productivity-bonus", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "worker-robots-speed-7",
    icons = {
      { icon = "__base__/graphics/technology/worker-robots-speed.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-w",
    upgrade = true,
    max_level = 8,
    unit = {
      time = 60,
      count_formula = "((L-6)^2)*5000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "worker-robots-speed-6", "kr-advanced-tech-card" },
    effects = {
      { type = "worker-robot-speed", modifier = 0.60 },
    },
  },

  {
    type = "technology",
    name = "worker-robots-speed-9",
    icons = {
      { icon = "__base__/graphics/technology/worker-robots-speed.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-movement-speed.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-z",
    upgrade = true,
    max_level = 10,
    unit = {
      time = 60,
      count_formula = "((L-8)^2)*5000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
    },
    prerequisites = { "worker-robots-speed-7", "kr-singularity-tech-card" },
    effects = {
      { type = "worker-robot-speed", modifier = 0.375 },
    },
  },
  {
    type = "technology",
    name = "follower-robot-count-6",
    icons = {
      { icon = "__base__/graphics/technology/follower-robots.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-count.png",
        icon_size = 128,
        shift = { 50, 50 },
      },
    },
    icon_size = 256,
    order = "c-k-f-w",
    upgrade = true,
    max_level = 8,
    unit = {
      time = 60,
      count_formula = "((L-7)^2)*5000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "follower-robot-count-5", "kr-advanced-tech-card" },
    effects = {
      { type = "maximum-following-robots-count", modifier = 15 },
    },
  },
  {
    type = "technology",
    name = "follower-robot-count-9",
    icons = {
      { icon = "__base__/graphics/technology/follower-robots.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-count.png",
        icon_size = 128,
        shift = { 50, 50 },
      },
    },
    icon_size = 256,
    order = "c-k-f-z",
    upgrade = true,
    max_level = 10,
    unit = {
      time = 60,
      count_formula = "((L-8)^2)*5000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
    },
    prerequisites = { "follower-robot-count-6", "kr-singularity-tech-card" },
    effects = {
      { type = "maximum-following-robots-count", modifier = 15 },
    },
  },
  {
    type = "technology",
    name = "physical-projectile-damage-11",
    icons = {
      { icon = "__base__/graphics/technology/physical-projectile-damage-2.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-w",
    upgrade = true,
    max_level = 15,
    unit = {
      time = 60,
      count_formula = "((L-10)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "physical-projectile-damage-7", "kr-advanced-tech-card" },
    effects = {
      { type = "ammo-damage", ammo_category = "bullet", modifier = 0.1 },
      { type = "turret-attack", turret_id = "gun-turret", modifier = 0.1 },
      { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.1 },
      { type = "ammo-damage", ammo_category = "cannon-shell", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "physical-projectile-damage-16",
    icons = {
      { icon = "__base__/graphics/technology/physical-projectile-damage-2.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-z",
    upgrade = true,
    max_level = 18,
    unit = {
      time = 60,
      count_formula = "((L-15)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
    },
    prerequisites = { "physical-projectile-damage-11", "kr-singularity-tech-card" },
    effects = {
      { type = "ammo-damage", ammo_category = "bullet", modifier = 0.1 },
      { type = "turret-attack", turret_id = "gun-turret", modifier = 0.1 },
      { type = "ammo-damage", ammo_category = "shotgun-shell", modifier = 0.1 },
      { type = "ammo-damage", ammo_category = "cannon-shell", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "stronger-explosives-11",
    icons = {
      { icon = "__base__/graphics/technology/stronger-explosives-3.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-w",
    upgrade = true,
    max_level = 15,
    unit = {
      time = 60,
      count_formula = "((L-10)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "stronger-explosives-7", "kr-advanced-tech-card" },
    effects = {
      { type = "ammo-damage", ammo_category = "rocket", modifier = 0.1 },
      { type = "ammo-damage", ammo_category = "grenade", modifier = 0.1 },
      { type = "ammo-damage", ammo_category = "artillery-shell", modifier = 0.1 },
      { type = "ammo-damage", ammo_category = "landmine", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "stronger-explosives-16",
    icons = {
      { icon = "__base__/graphics/technology/stronger-explosives-3.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-z",
    upgrade = true,
    max_level = 18,
    unit = {
      time = 60,
      count_formula = "((L-15)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
    },
    prerequisites = { "stronger-explosives-11", "kr-singularity-tech-card" },
    effects = {
      { type = "ammo-damage", ammo_category = "rocket", modifier = 0.1 },
      { type = "ammo-damage", ammo_category = "grenade", modifier = 0.1 },
      { type = "ammo-damage", ammo_category = "artillery-shell", modifier = 0.1 },
      { type = "ammo-damage", ammo_category = "landmine", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "refined-flammables-11",
    icons = {
      { icon = "__base__/graphics/technology/refined-flammables.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-w",
    upgrade = true,
    max_level = 15,
    unit = {
      time = 60,
      count_formula = "((L-10)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "refined-flammables-7", "kr-advanced-tech-card" },
    effects = {
      { type = "ammo-damage", ammo_category = "flamethrower", modifier = 0.1 },
      { type = "turret-attack", turret_id = "flamethrower-turret", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "refined-flammables-16",
    icons = {
      { icon = "__base__/graphics/technology/refined-flammables.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-z",
    upgrade = true,
    max_level = 18,
    unit = {
      time = 60,
      count_formula = "((L-15)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
    },
    prerequisites = { "refined-flammables-11", "kr-singularity-tech-card" },
    effects = {
      { type = "ammo-damage", ammo_category = "flamethrower", modifier = 0.1 },
      { type = "turret-attack", turret_id = "flamethrower-turret", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "laser-weapons-damage-11",
    icons = {
      { icon = "__base__/graphics/technology/laser-weapons-damage.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        shift = { 50, 50 },
      },
    },
    icon_size = 256,
    order = "c-k-f-w",
    upgrade = true,
    max_level = 15,
    unit = {
      time = 60,
      count_formula = "((L-10)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "laser-weapons-damage-7", "kr-advanced-tech-card" },
    effects = {
      { type = "ammo-damage", ammo_category = "laser", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "laser-weapons-damage-16",
    icons = {
      { icon = "__base__/graphics/technology/laser-weapons-damage.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-damage.png",
        icon_size = 128,
        shift = { 50, 50 },
      },
    },
    icon_size = 256,
    order = "c-k-f-z",
    upgrade = true,
    max_level = 18,
    unit = {
      time = 60,
      count_formula = "((L-15)^2)*3000",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
    },
    prerequisites = { "laser-weapons-damage-11", "kr-singularity-tech-card" },
    effects = {
      { type = "ammo-damage", ammo_category = "laser", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "artillery-shell-range-3",
    icons = {
      { icon = "__base__/graphics/technology/artillery-range.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-range.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-w",
    upgrade = true,
    max_level = 4,
    unit = {
      time = 60,
      count_formula = "((L-2)^2)*3500",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "artillery-shell-range-1", "kr-advanced-tech-card" },
    effects = {
      { type = "artillery-range", modifier = 0.3 },
    },
  },
  {
    type = "technology",
    name = "artillery-shell-range-5",
    icons = {
      { icon = "__base__/graphics/technology/artillery-range.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-range.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-z",
    upgrade = true,
    max_level = 7,
    unit = {
      time = 60,
      count_formula = "((L-4)^2)*3500",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
    },
    prerequisites = { "artillery-shell-range-3", "kr-singularity-tech-card" },
    effects = {
      { type = "artillery-range", modifier = 0.2 },
    },
  },
  {
    type = "technology",
    name = "artillery-shell-speed-3",
    icons = {
      { icon = "__base__/graphics/technology/artillery-speed.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-w",
    upgrade = true,
    max_level = 4,
    unit = {
      time = 60,
      count_formula = "((L-2)^2)*3500",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
      },
    },
    prerequisites = { "artillery-shell-speed-1", "kr-advanced-tech-card" },
    effects = {
      { type = "gun-speed", ammo_category = "artillery-shell", modifier = 0.1 },
    },
  },
  {
    type = "technology",
    name = "artillery-shell-speed-5",
    icons = {
      { icon = "__base__/graphics/technology/artillery-speed.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
        icon_size = 128,
        shift = { 50, 50 },
        scale = 0.5,
      },
    },
    icon_size = 256,
    order = "c-k-f-z",
    upgrade = true,
    max_level = 7,
    unit = {
      time = 60,
      count_formula = "((L-4)^2)*3500",
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { kr_optimization_tech_card_name, 1 },
        { "matter-tech-card", 1 },
        { "advanced-tech-card", 1 },
        { "singularity-tech-card", 1 },
      },
    },
    prerequisites = { "artillery-shell-speed-3", "kr-singularity-tech-card" },
    effects = {
      { type = "gun-speed", ammo_category = "artillery-shell", modifier = 0.1 },
    },
  },
})
