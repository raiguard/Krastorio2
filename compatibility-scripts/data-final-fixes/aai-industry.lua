if mods["aai-industry"] then

	-- -- -- Techologies fixes
	-- Sand
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("sand-processing", "kr-stone-processing")
	data.raw.technology["sand-processing"] = nil
	-- Glass
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("glass-processing", "kr-stone-processing")
	data.raw.technology["glass-processing"] = nil
	-- basic fluid handling
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("basic-fluid-handling", "kr-basic-fluid-handling")
	data.raw.technology["basic-fluid-handling"] = nil
	-- steam power engine
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("steam-power", "kr-steam-engine")
	data.raw.technology["steam-power"] = nil
	-- Removed Krastorio drill tech-card
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("kr-electric-mining-drill", "electric-mining")
	data.raw.technology["kr-electric-mining-drill"] = nil

	krastorio.technologies.addUnlockRecipe("kr-basic-fluid-handling", "pipe")
	krastorio.technologies.addUnlockRecipe("kr-basic-fluid-handling", "pipe-to-ground")
	krastorio.technologies.addUnlockRecipe("kr-basic-fluid-handling", "offshore-pump")
	
	krastorio.technologies.addUnlockRecipe("kr-steam-engine", "boiler")
	krastorio.technologies.addUnlockRecipe("kr-steam-engine", "steam-engine")

	krastorio.technologies.removeUnlockRecipe("automation", "burner-inserter")
	krastorio.technologies.removeUnlockRecipe("electricity", "inserter")
	
	krastorio.technologies.removeResearchUnitIngredient("basic-automation", "automation-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("basic-automation", "electricity")
	krastorio.recipes.replaceIngredient("assembling-machine-1", "iron-plate", {"iron-beam", 4})
	
	krastorio.technologies.addPrerequisite("basic-automation", "kr-automation-core")
	krastorio.technologies.addPrerequisite("kr-basic-fluid-handling", "electricity")
	krastorio.technologies.removeUnlockRecipe("electricity", "automation-science-pack")

	-- -- -- Recipes fixes
	krastorio.recipes.uniteDuplicateItemsOfRecipe("solar-panel")
	
	krastorio.recipes.replaceIngredient("burner-assembling-machine", "motor", {"automation-core", 2})
	
	krastorio.recipes.removeIngredient("burner-inserter", "automation-core")
	
	-- -- -- Entities fixes
	data.raw["lab"]["burner-lab"].inputs = {"basic-tech-card", "automation-science-pack"}
	
	-- Fix for fuels
	if krastorio.general.getSafeSettingValue("kr-rebalance-vehicles&fuels") then
		data.raw.item["processed-fuel"].fuel_category = "vehicle-fuel"
		data.raw.item["processed-fuel"].fuel_acceleration_multiplier = 0.9
		data.raw.item["processed-fuel"].fuel_top_speed_multiplier = 0.9
		data.raw.item["processed-fuel"].fuel_emissions_multiplier = 0.9
		data.raw.recipe["processed-fuel-from-fuel"] = nil
		data.raw.recipe["processed-fuel-from-bio-fuel"] = nil
		data.raw.recipe["processed-fuel-advanced-fuel"] = nil
	end

end