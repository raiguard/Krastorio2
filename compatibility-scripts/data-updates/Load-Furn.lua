if mods["Load-Furn"] then
	if data.raw.recipe["wood-cool"] then		
		aswil.recipes.replaceIngredient("wood-cool", "wood", {"wood", 8})
		aswil.recipes.replaceProduct("wood-cool", "coal", {"coal", 4})
	end
end