if mods["aai-industry"] then
  -- -- -- Techologies fixes
  -- Sand
  krastorio.technologies.convertPrerequisiteFromAllTechnologies("sand-processing", "kr-stone-processing")
  data.raw.technology["sand-processing"] = nil
  -- Glass
  krastorio.technologies.convertPrerequisiteFromAllTechnologies("glass-processing", "kr-stone-processing")
  data.raw.technology["glass-processing"] = nil
  -- basic fluid handling
  krastorio.technologies.convertPrerequisiteFromAllTechnologies("basic-fluid-handling", "kr-basic-fluid-handling")
  data.raw.technology["basic-fluid-handling"] = nil
  -- steam power engine
  krastorio.technologies.convertPrerequisiteFromAllTechnologies("steam-power", "kr-steam-engine")
  data.raw.technology["steam-power"] = nil
  -- Removed Krastorio drill tech-card
  krastorio.technologies.convertPrerequisiteFromAllTechnologies("kr-electric-mining-drill", "electric-mining")
  data.raw.technology["kr-electric-mining-drill"] = nil

  -- Fuel prerequisite
  if krastorio.general.getSafeSettingValue("aai-fuel-processor") then
    krastorio.technologies.addPrerequisite("kr-fuel", "fuel-processing")
  end

  krastorio.technologies.addUnlockRecipe("kr-basic-fluid-handling", "pipe")
  krastorio.technologies.addUnlockRecipe("kr-basic-fluid-handling", "pipe-to-ground")
  krastorio.technologies.addUnlockRecipe("kr-basic-fluid-handling", "offshore-pump")

  krastorio.technologies.addUnlockRecipe("kr-steam-engine", "boiler")
  krastorio.technologies.addUnlockRecipe("kr-steam-engine", "steam-engine")

  krastorio.technologies.removeUnlockRecipe("automation", "burner-inserter")
  krastorio.technologies.removeUnlockRecipe("electricity", "inserter")

  krastorio.technologies.removeResearchUnitIngredient("basic-automation", "automation-science-pack")
  krastorio.technologies.removeResearchUnitIngredient("basic-automation", "electricity")
  krastorio.recipes.replaceIngredient("assembling-machine-1", "iron-plate", { "iron-beam", 4 })

  krastorio.technologies.addPrerequisite("basic-automation", "kr-automation-core")
  krastorio.technologies.addPrerequisite("kr-basic-fluid-handling", "electricity")
  krastorio.technologies.removeUnlockRecipe("electricity", "automation-science-pack")

  -- -- -- Recipes fixes
  krastorio.recipes.uniteDuplicateItemsOfRecipe("solar-panel")

  krastorio.recipes.replaceIngredient("burner-assembling-machine", "motor", { "automation-core", 2 })

  krastorio.recipes.removeIngredient("burner-inserter", "automation-core")

  -- -- -- Entities fixes
  data.raw["lab"]["burner-lab"].inputs = { "basic-tech-card", "automation-science-pack" }

  -- Fix for fuels
  if krastorio.general.getSafeSettingValue("kr-rebalance-vehicles&fuels") then
    if data.raw.item["processed-fuel"] then
      data.raw.item["processed-fuel"].fuel_category = "vehicle-fuel"
      data.raw.item["processed-fuel"].fuel_acceleration_multiplier = 0.9
      data.raw.item["processed-fuel"].fuel_top_speed_multiplier = 0.9
      data.raw.item["processed-fuel"].fuel_emissions_multiplier = 0.9
    end
    if data.raw.recipe["processed-fuel-from-fuel"] then
      data.raw.recipe["processed-fuel-from-fuel"] = nil
      krastorio.technologies.removeUnlockRecipeFromAllTechnologies("processed-fuel-from-fuel")
    end
    if data.raw.recipe["processed-fuel-from-bio-fuel"] then
      data.raw.recipe["processed-fuel-from-bio-fuel"] = nil
      krastorio.technologies.removeUnlockRecipeFromAllTechnologies("processed-fuel-from-bio-fuel")
    end
    if data.raw.recipe["processed-fuel-advanced-fuel"] then
      data.raw.recipe["processed-fuel-advanced-fuel"] = nil
      krastorio.technologies.removeUnlockRecipeFromAllTechnologies("processed-fuel-advanced-fuel")
    end
    -- Re-apply fuel category migrations
    -- For locomotives
    data.raw.locomotive["locomotive"].burner.fuel_category = nil
    data.raw.locomotive["locomotive"].burner.fuel_categories = { "chemical", "vehicle-fuel" }
    -- For any cars
    for _, car in pairs(data.raw.car) do
      if car.burner then
        car.burner.fuel_category = "vehicle-fuel"
        car.burner.fuel_categories = nil
      end
    end
  end

  -- -- -- ENFORCE SCIENCE PACK PREREQUISITE COHERENCE, again.
  krastorio.technologies.enforceUsedSciencePacksInPrerequisites()

  -- External compatibility call
  ---@diagnostic disable-next-line
  if k2_aai_industry_compatibility then
    ---@diagnostic disable-next-line
    k2_aai_industry_compatibility()
  end
end
