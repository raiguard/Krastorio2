--- @type table<string, boolean>
local crushing_ingredients = {}
for _, recipe in pairs(data.raw.recipe) do
  if recipe.category and recipe.category == "crushing" then
    for _, ingredient in pairs(recipe.ingredients) do
      crushing_ingredients[ingredient.name] = true
    end
  end
end

for prototype_type in pairs(defines.prototypes.item) do
  if prototype_type ~= "module" then
    for item_name in pairs(data.raw[prototype_type] or {}) do
      if not crushing_ingredients[item_name] then
        data:extend({
          {
            type = "recipe",
            name = "kr-crush-" .. item_name,
            icon = "__Krastorio2Assets__/icons/recipes/trash.png",
            category = "void-crushing",
            hidden = true,
            hide_from_stats = true,
            energy_required = 2,
            ingredients = { { type = "item", name = item_name, amount = 1 } },
          },
        })
      end
    end
  end
end
