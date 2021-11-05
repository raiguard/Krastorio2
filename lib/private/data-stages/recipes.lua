krastorio.recipes = {}
krastorio.recipes.recipes_groups = {}
krastorio.recipes.changed_names = {}

-- -- -- GETTING(READ) FUNCTIONS

-- -- INGREDIENTS

-- @ ingredient
function krastorio.recipes.getIngredientType(ingredient)
  return ingredient.type or "item"
end

-- @ ingredient
function krastorio.recipes.getIngredientName(ingredient)
  return ingredient.name or ingredient[1]
end

-- @ ingredient
function krastorio.recipes.getIngredientAmount(ingredient)
  return ingredient.amount or ingredient[2]
end

-- @ ingredient
function krastorio.recipes.getIngredientCatalystAmount(ingredient)
  return ingredient.catalyst_amount or 0
end

-- -- normal

-- @ recipe_name
-- return a table
function krastorio.recipes.getIngredients(recipe_name)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
  if recipe then
    if recipe.ingredients then
      return recipe.ingredients
    end
    if recipe.normal and recipe.normal.ingredients then
      return recipe.normal.ingredients
    end
  end
  return {}
end

--

-- @ recipe_name
-- @ ingredient_name
-- return a boolean
function krastorio.recipes.hasIngredient(recipe_name, ingredient_name)
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  if ingredients and #ingredients > 0 then
    local inner_ingredient_name = nil
    for i = 1, #ingredients do
      inner_ingredient_name = krastorio.recipes.getIngredientName(ingredients[i])
      if inner_ingredient_name == ingredient_name then
        return true
      end
    end
  end
  return false
end

-- @ recipe_name
-- @ ingredient_name
-- return a integer, ingredient amount
function krastorio.recipes.countIngredient(recipe_name, ingredient_name)
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  if ingredients and #ingredients > 0 then
    local inner_ingredient_name = nil
    for i = 1, #ingredients do
      inner_ingredient_name = krastorio.recipes.getIngredientName(ingredients[i])
      if inner_ingredient_name == ingredient_name then
        return krastorio.recipes.getIngredientAmount(ingredients[i])
      end
    end
  end
  return 0
end

--

-- @ recipe_name
-- @ ingredient_names
-- return a boolean
function krastorio.recipes.hasIngredients(recipe_name, ingredient_names)
  local has_all = true
  for _, ingredient_name in pairs(ingredient_names) do
    has_all = has_all and krastorio.recipes.hasIngredient(recipe_name, ingredient_name)
  end
  return has_all
end

-- @ recipe_name
-- return a boolean
function krastorio.recipes.useFluids(recipe_name)
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  if ingredients and #ingredients > 0 then
    for _, ingredient in pairs(ingredients) do
      if ingredient.type and ingredient.type == "fluid" then
        return true
      end
    end
  end
  return false
end

-- @ recipe_name
-- return a boolean
function krastorio.recipes.hasNoIngredients(recipe_name)
  return (next(krastorio.recipes.getIngredients(recipe_name)) == nil)
end

-- -- expensive

-- @ recipe_name
-- return a table
function krastorio.recipes.getExpensiveIngredients(recipe_name)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
  if recipe and recipe.expensive and recipe.expensive.ingredients then
    return recipe.expensive.ingredients
  end
  return {}
end

--

-- @ recipe_name
-- @ ingredient_name
-- return a boolean
function krastorio.recipes.hasExpensiveIngredient(recipe_name, ingredient_name)
  local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
  if next(expensive_ingredients) ~= nil then
    local inner_ingredient_name = nil
    for i = 1, #expensive_ingredients do
      inner_ingredient_name = krastorio.recipes.getIngredientName(expensive_ingredients[i])
      if inner_ingredient_name == ingredient_name then
        return true
      end
    end
  end
  return false
end

--

-- @ recipe_name
-- @ ingredient_names
-- return a boolean
function krastorio.recipes.hasExpensiveIngredients(recipe_name, ingredient_names)
  local has_all = true
  for _, ingredient_name in pairs(ingredient_names) do
    has_all = has_all and krastorio.recipes.hasExpensiveIngredient(recipe_name, ingredient_name)
  end
  return has_all
end

-- @ recipe_name
-- return a boolean
function krastorio.recipes.hasNoExpensiveIngredients(recipe_name)
  return (next(krastorio.recipes.getExpensiveIngredients(recipe_name)) == nil)
end

-- -- PRODUCTS

-- @ recipe_name
function krastorio.recipes.resultToResults(recipe_name)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
  local results = nil

  if recipe.results then
    results = recipe.results
  elseif recipe.normal and recipe.normal.results then
    results = recipe.normal.results
  elseif recipe.expensive and recipe.expensive.results then
    results = recipe.expensive.results
  end

  if not results then
    local result_count = 1
    if recipe.result then
      result_count = recipe.result_count or 1
      if type(recipe.result) == "string" then
        recipe.results = { { type = "item", name = recipe.result, amount = result_count } }
      elseif recipe.result.name then
        recipe.results = { recipe.result }
      elseif recipe.result[1] then
        result_count = recipe.result[2] or result_count
        recipe.results = { { type = "item", name = recipe.result[1], amount = result_count } }
      end
      recipe.result = nil
      results = recipe.results
      recipe.result_count = nil
    end
    if not results and recipe.normal and recipe.normal.result then
      result_count = recipe.normal.result_count or 1
      if type(recipe.normal.result) == "string" then
        recipe.normal.results = { { type = "item", name = recipe.normal.result, amount = result_count } }
      elseif recipe.normal.result.name then
        recipe.normal.results = { recipe.normal.result }
      elseif recipe.normal.result[1] then
        result_count = recipe.normal.result[2] or result_count
        recipe.normal.results = { { type = "item", name = recipe.normal.result[1], amount = result_count } }
      end
      recipe.normal.result = nil
      results = recipe.normal.results
      recipe.normal.result_count = nil
    end
    if recipe.expensive and recipe.expensive.result then
      result_count = recipe.expensive.result_count or 1
      if type(recipe.expensive.result) == "string" then
        recipe.expensive.results = { { type = "item", name = recipe.expensive.result, amount = result_count } }
      elseif recipe.expensive.result.name then
        recipe.expensive.results = { recipe.expensive.result }
      elseif recipe.expensive.result[1] then
        result_count = recipe.expensive.result[2] or result_count
        recipe.expensive.results = { { type = "item", name = recipe.expensive.result[1], amount = result_count } }
      end
      recipe.expensive.result = nil
      recipe.expensive.result_count = nil
      if not results then
        results = recipe.expensive.results
      end
    end
  end
  return results
end

--

-- @ recipe_name
-- return a table, with one ore more product
function krastorio.recipes.getProducts(recipe_name)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
  if recipe then
    results = krastorio.recipes.resultToResults(recipe_name) -- test
    if results == nil then
      results = {}
    end
    return results
  end
  return {}
end

--

-- @ recipe_name
-- @ product_name
-- return a boolean
function krastorio.recipes.hasProduct(recipe_name, product_name)
  local products = krastorio.recipes.getProducts(recipe_name)
  if next(products) ~= nil then
    local inner_product_name = nil
    for i = 1, #products do
      inner_product_name = krastorio.recipes.getIngredientName(products[i])
      if inner_product_name == product_name then
        return true
      end
    end
  end
  return false
end

--

-- @ recipe_name
-- @ product_names
-- return a boolean
function krastorio.recipes.hasProducts(recipe_name, product_names)
  local has_all = true
  for _, product_name in pairs(product_names) do
    has_all = has_all and krastorio.recipes.hasProduct(recipe_name, product_name)
  end
  return has_all
end

function krastorio.recipes.countProduct(recipe_name, product_name)
  local products = krastorio.recipes.getProducts(recipe_name)
  if products and #products > 0 then
    local inner_product_name = nil
    for i = 1, #products do
      inner_product_name = krastorio.recipes.getIngredientName(products[i])
      if inner_product_name == product_name then
        return krastorio.recipes.getIngredientAmount(products[i])
      end
    end
  end
  return 0
end

-- -- OTHERS

-- wrapper
-- @ recipe_name
-- return a boolean
function krastorio.recipes.exist(recipe_name)
  return krastorio.recipes.getRecipeFromName(recipe_name) ~= nil
end

-- @ recipe_name
-- return a recipe or nil
function krastorio.recipes.getRecipeFromName(recipe_name)
  return data.raw.recipe[recipe_name]
end

-- @ recipe_name
-- return a boolean
function krastorio.recipes.isRecipeVanilla(recipe_name)
  return krastorio_utils.recipes_backup_utils.isRecipeVanilla(recipe_name)
end

-- @ recipe_name
-- return a string
function krastorio.recipes.getCategory(recipe_name)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
  if recipe then
    return recipe.category
  end
  return false
end

function krastorio.recipes.normalEnergyRequired(recipe_name)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
  local seconds = 0
  if recipe then
    seconds = 0.5
    local not_defined = true
    if recipe.energy_required then
      seconds = recipe.energy_required
      not_defined = false
    elseif recipe.normal and recipe.normal.energy_required then
      seconds = recipe.normal.energy_required
      not_defined = false
    elseif not_defined and recipe.expensive and recipe.expensive.energy_required then
      seconds = recipe.expensive.energy_required
    end
  end
  return seconds
end

-- -- -- SETTING(WRITE) FUNCTIONS

-- -- -- GENERAL TOOL FUNCTIONS

-- return a copy
function krastorio.recipes.getParsedItem(item)
  if type(item) ~= "table" then
    return item
  end

  local parsed_item = {}
  if item.type then -- already well parsed
    parsed_item = krastorio_utils.tables.fullCopy(item)
  else -- parsing item
    -- fixed mandatory property
    parsed_item.type = "item"
    -- get mandatory property
    if item.name then
      parsed_item.name = item.name
    end
    if item.amount then
      parsed_item.amount = item.amount
    end
    -- get optional property
    if item.catalyst_amount then
      parsed_item.catalyst_amount = item.catalyst_amount
    end
    if item.probability then
      parsed_item.probability = item.probability
    end
    if item.temperature then
      parsed_item.temperature = item.temperature
    end
    if item.fluidbox_index then
      parsed_item.fluidbox_index = item.fluidbox_index
    end
    -- get mandatory property in case have no index strings
    if not parsed_item.name or not parsed_item.amount then
      for _, value in pairs(item) do
        if type(value) == "string" then
          parsed_item.name = value
        else
          parsed_item.amount = value
        end
      end
    end
  end
  return parsed_item
end

function krastorio.recipes.mergeParsedItems(item_a, item_b)
  local merged_item = {}
  -- mandatory property
  merged_item.name = item_b.name
  merged_item.type = item_b.type

  if item_a.amount and item_b.amount then
    merged_item.amount = item_a.amount + item_b.amount
  elseif item_a.amount_min then
    merged_item.amount_min = item_a.amount_min + item_b.amount
    merged_item.amount_max = item_a.amount_max + item_b.amount
  elseif item_b.amount_min then
    merged_item.amount_min = item_b.amount_min + item_a.amount
    merged_item.amount_max = item_b.amount_max + item_a.amount
  end
  -- optional property (prioritized on second item)
  if item_b.catalyst_amount then
    merged_item.catalyst_amount = item_b.catalyst_amount
  elseif item_a.catalyst_amount then
    merged_item.catalyst_amount = item_a.catalyst_amount
  end
  if item_b.probability then
    merged_item.probability = item_b.probability
  elseif item_a.probability then
    merged_item.probability = item_a.probability
  end
  if item_b.temperature then
    merged_item.temperature = item_b.temperature
  elseif item_a.temperature then
    merged_item.temperature = item_a.temperature
  end
  if item_b.fluidbox_index then
    merged_item.fluidbox_index = item_b.fluidbox_index
  elseif item_a.fluidbox_index then
    merged_item.fluidbox_index = item_a.fluidbox_index
  end
  return merged_item
end

function krastorio.recipes.uniteDuplicateItems(items)
  local count = #items
  for i = 1, count do
    items[i] = krastorio.recipes.getParsedItem(items[i])
  end
  deduplicated_items = {}
  local united = false
  local inner_item_name = nil
  local inner_dedup_item_name = nil
  for _, item in pairs(items) do
    united = false
    inner_item_name = krastorio.recipes.getIngredientName(item)
    for j, dedup_item in pairs(deduplicated_items) do
      inner_dedup_item_name = krastorio.recipes.getIngredientName(dedup_item)
      if inner_item_name == inner_dedup_item_name then
        merged_item = krastorio.recipes.mergeParsedItems(item, dedup_item)
        deduplicated_items[j] = merged_item
        united = true
        break
      end
    end
    if not united then
      table.insert(deduplicated_items, item)
    end
  end
  for i = 1, count do
    items[i] = nil
  end
  count = #deduplicated_items
  for i = 1, count do
    table.insert(items, deduplicated_items[i])
  end
end

function krastorio.recipes.remove(items, item_name)
  local removed = false
  local inner_item_name = nil
  for i, item in pairs(items) do
    inner_item_name = krastorio.recipes.getIngredientName(item)
    if inner_item_name == item_name then
      table.remove(items, i)
      removed = true
    end
  end
  return removed
end

function krastorio.recipes.add(items, item)
  local ingredient_name = ""
  local ingredient_to_insert = nil
  if type(item) == "string" then
    ingredient_to_insert = { item, 1 }
  elseif type(item) == "table" then
    ingredient_to_insert = item
  else
    return false
  end
  table.insert(items, ingredient_to_insert)
  krastorio.recipes.uniteDuplicateItems(items)
  return true
end

function krastorio.recipes.multiply(items, item_name, multiplier)
  local inner_item_name = nil
  for i, item in pairs(items) do
    inner_item_name = krastorio.recipes.getIngredientName(item)
    if inner_item_name == item_name then
      if item.amount then
        items[i].amount = item.amount * multiplier
      else
        items[i][2] = item[2] * multiplier
      end
      return true
    end
  end
  return false
end

function krastorio.recipes.replace(items, old_item_name, new_item)
  local inner_item_name = nil
  for i, item in pairs(items) do
    inner_item_name = krastorio.recipes.getIngredientName(item)
    if inner_item_name == old_item_name then
      items[i] = new_item
      krastorio.recipes.uniteDuplicateItems(items)
      return true
    end
  end
  return false
end

function krastorio.recipes.addOrReplace(items, old_item_name, new_item)
  local added = krastorio.recipes.replace(items, old_item_name, new_item)
  if not added then
    added = krastorio.recipes.add(items, new_item)
  end
  return added
end

function krastorio.recipes.convert(items, old_item_name, new_item_name)
  local inner_item_name = nil
  for i, item in pairs(items) do
    inner_item_name = krastorio.recipes.getIngredientName(item)
    if inner_item_name == old_item_name then
      krastorio.recipes.setIngredientName(item, new_item_name)
      krastorio.recipes.uniteDuplicateItems(items)
      return true
    end
  end
  return false
end

-- -- INGREDIENTS

-- @ ingredient
function krastorio.recipes.setIngredientType(item, new_type)
  item.type = new_type
end

-- @ ingredient
function krastorio.recipes.setIngredientName(item, new_name)
  if item.name then
    item.name = new_name
  else
    item[1] = new_name
  end
end

-- @ ingredient
function krastorio.recipes.setIngredientAmount(item, new_amount)
  if item.amount then
    item.amount = new_amount
  else
    item[2] = new_amount
  end
end

-- @ ingredient
function krastorio.recipes.setIngredientCatalystAmount(item, new_catalyst_amount)
  item.catalyst_amount = new_catalyst_amount
end

function krastorio.recipes.overrideIngredients(recipe_name, new_ingredients)
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  if next(ingredients) ~= nil then
    -- normal ingredients
    krastorio_utils.tables.replace(ingredients, new_ingredients)
    -- expensive ingredients
    local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
    if next(expensive_ingredients) ~= nil then
      krastorio_utils.tables.replace(expensive_ingredients, table.deepcopy(new_ingredients))
    end
    return true
  end
  return false
end

-- -- remove

-- @ recipe_name
-- @ ingredient_name
-- return a boolean
function krastorio.recipes.removeIngredient(recipe_name, ingredient_name)
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  local removed = false
  -- normal
  if next(ingredients) ~= nil then
    removed = krastorio.recipes.remove(ingredients, ingredient_name)
    -- expensive
    local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
    if next(expensive_ingredients) ~= nil then
      local removed_expensive = krastorio.recipes.remove(expensive_ingredients, ingredient_name)
      removed = removed or removed_expensive
    end
  end
  return removed
end

--

-- @ recipe_name
-- @ ingredient_names
-- return a boolean
function krastorio.recipes.removeIngredients(recipe_name, ingredient_names)
  local removed_all = true
  local removed = false
  for _, ingredient_name in pairs(ingredient_names) do
    removed = krastorio.recipes.removeIngredient(recipe_name, ingredient_name)
    removed_all = removed_all and removed
  end
  return removed_all
end

--

-- @ ingredient_name
-- return a interger
function krastorio.recipes.removeIngredientFromAllRecipes(ingredient_name)
  local count = 0
  for name, recipe in pairs(data.raw.recipe) do
    if krastorio.recipes.removeIngredient(name, ingredient_name) then
      count = count + 1
    end
  end
  return count
end

--

-- @ ingredient_names
function krastorio.recipes.removeIngredientsFromAllRecipes(ingredient_names)
  local total_count = 0
  for _, ingredient_name in pairs(ingredient_names) do
    total_count = total_count + krastorio.recipes.removeIngredientFromAllRecipes(ingredient_name)
  end
  return total_count
end

-- remove and remove prerequisites

-- @ recipe_name
-- @ ingredient_name
-- return a boolean
function krastorio.recipes.removeIngredientWithPrerequisite(recipe_name, ingredient_name)
  local recipe_tech = krastorio.technologies.getTechnologyThatUnlockRecipe(recipe_name)
  local ingredient_tech = krastorio.technologies.getTechnologyThatUnlockRecipe(ingredient_name)
  if recipe_tech and ingredient_tech then
    krastorio.technologies.removePrerequisite(recipe_tech.name, ingredient_tech.name)
    return krastorio.recipes.removeIngredient(recipe_name, ingredient_name)
  end
end

--

-- @ recipe_name
-- @ ingredient_names
-- return a boolean
function krastorio.recipes.removeIngredientsWithPrerequisite(recipe_name, ingredient_names)
  local removed_all = true
  local removed = false
  for _, ingredient_name in pairs(ingredient_names) do
    removed = krastorio.recipes.removeIngredientWithPrerequisite(recipe_name, ingredient_name)
    removed_all = removed_all and removed
  end
  return removed_all
end

--

-- @ ingredient_name
-- return a interger
function krastorio.recipes.removeIngredientWithPrerequisiteFromAllRecipes(ingredient_name)
  local count = 0
  for name, recipe in pairs(data.raw.recipe) do
    if krastorio.recipes.removeIngredientWithPrerequisite(name, ingredient_name) then
      count = count + 1
    end
  end
  return count
end

--

-- @ ingredient_names
function krastorio.recipes.removeIngredientsWithPrerequisiteFromAllRecipes(ingredient_names)
  local total_count = 0
  for _, ingredient_name in pairs(ingredient_names) do
    total_count = total_count + krastorio.recipes.removeIngredientWithPrerequisiteFromAllRecipes(ingredient_name)
  end
  return total_count
end

-- -- add

-- @ recipe_name
-- @ ingredient
function krastorio.recipes.addIngredient(recipe_name, ingredient)
  local added = false
  -- normal
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  if next(ingredients) ~= nil then
    added = krastorio.recipes.add(ingredients, ingredient)
    -- expensive
    local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
    if next(expensive_ingredients) ~= nil then
      local added_expensive = krastorio.recipes.add(expensive_ingredients, ingredient)
      added = added or added_expensive
    end
  end
  return added
end

--

-- @ recipe_name
-- @ ingredients
function krastorio.recipes.addIngredients(recipe_name, ingredients)
  local added_all = true
  local added = false
  for _, ingredient in pairs(ingredients) do
    added = krastorio.recipes.addIngredient(recipe_name, krastorio_utils.tables.fullCopy(ingredient))
    added_all = added_all and added
  end
  return added_all
end

--

-- @ ingredient
function krastorio.recipes.addIngredientToAllRecipes(ingredient)
  local count = 0
  if next(ingredient) ~= nil then
    for name, recipe in pairs(data.raw.recipe) do
      if krastorio.recipes.addIngredient(name, krastorio_utils.tables.fullCopy(ingredient)) then
        count = count + 1
      end
    end
  end
  return count
end

--

-- @ ingredients
function krastorio.recipes.addIngredientsToAllRecipes(ingredients)
  local total_count = 0
  for _, ingredient in pairs(ingredients) do
    total_count = total_count + krastorio.recipes.addIngredientToAllRecipes(ingredient)
  end
  return total_count
end

-- -- multiply

-- @ recipe_name
-- @ ingredient_name
-- @ multiplier
function krastorio.recipes.multiplyIngredient(recipe_name, ingredient_name, multiplier)
  local multiply = false
  -- normal
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  if next(ingredients) ~= nil then
    multiply = krastorio.recipes.multiply(ingredients, ingredient_name, multiplier)
    -- expensive
    local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
    if next(expensive_ingredients) ~= nil then
      local multiply_expensive = krastorio.recipes.multiply(expensive_ingredients, ingredient_name, multiplier)
      multiply = multiply or multiply_expensive
    end
  end
  return multiply
end

--

-- @ recipe_name
-- @ ingredient_name
-- @ multiplier
function krastorio.recipes.multiplyExpensiveIngredient(recipe_name, ingredient_name, multiplier)
  local multiply = false
  -- expensive
  local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
  if next(expensive_ingredients) ~= nil then
    local multiply_expensive = krastorio.recipes.multiply(expensive_ingredients, ingredient_name, multiplier)
    multiply = true
  end
  return multiply
end

--

-- @ recipe_name
-- @ ingredient_names
-- @ multiplier
function krastorio.recipes.multiplyIngredients(recipe_name, ingredient_names, multiplier)
  local multiply_all = true
  local multiply = false
  for _, ingredient_name in pairs(ingredient_names) do
    multiply = krastorio.recipes.multiplyIngredient(recipe_name, ingredient_name, multiplier)
    multiply_all = multiply_all and multiply
  end
  return multiply_all
end

--

-- @ recipe_name
-- @ ingredient_names
-- @ multiplier
function krastorio.recipes.multiplyExpensiveIngredients(recipe_name, ingredient_names, multiplier)
  local multiply_all = true
  local multiply = false
  for _, ingredient_name in pairs(ingredient_names) do
    multiply = krastorio.recipes.multiplyExpensiveIngredient(recipe_name, ingredient_name, multiplier)
    multiply_all = multiply_all and multiply
  end
  return multiply_all
end

--

-- @ recipe_name
-- @ ingredient_names
-- @ multiplier
function krastorio.recipes.multiplyAllExpensiveIngredients(recipe_name, multiplier, expensive_ingredients)
  local expensive_ingredients = expensive_ingredients or krastorio.recipes.getExpensiveIngredients(recipe_name)
  if expensive_ingredients and next(expensive_ingredients) ~= nil then
    for i, ingredient in pairs(expensive_ingredients) do
      if ingredient.amount then
        expensive_ingredients[i].amount = ingredient.amount * multiplier
      else
        expensive_ingredients[i][2] = ingredient[2] * multiplier
      end
    end
  end
  return true
end

--

-- @ ingredient_name
-- @ multiplier
function krastorio.recipes.multiplyIngredientToAllRecipes(ingredient_name, multiplier)
  local count = 0
  if ingredient_name ~= nil then
    for name, recipe in pairs(data.raw.recipe) do
      if krastorio.recipes.multiplyIngredient(name, ingredient_name, multiplier) then
        count = count + 1
      end
    end
  end
  return count
end

--

-- @ ingredient_names
-- @ multiplier
function krastorio.recipes.multiplyIngredientsToAllRecipes(ingredient_names, multiplier)
  local total_count = 0
  for _, ingredient_name in pairs(ingredient_names) do
    total_count = total_count + krastorio.recipes.multiplyIngredientToAllRecipes(ingredient_name, multiplier)
  end
  return total_count
end

-- replace

-- @ recipe_name
-- @ old_ingredient_name
-- @ new_ingredient
function krastorio.recipes.replaceIngredient(recipe_name, old_ingredient_name, new_ingredient)
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  local replaced = false
  if next(ingredients) ~= nil then
    replaced = krastorio.recipes.replace(ingredients, old_ingredient_name, new_ingredient)
    local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
    if next(expensive_ingredients) ~= nil then
      local expensive_replaced = krastorio.recipes.replace(expensive_ingredients, old_ingredient_name, new_ingredient)
      replaced = replaced or expensive_replaced
    end
  end
  return replaced
end

--

-- @ recipe_name
-- @ old_ingredient_names
-- @ new_ingredients
function krastorio.recipes.replaceIngredients(recipe_name, old_ingredient_names, new_ingredients)
  if type(old_ingredient_names) ~= "table" or type(new_ingredients) ~= "table" then
    return false
  end
  local replaced_all = true
  local replaced = false
  local i, old_ingredient_name = next(old_ingredient_names, nil)
  local j, ingredient = next(new_ingredients, nil)
  while i and j and type(ingredient) == "table" do
    replaced = krastorio.recipes.replaceIngredient(
      recipe_name,
      old_ingredient_name,
      krastorio_utils.tables.fullCopy(ingredient)
    )
    replaced_all = replaced_all and replaced
    i, old_ingredient_name = next(old_ingredient_names, i)
    j, ingredient = next(new_ingredients, j)
  end
  return replaced_all
end

--

-- @ old_ingredient_name
-- @ new_ingredient
function krastorio.recipes.replaceIngredientToAllRecipes(old_ingredient_name, new_ingredient)
  local count = 0
  if next(new_ingredient) ~= nil then
    for name, recipe in pairs(data.raw.recipe) do
      if
        krastorio.recipes.replaceIngredient(name, old_ingredient_name, krastorio_utils.tables.fullCopy(new_ingredient))
      then
        count = count + 1
      end
    end
  end
  return count
end

--

-- @ old_ingredient_names
-- @ new_ingredients
function krastorio.recipes.replaceIngredientsToAllRecipes(old_ingredient_names, new_ingredients)
  if type(old_ingredient_names) ~= "table" or type(new_ingredients) ~= "table" then
    return false
  end
  local total_count = 0
  local i, old_ingredient_name = next(old_ingredient_names, nil)
  local j, ingredient = next(new_ingredients, nil)
  while i and j and next(ingredient) ~= nil do
    total_count = total_count + krastorio.recipes.replaceIngredientToAllRecipes(old_ingredient_name, ingredient)
    i, old_ingredient_name = next(old_ingredient_names, i)
    j, ingredient = next(new_ingredients, j)
  end
  return total_count
end

-- -- add or replace

-- @ recipe_name
-- @ old_ingredient_name
-- @ new_ingredient
function krastorio.recipes.addOrReplaceIngredient(recipe_name, old_ingredient_name, new_ingredient)
  if old_ingredient_name == nil then
    return krastorio.recipes.addIngredient(recipe_name, new_ingredient)
  end
  local added = false
  -- normal
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  if next(ingredients) ~= nil then
    added = krastorio.recipes.addOrReplace(ingredients, old_ingredient_name, new_ingredient)
    -- expensive
    local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
    if next(expensive_ingredients) ~= nil then
      local added_expensive = krastorio.recipes.addOrReplace(expensive_ingredients, old_ingredient_name, new_ingredient)
      added = added or added_expensive
    end
  end
  return added
end

--

-- @ recipe_name
-- @ old_ingredient_names
-- @ new_ingredients
function krastorio.recipes.addOrReplaceIngredients(recipe_name, old_ingredient_names, new_ingredients)
  if type(old_ingredient_names) ~= "table" or type(new_ingredients) ~= "table" then
    return false
  end
  local i, old_ingredient_name = next(old_ingredient_names, nil)
  local j, ingredient = next(new_ingredients, nil)
  while j and type(ingredient) == "table" do
    if not old_ingredient_name then
      krastorio.recipes.addIngredient(recipe_name, krastorio_utils.tables.fullCopy(ingredient))
    else
      krastorio.recipes.addOrReplaceIngredient(
        recipe_name,
        old_ingredient_name,
        krastorio_utils.tables.fullCopy(ingredient)
      )
    end
    i, old_ingredient_name = next(old_ingredient_names, i)
    j, ingredient = next(new_ingredients, j)
  end
end

--

-- @ old_ingredient_name
-- @ new_ingredient
function krastorio.recipes.addOrReplaceIngredientToAllRecipes(old_ingredient_name, new_ingredient)
  for name, recipe in pairs(data.raw.recipe) do
    krastorio.recipes.addOrReplaceIngredient(name, old_ingredient_name, krastorio_utils.tables.fullCopy(new_ingredient))
  end
end

--

-- @ old_ingredient_names
-- @ new_ingredients
function krastorio.recipes.addOrReplaceIngredientsToAllRecipes(old_ingredient_names, new_ingredients)
  if type(old_ingredient_names) ~= "table" or type(new_ingredients) ~= "table" then
    return false
  end
  local i, old_ingredient_name = next(old_ingredient_names, nil)
  local j, ingredient = next(new_ingredients, nil)
  while j and type(ingredient) == "table" do
    krastorio.recipes.addOrReplaceIngredientToAllRecipes(old_ingredient_name, ingredient)
    i, old_ingredient_name = next(old_ingredient_names, i)
    j, ingredient = next(new_ingredients, j)
  end
end

-- convert

-- @ recipe_name
-- @ old_ingredient_names
-- @ new_ingredients
function krastorio.recipes.convertIngredient(recipe_name, old_ingredient_name, new_ingredient_name)
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  local converted = false
  if next(ingredients) ~= nil then
    -- normal
    converted = krastorio.recipes.convert(ingredients, old_ingredient_name, new_ingredient_name)
    -- expensive
    local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
    if next(expensive_ingredients) ~= nil then
      converted_expensive = krastorio.recipes.convert(expensive_ingredients, old_ingredient_name, new_ingredient_name)
      converted = converted or converted_expensive
    end
  end
  return converted
end

-- @ recipe_name
-- @ old_ingredient_names
-- @ new_ingredients
function krastorio.recipes.convertIngredients(recipe_name, old_ingredient_names, new_ingredient_names)
  if type(old_ingredient_names) ~= "table" or type(new_ingredient_names) ~= "table" then
    return false
  end
  local converted_all = true
  local converted = false
  local i, old_ingredient_name = next(old_ingredient_names, nil)
  local j, ingredient_name = next(new_ingredient_names, nil)
  while i and j and type(ingredient_name) == "table" do
    converted = krastorio.recipes.convertIngredient(recipe_name, old_ingredient_name, ingredient_name)
    converted_all = converted_all and converted
    i, old_ingredient_name = next(old_ingredient_names, i)
    j, ingredient_name = next(new_ingredient_names, j)
  end
  return converted_all
end

-- @ old_ingredient_name
-- @ new_ingredient
function krastorio.recipes.convertIngredientFromAllRecipes(old_ingredient_name, new_ingredient_name)
  local count = 0
  for name, recipe in pairs(data.raw.recipe) do
    if krastorio.recipes.convertIngredient(name, old_ingredient_name, new_ingredient_name) then
      count = count + 1
    end
  end
  return count
end

-- @ old_ingredient_names
-- @ new_ingredients
function krastorio.recipes.convertIngredientsFromAllRecipes(old_ingredient_names, new_ingredient_names)
  if type(old_ingredient_names) ~= "table" or type(new_ingredient_names) ~= "table" then
    return false
  end
  local total_count = 0
  local i, old_ingredient_name = next(old_ingredient_names, nil)
  local j, new_ingredient_name = next(new_ingredient_names, nil)
  while i and j and new_ingredient_name ~= nil do
    total_count = total_count
      + krastorio.recipes.convertIngredientFromAllRecipes(old_ingredient_name, new_ingredient_name)
    i, old_ingredient_name = next(old_ingredient_names, i)
    j, new_ingredient_name = next(new_ingredient_names, j)
  end
  return total_count
end

-- -- GROUP INGREDIENTS

-- @ group_name
-- @ ingredient_name
function krastorio.recipes.removeIngredientFromGroup(group_name, ingredient_name)
  if krastorio.recipes.recipes_groups[group_name] then
    for _, recipe_name in pairs(krastorio.recipes.recipes_groups[group_name]) do
      krastorio.recipes.removeIngredient(recipe_name, ingredient_name)
    end
    return true
  end
  return false
end

-- @ group_name
-- @ ingredient
function krastorio.recipes.addIngredientToGroup(group_name, ingredient)
  if krastorio.recipes.recipes_groups[group_name] then
    for _, recipe_name in pairs(krastorio.recipes.recipes_groups[group_name]) do
      krastorio.recipes.addIngredient(recipe_name, ingredient)
    end
    return true
  end
  return false
end

-- @ group_name
-- @ old_ingredient_name
-- @ new_ingredient
function krastorio.recipes.replaceIngredientToGroup(group_name, old_ingredient_name, new_ingredient)
  if krastorio.recipes.recipes_groups[group_name] then
    for _, recipe_name in pairs(krastorio.recipes.recipes_groups[group_name]) do
      krastorio.recipes.replaceIngredient(recipe_name, old_ingredient_name, new_ingredient)
    end
    return true
  end
  return false
end

-- @ group_name
-- @ old_ingredient_name
-- @ new_ingredient
function krastorio.recipes.addOrReplaceIngredientToGroup(group_name, old_ingredient_name, new_ingredient)
  if krastorio.recipes.recipes_groups[group_name] then
    for _, recipe_name in pairs(krastorio.recipes.recipes_groups[group_name]) do
      krastorio.recipes.addOrReplaceIngredient(recipe_name, old_ingredient_name, new_ingredient)
    end
    return true
  end
  return false
end

-- @ group_name
-- @ old_ingredient_name
-- @ new_ingredient_name
function krastorio.recipes.convertIngredientToGroup(group_name, old_ingredient_name, new_ingredient_name)
  if krastorio.recipes.recipes_groups[group_name] then
    for _, recipe_name in pairs(krastorio.recipes.recipes_groups[group_name]) do
      krastorio.recipes.convertIngredient(recipe_name, old_ingredient_name, new_ingredient_name)
    end
    return true
  end
  return false
end

-- -- PRODUCTS

function krastorio.recipes.overrideProducts(recipe_name, new_products, new_expensive_products)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
  if recipe and next(recipe) then
    -- normal ingredients
    if recipe.normal then
      recipe.normal.result = nil
      recipe.normal.results = new_products
      recipe.normal.result_count = nil
    else
      recipe.result = nil
      recipe.results = table.deepcopy(new_products)
      recipe.result_count = nil
    end
    -- expensive ingredients
    if recipe.expensive then
      recipe.expensive.result = nil
      recipe.expensive.results = new_expensive_products or table.deepcopy(new_products)
      recipe.expensive.result_count = nil
    end
    return true
  end
  return false
end

-- -- remove

-- @ recipe_name
-- @ product_name
function krastorio.recipes.removeProduct(recipe_name, product_name)
  local products = krastorio.recipes.getProducts(recipe_name)
  if next(products) ~= nil then
    return krastorio.recipes.remove(products, product_name)
  end
  return false
end

--

-- @ recipe_name
-- @ product_names
function krastorio.recipes.removeProducts(recipe_name, product_names)
  local removed_all = true
  local removed = false
  for _, product_name in pairs(product_names) do
    removed = krastorio.recipes.removeProduct(recipe_name, product_name)
    removed_all = removed_all and removed
  end
  return removed_all
end

--

-- @ product_name
function krastorio.recipes.removeProductFromAllRecipes(product_name)
  local count = 0
  for name, recipe in pairs(data.raw.recipe) do
    if krastorio.recipes.removeProduct(name, product_name) then
      count = count + 1
    end
  end
  return count
end

--

-- @ product_names
function krastorio.recipes.removeProductsFromAllRecipes(product_names)
  local total_count = 0
  for _, product_name in pairs(product_names) do
    total_count = total_count + krastorio.recipes.removeProductFromAllRecipes(product_name)
  end
  return total_count
end

-- -- add

-- @ recipe_name
-- @ product
function krastorio.recipes.addProduct(recipe_name, product)
  local products = krastorio.recipes.getProducts(recipe_name)
  if next(products) ~= nil then
    local added = krastorio.recipes.add(products, product)
    local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
    if added and (#products > 1 and (not (recipe.icon and recipe.subgroup) or recipe.main_product)) then
      local i, product = next(products)
      recipe.main_product = product.name
      if not (recipe.icon or recipe.icons) then
        krastorio_utils.log.write(3, string.format("Maybe %s recipe needs the icon to be set correctly.", recipe.name))
      end
    end
    return added
  end
  return false
end

--

-- @ recipe_name
-- @ products
function krastorio.recipes.addProducts(recipe_name, products)
  local added_all = true
  local added = false
  for _, product in pairs(products) do
    added = krastorio.recipes.addProduct(recipe_name, krastorio_utils.tables.fullCopy(product))
    added_all = added_all and added
  end
  return added_all
end

--

-- @ product
function krastorio.recipes.addProductToAllRecipes(product)
  local count = 0
  if next(product) ~= nil then
    for name, recipe in pairs(data.raw.recipe) do
      if krastorio.recipes.addProduct(name, krastorio_utils.tables.fullCopy(product)) then
        count = count + 1
      end
    end
  end
  return count
end

--

-- @ products
function krastorio.recipes.addProductsToAllRecipes(products)
  local total_count = 0
  for _, product in pairs(products) do
    total_count = total_count + krastorio.recipes.addProductToAllRecipes(product)
  end
  return total_count
end

-- multiply

-- @ recipe_name
-- @ product_name
-- @ multiplier
function krastorio.recipes.multiplyProduct(recipe_name, product_name, multiplier)
  local multiplied = false
  local products = krastorio.recipes.getProducts(recipe_name)
  if next(products) ~= nil then
    multiplied = krastorio.recipes.multiply(products, product_name, multiplier)
  end
  return multiplied
end

-- @ recipe_name
-- @ product_names
-- @ multiplier
function krastorio.recipes.multiplyProducts(recipe_name, product_names, multiplier)
  local multiplied_all = true
  local multiplied = false
  for _, product_name in pairs(product_names) do
    multiplied = krastorio.recipes.multiplyProduct(recipe_name, product_name, multiplier)
    multiplied_all = multiplied_all and multiplied
  end
  return multiplied_all
end

--

-- @ product_name
-- @ multiplier
function krastorio.recipes.multiplyProductToAllRecipes(product_name, multiplier)
  local count = 0
  if product_name ~= nil then
    for name, recipe in pairs(data.raw.recipe) do
      if krastorio.recipes.multiplyProduct(name, product_name, multiplier) then
        count = count + 1
      end
    end
  end
  return count
end

--

-- @ product_names
-- @ multiplier
function krastorio.recipes.multiplyProductsToAllRecipes(product_names, multiplier)
  local total_count = 0
  for _, product_name in pairs(product_names) do
    total_count = total_count + krastorio.recipes.multiplyProductToAllRecipes(product_name, multiplier)
  end
  return total_count
end

-- replace

-- @ recipe_name
-- @ old_product_name
-- @ new_product
function krastorio.recipes.replaceProduct(recipe_name, old_product_name, new_product)
  local products = krastorio.recipes.getProducts(recipe_name)
  if next(products) ~= nil then
    return krastorio.recipes.replace(products, old_product_name, new_product)
  end
  return false
end

--

-- @ recipe_name
-- @ old_product_names
-- @ new_products
function krastorio.recipes.replaceProducts(recipe_name, old_product_names, new_products)
  if type(old_product_names) ~= "table" or type(new_products) ~= "table" then
    return false
  end
  local replaced_all = true
  local replaced = false
  local i, old_product_name = next(old_product_names, nil)
  local j, product = next(new_products, nil)
  while i and j and type(product) == "table" do
    replaced = krastorio.recipes.replaceProduct(recipe_name, old_product_name, krastorio_utils.tables.fullCopy(product))
    replaced_all = replaced_all and replaced
    i, old_product_name = next(old_product_names, i)
    j, product = next(new_products, j)
  end
  return replaced_all
end

--

-- @ old_product_name
-- @ new_product
function krastorio.recipes.replaceProductToAllRecipes(old_product_name, new_product)
  local count = 0
  if next(new_product) ~= nil then
    for name, recipe in pairs(data.raw.recipe) do
      if krastorio.recipes.replaceProduct(name, old_product_name, krastorio_utils.tables.fullCopy(new_product)) then
        count = count + 1
      end
    end
  end
  return count
end

--

-- @ old_product_names
-- @ new_products
function krastorio.recipes.replaceProductsToAllRecipes(old_product_names, new_products)
  if type(old_product_names) ~= "table" or type(new_products) ~= "table" then
    return false
  end
  local total_count = 0
  local i, old_product_name = next(old_product_names, nil)
  local j, product = next(new_products, nil)
  while i and j and next(product) ~= nil do
    total_count = total_count + krastorio.recipes.replaceProductToAllRecipes(old_product_name, product)
    i, old_product_name = next(old_product_names, i)
    j, product = next(new_products, j)
  end
  return total_count
end

-- -- add or replace

-- @ recipe_name
-- @ old_product_name
-- @ new_product
function krastorio.recipes.addOrReplaceProduct(recipe_name, old_product_name, new_product)
  if old_product_name == nil then
    return krastorio.recipes.addProduct(recipe_name, new_product)
  end
  local products = krastorio.recipes.getProducts(recipe_name)
  if next(products) ~= nil then
    local added = krastorio.recipes.addOrReplace(products, old_product_name, new_product)
    local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
    if #products > 1 and (not (recipe.icon and recipe.subgroup) or recipe.main_product) then
      local i, product = next(products)
      recipe.main_product = product.name
      krastorio_utils.log.write(3, string.format("Maybe %s recipe needs the icon to be set correctly.", recipe.name))
    end
    return added
  end
  return false
end

--

-- @ recipe_name
-- @ old_product_names
-- @ new_products
function krastorio.recipes.addOrReplaceProducts(recipe_name, old_product_names, new_products)
  if type(old_product_names) ~= "table" or type(new_products) ~= "table" then
    return false
  end
  local i, old_product_name = next(old_product_names, nil)
  local j, product = next(new_products, nil)
  while j and type(product) == "table" do
    if not old_product_name then
      krastorio.recipes.addProduct(recipe_name, krastorio_utils.tables.fullCopy(product))
    else
      krastorio.recipes.addOrReplaceProduct(recipe_name, old_product_name, krastorio_utils.tables.fullCopy(product))
    end
    i, old_product_name = next(old_product_names, i)
    j, product = next(new_products, j)
  end
end

--

-- @ old_product_name
-- @ new_product
function krastorio.recipes.addOrReplaceProductToAllRecipes(old_product_name, new_product)
  for name, recipe in pairs(data.raw.recipe) do
    krastorio.recipes.addOrReplaceProduct(name, old_product_name, krastorio_utils.tables.fullCopy(new_product))
  end
end

--

-- @ old_product_names
-- @ new_products
function krastorio.recipes.addOrReplacProductsToAllRecipes(old_product_names, new_products)
  if type(old_product_names) ~= "table" or type(new_products) ~= "table" then
    return false
  end
  local i, old_product_name = next(old_product_names, nil)
  local j, product = next(new_products, nil)
  while j and type(product) == "table" do
    krastorio.recipes.addOrReplaceProductToAllRecipes(old_product_name, product)
    i, old_product_name = next(old_product_names, i)
    j, product = next(new_products, j)
  end
end

-- convert

-- @ recipe_name
-- @ old_product_name
-- @ new_product
function krastorio.recipes.convertProduct(recipe_name, old_product_name, new_product_name)
  local products = krastorio.recipes.getProducts(recipe_name)
  if next(products) ~= nil then
    return krastorio.recipes.convert(products, old_product_name, new_product_name)
  end
  return false
end

--

-- @ recipe_name
-- @ old_product_names
-- @ new_products
function krastorio.recipes.convertProducts(recipe_name, old_product_names, new_product_names)
  if type(old_product_names) ~= "table" or type(new_product_names) ~= "table" then
    return false
  end
  local converted_all = true
  local converted = false
  local i, old_product_name = next(old_product_names, nil)
  local j, new_product_name = next(new_product_names, nil)
  while i and j and new_product_name ~= nil do
    converted = krastorio.recipes.convertProduct(recipe_name, old_product_name, new_product_name)
    converted_all = converted_all and converted
    i, old_product_name = next(old_product_names, i)
    j, new_product_name = next(new_product_names, j)
  end
  return converted_all
end

--

-- @ old_product_name
-- @ new_product
function krastorio.recipes.convertProductFromAllRecipes(old_product_name, new_product_name)
  local count = 0
  for name, recipe in pairs(data.raw.recipe) do
    if krastorio.recipes.convertProduct(name, old_product_name, new_product_name) then
      count = count + 1
    end
  end
  return count
end

--

-- @ old_product_names
-- @ new_products
function krastorio.recipes.convertProductsFromAllRecipes(old_product_names, new_product_names)
  if type(old_product_names) ~= "table" or type(new_product_names) ~= "table" then
    return false
  end
  local total_count = 0
  local i, old_product_name = next(old_product_names, nil)
  local j, new_product_name = next(new_product_names, nil)
  while i and j and new_product_name ~= nil do
    total_count = total_count + krastorio.recipes.convertProductFromAllRecipes(old_product_name, new_product_name)
    i, old_product_name = next(old_product_names, i)
    j, new_product_name = next(new_product_names, j)
  end
  return total_count
end

-- -- GROUP PRODUCTS

-- @ group_name
-- @ product_name
function krastorio.recipes.removeProductFromGroup(group_name, product_name)
  if krastorio.recipes.recipes_groups[group_name] then
    for _, recipe_name in pairs(krastorio.recipes.recipes_groups[group_name]) do
      krastorio.recipes.removeProduct(recipe_name, product_name)
    end
    return true
  end
  return false
end

-- @ group_name
-- @ product
function krastorio.recipes.addProductToGroup(group_name, product)
  if krastorio.recipes.recipes_groups[group_name] then
    for _, recipe_name in pairs(krastorio.recipes.recipes_groups[group_name]) do
      krastorio.recipes.addProduct(recipe_name, product)
    end
    return true
  end
  return false
end

-- @ group_name
-- @ old_product_name
-- @ new_product
function krastorio.recipes.replaceProductToGroup(group_name, old_product_name, new_product)
  if krastorio.recipes.recipes_groups[group_name] then
    for _, recipe_name in pairs(krastorio.recipes.recipes_groups[group_name]) do
      krastorio.recipes.replaceProduct(recipe_name, old_product_name, new_product)
    end
    return true
  end
  return false
end

-- @ group_name
-- @ old_product_name
-- @ new_product
function krastorio.recipes.addOrReplaceProductToGroup(group_name, old_product_name, new_product)
  if krastorio.recipes.recipes_groups[group_name] then
    for _, recipe_name in pairs(krastorio.recipes.recipes_groups[group_name]) do
      krastorio.recipes.addOrReplaceProduct(recipe_name, old_product_name, new_product)
    end
    return true
  end
  return false
end

-- @ group_name
-- @ old_product_name
-- @ new_product_name
function krastorio.recipes.convertProductToGroup(group_name, old_product_name, new_product_name)
  if krastorio.recipes.recipes_groups[group_name] then
    for _, recipe_name in pairs(krastorio.recipes.recipes_groups[group_name]) do
      krastorio.recipes.convertProduct(recipe_name, old_product_name, new_product_name)
    end
    return true
  end
  return false
end

-- -- -- OTHERS

-- @ recipe
function krastorio.recipes.addWithOverrideSafeNewRecipe(recipe)
  if recipe.type == "recipe" and recipe.name then
    if data.raw.recipe[recipe.name] then
      local suffix = 2
      while data.raw.recipe[recipe.name .. "-" .. suffix] do
        suffix = suffix + 1
      end
      if not recipe.localised_name then
        -- FIXME: Don't naively use `item-name` and `recipe-name`, use the actual localised names
        if recipe.result then
          recipe.localised_name = {
            "other.krastorio-recipe-variation-n",
            { "item-name." .. recipe.result },
            tostring(suffix),
          }
        else
          recipe.localised_name = {
            "other.krastorio-recipe-variation-n",
            { "recipe-name." .. recipe.name },
            tostring(suffix),
          }
        end
      end
      -- log activity
      krastorio_utils.log.write(
        3,
        string.format(
          "Avoided recipe override chaning recipe name from %s to %s",
          recipe.name,
          recipe.name .. "-" .. suffix
        )
      )
      -- apply
      krastorio.recipes.changed_names[recipe.name] = recipe.name .. "-" .. suffix
      recipe.name = recipe.name .. "-" .. suffix
    end
    data:extend({ recipe })
  end
end

-- @ recipe_name
-- @ multiplier
function krastorio.recipes.multiplyRecipeStat(recipe_name, multiplier, only_ingredients)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)

  if recipe then
    -- ingredients
    local ingredients = krastorio.recipes.getIngredients(recipe_name)
    if next(ingredients) ~= nil then
      for i, ingredient in pairs(ingredients) do
        if ingredient.amount then
          ingredients[i].amount = ingredient.amount * multiplier
        elseif ingredient.amount_min then -- guaranteed to have both amount_min and amount_max
          ingredient.amount_min = ingredient.amount_min * multiplier
          ingredient.amount_max = ingredient.amount_max * multiplier
        else
          ingredients[i][2] = ingredient[2] * multiplier
        end
        if ingredient.catalyst_amount and ingredient.catalyst_amount > 0 then
          ingredient.catalyst_amount = ingredient.catalyst_amount * multiplier
        end
      end
    end

    local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
    if expensive_ingredients and next(expensive_ingredients) ~= nil then
      for i, ingredient in pairs(expensive_ingredients) do
        if ingredient.amount then
          expensive_ingredients[i].amount = ingredient.amount * multiplier
        elseif ingredient.amount_min then -- guaranteed to have both amount_min and amount_max
          ingredient.amount_min = ingredient.amount_min * multiplier
          ingredient.amount_max = ingredient.amount_max * multiplier
        else
          expensive_ingredients[i][2] = ingredient[2] * multiplier
        end
        if ingredient.catalyst_amount and ingredient.catalyst_amount > 0 then
          ingredient.catalyst_amount = ingredient.catalyst_amount * multiplier
        end
      end
    end

    -- products
    if not only_ingredients or only_ingredients ~= true then
      local products = krastorio.recipes.getProducts(recipe_name)
      if next(products) ~= nil then
        for i, product in pairs(products) do
          if product.amount then
            products[i].amount = product.amount * multiplier
          elseif product.amount_min then -- guaranteed to have both amount_min and amount_max
            product.amount_min = product.amount_min * 2
            product.amount_max = product.amount_max * 2
          else
            products[i][2] = product[2] * multiplier
          end
          if product.catalyst_amount and product.catalyst_amount > 0 then
            product.catalyst_amount = product.catalyst_amount * multiplier
          end
        end
        if recipe.expensive and recipe.expensive.results then
          recipe.expensive.results = products
        end
      end
    end

    -- energy required/time to craft
    if recipe.energy_required then
      recipe.energy_required = recipe.energy_required * multiplier
    elseif recipe.ingredients then
      recipe.energy_required = 0.5 * multiplier
    end
    if recipe.normal then
      if recipe.normal.energy_required then
        recipe.normal.energy_required = recipe.normal.energy_required * multiplier
      else
        recipe.normal.energy_required = 0.5 * multiplier
      end
    end
    if recipe.expensive then
      if recipe.expensive.energy_required then
        recipe.expensive.energy_required = recipe.expensive.energy_required * multiplier
      else
        recipe.expensive.energy_required = 0.5 * multiplier
      end
    end
  end
end

-- @ recipe_name
-- @ category_name
-- return a category
function krastorio.recipes.existRecipesCategory(category_name)
  if type(category_name) == "string" then
    for name, category in pairs(data.raw["recipe-category"]) do
      if name == category_name then
        return true
      end
    end
  end
  return false
end

-- @ recipe_name
-- @ category_name
function krastorio.recipes.setCategoryIfExist(recipe_name, category_name)
  local category = krastorio.recipes.existRecipesCategory(category_name)
  if category then
    local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
    if recipe then
      recipe.category = category_name
    end
  end
end

-- @ old_category_name
-- @ new_category_name
function krastorio.recipes.migrateCategory(old_category_name, new_category_name)
  -- remove old category
  if data.raw["recipe-category"][old_category_name] then
    data.raw["recipe-category"][old_category_name] = nil
  end
  -- create new category if not exist
  if data.raw["recipe-category"][new_category_name] then
    data:extend({
      {
        type = "recipe-category",
        name = new_category_name,
      },
    })
  end
  -- change category in machines
  for _, prototypes_type in pairs({ "assembling-machine", "furnace" }) do
    for _, prototype in pairs(data.raw[prototypes_type]) do
      for i, category in pairs(prototype.crafting_categories) do
        if category == old_category_name then
          table.remove(prototype.crafting_categories, i)
          table.insert(prototype.crafting_categories, new_category_name)
        end
      end
    end
  end
  -- change in recipes
  for _, recipe in pairs(data.raw.recipe) do
    if recipe.category == old_category_name then
      recipe.category = new_category_name
    end
  end
end

-- @ recipe_name
-- @ group_name
function krastorio.recipes.addRecipeToGroup(recipe_name, group_name)
  if not krastorio.recipes.recipes_groups[group_name] then
    krastorio.recipes.recipes_groups[group_name] = {}
  end
  table.insert(krastorio.recipes.recipes_groups[group_name], recipe_name)
end

-- @ recipe_name
-- @ group_name
function krastorio.recipes.removeRecipeFromGroup(recipe_name, group_name)
  if krastorio.recipes.recipes_groups[group_name] then
    if krastorio.recipes.recipes_groups[group_name][recipe_name] then
      table.remove(krastorio.recipes.recipes_groups[group_name], recipe_name)
      if not next(krastorio.recipes.recipes_groups[group_name]) then
        table.remove(krastorio.recipes.recipes_groups, group_name)
      end
    end
  end
end

-- @ recipe_name
-- @ energy_cost
-- @ expensive_cost(?)
function krastorio.recipes.setEnergyCost(recipe_name, energy_cost, expensive_cost)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)

  if recipe then
    if recipe.energy_required or not (recipe.normal == nil or recipe.expensive == nil) then
      recipe.energy_required = energy_cost
    elseif recipe.ingredients then
      recipe.energy_required = energy_cost
    end
    if recipe.normal then
      recipe.normal.energy_required = energy_cost
    end
    if recipe.expensive then
      recipe.expensive.energy_required = expensive_cost or energy_cost
    end
  end
end

-- @ recipe_name
-- @ result_count
function krastorio.recipes.setRecipeResultCount(recipe_name, result_count)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)

  if recipe ~= nil then
    if
      not recipe.result_count
      and not (recipe.normal and recipe.normal.result_count)
      and not (recipe.expensive and recipe.expensive.result_count)
    then
      if recipe and recipe.ingredients then
        recipe.result_count = result_count
      end
      if recipe.normal ~= nil and recipe.normal.ingredients then
        recipe.normal.result_count = result_count
      end
      if recipe.expensive ~= nil then
        recipe.expensive.result_count = result_count
      end
    else
      if recipe.result_count ~= nil then
        recipe.result_count = result_count
      end
      if recipe.normal ~= nil and recipe.normal.ingredients and recipe.normal.result_count ~= nil then
        recipe.normal.result_count = result_count
      end
      if recipe.expensive ~= nil and recipe.expensive.ingredients and recipe.expensive.result_count ~= nil then
        recipe.expensive.result_count = result_count
      end
    end
  end
end

-- @ recipe_name
function krastorio.recipes.restoreRecipeToVanilla(recipe_name)
  krastorio_utils.recipes_backup_utils.restoreRecipeToVanilla(recipe_name)
end

-- @ recipe_name
function krastorio.recipes.uniteDuplicateItemsOfRecipe(recipe_name)
  local ingredients = krastorio.recipes.getIngredients(recipe_name)
  if next(ingredients) ~= nil then
    krastorio.recipes.uniteDuplicateItems(ingredients)
    local expensive_ingredients = krastorio.recipes.getExpensiveIngredients(recipe_name)
    if next(expensive_ingredients) ~= nil then
      krastorio.recipes.uniteDuplicateItems(expensive_ingredients)
    end
  end
end

-- -- ENABLE/DISABLE

-- @ recipe_name
-- @ state
function krastorio.recipes.changeEnabledState(recipe_name, state)
  local recipe = krastorio.recipes.getRecipeFromName(recipe_name)
  if recipe then
    if recipe.enabled ~= nil or recipe.normal == nil then
      recipe.enabled = state or false
    end
    if recipe.normal and (recipe.normal.enabled ~= nil or recipe.enabled == nil) then
      recipe.normal.enabled = state or false
    end
    if recipe.expensive and (recipe.expensive.enabled ~= nil or recipe.enabled == nil) then
      recipe.expensive.enabled = state or false
    end
  end
end

-- @ recipe_name
function krastorio.recipes.enable(recipe_name)
  krastorio.recipes.changeEnabledState(recipe_name, true)
end

--

-- @ recipe_name
function krastorio.recipes.disable(recipe_name)
  krastorio.recipes.changeEnabledState(recipe_name, false)
end

-- -- DEBUG

function krastorio.recipes.findNotUnlockableRecipes()
  -- list all disabled recipes
  local all_recipes = {}
  local recipe_name = nil
  for index_name, recipe in pairs(data.raw.recipe) do
    if
      recipe.enabled == false
      or (recipe.normal and recipe.normal.enabled == false)
      or (recipe.expensive and recipe.expensive.enabled == false)
    then
      recipe_name = recipe.name or index_name
      all_recipes[recipe_name] = true
    end
  end
  -- remove what compair in tech
  for _, tech in pairs(data.raw.technology) do
    if tech.effects then
      for _, effect in pairs(tech.effects) do
        if effect.type == "unlock-recipe" and effect.recipe then
          all_recipes[effect.recipe] = nil
        end
      end
    end
  end
  -- remove recipes that is unlockable by default
  local default_locked_vanilla_recipes = {
    "loader",
    "railgun-dart",
    "player-port",
    "railgun",
    "fast-loader",
    "express-loader",
    "small-plane",
    "electric-energy-interface",
  }
  for _, recipe_name in pairs(default_locked_vanilla_recipes) do
    all_recipes[recipe_name] = nil
  end
  local default_locked_creative_mod = {
    "creative-mod_creative-chest",
    "creative-mod_creative-provider-chest",
    "creative-mod_autofill-requester-chest",
    "creative-mod_duplicating-chest",
    "creative-mod_duplicating-provider-chest",
    "creative-mod_void-requester-chest",
    "creative-mod_void-storage-chest",
    "creative-mod_super-loader",
    "creative-mod_creative-cargo-wagon",
    "creative-mod_duplicating-cargo-wagon",
    "creative-mod_void-cargo-wagon",
    "creative-mod_super-logistic-robot",
    "creative-mod_super-construction-robot",
    "creative-mod_super-roboport",
    "creative-mod_fluid-source",
    "creative-mod_fluid-void",
    "creative-mod_super-boiler",
    "creative-mod_super-cooler",
    "creative-mod_configurable-super-boiler",
    "creative-mod_heat-source",
    "creative-mod_heat-void",
    "creative-mod_item-source",
    "creative-mod_duplicator",
    "creative-mod_item-void",
    "creative-mod_random-item-source",
    "creative-mod_creative-lab",
    "creative-mod_active-electric-energy-interface-output",
    "creative-mod_passive-electric-energy-interface",
    "creative-mod_active-electric-energy-interface-input",
    "creative-mod_energy-source",
    "creative-mod_passive-energy-source",
    "creative-mod_energy-void",
    "creative-mod_passive-energy-void",
    "creative-mod_super-electric-pole",
    "creative-mod_super-substation",
    "creative-mod_energy-absorption",
    "creative-mod_magic-wand-creator",
    "creative-mod_magic-wand-healer",
    "creative-mod_magic-wand-modifier",
    "creative-mod_super-radar",
    "creative-mod_super-radar-2",
    "creative-mod_alien-attractor-small",
    "creative-mod_alien-attractor-medium",
    "creative-mod_alien-attractor-large",
    "creative-mod_super-beacon",
    "creative-mod_super-speed-module",
    "creative-mod_super-effectivity-module",
    "creative-mod_super-productivity-module",
    "creative-mod_super-clean-module",
    "creative-mod_super-slow-module",
    "creative-mod_super-consumption-module",
    "creative-mod_super-pollution-module",
    "infinity-chest",
    "creative-mod_belt-immunity-equipment",
    "creative-mod_super-fusion-reactor-equipment",
    "creative-mod_super-personal-roboport-equipment",
  }
  for _, recipe_name in pairs(default_locked_creative_mod) do
    all_recipes[recipe_name] = nil
  end
  -- gettin remain results
  local not_unlockable_recipe_names = {}
  for recipe_name, _ in pairs(all_recipes) do
    table.insert(not_unlockable_recipe_names, recipe_name)
  end
  -- print result in log before return the list
  if next(not_unlockable_recipe_names) == nil then
    krastorio_utils.log.write(1, string.format("All recipes are unlockable."))
  else
    local inspect = require(kr_private_lib .. "/utils/inspect")
    krastorio_utils.log.write(
      3,
      string.format(
        "This recipes are not unlockable, maybe is an error: %s [from findNotUnlockableRecipes()]",
        inspect(not_unlockable_recipe_names)
      )
    )
  end
  return not_unlockable_recipe_names
end

--
