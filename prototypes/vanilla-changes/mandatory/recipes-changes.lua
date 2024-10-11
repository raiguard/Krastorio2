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
krastorio.recipes.replaceIngredient("iron-plate", "iron-ore", { type = "item", name = "iron-ore", amount = 2 })
krastorio.recipes.replaceIngredient("iron-gear-wheel", "iron-plate", { type = "item", name = "iron-plate", amount = 1 })

-- Copper plate
krastorio.recipes.replaceIngredient("copper-plate", "copper-ore", { type = "item", name = "copper-ore", amount = 2 })

-- rail
krastorio.recipes.overrideIngredients("rail", {
  { type = "item", name = "steel-beam", amount = 1 },
  { type = "item", name = "stone", amount = 2 },
})

-- Rocket fuel category
krastorio.recipes.convertIngredientFromAllRecipes("nuclear-fuel", "rocket-fuel")
krastorio.recipes.setCategoryIfExist("rocket-fuel", "fuel-refinery")
krastorio.recipes.addOrReplaceIngredient(
  "rocket-fuel",
  "light-oil",
  { type = "fluid", name = "light-oil", amount = 30 }
)
krastorio.recipes.replaceIngredient("rocket-fuel", "solid-fuel", { type = "item", name = "iron-plate", amount = 1 })
krastorio.recipes.addIngredient("rocket-fuel", { type = "fluid", name = "oxygen", amount = 50 })

data.raw.recipe["rocket-fuel"].crafting_machine_tint = {
  primary = { r = 0.692, g = 0.800, b = 0.550, a = 0.100 },
  secondary = { r = 0.581, g = 0.817, b = 0.670, a = 0.250 },
  tertiary = { r = 0.554, g = 0.417, b = 0.529, a = 0.500 },
  quaternary = { r = 0.462, g = 0.607, b = 0.839, a = 0.900 },
}

krastorio.recipes.setEnergyCost("rocket-fuel", 16)

-- Slowdown capsule
krastorio.recipes.removeIngredient("slowdown-capsule", "electronic-circuit")

-- Apply automation core to the early game items
krastorio.recipes.overrideIngredients("burner-inserter", {
  { type = "item", name = "inserter-parts", amount = 1 },
  { type = "item", name = "iron-plate", amount = 1 },
})
krastorio.recipes.overrideIngredients("inserter", {
  { type = "item", name = "inserter-parts", amount = 1 },
  { type = "item", name = "automation-core", amount = 1 },
})
krastorio.recipes.overrideIngredients("long-handed-inserter", {
  { type = "item", name = "inserter-parts", amount = 1 },
  { type = "item", name = "automation-core", amount = 1 },
  { type = "item", name = "iron-stick", amount = 2 },
})
krastorio.recipes.overrideIngredients("fast-inserter", {
  { type = "item", name = "inserter-parts", amount = 1 },
  { type = "item", name = "electronic-circuit", amount = 2 },
  { type = "item", name = "steel-plate", amount = 1 },
})
krastorio.recipes.overrideIngredients("filter-inserter", {
  { type = "item", name = "inserter-parts", amount = 1 },
  { type = "item", name = "electronic-circuit", amount = 4 },
  { type = "item", name = "steel-plate", amount = 1 },
})
krastorio.recipes.overrideIngredients("bulk-inserter", {
  { type = "item", name = "inserter-parts", amount = 1 },
  { type = "item", name = "advanced-circuit", amount = 2 },
  { type = "item", name = "steel-plate", amount = 1 },
  { type = "item", name = "steel-gear-wheel", amount = 2 },
})

-- Chaning steel recipes
krastorio.recipes.overrideIngredients("steel-plate", {
  { type = "item", name = "iron-plate", amount = 10 },
  { type = "item", name = "coke", amount = 2 },
})
krastorio.recipes.overrideProducts("steel-plate", {
  { type = "item", name = "steel-plate", amount = 5 },
})
krastorio.recipes.setEnergyCost("steel-plate", 16)

krastorio.recipes.replaceProduct(
  "iron-gear-wheel",
  "iron-gear-wheel",
  { type = "item", name = "iron-gear-wheel", amount = 1 }
)

-- Engine
krastorio.recipes.convertIngredient("engine-unit", "steel-plate", "iron-plate")

-- Bricks
-- But why?
-- if krastorio.recipes.exist("stone-brick") then
--   data.raw.recipe["stone-brick"].subgroup = "raw-material"
-- end
krastorio.recipes.replaceIngredient(
  "refined-concrete",
  "steel-plate",
  { type = "item", name = "iron-beam", amount = 5 }
)
krastorio.recipes.removeIngredient("refined-concrete", "iron-stick")

-- ROBOT/DRONES
krastorio.recipes.replaceIngredient(
  "flying-robot-frame",
  "electronic-circuit",
  { type = "item", name = "electronic-components", amount = 10 }
)

-- Circuits
krastorio.recipes.addIngredient("electronic-circuit", { type = "item", name = "wood", amount = 1 })
krastorio.recipes.replaceIngredient(
  "electronic-circuit",
  "iron-plate",
  { type = "item", name = "iron-plate", amount = 1 }
)
krastorio.recipes.replaceIngredient(
  "electronic-circuit",
  "copper-cable",
  { type = "item", name = "copper-cable", amount = 4 }
)
krastorio.recipes.setEnergyCost("electronic-circuit", 2)
krastorio.recipes.replaceProduct(
  "electronic-circuit",
  "electronic-circuit",
  { type = "item", name = "electronic-circuit", amount = 2 }
)

krastorio.recipes.replaceIngredient(
  "advanced-circuit",
  "electronic-circuit",
  { type = "item", name = "electronic-circuit", amount = 4 }
)
krastorio.recipes.replaceIngredient(
  "advanced-circuit",
  "copper-cable",
  { type = "item", name = "copper-cable", amount = 4 }
)
krastorio.recipes.replaceIngredient(
  "advanced-circuit",
  "plastic-bar",
  { type = "item", name = "electronic-components", amount = 2 }
)
krastorio.recipes.setEnergyCost("advanced-circuit", 4)
krastorio.recipes.replaceProduct(
  "advanced-circuit",
  "advanced-circuit",
  { type = "item", name = "advanced-circuit", amount = 2 }
)

krastorio.recipes.removeIngredient("processing-unit", "electronic-circuit")
krastorio.recipes.replaceIngredient(
  "processing-unit",
  "advanced-circuit",
  { type = "item", name = "advanced-circuit", amount = 6 }
)
krastorio.recipes.addIngredient("processing-unit", { type = "item", name = "rare-metals", amount = 3 })
krastorio.recipes.replaceIngredient(
  "processing-unit",
  "sulfuric-acid",
  { type = "fluid", name = "sulfuric-acid", amount = 10 }
)
krastorio.recipes.setEnergyCost("processing-unit", 12)
krastorio.recipes.replaceProduct(
  "processing-unit",
  "processing-unit",
  { type = "item", name = "processing-unit", amount = 2 }
)

-- --

krastorio.recipes.replaceIngredient(
  "repair-pack",
  "iron-gear-wheel",
  { type = "item", name = "iron-plate", amount = 2 }
)
krastorio.recipes.replaceIngredient(
  "repair-pack",
  "electronic-circuit",
  { type = "item", name = "copper-plate", amount = 2 }
)
krastorio.recipes.addIngredient("repair-pack", { type = "item", name = "stone", amount = 2 })

-- EQUIPMENTS
krastorio.recipes.replaceIngredient(
  "personal-laser-defense-equipment",
  "processing-unit",
  { type = "item", name = "electronic-components", amount = 50 }
)

krastorio.recipes.replaceIngredient(
  "energy-shield-mk2-equipment",
  "energy-shield-equipment",
  { type = "item", name = "energy-shield-equipment", amount = 5 }
)

krastorio.recipes.replaceIngredient(
  "low-density-structure",
  "copper-plate",
  { type = "item", name = "copper-plate", amount = 10 }
)

-- MODULES
-- Speed modules

-- Speed module 1
krastorio.recipes.setEnergyCost("speed-module", 15)
krastorio.recipes.overrideIngredients("speed-module", {
  { type = "item", name = "electronic-circuit", amount = 5 },
  { type = "item", name = "electronic-components", amount = 10 },
})

-- Speed module 2
krastorio.recipes.setEnergyCost("speed-module-2", 15)
krastorio.recipes.overrideIngredients("speed-module-2", {
  { type = "item", name = "advanced-circuit", amount = 5 },
  { type = "item", name = "electronic-circuit", amount = 5 },
  { type = "item", name = "speed-module", amount = 5 },
})

-- Speed module 3
krastorio.recipes.setEnergyCost("speed-module-3", 15)
krastorio.recipes.overrideIngredients("speed-module-3", {
  { type = "item", name = "processing-unit", amount = 5 },
  { type = "item", name = "advanced-circuit", amount = 5 },
  { type = "item", name = "speed-module-2", amount = 5 },
})

-- Ammos
krastorio.recipes.convertIngredient("flamethrower-ammo", "steel-plate", "iron-plate")

------------------------------------------------
-- -- Productivity modules

-- Productivity module 1
krastorio.recipes.setEnergyCost("productivity-module", 15)
krastorio.recipes.overrideIngredients("productivity-module", {
  { type = "item", name = "electronic-circuit", amount = 5 },
  { type = "item", name = "electronic-components", amount = 10 },
})

-- Productivity module 2
krastorio.recipes.setEnergyCost("productivity-module-2", 15)
krastorio.recipes.overrideIngredients("productivity-module-2", {
  { type = "item", name = "advanced-circuit", amount = 5 },
  { type = "item", name = "electronic-circuit", amount = 5 },
  { type = "item", name = "productivity-module", amount = 5 },
})

-- Productivity module 3
krastorio.recipes.setEnergyCost("productivity-module-3", 15)
krastorio.recipes.overrideIngredients("productivity-module-3", {
  { type = "item", name = "processing-unit", amount = 5 },
  { type = "item", name = "advanced-circuit", amount = 5 },
  { type = "item", name = "productivity-module-2", amount = 5 },
})

------------------------------------------------
-- -- Effectivity modules

-- Effectivity module 1
krastorio.recipes.setEnergyCost("efficiency-module", 15)
krastorio.recipes.overrideIngredients("efficiency-module", {
  { type = "item", name = "electronic-circuit", amount = 5 },
  { type = "item", name = "electronic-components", amount = 10 },
})

-- Effectivity module 2
krastorio.recipes.setEnergyCost("efficiency-module-2", 15)
krastorio.recipes.overrideIngredients("efficiency-module-2", {
  { type = "item", name = "advanced-circuit", amount = 5 },
  { type = "item", name = "electronic-circuit", amount = 5 },
  { type = "item", name = "efficiency-module", amount = 5 },
})

-- Effectivity module 3
krastorio.recipes.setEnergyCost("efficiency-module-3", 15)
krastorio.recipes.overrideIngredients("efficiency-module-3", {
  { type = "item", name = "processing-unit", amount = 5 },
  { type = "item", name = "advanced-circuit", amount = 5 },
  { type = "item", name = "efficiency-module-2", amount = 5 },
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
              { type = "item", name = "automation-core", amount = math.ceil(count / 2) }
            )
          end
        end
      end
    end
  end
end

-- Exceptions
krastorio.recipes.convertIngredient("fast-inserter", "automation-core", "electronic-circuit")
krastorio.recipes.addOrReplaceIngredient(
  "filter-inserter",
  "automation-core",
  { type = "item", name = "electronic-circuit", amount = 2 }
)

-- Lamp (glass)
krastorio.recipes.convertIngredient("small-lamp", "automation-core", "glass")
krastorio.recipes.addOrReplaceIngredient("small-lamp", { name = "glass", amount = 1 })

-- Solar panel
krastorio.recipes.replaceIngredient("solar-panel", "copper-plate", { type = "item", name = "glass", amount = 10 })
krastorio.recipes.replaceIngredient("solar-panel", "steel-plate", { type = "item", name = "steel-plate", amount = 5 })
krastorio.recipes.replaceIngredient(
  "solar-panel",
  "electronic-circuit",
  { type = "item", name = "electronic-circuit", amount = 10 }
)
krastorio.recipes.addIngredient("solar-panel", { type = "item", name = "silicon", amount = 5 })

krastorio.recipes.replaceIngredient("solar-panel", "iron-plate", { type = "item", name = "iron-beam", amount = 4 })

-- Assembling machine tier 1
krastorio.recipes.replaceIngredient(
  "assembling-machine-1",
  "iron-plate",
  { type = "item", name = "iron-beam", amount = 4 }
)

-- Electric mining drill 1
krastorio.recipes.replaceIngredient(
  "electric-mining-drill",
  "iron-plate",
  { type = "item", name = "iron-beam", amount = 2 }
)

-- -- -- -- -- -- -- -- -- -- -- -- --

-- Underground belt (Yellow tier 1)
krastorio.recipes.replaceIngredient("underground-belt", "iron-plate", { type = "item", name = "iron-beam", amount = 2 })

-- Splitter (Yellow tier 1)
krastorio.recipes.replaceIngredient("splitter", "iron-plate", { type = "item", name = "iron-gear-wheel", amount = 5 })
krastorio.recipes.replaceIngredient(
  "splitter",
  "automation-core",
  { type = "item", name = "automation-core", amount = 1 }
)

-- Fast belt (Red tier 2)
krastorio.recipes.replaceIngredient(
  "fast-transport-belt",
  "iron-gear-wheel",
  { type = "item", name = "iron-gear-wheel", amount = 4 }
)

-- Fast underground belt (Red tier 2)
-- krastorio.recipes.convertIngredient("fast-underground-belt", "iron-gear-wheel", "steel-gear-wheel")
krastorio.recipes.replaceIngredient(
  "fast-underground-belt",
  "iron-gear-wheel",
  { type = "item", name = "fast-transport-belt", amount = 10 }
)

-- Fast splitter (Red tier 2)
krastorio.recipes.replaceIngredient(
  "fast-splitter",
  "iron-gear-wheel",
  { type = "item", name = "iron-gear-wheel", amount = 4 }
)
krastorio.recipes.replaceIngredient(
  "fast-splitter",
  "electronic-circuit",
  { type = "item", name = "electronic-circuit", amount = 2 }
)

-- Express belt (Red tier 3)
krastorio.recipes.replaceIngredient(
  "express-transport-belt",
  "iron-gear-wheel",
  { type = "item", name = "steel-gear-wheel", amount = 4 }
)

-- Express underground belt (Red tier 3)
krastorio.recipes.replaceIngredient(
  "express-underground-belt",
  "iron-gear-wheel",
  { type = "item", name = "express-transport-belt", amount = 20 }
)
krastorio.recipes.removeIngredient("express-underground-belt", "lubricant")
krastorio.recipes.setCategoryIfExist("express-underground-belt", "crafting")

-- Express splitter (Red tier 3)
krastorio.recipes.replaceIngredient(
  "express-splitter",
  "iron-gear-wheel",
  { type = "item", name = "steel-gear-wheel", amount = 4 }
)
krastorio.recipes.removeIngredient("express-splitter", "lubricant")
krastorio.recipes.replaceIngredient(
  "express-splitter",
  "advanced-circuit",
  { type = "item", name = "electronic-components", amount = 4 }
)
krastorio.recipes.setCategoryIfExist("express-splitter", "crafting")

-- Heat pipe
krastorio.recipes.convertIngredient("heat-pipe", "steel-plate", "quartz")

-- Turrets
krastorio.recipes.addIngredient("laser-turret", { name = "quartz", amount = 5 })
krastorio.recipes.replaceIngredient("laser-turret", "steel-plate", { type = "item", name = "steel-plate", amount = 15 })

krastorio.recipes.replaceIngredient(
  "flamethrower-turret",
  "steel-plate",
  { type = "item", name = "steel-plate", amount = 20 }
)

-- Storage tank
krastorio.recipes.replaceIngredient("storage-tank", "iron-plate", { type = "item", name = "iron-plate", amount = 10 })
krastorio.recipes.convertIngredient("storage-tank", "steel-plate", "iron-beam")

-- Pump
krastorio.recipes.convertIngredient("storage-tank", "steel-plate", "iron-beam")

-- Pumpjack
krastorio.recipes.convertIngredient("pumpjack", "iron-gear-wheel", "steel-gear-wheel")
krastorio.recipes.replaceIngredient("pumpjack", "steel-plate", { type = "item", name = "steel-beam", amount = 4 })
krastorio.recipes.replaceIngredient("pumpjack", "iron-plate", { type = "item", name = "steel-beam", amount = 4 })

-- Oil refinery
krastorio.recipes.replaceIngredient("oil-refinery", "steel-plate", { type = "item", name = "steel-beam", amount = 4 })
krastorio.recipes.convertIngredient("oil-refinery", "iron-gear-wheel", "steel-gear-wheel")

-- Chemical plant
krastorio.recipes.replaceIngredient("chemical-plant", "steel-plate", { type = "item", name = "steel-beam", amount = 4 })
krastorio.recipes.convertIngredient("chemical-plant", "iron-gear-wheel", "steel-gear-wheel")

-- Poles
krastorio.recipes.replaceIngredient(
  "small-electric-pole",
  "copper-cable",
  { type = "item", name = "copper-cable", amount = 1 }
)
krastorio.recipes.replaceProduct(
  "small-electric-pole",
  "small-electric-pole",
  { type = "item", name = "small-electric-pole", amount = 1 }
)

krastorio.recipes.replaceIngredient(
  "medium-electric-pole",
  "copper-plate",
  { type = "item", name = "copper-cable", amount = 4 }
)
krastorio.recipes.replaceIngredient(
  "medium-electric-pole",
  "steel-plate",
  { type = "item", name = "iron-beam", amount = 2 }
)

krastorio.recipes.replaceIngredient(
  "big-electric-pole",
  "copper-plate",
  { type = "item", name = "copper-cable", amount = 8 }
)
krastorio.recipes.replaceIngredient(
  "big-electric-pole",
  "steel-plate",
  { type = "item", name = "steel-beam", amount = 4 }
)

krastorio.recipes.replaceIngredient("substation", "copper-plate", { type = "item", name = "copper-cable", amount = 16 })
krastorio.recipes.replaceIngredient("substation", "steel-plate", { type = "item", name = "steel-beam", amount = 8 })

krastorio.recipes.replaceIngredient("roboport", "steel-plate", { type = "item", name = "steel-beam", amount = 20 })

-- Vanilla Lab
krastorio.recipes.replaceIngredient("lab", "electronic-circuit", { type = "item", name = "iron-beam", amount = 10 })
krastorio.recipes.replaceIngredient("lab", "iron-gear-wheel", { type = "item", name = "copper-plate", amount = 10 })
krastorio.recipes.replaceIngredient("lab", "transport-belt", { type = "item", name = "copper-cable", amount = 10 })

-- Nuclear reactor
data.raw.recipe["nuclear-reactor"].energy_required = 120
data.raw.recipe["nuclear-reactor"].category = "crafting-with-fluid"
krastorio.recipes.replaceIngredient("nuclear-reactor", "concrete", { type = "item", name = "concrete", amount = 500 }) --it's not a mistake. it's for future rebalance
krastorio.recipes.replaceIngredient(
  "nuclear-reactor",
  "steel-plate",
  { type = "item", name = "steel-plate", amount = 200 }
) --it's not a mistake. it's for future rebalance
krastorio.recipes.replaceIngredient(
  "nuclear-reactor",
  "advanced-circuit",
  { type = "item", name = "advanced-circuit", amount = 200 }
) --it's not a mistake. it's for future rebalance
krastorio.recipes.replaceIngredient(
  "nuclear-reactor",
  "copper-plate",
  { type = "item", name = "heat-pipe", amount = 20 }
)
krastorio.recipes.addIngredient("nuclear-reactor", { type = "item", name = "rare-metals", amount = 200 })

-- -- Turbines
----------------------------

-- Steam engine
krastorio.recipes.setEnergyCost("steam-engine", 5)

-- Steam turbine
krastorio.recipes.setEnergyCost("steam-turbine", 10)
krastorio.recipes.addIngredient("steam-turbine", { type = "item", name = "steam-engine", amount = 2 })
krastorio.recipes.replaceIngredient(
  "steam-turbine",
  "iron-gear-wheel",
  { type = "item", name = "iron-gear-wheel", amount = 14 }
)
krastorio.recipes.replaceIngredient("steam-turbine", "pipe", { type = "item", name = "pipe", amount = 10 })

-- Assembling machine
krastorio.recipes.setEnergyCost("assembling-machine-1", 1)
krastorio.recipes.setEnergyCost("assembling-machine-2", 2)
krastorio.recipes.replaceIngredient(
  "assembling-machine-3",
  "assembling-machine-2",
  { type = "item", name = "assembling-machine-2", amount = 1 }
)
krastorio.recipes.replaceIngredient(
  "assembling-machine-3",
  "speed-module",
  { type = "item", name = "speed-module", amount = 2 }
)
krastorio.recipes.addIngredient("assembling-machine-3", { type = "item", name = "advanced-circuit", amount = 3 })
krastorio.recipes.addIngredient("assembling-machine-3", { type = "item", name = "steel-gear-wheel", amount = 5 })
krastorio.recipes.setEnergyCost("assembling-machine-3", 3)

-- TURRETS

-- Gun turret
krastorio.recipes.replaceIngredient("gun-turret", "iron-plate", { type = "item", name = "iron-beam", amount = 5 })
krastorio.recipes.replaceIngredient(
  "gun-turret",
  "copper-plate",
  { type = "item", name = "automation-core", amount = 3 }
)
krastorio.recipes.replaceIngredient(
  "gun-turret",
  "iron-gear-wheel",
  { type = "item", name = "iron-gear-wheel", amount = 4 }
)

----------------------------

--------------------------------------------------------------------
-- -- -- VEHICLES
--------------------------------------------------------------------

krastorio.recipes.replaceIngredient("cargo-wagon", "steel-plate", { type = "item", name = "steel-beam", amount = 10 })

--------------------------------------------------------------------
-- -- -- SPECIAL
--------------------------------------------------------------------

-- Cable of circuit network
krastorio.recipes.removeIngredient("red-wire", "electronic-circuit")
krastorio.recipes.removeIngredient("green-wire", "electronic-circuit")

krastorio.recipes.convertIngredient("spidertron", "raw-fish", "ai-core")
krastorio.recipes.replaceIngredient(
  "spidertron",
  "fusion-reactor-equipment",
  { type = "item", name = "fusion-reactor-equipment", amount = 1 }
)

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

krastorio.recipes.replaceProduct(
  "kovarex-enrichment-process",
  "uranium-235",
  { type = "item", name = "uranium-235", amount = 31 }
)
krastorio.recipes.replaceProduct(
  "kovarex-enrichment-process",
  "uranium-238",
  { type = "item", name = "stone", amount = 2 }
)

krastorio.recipes.replaceIngredient("uranium-fuel-cell", "uranium-235", { name = "uranium-235", amount = 2 })
krastorio.recipes.replaceIngredient("uranium-fuel-cell", "uranium-238", { name = "uranium-238", amount = 10 })
krastorio.recipes.replaceIngredient("uranium-fuel-cell", "iron-plate", { name = "steel-plate", amount = 1 })
krastorio.recipes.replaceProduct(
  "uranium-fuel-cell",
  "uranium-fuel-cell",
  { type = "item", name = "uranium-fuel-cell", amount = 1 }
)

krastorio.recipes.replaceIngredient(
  "nuclear-fuel-reprocessing",
  "depleted-uranium-fuel-cell",
  { name = "depleted-uranium-fuel-cell", amount = 1 }
)
krastorio.recipes.replaceProduct(
  "nuclear-fuel-reprocessing",
  "uranium-238",
  { type = "item", name = "uranium-238", amount = 6 }
)
krastorio.recipes.addProduct("nuclear-fuel-reprocessing", { type = "item", name = "stone", amount = 4 })
krastorio.recipes.addProduct(
  "nuclear-fuel-reprocessing",
  { type = "item", name = "tritium", probability = 0.15, amount = 1 }
)

-- More realistic weapons craft

krastorio.recipes.addIngredient("atomic-bomb", { type = "item", name = "heavy-rocket", amount = 1 })
krastorio.recipes.replaceIngredient("atomic-bomb", "uranium-235", { type = "item", name = "uranium-235", amount = 20 })
krastorio.recipes.setEnergyCost("atomic-bomb", 10)

krastorio.recipes.replaceIngredient("pistol", "iron-plate", { type = "item", name = "iron-plate", amount = 2 })
krastorio.recipes.replaceIngredient("pistol", "copper-plate", { type = "item", name = "copper-plate", amount = 1 })

krastorio.recipes.replaceIngredient(
  "piercing-shotgun-shell",
  "shotgun-shell",
  { type = "item", name = "shotgun-shell", amount = 1 }
)
krastorio.recipes.replaceIngredient(
  "piercing-shotgun-shell",
  "steel-plate",
  { type = "item", name = "steel-plate", amount = 3 }
)
krastorio.recipes.removeIngredient("piercing-shotgun-shell", "copper-plate")

krastorio.recipes.replaceIngredient("submachine-gun", "iron-plate", { type = "item", name = "iron-plate", amount = 3 })
krastorio.recipes.replaceIngredient(
  "submachine-gun",
  "copper-plate",
  { type = "item", name = "copper-plate", amount = 2 }
)
krastorio.recipes.replaceIngredient(
  "submachine-gun",
  "iron-gear-wheel",
  { type = "item", name = "iron-gear-wheel", amount = 5 }
)

krastorio.recipes.replaceIngredient("shotgun", "wood", { type = "item", name = "wood", amount = 2 })
krastorio.recipes.replaceIngredient("shotgun", "iron-plate", { type = "item", name = "iron-plate", amount = 3 })
krastorio.recipes.replaceIngredient("shotgun", "copper-plate", { type = "item", name = "copper-plate", amount = 2 })
krastorio.recipes.replaceIngredient(
  "shotgun",
  "iron-gear-wheel",
  { type = "item", name = "iron-gear-wheel", amount = 3 }
)

krastorio.recipes.replaceIngredient("combat-shotgun", "wood", { type = "item", name = "wood", amount = 3 })
krastorio.recipes.replaceIngredient(
  "combat-shotgun",
  "steel-plate",
  { type = "item", name = "steel-plate", amount = 4 }
)
krastorio.recipes.replaceIngredient(
  "combat-shotgun",
  "copper-plate",
  { type = "item", name = "copper-plate", amount = 2 }
)
krastorio.recipes.replaceIngredient(
  "combat-shotgun",
  "iron-gear-wheel",
  { type = "item", name = "iron-gear-wheel", amount = 3 }
)
