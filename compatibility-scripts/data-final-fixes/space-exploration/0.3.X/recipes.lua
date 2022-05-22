if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
  -- Remove glass from low desity structure
  krastorio.recipes.removeIngredient("low-density-structure", "glass")
  krastorio.recipes.replaceIngredient("low-density-structure", "steel-plate", { "steel-plate", 2 })

  -- Removing rocket fuel from water recipe, is not necessary with the K2 atmopheric condenser (on every plant is possible craft the rocket fuel)
  data.raw.recipe["se-rocket-fuel-from-water-copper"] = nil
  krastorio.technologies.removeUnlockRecipeFromAllTechnologies("se-rocket-fuel-from-water-copper")
  krastorio.modules.removeProductivityLimitation("se-rocket-fuel-from-water-copper")
  krastorio.recipes.setCategoryIfExist("rocket-fuel", "fuel-refinery")

  -- Adding new K2 recipe categories to some space machines to make users able to process the K2 intermediates in the space
  krastorio.entities.addCraftingCategory("assembling-machine", "se-space-mechanical-laboratory", "crushing")
  krastorio.entities.addCraftingCategory("assembling-machine", "se-pulveriser", "crushing")
  krastorio.entities.addCraftingCategory("assembling-machine", "se-space-decontamination-facility", "fluid-filtration")

  -- Merge the sand recipes
  if data.raw.recipe["sand-from-stone"] then
    data.raw.recipe["sand-from-stone"] = nil
    data.raw.technology["sand-processing"] = nil
    krastorio.technologies.convertPrerequisiteFromAllTechnologies("sand-processing", "kr-stone-processing")
    krastorio.technologies.removeUnlockRecipeFromAllTechnologies("sand-from-stone")
    krastorio.modules.removeProductivityLimitation("sand-from-stone")
  end
  if data.raw.recipe["se-pulverised-sand"] then
    data.raw.recipe["se-pulverised-sand"] = nil
    data.raw.technology["sand-processing"] = nil
    krastorio.technologies.convertPrerequisiteFromAllTechnologies("sand-processing", "kr-stone-processing")
    krastorio.technologies.removeUnlockRecipeFromAllTechnologies("se-pulverised-sand")
    krastorio.modules.removeProductivityLimitation("se-pulverised-sand")
  end

  -- Merge the glass recipe
  if data.raw.recipe["glass-from-sand"] then
    data.raw.recipe["glass-from-sand"] = nil
    data.raw.technology["glass-processing"] = nil
    krastorio.technologies.convertPrerequisiteFromAllTechnologies("glass-processing", "kr-stone-processing")
    krastorio.technologies.removeUnlockRecipeFromAllTechnologies("glass-from-sand")
    krastorio.modules.removeProductivityLimitation("glass-from-sand")
  end

  -- Move lithium sulfur battery
  data.raw["recipe"]["lithium-sulfur-battery"].subgroup = "intermediate-product"

  -- Add additional landfill recipes
  local template = data.raw.recipe["landfill-iron-ore"]
  local tech = data.raw.technology["se-recycling-facility"]
  for _, resource_name in pairs({ "raw-rare-metals", "raw-imersite" }) do
    local recipe = table.deepcopy(template)
    recipe.name = "landfill-" .. resource_name
    recipe.order = "z-b-" .. resource_name
    recipe.icon = nil
    recipe.icons = {
      { icon = data.raw.item["landfill"].icon , icon_size = data.raw.item["landfill"].icon_size},
      { icon = data.raw.item[resource_name].icon, icon_size = data.raw.item[resource_name].icon_size, scale = 0.33},
    }
    if recipe.ingredients then
      recipe.ingredients = {{name = resource_name, amount = 50}}
    end
    if recipe.normal and recipe.normal.ingredients then
      recipe.normal.ingredients = {{name = resource_name, amount = 50}}
    end
    if recipe.expensive and recipe.expensive.ingredients then
      recipe.expensive.ingredients = {{name = resource_name, amount = 50}}
    end
    table.insert(tech.effects, { type = "unlock-recipe", recipe = recipe.name })
    data:extend({ recipe })
  end
end
