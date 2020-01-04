if mods["IndustrialRevolution"] then
	-- -- RAW PROCESSING
	-- increase cost for make sense of crusher
	local categories = {"grinding","grinding-1","grinding-2"}
	local function crusherRecipe(recipe_category)
		for _, category in pairs(categories) do
			if category == recipe_category then
				return true
			end
		end
		return false
	end	
	for name, recipe in pairs(data.raw.recipe) do	
		if 
			recipe.category and crusherRecipe(recipe.category)
		then 
			if not recipe.energy_required then
				krastorio.recipes.setEnergyCost(name, 0.5)
			end
			krastorio.recipes.multiplyRecipeStat(name, 5)
			data.raw.recipe[name].always_show_products = true
		end
	end
	
	-- -- ITEMS
	data.raw.recipe["iron-beam-2"] = nil	
	
	-- Circuits
	krastorio.recipes.removeIngredient("electronic-circuit", "wood")
	krastorio.recipes.setEnergyCost("electronic-circuit", 0.5)
	krastorio.recipes.replaceProduct("electronic-circuit", "electronic-circuit", {"electronic-circuit", 1})

	krastorio.recipes.removeIngredient("advanced-circuit", "electronic-components")
	krastorio.recipes.setEnergyCost("advanced-circuit", 2)

	krastorio.recipes.removeIngredient("processing-unit", "rare-metals")
	
	-- -- ENTITIES BUILDINGS	
	-- Inserters
	krastorio.recipes.removeIngredient("burner-inserter", "copper-motor")
	krastorio.recipes.removeIngredient("long-handed-burner-inserter", "copper-motor")
	krastorio.recipes.overrideIngredients("long-handed-inserter", 
	{
		{"long-handed-burner-inserter", 1},
		{"copper-cable", 2}
	})
	if krastorio.general.getSafeSettingValue("kr-loaders") then
		krastorio.recipes.convertIngredient("kr-loader", "iron-gear-wheel", "tin-gear-wheel")
	end
	
	-- Drills
	krastorio.recipes.convertIngredient("burner-mining-drill", "copper-motor", "automation-core")
	
	-- Assemblers
	krastorio.recipes.convertIngredient("assembling-machine-1", "burner-inserter", "automation-core")
	
	-- Fluid storages & steel pipes
	krastorio.recipes.overrideIngredients("kr-steel-pipe", {{"steel-tube", 1},{"steel-rivet", 1}})
	krastorio.recipes.overrideIngredients("kr-steel-pipe-to-ground", {{"kr-steel-pipe", 10}})
	krastorio.recipes.convertIngredient("kr-steel-pump", "engine-unit", "electric-engine-unit")

	krastorio.recipes.overrideIngredients("kr-fluid-storage-1", krastorio.recipes.getIngredients("storage-tank"))
	krastorio.recipes.convertIngredient("kr-fluid-storage-1", "pipe", "kr-steel-pipe")
	krastorio.recipes.convertIngredient("kr-fluid-storage-1", "iron-plate-heavy", "steel-plate-heavy")
	krastorio.recipes.convertIngredient("kr-fluid-storage-1", "iron-stick", "steel-rod")
	krastorio.recipes.convertIngredient("kr-fluid-storage-1", "iron-rivet", "steel-rivet")
	krastorio.recipes.overrideProducts("kr-fluid-storage-1", {{"kr-fluid-storage-1", 1}})
	-- 
	krastorio.recipes.overrideIngredients("kr-fluid-storage-2", krastorio.recipes.getIngredients("kr-fluid-storage-1"))
	krastorio.recipes.multiplyRecipeStat("kr-fluid-storage-2", 2)
	krastorio.recipes.overrideProducts("kr-fluid-storage-2", {{"kr-fluid-storage-2", 1}})
	---------------------------------------------------------------
	-- Migrate to deadlock glass
	krastorio.recipes.convertIngredientFromAllRecipes("glass", "glass-plate")	
	krastorio.recipes.convertProductFromAllRecipes("glass", "glass-plate")

	krastorio.recipes.replaceIngredient("small-lamp", "glass-plate", {"glass-plate", 1})
	krastorio.recipes.replaceIngredient("solar-panel", "glass-plate", {"glass-plate", 9})
	---------------------------------------------------------------
end
