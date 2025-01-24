local flib_locale = require("__flib__.locale")
local flib_prototypes = require("__flib__.prototypes")

--- @type table<string, boolean>
local crushing_ingredients = {}
for _, recipe in pairs(data.raw.recipe) do
  if recipe.category and recipe.category == "crushing" then
    for _, ingredient in pairs(recipe.ingredients) do
      crushing_ingredients[ingredient.name] = true
    end
  end
end

for _, item in pairs(flib_prototypes.all("item")) do
  if item.type ~= "module" and not crushing_ingredients[item.name] then
    data:extend({
      {
        type = "recipe",
        name = "kr-crush-" .. item.name,
        localised_name = {
          "recipe-name.kr-crush",
          flib_locale.of(item),
        },
        icon = "__Krastorio2Assets__/icons/recipes/trash.png",
        category = "void-crushing",
        hidden = true,
        hide_from_stats = true,
        energy_required = 2,
        ingredients = { { type = "item", name = item.name, amount = 1 } },
      },
    })
  end
end
