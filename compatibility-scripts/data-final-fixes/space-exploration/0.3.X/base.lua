if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
	-- remove glass from low desity structure
	krastorio.recipes.removeIngredient("low-density-structure", "glass")
	krastorio.recipes.replaceIngredient("low-density-structure", "steel-plate", {"steel-plate", 2})
end