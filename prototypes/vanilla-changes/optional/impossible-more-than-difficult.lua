if krastorio.general.getSafeSettingValue("kr-impossible-more-than-difficult") then
  -- Doubles expensive ingredients of all recipes
  for name, recipe in pairs(data.raw.recipe) do
    if krastorio.recipes.hasNoExpensiveIngredients(name) then
      local recipe_def = krastorio_utils.tables.fullCopy(recipe)
      recipe.normal = recipe_def
      recipe.expensive = krastorio_utils.tables.fullCopy(recipe_def)
    end
    krastorio.recipes.multiplyAllExpensiveIngredients(name, 2, recipe.expensive.ingredients)
  end
  -- Doubles expensive ingredients of all technologies
  for technology_name, technology in pairs(data.raw.technology) do
    if not technology.expensive then
      local tec_def = krastorio_utils.tables.fullCopy(technology)
      technology.normal = tec_def
      technology.expensive = krastorio_utils.tables.fullCopy(tec_def)
    end
    if technology.expensive.unit and technology.expensive.unit.count then
      technology.expensive.unit.count = technology.expensive.unit.count * 2
    end
  end
end
