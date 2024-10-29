local data_util = require("data-util")

data_util.add_prerequisite("advanced-circuit", "electronics")
data_util.add_prerequisite("advanced-circuit", "kr-silicon-processing")
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
data_util.add_prerequisite("nuclear-power", "kr-steam-engine")
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

data.raw.technology["artillery"].unit.count = 1000
data.raw.technology["automation-3"].unit.count = 350
data.raw.technology["coal-liquefaction"].unit.count = 150
data.raw.technology["destroyer"].unit.count = 350
data.raw.technology["discharge-defense-equipment"].unit.count = 300
data.raw.technology["effect-transmission"].unit.count = 500
data.raw.technology["kovarex-enrichment-process"].unit.count = 500
data.raw.technology["laser"].unit.count = 200
data.raw.technology["logistic-system"].unit.count = 250
data.raw.technology["low-density-structure"].unit.count = 500
data.raw.technology["military-4"].unit.count = 350
data.raw.technology["production-science-pack"].unit.count = 250
data.raw.technology["uranium-ammo"].unit.count = 300
data.raw.technology["utility-science-pack"].unit.count = 250

data.raw.technology["artillery-shell-range-1"].max_level = 2
data.raw.technology["artillery-shell-range-1"].unit.count_formula = "L^2*3500"
data.raw.technology["artillery-shell-speed-1"].max_level = 2
data.raw.technology["artillery-shell-speed-1"].unit.count_formula = "L^2*3500"

data.raw.technology["laser-weapons-damage-7"].max_level = 10
data.raw.technology["laser-weapons-damage-7"].unit.count_formula = "((L-6)^2)*3000"
data.raw.technology["laser-weapons-damage-7"].unit.count = nil

data.raw.technology["physical-projectile-damage-7"].max_level = 10
data.raw.technology["physical-projectile-damage-7"].unit.count_formula = "((L-6)^2)*3000"

data.raw.technology["refined-flammables-7"].max_level = 10
data.raw.technology["refined-flammables-7"].unit.count_formula = "((L-6)^2)*3000"

data.raw.technology["stronger-explosives-7"].max_level = 10
data.raw.technology["stronger-explosives-7"].unit.count_formula = "((L-6)^2)*3000"

for _, technology in pairs(data.raw.technology) do
  local unit = technology.unit
  if unit and #unit.ingredients == 1 and unit.ingredients[1][1] == "automation-science-pack" then
    table.insert(unit.ingredients, 1, { "basic-tech-card", 1 })
  end
end
