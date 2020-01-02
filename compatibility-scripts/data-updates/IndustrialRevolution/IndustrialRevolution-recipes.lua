if mods["IndustrialRevolution"] then

	data.raw.recipe["iron-beam-2"] = nil
	-- ENTITIES BUILDINGS
	krastorio.recipes.removeIngredient("burner-inserter", "copper-motor")
	krastorio.recipes.removeIngredient("long-handed-burner-inserter", "copper-motor", "automation-core")
	krastorio.recipes.removeIngredient("long-handed-inserter", "iron-motor")
	
end
