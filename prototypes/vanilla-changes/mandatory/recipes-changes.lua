-- Disabling all vanilla recipes at the game start
krastorio.recipes.disable("electronic-circuit")
krastorio.recipes.disable("inserter")
krastorio.recipes.disable("steam-engine")
krastorio.recipes.disable("pipe")
krastorio.recipes.disable("pipe-to-ground")
krastorio.recipes.disable("boiler")
krastorio.recipes.disable("electric-mining-drill")
krastorio.recipes.disable("offshore-pump")
krastorio.recipes.disable("radar")
krastorio.recipes.disable("light-armor")

-- Hide barrel crafting from player menu
for fluid_name, _ in pairs(data.raw.fluid) do
  if krastorio.recipes.exist("empty-" .. fluid_name .. "-barrel") then
    data.raw.recipe["empty-" .. fluid_name .. "-barrel"].hide_from_player_crafting = true
  end
  if krastorio.recipes.exist("fill-" .. fluid_name .. "-barrel") then
    data.raw.recipe["fill-" .. fluid_name .. "-barrel"].hide_from_player_crafting = true
  end
end

--------------------------------------------------------------------
-- -- -- ITEMS
--------------------------------------------------------------------

-- Iron plate
krastorio.recipes.replaceIngredient("iron-plate", "iron-ore", { "iron-ore", 2 })
krastorio.recipes.replaceIngredient("iron-gear-wheel", "iron-plate", { "iron-plate", 1 })

-- Copper plate
krastorio.recipes.replaceIngredient("copper-plate", "copper-ore", { "copper-ore", 2 })

-- rail
krastorio.recipes.overrideIngredients("rail", {
  { "steel-beam", 1 },
  { "stone", 2 },
})

-- Rocket fuel category
krastorio.recipes.convertIngredientFromAllRecipes("nuclear-fuel", "rocket-fuel")
krastorio.recipes.setCategoryIfExist("rocket-fuel", "fuel-refinery")
krastorio.recipes.addOrReplaceIngredient(
  "rocket-fuel",
  "light-oil",
  { type = "fluid", name = "light-oil", amount = 30, catalyst_amount = 30 }
)
krastorio.recipes.replaceIngredient("rocket-fuel", "solid-fuel", { "iron-plate", 1 })
krastorio.recipes.addIngredient("rocket-fuel", { type = "fluid", name = "oxygen", amount = 50 })

data.raw.recipe["rocket-fuel"].crafting_machine_tint = {
  primary = { r = 0.692, g = 0.800, b = 0.550, a = 0.100 },
  secondary = { r = 0.581, g = 0.817, b = 0.670, a = 0.250 },
  tertiary = { r = 0.554, g = 0.417, b = 0.529, a = 0.500 },
  quaternary = { r = 0.462, g = 0.607, b = 0.839, a = 0.900 },
}
data.raw.recipe["rocket-fuel"].always_show_products = true

krastorio.recipes.setEnergyCost("rocket-fuel", 16)

-- Slowdown capsule
krastorio.recipes.removeIngredient("slowdown-capsule", "electronic-circuit")

-- Apply automation core to the early game items
krastorio.recipes.overrideIngredients("burner-inserter", {
  { "inserter-parts", 1 },
  { "iron-plate", 1 },
})
krastorio.recipes.overrideIngredients("inserter", {
  { "inserter-parts", 1 },
  { "automation-core", 1 },
})
krastorio.recipes.overrideIngredients("long-handed-inserter", {
  { "inserter-parts", 1 },
  { "automation-core", 1 },
  { "iron-stick", 2 },
})
krastorio.recipes.overrideIngredients("fast-inserter", {
  { "inserter-parts", 1 },
  { "electronic-circuit", 2 },
  { "steel-plate", 1 },
})
krastorio.recipes.overrideIngredients("filter-inserter", {
  { "inserter-parts", 1 },
  { "electronic-circuit", 4 },
  { "steel-plate", 1 },
})
krastorio.recipes.overrideIngredients("stack-inserter", {
  { "inserter-parts", 1 },
  { "advanced-circuit", 2 },
  { "steel-plate", 1 },
  { "steel-gear-wheel", 2 },
})
krastorio.recipes.overrideIngredients("stack-filter-inserter", {
  { "inserter-parts", 1 },
  { "advanced-circuit", 4 },
  { "steel-plate", 1 },
  { "steel-gear-wheel", 2 },
})

-- Chaning steel recipes
krastorio.recipes.overrideIngredients("steel-plate", {
  { "iron-plate", 10 },
  { "coke", 2 },
})
krastorio.recipes.overrideProducts("steel-plate", {
  { "steel-plate", 5 },
})
krastorio.recipes.setEnergyCost("steel-plate", 16)

krastorio.recipes.replaceProduct("iron-gear-wheel", "iron-gear-wheel", { "iron-gear-wheel", 1 })

-- Engine
krastorio.recipes.convertIngredient("engine-unit", "steel-plate", "iron-plate")

-- Bricks
if krastorio.recipes.exist("stone-brick") then
  data.raw.recipe["stone-brick"].subgroup = "raw-material"
end
krastorio.recipes.replaceIngredient("refined-concrete", "steel-plate", { "iron-beam", 5 })
krastorio.recipes.removeIngredient("refined-concrete", "iron-stick")

-- ROBOT/DRONES
krastorio.recipes.replaceIngredient("flying-robot-frame", "electronic-circuit", { "electronic-components", 10 })

-- Circuits
krastorio.recipes.addIngredient("electronic-circuit", { "wood", 1 })
krastorio.recipes.replaceIngredient("electronic-circuit", "iron-plate", { "iron-plate", 1 })
krastorio.recipes.replaceIngredient("electronic-circuit", "copper-cable", { "copper-cable", 4 })
krastorio.recipes.setEnergyCost("electronic-circuit", 2)
krastorio.recipes.replaceProduct("electronic-circuit", "electronic-circuit", { "electronic-circuit", 2 })

krastorio.recipes.replaceIngredient("advanced-circuit", "electronic-circuit", { "electronic-circuit", 4 })
krastorio.recipes.replaceIngredient("advanced-circuit", "copper-cable", { "copper-cable", 4 })
krastorio.recipes.replaceIngredient("advanced-circuit", "plastic-bar", { "electronic-components", 2 })
krastorio.recipes.setEnergyCost("advanced-circuit", 4)
krastorio.recipes.replaceProduct("advanced-circuit", "advanced-circuit", { "advanced-circuit", 2 })

krastorio.recipes.removeIngredient("processing-unit", "electronic-circuit")
krastorio.recipes.replaceIngredient("processing-unit", "advanced-circuit", { "advanced-circuit", 6 })
krastorio.recipes.addIngredient("processing-unit", { "rare-metals", 3 })
krastorio.recipes.replaceIngredient(
  "processing-unit",
  "sulfuric-acid",
  { type = "fluid", name = "sulfuric-acid", amount = 10 }
)
krastorio.recipes.setEnergyCost("processing-unit", 12)
krastorio.recipes.replaceProduct("processing-unit", "processing-unit", { "processing-unit", 2 })

-- --

krastorio.recipes.replaceIngredient("repair-pack", "iron-gear-wheel", { "iron-plate", 2 })
krastorio.recipes.replaceIngredient("repair-pack", "electronic-circuit", { "copper-plate", 2 })
krastorio.recipes.addIngredient("repair-pack", { "stone", 2 })

-- EQUIPMENTS
krastorio.recipes.replaceIngredient(
  "personal-laser-defense-equipment",
  "processing-unit",
  { "electronic-components", 50 }
)

krastorio.recipes.replaceIngredient(
  "energy-shield-mk2-equipment",
  "energy-shield-equipment",
  { "energy-shield-equipment", 5 }
)

krastorio.recipes.replaceIngredient("low-density-structure", "copper-plate", { "copper-plate", 10 })

-- MODULES
-- Speed modules

-- Speed module 1
krastorio.recipes.setEnergyCost("speed-module", 15)
krastorio.recipes.overrideIngredients("speed-module", {
  { "electronic-circuit", 5 },
  { "electronic-components", 10 },
})

-- Speed module 2
krastorio.recipes.setEnergyCost("speed-module-2", 15)
krastorio.recipes.overrideIngredients("speed-module-2", {
  { "advanced-circuit", 5 },
  { "electronic-circuit", 5 },
  { "speed-module", 5 },
})

-- Speed module 3
krastorio.recipes.setEnergyCost("speed-module-3", 15)
krastorio.recipes.overrideIngredients("speed-module-3", {
  { "processing-unit", 5 },
  { "advanced-circuit", 5 },
  { "speed-module-2", 5 },
})

-- Ammos
krastorio.recipes.convertIngredient("flamethrower-ammo", "steel-plate", "iron-plate")

------------------------------------------------
-- -- Productivity modules

-- Productivity module 1
krastorio.recipes.setEnergyCost("productivity-module", 15)
krastorio.recipes.overrideIngredients("productivity-module", {
  { "electronic-circuit", 5 },
  { "electronic-components", 10 },
})

-- Productivity module 2
krastorio.recipes.setEnergyCost("productivity-module-2", 15)
krastorio.recipes.overrideIngredients("productivity-module-2", {
  { "advanced-circuit", 5 },
  { "electronic-circuit", 5 },
  { "productivity-module", 5 },
})

-- Productivity module 3
krastorio.recipes.setEnergyCost("productivity-module-3", 15)
krastorio.recipes.overrideIngredients("productivity-module-3", {
  { "processing-unit", 5 },
  { "advanced-circuit", 5 },
  { "productivity-module-2", 5 },
})

------------------------------------------------
-- -- Effectivity modules

-- Effectivity module 1
krastorio.recipes.setEnergyCost("effectivity-module", 15)
krastorio.recipes.overrideIngredients("effectivity-module", {
  { "electronic-circuit", 5 },
  { "electronic-components", 10 },
})

-- Effectivity module 2
krastorio.recipes.setEnergyCost("effectivity-module-2", 15)
krastorio.recipes.overrideIngredients("effectivity-module-2", {
  { "advanced-circuit", 5 },
  { "electronic-circuit", 5 },
  { "effectivity-module", 5 },
})

-- Effectivity module 3
krastorio.recipes.setEnergyCost("effectivity-module-3", 15)
krastorio.recipes.overrideIngredients("effectivity-module-3", {
  { "processing-unit", 5 },
  { "advanced-circuit", 5 },
  { "effectivity-module-2", 5 },
})

--------------------------------------------------------------------
-- -- -- BUILDINGS
--------------------------------------------------------------------

-- Convert all electronic-circuit of early game in automation-core
local function hasEarlyGameIngredients(ingredients)
  local basic, automation = false, false
  local ingredient_name = nil
  for i = 1, #ingredients do
    ingredient_name = krastorio.technologies.getIngredientName(ingredients[i])
    if ingredient_name == "basic-tech-card" then
      if #ingredients == 1 then
        return true
      else
        basic = true
      end
    end
    if ingredient_name == "automation-science-pack" then
      if #ingredients == 1 then
        return true
      else
        automation = true
      end
    end
  end
  if #ingredients == 2 and basic and automation then
    return true
  else
    return false
  end
end
for name, technology in pairs(data.raw.technology) do
  local count = nil
  if (technology.enabled == true or technology.enabled == nil) and technology.effects then
    if technology.unit and technology.unit.ingredients and hasEarlyGameIngredients(technology.unit.ingredients) then
      for _, effect in pairs(technology.effects) do
        if effect.type == "unlock-recipe" then
          count = krastorio.recipes.countIngredient(effect.recipe, "electronic-circuit")
          if count > 0 then
            krastorio.recipes.replaceIngredient(
              effect.recipe,
              "electronic-circuit",
              { "automation-core", math.ceil(count / 2) }
            )
          end
        end
      end
    end
  end
end

-- Exceptions
krastorio.recipes.convertIngredient("fast-inserter", "automation-core", "electronic-circuit")
krastorio.recipes.addOrReplaceIngredient("filter-inserter", "automation-core", { "electronic-circuit", 2 })

-- Lamp (glass)
krastorio.recipes.convertIngredient("small-lamp", "automation-core", "glass")
krastorio.recipes.addOrReplaceIngredient("small-lamp", { name = "glass", amount = 1 })

-- Solar panel
krastorio.recipes.replaceIngredient("solar-panel", "copper-plate", { "glass", 10 })
krastorio.recipes.replaceIngredient("solar-panel", "steel-plate", { "steel-plate", 5 })
krastorio.recipes.replaceIngredient("solar-panel", "electronic-circuit", { "electronic-circuit", 10 })
krastorio.recipes.addIngredient("solar-panel", { "silicon", 5 })

krastorio.recipes.replaceIngredient("solar-panel", "iron-plate", { "iron-beam", 4 })

-- Assembling machine tier 1
krastorio.recipes.replaceIngredient("assembling-machine-1", "iron-plate", { "iron-beam", 4 })

-- Electric mining drill 1
krastorio.recipes.replaceIngredient("electric-mining-drill", "iron-plate", { "iron-beam", 2 })

-- -- -- -- -- -- -- -- -- -- -- -- --

-- Underground belt (Yellow tier 1)
krastorio.recipes.replaceIngredient("underground-belt", "iron-plate", { "iron-beam", 2 })

-- Splitter (Yellow tier 1)
krastorio.recipes.replaceIngredient("splitter", "iron-plate", { "iron-gear-wheel", 5 })
krastorio.recipes.replaceIngredient("splitter", "automation-core", { "automation-core", 1 })

-- Fast belt (Red tier 2)
krastorio.recipes.replaceIngredient("fast-transport-belt", "iron-gear-wheel", { "iron-gear-wheel", 4 })

-- Fast underground belt (Red tier 2)
-- krastorio.recipes.convertIngredient("fast-underground-belt", "iron-gear-wheel", "steel-gear-wheel")
krastorio.recipes.replaceIngredient("fast-underground-belt", "iron-gear-wheel", { "fast-transport-belt", 10 })

-- Fast splitter (Red tier 2)
krastorio.recipes.replaceIngredient("fast-splitter", "iron-gear-wheel", { "iron-gear-wheel", 4 })
krastorio.recipes.replaceIngredient("fast-splitter", "electronic-circuit", { "electronic-circuit", 2 })

-- Express belt (Red tier 3)
krastorio.recipes.replaceIngredient("express-transport-belt", "iron-gear-wheel", { "steel-gear-wheel", 4 })

-- Express underground belt (Red tier 3)
krastorio.recipes.replaceIngredient("express-underground-belt", "iron-gear-wheel", { "express-transport-belt", 20 })
krastorio.recipes.removeIngredient("express-underground-belt", "lubricant")

-- Express splitter (Red tier 3)
krastorio.recipes.replaceIngredient("express-splitter", "iron-gear-wheel", { "steel-gear-wheel", 4 })
krastorio.recipes.removeIngredient("express-splitter", "lubricant")
krastorio.recipes.replaceIngredient("express-splitter", "advanced-circuit", { "electronic-components", 4 })

-- Heat pipe
krastorio.recipes.convertIngredient("heat-pipe", "steel-plate", "quartz")

-- Turrets
krastorio.recipes.addIngredient("laser-turret", { name = "quartz", amount = 5 })
krastorio.recipes.replaceIngredient("laser-turret", "steel-plate", { "steel-plate", 15 })

krastorio.recipes.replaceIngredient("flamethrower-turret", "steel-plate", { "steel-plate", 20 })

-- Storage tank
krastorio.recipes.replaceIngredient("storage-tank", "iron-plate", { "iron-plate", 10 })
krastorio.recipes.convertIngredient("storage-tank", "steel-plate", "iron-beam")

-- Pump
krastorio.recipes.convertIngredient("storage-tank", "steel-plate", "iron-beam")

-- Pumpjack
krastorio.recipes.convertIngredient("pumpjack", "iron-gear-wheel", "steel-gear-wheel")
krastorio.recipes.replaceIngredient("pumpjack", "steel-plate", { "steel-beam", 4 })
krastorio.recipes.replaceIngredient("pumpjack", "iron-plate", { "steel-beam", 4 })

-- Oil refinery
krastorio.recipes.replaceIngredient("oil-refinery", "steel-plate", { "steel-beam", 4 })
krastorio.recipes.convertIngredient("oil-refinery", "iron-gear-wheel", "steel-gear-wheel")

-- Chemical plant
krastorio.recipes.replaceIngredient("chemical-plant", "steel-plate", { "steel-beam", 4 })
krastorio.recipes.convertIngredient("chemical-plant", "iron-gear-wheel", "steel-gear-wheel")

-- Poles
krastorio.recipes.replaceIngredient("small-electric-pole", "copper-cable", { "copper-cable", 1 })
krastorio.recipes.replaceProduct("small-electric-pole", "small-electric-pole", { "small-electric-pole", 1 })

krastorio.recipes.replaceIngredient("medium-electric-pole", "copper-plate", { "copper-cable", 4 })
krastorio.recipes.replaceIngredient("medium-electric-pole", "steel-plate", { "iron-beam", 2 })

krastorio.recipes.replaceIngredient("big-electric-pole", "copper-plate", { "copper-cable", 8 })
krastorio.recipes.replaceIngredient("big-electric-pole", "steel-plate", { "steel-beam", 4 })

krastorio.recipes.replaceIngredient("substation", "copper-plate", { "copper-cable", 16 })
krastorio.recipes.replaceIngredient("substation", "steel-plate", { "steel-beam", 8 })

krastorio.recipes.replaceIngredient("roboport", "steel-plate", { "steel-beam", 20 })

-- Vanilla Lab
krastorio.recipes.replaceIngredient("lab", "electronic-circuit", { "iron-beam", 10 })
krastorio.recipes.replaceIngredient("lab", "iron-gear-wheel", { "copper-plate", 10 })
krastorio.recipes.replaceIngredient("lab", "transport-belt", { "copper-cable", 10 })

-- Nuclear reactor
data.raw.recipe["nuclear-reactor"].energy_required = 120
data.raw.recipe["nuclear-reactor"].category = "crafting-with-fluid"
krastorio.recipes.replaceIngredient("nuclear-reactor", "concrete", { "concrete", 500 }) --it's not a mistake. it's for future rebalance
krastorio.recipes.replaceIngredient("nuclear-reactor", "steel-plate", { "steel-plate", 200 }) --it's not a mistake. it's for future rebalance
krastorio.recipes.replaceIngredient("nuclear-reactor", "advanced-circuit", { "advanced-circuit", 200 }) --it's not a mistake. it's for future rebalance
krastorio.recipes.replaceIngredient("nuclear-reactor", "copper-plate", { "heat-pipe", 20 })
krastorio.recipes.addIngredient("nuclear-reactor", { "rare-metals", 200 })

-- -- Turbines
----------------------------

-- Steam engine
krastorio.recipes.setEnergyCost("steam-engine", 5)

-- Steam turbine
krastorio.recipes.setEnergyCost("steam-turbine", 10)
krastorio.recipes.addIngredient("steam-turbine", { "steam-engine", 2 })
krastorio.recipes.replaceIngredient("steam-turbine", "iron-gear-wheel", { "iron-gear-wheel", 14 })
krastorio.recipes.replaceIngredient("steam-turbine", "pipe", { "pipe", 10 })

-- Assembling machine
krastorio.recipes.setEnergyCost("assembling-machine-1", 1)
krastorio.recipes.setEnergyCost("assembling-machine-2", 2)
krastorio.recipes.replaceIngredient("assembling-machine-3", "assembling-machine-2", { "assembling-machine-2", 1 })
krastorio.recipes.replaceIngredient("assembling-machine-3", "speed-module", { "speed-module", 2 })
krastorio.recipes.addIngredient("assembling-machine-3", { "advanced-circuit", 3 })
krastorio.recipes.addIngredient("assembling-machine-3", { "steel-gear-wheel", 5 })
krastorio.recipes.setEnergyCost("assembling-machine-3", 3)

-- TURRETS

-- Gun turret
krastorio.recipes.replaceIngredient("gun-turret", "iron-plate", { "iron-beam", 5 })
krastorio.recipes.replaceIngredient("gun-turret", "copper-plate", { "automation-core", 3 })
krastorio.recipes.replaceIngredient("gun-turret", "iron-gear-wheel", { "iron-gear-wheel", 4 })

----------------------------

--------------------------------------------------------------------
-- -- -- VEHICLES
--------------------------------------------------------------------

krastorio.recipes.replaceIngredient("cargo-wagon", "steel-plate", { "steel-beam", 10 })

--------------------------------------------------------------------
-- -- -- SPECIAL
--------------------------------------------------------------------

-- Cable of circuit network
krastorio.recipes.removeIngredient("red-wire", "electronic-circuit")
krastorio.recipes.removeIngredient("green-wire", "electronic-circuit")

krastorio.recipes.convertIngredient("spidertron", "raw-fish", "ai-core")
krastorio.recipes.replaceIngredient("spidertron", "fusion-reactor-equipment", { "fusion-reactor-equipment", 1 })

--------------------------------------------------------------------
-- -- -- NUCLEAR
--------------------------------------------------------------------

-- Add stone and iron as waste
krastorio.recipes.setEnergyCost("uranium-processing", 15)
--krastorio.recipes.replaceIngredient("uranium-processing", "uranium-ore", {"uranium-ore", 15})
krastorio.recipes.addOrReplaceProducts("uranium-processing", {
  "uranium-235",
  "uranium-238",
  "iron-ore",
  "stone",
}, {
  {
    name = "uranium-235",
    probability = 0.007,
    amount = 1,
  },
  {
    name = "uranium-238",
    probability = 0.993,
    amount = 1,
  },
  {
    name = "iron-ore",
    probability = 0.25,
    amount = 1,
  },
  {
    name = "stone",
    probability = 0.5,
    amount = 1,
  },
})

-- Increase uranium usage and ad stone as waste

krastorio.recipes.replaceIngredient("kovarex-enrichment-process", "uranium-235", { name = "uranium-235", amount = 30 })
krastorio.recipes.replaceIngredient("kovarex-enrichment-process", "uranium-238", { name = "uranium-238", amount = 3 })
krastorio.recipes.setEnergyCost("kovarex-enrichment-process", 60)

krastorio.recipes.replaceProduct("kovarex-enrichment-process", "uranium-235", { "uranium-235", 31 })
krastorio.recipes.replaceProduct("kovarex-enrichment-process", "uranium-238", { "stone", 2 })

krastorio.recipes.replaceIngredient("uranium-fuel-cell", "uranium-235", { name = "uranium-235", amount = 2 })
krastorio.recipes.replaceIngredient("uranium-fuel-cell", "uranium-238", { name = "uranium-238", amount = 10 })
krastorio.recipes.replaceIngredient("uranium-fuel-cell", "iron-plate", { name = "steel-plate", amount = 1 })
krastorio.recipes.replaceProduct("uranium-fuel-cell", "uranium-fuel-cell", { "uranium-fuel-cell", 1 })

krastorio.recipes.replaceIngredient(
  "nuclear-fuel-reprocessing",
  "used-up-uranium-fuel-cell",
  { name = "used-up-uranium-fuel-cell", amount = 1 }
)
krastorio.recipes.replaceProduct("nuclear-fuel-reprocessing", "uranium-238", { "uranium-238", 6 })
krastorio.recipes.addProduct("nuclear-fuel-reprocessing", { "stone", 4 })
krastorio.recipes.addProduct(
  "nuclear-fuel-reprocessing",
  { type = "item", name = "tritium", probability = 0.15, amount = 1 }
)

-- More realistic weapons craft

krastorio.recipes.addIngredient("atomic-bomb", { "heavy-rocket", 1 })
krastorio.recipes.replaceIngredient("atomic-bomb", "uranium-235", { "uranium-235", 20 })
krastorio.recipes.setEnergyCost("atomic-bomb", 10)

krastorio.recipes.replaceIngredient("pistol", "iron-plate", { "iron-plate", 2 })
krastorio.recipes.replaceIngredient("pistol", "copper-plate", { "copper-plate", 1 })

krastorio.recipes.replaceIngredient("piercing-shotgun-shell", "shotgun-shell", { "shotgun-shell", 1 })
krastorio.recipes.replaceIngredient("piercing-shotgun-shell", "steel-plate", { "steel-plate", 3 })
krastorio.recipes.removeIngredient("piercing-shotgun-shell", "copper-plate")

krastorio.recipes.replaceIngredient("submachine-gun", "iron-plate", { "iron-plate", 3 })
krastorio.recipes.replaceIngredient("submachine-gun", "copper-plate", { "copper-plate", 2 })
krastorio.recipes.replaceIngredient("submachine-gun", "iron-gear-wheel", { "iron-gear-wheel", 5 })

krastorio.recipes.replaceIngredient("shotgun", "wood", { "wood", 2 })
krastorio.recipes.replaceIngredient("shotgun", "iron-plate", { "iron-plate", 3 })
krastorio.recipes.replaceIngredient("shotgun", "copper-plate", { "copper-plate", 2 })
krastorio.recipes.replaceIngredient("shotgun", "iron-gear-wheel", { "iron-gear-wheel", 3 })

krastorio.recipes.replaceIngredient("combat-shotgun", "wood", { "wood", 3 })
krastorio.recipes.replaceIngredient("combat-shotgun", "steel-plate", { "steel-plate", 4 })
krastorio.recipes.replaceIngredient("combat-shotgun", "copper-plate", { "copper-plate", 2 })
krastorio.recipes.replaceIngredient("combat-shotgun", "iron-gear-wheel", { "iron-gear-wheel", 3 })
