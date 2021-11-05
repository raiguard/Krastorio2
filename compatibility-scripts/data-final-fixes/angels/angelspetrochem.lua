if mods["angelspetrochem"] then
  local function makeFluidBurnable(fluid_name, value, emission)
    local fluid = krastorio.items.getItem(fluid_name)
    if fluid then
      if not fluid.gas_temperature or fluid.gas_temperature < 30 then
        fluid.gas_temperature = 30
      end
      fluid.fuel_value = value
      fluid.fuel_category = "burnable-fluid-fuel"
      fluid.fuel_emissions_multiplier = emission
    end
  end

  -- Circular dependecy fix
  krastorio.technologies.removePrerequisite("rocket-fuel", "angels-nitrogen-processing-4")

  -- Icon coherence fix
  krastorio.icons.setItemIcon("sulfuric-acid", kr_fluids_icons_path .. "sulfuric-acid.png", 64, 4)

  -- Unify redundant fluids, and other ingredients
  local to_convert = {
    -- Fluids
    ["gas-hydrogen"] = "hydrogen",
    ["gas-chlorine"] = "chlorine",
    ["gas-hydrogen-chlorine"] = "hydrogen-chlorine",
    ["gas-oxygen"] = "oxygen",
    ["gas-nitrogen"] = "nitrogen",
    ["gas-ammonia"] = "ammonia",
    ["liquid-nitric-acid"] = "nitric-acid",
    ["liquid-heavy-water"] = "heavy-water",

    -- Items
    ["solid-coke"] = "coke",
    ["solid-sand"] = "sand",
  }

  for old_name, new_name in pairs(to_convert) do
    if krastorio.items.getItem(old_name) and krastorio.items.getItem(new_name) then
      for recipe_name, _ in pairs(data.raw.recipe) do
        if recipe_name:find("creative-mod_", 1, true) == nil then
          krastorio.recipes.convertIngredient(recipe_name, old_name, new_name)
          krastorio.recipes.convertProduct(recipe_name, old_name, new_name)
        end
      end
    end
  end

  -- Remove angel hydrogen-chlorine recipe
  krastorio.technologies.removeUnlockRecipeFromAllTechnologies("gas-hydrogen-chlorine")

  -- Then, remove unseful recipe
  krastorio.technologies.addPrerequisite("chlorine-processing-3", "chemical-science-pack")
  krastorio.technologies.addPrerequisite("chlorine-processing-3", "chlorine-processing-1")
  krastorio.technologies.addPrerequisite("chlorine-processing-3", "chlorine-processing-2")
  krastorio.technologies.removePrerequisite("chlorine-processing-3", "chlorine-processing-2")
  if data.raw.technology["chlorine-processing-3"] then
    data.raw.technology["chlorine-processing-2"] = data.raw.technology["chlorine-processing-3"]
    data.raw.technology["chlorine-processing-3"] = nil
    data.raw.technology["chlorine-processing-2"].name = "chlorine-processing-2"
    krastorio.technologies.convertPrerequisiteFromAllTechnologies(
      "chlorine-processing-3",
      "chlorine-processing-2",
      true
    )
  end

  -- Remove other unseful recipes and techs
  data.raw.technology["resin-1"] = nil
  data.raw.technology["resin-2"] = nil
  data.raw.technology["resin-3"] = nil

  data.raw.technology["angel-flare-stack"] = nil
  data.raw.technology["rubber"] = nil

  -- Change the air filters
  krastorio.technologies.addPrerequisite("kr-advanced-chemistry", "angels-nitrogen-processing-1")
  krastorio.technologies.removePrerequisite("kr-advanced-chemistry", "kr-atmosphere-condensation")
  data.raw.technology["kr-atmosphere-condensation"] = nil

  krastorio.technologies.addUnlockRecipe("angels-nitrogen-processing-1", "oxygen")
  krastorio.technologies.addUnlockRecipe("angels-nitrogen-processing-1", "nitrogen")
  krastorio.technologies.addUnlockRecipe("angels-nitrogen-processing-1", "hydrogen")
  krastorio.technologies.addUnlockRecipe("angels-nitrogen-processing-1", "water-from-atmosphere")

  if data.raw["assembling-machine"]["angels-air-filter"] then
    table.insert(data.raw["assembling-machine"]["angels-air-filter"].crafting_categories, "atmosphere-condensation")
  end
  if data.raw["assembling-machine"]["angels-air-filter-2"] then
    table.insert(data.raw["assembling-machine"]["angels-air-filter-2"].crafting_categories, "atmosphere-condensation")
  end

  -- Rocket fuel
  krastorio.recipes.replaceIngredient("rocket-fuel-with-ammonia", "iron-plate", { "rocket-fuel-capsule", 10 })
  krastorio.recipes.addIngredient("rocket-fuel-with-ammonia", { "rocket-oxidizer-capsule", 10 })

  krastorio.recipes.replaceIngredient("rocket-fuel-with-hydrogen-chlorine", "iron-plate", {
    "rocket-fuel-capsule",
    10,
  })
  krastorio.recipes.addIngredient("rocket-fuel-with-hydrogen-chlorine", { "rocket-oxidizer-capsule", 10 })

  -- Fixing coke ingredients
  krastorio.recipes.addIngredient("solid-coke", { "wood", 4 })
  krastorio.recipes.addIngredient("solid-coke-sulfur", { "wood", 1 })

  -- Make some angels fluids burnable in the gas power station
  makeFluidBurnable("gas-methane", "775KJ", 1.3)
  makeFluidBurnable("gas-methanol", "790KJ", 1.3)
  makeFluidBurnable("gas-ethane", "850KJ", 1.3)
  makeFluidBurnable("gas-ethane", "850KJ", 1.3)
  makeFluidBurnable("gas-butane", "950KJ", 1.4)
  makeFluidBurnable("gas-propene", "1000KJ", 1.4)
  makeFluidBurnable("gas-benzene", "1000KJ", 1.4)
end
