for _, recipe in pairs(data.raw.recipe) do
  for _, ingredient in pairs(recipe.ingredients or {}) do
    if ingredient.name == "nuclear-fuel" then
      ingredient.name = "rocket-fuel"
    end
  end
end
