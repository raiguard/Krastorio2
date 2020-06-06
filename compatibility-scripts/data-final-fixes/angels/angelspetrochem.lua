if mods["angelspetrochem"] then
	-- Circular dependecy fix
	krastorio.technologies.removePrerequisite("rocket-fuel", "angels-nitrogen-processing-4")
	
	-- Icon coherence fix
	krastorio.icons.setItemIcon("sulfuric-acid", kr_fluids_icons_path  .. "sulfuric-acid.png")
	
	-- Unify redundant fluids	
	local to_convert =
	{
		["gas-hydrogen"] = "hydrogen",
		["gas-chlorine"] = "chlorine",
		["gas-hydrogen-chlorine"] = "hydrogen-chlorine",
		["gas-oxygen"] = "oxygen",
		["gas-nitrogen"] = "nitrogen",
		["gas-ammonia"] = "ammonia",
		["liquid-nitric-acid"] = "nitric-acid",
		["liquid-heavy-water"] = "heavy-water"
	}
	
	for old_name, new_name in pairs(to_convert) do
		for recipe_name, _ in pairs(data.raw.recipe) do
			if recipe_name:find("creative-mod_", 1, true) == nil then
				krastorio.recipes.convertIngredient(recipe_name, old_name, new_name)
				krastorio.recipes.convertProduct(recipe_name, old_name, new_name)
			end
		end
	end
	log(serpent.block(data.raw["recipe"]["angelsore5-crystal"]))
	
	krastorio.technologies.removeUnlockRecipeFromAllTechnologies("gas-hydrogen-chlorine")
	
	-- Rocket fuel
	krastorio.recipes.replaceIngredient("rocket-fuel-with-ammonia", "iron-plate", {"rocket-fuel-capsule", 10})
	krastorio.recipes.addIngredient("rocket-fuel-with-ammonia", {"rocket-oxidizer-capsule", 10})
	
	krastorio.recipes.replaceIngredient("rocket-fuel-with-hydrogen-chlorine", "iron-plate", {"rocket-fuel-capsule", 10})
	krastorio.recipes.addIngredient("rocket-fuel-with-hydrogen-chlorine", {"rocket-oxidizer-capsule", 10})
end