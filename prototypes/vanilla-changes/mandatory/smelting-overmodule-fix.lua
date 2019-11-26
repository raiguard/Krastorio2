-- For each recipe that is in smelting
-- multiply by 5 the recipe stat for avoid overmodule bug effect
for name, recipe in pairs(data.raw.recipe) do	
	if 
		recipe.category and recipe.category == "smelting" and 
		(not recipe.energy_required or recipe.energy_required < 6.4)
	then 
		if not recipe.energy_required then
			krastorio.recipes.setEnergyCost(name, 3.2)
		end
		krastorio.recipes.multiplyRecipeStat(name, 5)
	end
end
