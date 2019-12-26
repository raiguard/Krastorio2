if mods["IndustrialRevolution"] then

	---------------------------------------------------------
	-- -- -- Prerequisites

	-- General prerequisites conversion
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("steel-processing", "deadlock-steel-age")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("carbon-steel-processing", "deadlock-steel-age")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("advanced-material-processing", "deadlock-furnaces-1")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("advanced-material-processing-2", "deadlock-furnaces-2")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("electronics", "deadlock-electronics-1")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("advanced-electronics", "deadlock-electronics-2")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("advanced-electronics-2", "deadlock-electronics-3")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("concrete", "deadlock-concrete")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("fast-inserter", "deadlock-inserters-2")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("stack-inserter", "deadlock-inserters-3")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("laser-turrets", "turrets-3")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("uranium-ammo", "military-4")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("solar-energy", "deadlock-solar-energy-1")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("effectivity-module", "deadlock-modules-1")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("speed-module", "deadlock-modules-1")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("productivity-module", "deadlock-modules-1")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("effectivity-module-2", "deadlock-modules-2")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("speed-module-2", "deadlock-modules-2")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("productivity-module-2", "deadlock-modules-2")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("effectivity-module-3", "deadlock-modules-3")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("speed-module-3", "deadlock-modules-3")
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("productivity-module-3", "deadlock-modules-3")	
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("kr-steam-engine", "deadlock-steam-power")	
	
	-- Addings
	krastorio.technologies.addPrerequisite("kr-basic-fluid-handling", "deadlock-iron-age")
	krastorio.technologies.addPrerequisite("deadlock-steam-power", "kr-basic-fluid-handling")
	---------------------------------------------------------
	-- -- -- Research unit ingredients
	---------------------------------------------------------
	krastorio.technologies.removeResearchUnitIngredient("deadlock-steam-power", "logistic-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("deadlock-electronics-1", "logistic-science-pack")
	krastorio.technologies.removeResearchUnitIngredient("deadlock-iron-age", "logistic-science-pack")	
	krastorio.technologies.removeResearchUnitIngredient("deadlock-steel-age", "chemical-science-pack")	
	---------------------------------------------------------
	-- -- Recipes Unlocking
	---------------------------------------------------------
	-- Addings	

	-- Adding coke unlocking to steel production technology and steel things
	krastorio.technologies.addUnlockRecipe("deadlock-furnaces-2", "coke")
	krastorio.technologies.addUnlockRecipe("deadlock-steel-age", "steel-gear-wheel")
	krastorio.technologies.addUnlockRecipe("deadlock-steel-age", "steel-beam")
	
	-- Logistics
	krastorio.technologies.addUnlockRecipe("deadlock-inserters-1", "kr-loader")
	
	-- Removing
	krastorio.technologies.removeUnlockRecipe("deadlock-steam-power", "pipe")
	krastorio.technologies.removeUnlockRecipe("deadlock-steam-power", "pipe-to-ground")
	krastorio.technologies.removeUnlockRecipe("deadlock-steam-power", "offshore-pump")	
	---------------------------------------------------------
	-- -- Disabled technology
	data.raw.technology["kr-steam-engine"] = nil

end
