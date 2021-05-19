-- Compatibility for RealisticReactors-utilities provided by Aristine-06/08/2020-v1

if mods["RealisticReactors"] then
  data.raw.recipe["realistic-reactor"].energy_required = 120
  data.raw.recipe["realistic-reactor"].category = "crafting-with-fluid"
  krastorio.recipes.replaceIngredient("realistic-reactor", "concrete", { "concrete", 500 })
  krastorio.recipes.replaceIngredient("realistic-reactor", "steel-plate", { "steel-plate", 200 })
  krastorio.recipes.replaceIngredient("realistic-reactor", "advanced-circuit", { "advanced-circuit", 200 })
  krastorio.recipes.replaceIngredient("realistic-reactor", "copper-plate", { "copper-plate", 200 })
  krastorio.recipes.addIngredient("realistic-reactor", { "rare-metals", 200 })
  data.raw.recipe["breeder-reactor"].energy_required = 120
  data.raw.recipe["breeder-reactor"].category = "crafting-with-fluid"
  krastorio.recipes.replaceIngredient("breeder-reactor", "concrete", { "concrete", 500 })
  krastorio.recipes.replaceIngredient("breeder-reactor", "steel-plate", { "steel-plate", 200 })
  krastorio.recipes.replaceIngredient("breeder-reactor", "advanced-circuit", { "advanced-circuit", 200 })
  krastorio.recipes.replaceIngredient("breeder-reactor", "copper-plate", { "copper-plate", 200 })
  krastorio.recipes.addIngredient("breeder-reactor", { "rare-metals", 200 })
  data.raw.recipe["rr-cooling-tower"].energy_required = 30
  data.raw.recipe["rr-cooling-tower"].category = "crafting-with-fluid"
  krastorio.recipes.replaceIngredient("rr-cooling-tower", "steel-plate", { "steel-plate", 50 })
  krastorio.recipes.addIngredient("rr-cooling-tower", { "rare-metals", 50 })
  data.raw.recipe["reactor-sarcophagus"].energy_required = 240
  data.raw.recipe["reactor-sarcophagus"].category = "crafting-with-fluid"
  krastorio.recipes.replaceIngredient("reactor-sarcophagus", "steel-plate", { "steel-plate", 400 })
  krastorio.recipes.replaceIngredient("reactor-sarcophagus", "advanced-circuit", { "advanced-circuit", 50 })
  krastorio.recipes.addIngredient("reactor-sarcophagus", { "rare-metals", 200 })

  krastorio.recipes.removeIngredient("kr-nuclear-locomotive", "electronic-components")
  krastorio.recipes.removeIngredient("kr-nuclear-locomotive", "steel-gear-wheel")
  krastorio.recipes.removeIngredient("kr-nuclear-locomotive", "rare-metals")
  krastorio.recipes.addIngredient("kr-nuclear-locomotive", { "realistic-reactor", 1 })

  local armor = data.raw["armor"]["radsuit"]
  if armor then
    if not armor.resistances then
      armor.resistances = {}
    end
    table.insert(armor.resistances, {
      ["type"] = "radioactive",
      ["decrease"] = 7,
      ["percent"] = 90,
    })
  end
end
