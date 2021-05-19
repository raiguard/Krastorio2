if mods["Load-Furn"] then
  if data.raw.recipe["cool"] then
    krastorio.recipes.replaceIngredient("cool", "wood", { "wood", 16 })
    krastorio.recipes.replaceProduct("cool", "coal", { "coal", 4 })
  end
end
