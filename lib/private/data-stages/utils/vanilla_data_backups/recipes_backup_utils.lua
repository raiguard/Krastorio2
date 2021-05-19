require("recipes_backup")

krastorio_utils.recipes_backup_utils = {}

function krastorio_utils.recipes_backup_utils.isRecipeVanilla(recipe_name)
  if type(recipe_name) == "string" then
    for name, recipe in pairs(krastorio_utils.recipes_backup) do
      if name == recipe_name then
        return true
      end
    end
  end
  return false
end

function krastorio_utils.recipes_backup_utils.restoreRecipeToVanilla(recipe_name)
  if type(recipe_name) == "string" then
    for name, recipe in pairs(krastorio_utils.recipes_backup) do
      if name == recipe_name then
        krastorio_utils.tables.replace(data.raw.recipe[name], recipe)
        return true
      end
    end
  end
  return false
end
