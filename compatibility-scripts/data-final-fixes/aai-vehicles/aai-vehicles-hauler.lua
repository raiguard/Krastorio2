if mods["aai-vehicles-hauler"] and data.raw["car"]["vehicle-hauler"] then
  data.raw["car"]["vehicle-hauler"].equipment_grid = "kr-car-grid"

  krastorio.recipes.overrideIngredients("vehicle-hauler", krastorio.recipes.getIngredients("car"))
  krastorio.recipes.multiplyRecipeStat("vehicle-hauler", 2)

  krastorio.technologies.addPrerequisite("basic-vehicles", "engine")
  if mods["aai-industry"] and krastorio.general.getSafeSettingValue("aai-fuel-processor") then
    krastorio.technologies.addPrerequisite("basic-vehicles", "fuel-processing")
  else
    krastorio.technologies.addPrerequisite("basic-vehicles", "kr-fuel")
  end
end
