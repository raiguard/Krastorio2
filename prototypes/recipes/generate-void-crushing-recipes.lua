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
for type_name in pairs(defines.prototypes.item) do
  if type_name ~= "fluid" and type_name ~= "module" then
    -- TODO: Investigate why `item-with-inventory` has no members.
    for item_name, _ in pairs(data.raw[type_name] or {}) do
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
            ingredients = { { type = "item", name = item_name, amount = 1 } },
            results = { { type = "item", name = "kr-void", amount = 0 } },
          },
        })
      end
    end
  end
end
