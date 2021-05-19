-- DISABLED
if mods["DeadlockLargerLamp"] then
  krastorio.recipes.replaceIngredient("deadlock-large-lamp", "electronic-circuit", { name = "glass", amount = 4 })
  krastorio.recipes.replaceIngredient("deadlock-large-lamp", "automation-core", { name = "glass", amount = 4 })
  if not krastorio.recipes.hasIngredient("deadlock-large-lamp", "glass") then
    krastorio.recipes.addIngredient("deadlock-large-lamp", { name = "glass", amount = 4 })
  end
end
