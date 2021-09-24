-- For each item load that can't be produced by crushers
-- will create a recipe that give 0 void item consuming the input

-- calculate all product that can be processed in "crushing" category
local crushing_ingredients = {}
for recipe_name, recipe in pairs(data.raw.recipe) do
  if recipe.category and recipe.category == "crushing" then
    for _, ingredient in pairs(krastorio.recipes.getIngredients(recipe_name)) do
      crushing_ingredients[krastorio.recipes.getIngredientName(ingredient)] = true
    end
    for _, ingredient in pairs(krastorio.recipes.getExpensiveIngredients(recipe_name)) do
      crushing_ingredients[krastorio.recipes.getIngredientName(ingredient)] = true
    end
  end
end

-- this prefix is exclusive of void crushing recipes
local void_crushing_recipes_prefix = "kr-vc-"

-- creating void crushing recipes
for _, type_name in pairs(krastorio.items.item_types) do
  if type_name ~= "fluid" then
    for item_name, _ in pairs(data.raw[type_name]) do
      if not crushing_ingredients[item_name] then
        data:extend({
          {
            type = "recipe",
            name = void_crushing_recipes_prefix .. item_name,
            icon = kr_recipes_icons_path .. "trash.png",
            icon_size = 64,
            category = "void-crushing",
            hidden = true,
            hide_from_stats = true,
            energy_required = 2,
            ingredients = { { item_name, 1 } },
            results = { { "kr-void", 0 } },
          },
        })
      end
    end
  end
end
