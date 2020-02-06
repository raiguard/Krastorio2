if mods["aai-vehicles-hauler"] then
	if data.raw["car"]["vehicle-hauler"] then
		data.raw["car"]["vehicle-hauler"].equipment_grid = "kr-car-grid"

		krastorio.recipes.overrideIngredients("vehicle-hauler", krastorio.recipes.getIngredients("car"))
		krastorio.recipes.multiplyRecipeStat("vehicle-hauler", 2)

		krastorio.technologies.addPrerequisite("basic-vehicles", "engine")
	end
end