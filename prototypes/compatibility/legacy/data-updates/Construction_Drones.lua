if mods["Construction_Drones"] then
  if data.raw.recipe["Construction Drone"] then
    krastorio.recipes.replaceIngredient("Construction Drone", "electronic-circuit", { "automation-core", 5 })
  end
end
