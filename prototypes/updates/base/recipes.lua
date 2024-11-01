--- Replaces the recipe's ingredient matching the given name.
--- @param recipe_name data.RecipeID
--- @param old_ingredient_name data.FluidID|data.ItemID
--- @param new_ingredient data.IngredientPrototype
local function add_or_replace_ingredient(recipe_name, old_ingredient_name, new_ingredient)
  local recipe = data.raw.recipe[recipe_name]
  if not recipe then
    error("Recipe " .. recipe_name .. " does not exist.")
  end
  if not recipe.ingredients then
    recipe.ingredients = { new_ingredient }
    return
  end
  for i, ingredient in pairs(recipe.ingredients) do
    if ingredient.name == old_ingredient_name then
      recipe.ingredients[i] = new_ingredient
      return
    end
  end
  table.insert(recipe.ingredients, new_ingredient)
end

--- Remove the given ingredient from the recipe.
--- @param recipe_name data.RecipeID
--- @param ingredient_name data.FluidID|data.ItemID
local function remove_ingredient(recipe_name, ingredient_name)
  local recipe = data.raw.recipe[recipe_name]
  if not recipe then
    error("Recipe " .. recipe_name .. " does not exist.")
  end
  if not recipe.ingredients then
    error("Recipe " .. recipe_name .. " has no ingredients.")
    return
  end
  for i, ingredient in pairs(recipe.ingredients) do
    if ingredient.name == ingredient_name then
      table.remove(recipe.ingredients, i)
      return
    end
  end
  error("Recipe " .. recipe_name .. " does not have ingredient " .. ingredient_name .. ".")
end

add_or_replace_ingredient("heavy-armor", "light-armor", { type = "item", name = "light-armor", amount = 1 })
remove_ingredient("heavy-armor", "copper-plate")

add_or_replace_ingredient("modular-armor", "heavy-armor", { type = "item", name = "heavy-armor", amount = 1 })
remove_ingredient("modular-armor", "steel-plate")

add_or_replace_ingredient("power-armor", "modular-armor", { type = "item", name = "modular-armor", amount = 1 })
remove_ingredient("power-armor", "steel-plate")

add_or_replace_ingredient("power-armor-mk2", "power-armor", { type = "item", name = "power-armor", amount = 1 })
remove_ingredient("power-armor-mk2", "processing-unit")
