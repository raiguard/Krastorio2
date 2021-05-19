-- For each recipe that is in smelting
-- multiply by 5 the recipe stat for avoid overmodule bug effect
for name, recipe in pairs(data.raw.recipe) do
  local energy_required = krastorio.recipes.normalEnergyRequired(name) or 3.2
  if recipe.category and recipe.category == "smelting" and energy_required < 6.4 then -- Smelting
    if not recipe.energy_required then
      krastorio.recipes.setEnergyCost(name, 3.2)
    end
    krastorio.recipes.multiplyRecipeStat(name, 5)
  elseif recipe.category and recipe.category == "chemistry" and energy_required < 2.0 then -- Chemical
    if not recipe.energy_required then
      krastorio.recipes.setEnergyCost(name, 0.5)
    end
    if energy_required >= 1.0 then
      krastorio.recipes.multiplyRecipeStat(name, 2)
    else
      krastorio.recipes.multiplyRecipeStat(name, 4)
    end
  elseif not recipe.category or recipe.category == "crafting" then -- Intermediate crafting
    local recipe_item = krastorio.items.getItem(name) or false

    if
      recipe_item
      and recipe_item.subgroup
      and recipe_item.subgroup == "intermediate-product"
      and energy_required < 2.0
    then
      if not recipe.energy_required then
        krastorio.recipes.setEnergyCost(name, 0.5)
      end
      if energy_required >= 1.0 then
        krastorio.recipes.multiplyRecipeStat(name, 2)
      else
        krastorio.recipes.multiplyRecipeStat(name, 4)
      end
    end
  end
end
