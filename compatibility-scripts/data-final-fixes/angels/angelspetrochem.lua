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
	
	-- Remove angel hydrogen-chlorine recipe
	krastorio.technologies.removeUnlockRecipeFromAllTechnologies("gas-hydrogen-chlorine")
	
	-- Then, remove unseful recipe
	krastorio.technologies.addPrerequisite("chlorine-processing-3", "chemical-science-pack")
	krastorio.technologies.addPrerequisite("chlorine-processing-3",  "chlorine-processing-1")
	krastorio.technologies.addPrerequisite("chlorine-processing-3", "chlorine-processing-2")
	krastorio.technologies.removePrerequisite("chlorine-processing-3", "chlorine-processing-2")
	if data.raw.technology["chlorine-processing-3"] then
		data.raw.technology["chlorine-processing-2"] = data.raw.technology["chlorine-processing-3"]
		data.raw.technology["chlorine-processing-3"] = nil
		data.raw.technology["chlorine-processing-2"].name = "chlorine-processing-2"
		krastorio.technologies.convertPrerequisiteFromAllTechnologies("chlorine-processing-3", "chlorine-processing-2", true)
	end
	
	-- Remove other unseful recipes
	data.raw.technology["resin-1"] = nil
	data.raw.technology["resin-2"] = nil
	data.raw.technology["resin-3"] = nil
	
	data.raw.technology["angel-flare-stack"] = nil
	
	-- Change the air filters
	krastorio.technologies.addPrerequisite("kr-advanced-chemistry", "angels-nitrogen-processing-1")
	krastorio.technologies.removePrerequisite("kr-advanced-chemistry", "kr-atmosphere-condensation")
	data.raw.technology["kr-atmosphere-condensation"] = nil
	
	krastorio.technologies.addUnlockRecipe("angels-nitrogen-processing-1", "oxygen")
	krastorio.technologies.addUnlockRecipe("angels-nitrogen-processing-1", "nitrogen")
	krastorio.technologies.addUnlockRecipe("angels-nitrogen-processing-1", "hydrogen")
	krastorio.technologies.addUnlockRecipe("angels-nitrogen-processing-1", "water-from-atmosphere")
	
	if data.raw["assembling-machine"]["angels-air-filter"] then
		table.insert(data.raw["assembling-machine"]["angels-air-filter"].crafting_categories, "atmosphere-condensation")
	end
	if data.raw["assembling-machine"]["angels-air-filter-2"] then
		table.insert(data.raw["assembling-machine"]["angels-air-filter-2"].crafting_categories, "atmosphere-condensation")
	end
	
	
	-- Rocket fuel
	krastorio.recipes.replaceIngredient("rocket-fuel-with-ammonia", "iron-plate", {"rocket-fuel-capsule", 10})
	krastorio.recipes.addIngredient("rocket-fuel-with-ammonia", {"rocket-oxidizer-capsule", 10})
	
	krastorio.recipes.replaceIngredient("rocket-fuel-with-hydrogen-chlorine", "iron-plate", {"rocket-fuel-capsule", 10})
	krastorio.recipes.addIngredient("rocket-fuel-with-hydrogen-chlorine", {"rocket-oxidizer-capsule", 10})
end