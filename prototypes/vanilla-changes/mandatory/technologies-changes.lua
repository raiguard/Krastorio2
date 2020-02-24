-- -- -- Modifications to vanilla technologies

--------------------------------------------------------------------
-- -- Prerequisites
--------------------------------------------------------------------

-- Addings
krastorio.technologies.addPrerequisite("steel-axe", "kr-iron-pickaxe")
krastorio.technologies.addPrerequisite("automation", "kr-automation-core")
krastorio.technologies.addPrerequisite("automation", "automation-science-pack")
krastorio.technologies.addPrerequisite("logistics", "automation-science-pack")
krastorio.technologies.addPrerequisite("stone-walls", "military")
krastorio.technologies.addPrerequisite("turrets", "automation-science-pack")
krastorio.technologies.addPrerequisite("fast-inserter", "electronics")
krastorio.technologies.addPrerequisite("heavy-armor", "light-armor")
krastorio.technologies.addPrerequisite("optics", "kr-stone-processing")
krastorio.technologies.addPrerequisite("logistics-2", "steel-processing")
krastorio.technologies.addPrerequisite("nuclear-power", "kr-steam-engine")
krastorio.technologies.addPrerequisite("oil-processing", "kr-fluids-chemistry")
krastorio.technologies.addPrerequisite("fluid-handling", "kr-basic-fluid-handling")
krastorio.technologies.addPrerequisite("advanced-electronics", "electronics")
krastorio.technologies.addPrerequisite("advanced-electronics", "kr-silicon-processing")
krastorio.technologies.addPrerequisite("battery-equipment", "modular-armor")
krastorio.technologies.addPrerequisite("fusion-reactor-equipment", "kr-fusion-energy")

-- Science
krastorio.technologies.addPrerequisite("military-science-pack", "advanced-electronics")
krastorio.technologies.addPrerequisite("logistic-science-pack", "automation-science-pack")
krastorio.technologies.addPrerequisite("logistic-science-pack", "electronics")
krastorio.technologies.addPrerequisite("production-science-pack", "kr-research-server")
krastorio.technologies.addPrerequisite("production-science-pack", "kr-advanced-lab")
krastorio.technologies.addPrerequisite("production-science-pack", "uranium-processing")
krastorio.technologies.addPrerequisite("utility-science-pack", "kr-research-server")
krastorio.technologies.addPrerequisite("utility-science-pack", "rocket-fuel")
krastorio.technologies.addPrerequisite("space-science-pack", "kr-singularity-lab")

-- Modules 
krastorio.technologies.addPrerequisite("speed-module-3", "advanced-electronics-2")
krastorio.technologies.addPrerequisite("productivity-module-3", "advanced-electronics-2")
krastorio.technologies.addPrerequisite("effectivity-module-3", "advanced-electronics-2")

--Removing
krastorio.technologies.removePrerequisite("heavy-armor", "military")
krastorio.technologies.removePrerequisite("fluid-handling", "automation-2")
krastorio.technologies.removePrerequisite("engine", "steel-processing")
krastorio.technologies.removePrerequisite("battery-equipment", "solar-panel-equipment")
krastorio.technologies.removePrerequisite("battery-mk2-equipment", "low-density-structure")
krastorio.technologies.removePrerequisite("personal-laser-defense-equipment", "low-density-structure")

-- Modules
krastorio.technologies.removePrerequisite("speed-module-2", "advanced-electronics-2")
krastorio.technologies.removePrerequisite("productivity-module-2", "advanced-electronics-2")
krastorio.technologies.removePrerequisite("effectivity-module-2", "advanced-electronics-2")

--------------------------------------------------------------------
-- -- Research unit ingredients
--------------------------------------------------------------------

-- Conversions 
krastorio.technologies.convertResearchUnitIngredient("stone-walls", "automation-science-pack", "basic-tech-card")
krastorio.technologies.convertResearchUnitIngredient("military", "automation-science-pack", "basic-tech-card")

-- Addings
krastorio.technologies.addResearchUnitIngredient("automation", "basic-tech-card")
krastorio.technologies.addResearchUnitIngredient("character-logistic-trash-slots-1", "basic-tech-card")
krastorio.technologies.addResearchUnitIngredient("auto-character-logistic-trash-slots", "basic-tech-card")

-- Removing
krastorio.technologies.removeResearchUnitIngredient("automation", "automation-science-pack")
krastorio.technologies.removeResearchUnitIngredient("fluid-handling", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("oil-processing", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("engine", "logistic-science-pack")
krastorio.technologies.removeResearchUnitIngredient("plastics", "logistic-science-pack")

--------------------------------------------------------------------
-- -- Recipes Unlocking
--------------------------------------------------------------------

-- Addings

-- Adding coke unlocking to steel production technology and steel things
krastorio.technologies.addUnlockRecipe("steel-processing", "coke")
krastorio.technologies.addUnlockRecipe("steel-processing", "steel-gear-wheel")
krastorio.technologies.addUnlockRecipe("steel-processing", "steel-beam")

-- Moving inserters unlocking in early game
krastorio.technologies.addUnlockRecipe("automation", "burner-inserter")
krastorio.technologies.addUnlockRecipe("logistics", "inserter")
krastorio.technologies.addUnlockRecipe("logistics", "long-handed-inserter")

-- First belt
krastorio.technologies.addUnlockRecipe("logistics", "transport-belt")

-- Electronics I
krastorio.technologies.addUnlockRecipe("electronics", "electronic-circuit")
-- Electronics 2
krastorio.technologies.addUnlockRecipe("advanced-electronics", "electronic-components")

-- -- EQUIPMENTS
krastorio.technologies.addUnlockRecipe("solar-panel-equipment", "big-solar-panel-equipment")

krastorio.technologies.addUnlockRecipe("battery-equipment", "big-battery-equipment")
krastorio.technologies.addUnlockRecipe("battery-equipment", "small-portable-generator")

krastorio.technologies.addUnlockRecipe("battery-mk2-equipment", "big-battery-mk2-equipment")

krastorio.technologies.addUnlockRecipe(krastorio.technologies.getTechnologyThatUnlockRecipe("personal-roboport-equipment"), "vehicle-roboport")
krastorio.technologies.addUnlockRecipe(krastorio.technologies.getTechnologyThatUnlockRecipe("electric-engine-unit"), "additional-engine")

krastorio.technologies.addUnlockRecipe("personal-laser-defense-equipment", "personal-submachine-laser-defense-mk1-equipment")

-- Rocket fuel recipes
krastorio.technologies.addUnlockRecipe("rocket-fuel", "rocket-fuel-with-ammonia")
krastorio.technologies.addUnlockRecipe("rocket-fuel", "rocket-fuel-with-hydrogen-chloride")

-- Science
krastorio.technologies.addUnlockRecipe("military-science-pack", "biters-research-data")
krastorio.technologies.addUnlockRecipe("military-science-pack", "kr-creep-collector")
krastorio.technologies.addUnlockRecipe("space-science-pack", "space-science-pack")

-- Removings

-- Moving inserters unlocking in early game
krastorio.technologies.removeUnlockRecipe("automation", "long-handed-inserter")
krastorio.technologies.removeUnlockRecipe("oil-processing", "chemical-plant")

krastorio.technologies.removeUnlockRecipe("kovarex-enrichment-process", "nuclear-fuel")

--------------------------------------------------------------------
-- Loaders
if krastorio.general.getSafeSettingValue("kr-loaders") then
	krastorio.technologies.addUnlockRecipe("logistics", "kr-loader")
	krastorio.technologies.addUnlockRecipe("logistics-2", "kr-fast-loader")
	krastorio.technologies.addUnlockRecipe("logistics-3", "kr-express-loader")
end
--------------------------------------------------------------------

-- -- END CHANGING (this lines must remain at the end of file)

-- Apply basic tech card to all technologies with automation science pack (T1 tier)
krastorio_utils.log.disableLogs()
for technology_name, technology in pairs(data.raw.technology) do
	if krastorio.technologies.hasIngredient(technology_name, "automation-science-pack") then
		krastorio.technologies.addResearchUnitIngredient(technology_name, "basic-tech-card")
	end
end
krastorio_utils.log.enableLogs()

-- Remove basic tech card to all technologies of T2 tier
for technology_name, technology in pairs(data.raw.technology) do
	if 
		krastorio.technologies.hasIngredient(technology_name, "production-science-pack") or
		krastorio.technologies.hasIngredient(technology_name, "utility-science-pack") or
		krastorio.technologies.hasIngredient(technology_name, "space-science-pack") or
		krastorio.technologies.hasIngredient(technology_name, "matter-tech-card")
	then
		krastorio.technologies.removeResearchUnitIngredient(technology_name, "basic-tech-card")
	end
end

	--------------
	-- stats
	
		--------------
		-- rocket

		data.raw.technology["rocket-control-unit"].unit.count = 500
		
	--------------
	-- science packs
		
	data.raw.technology["production-science-pack"].unit.count = 250
	data.raw.technology["utility-science-pack"].unit.count = 250
		
	--------------
	-- military
	
	data.raw.technology["military-4"].unit.count = 500	
	data.raw.technology["discharge-defense-equipment"].unit.count = 350
	data.raw.technology["uranium-ammo"].unit.count = 350
	data.raw.technology["combat-robotics-3"].unit.count = 500
	data.raw.technology["artillery"].unit.count = 2500
	data.raw.technology["laser"].unit.count = 200
	data.raw.technology["physical-projectile-damage-7"].unit.count_formula = "((L-6)^2)*5000"
	data.raw.technology["stronger-explosives-7"].unit.count_formula = "((L-6)^2)*5000"	
	data.raw.technology["refined-flammables-7"].unit.count_formula = "((L-6)^2)*5000"
	data.raw.technology["energy-weapons-damage-7"].unit.count_formula = "((L-6)^2)*5000"
	data.raw.technology["artillery-shell-range-1"].unit.count_formula = "L^2*5000"
	data.raw.technology["artillery-shell-speed-1"].unit.count_formula = "L^2*75000"	

	--------------
	-- miscellaneous
	
	data.raw.technology["logistic-system"].unit.count = 350		
	data.raw.technology["coal-liquefaction"].unit.count = 200	
	data.raw.technology["automation-3"].unit.count = 300		
	data.raw.technology["effect-transmission"].unit.count = 750		
	data.raw.technology["low-density-structure"].unit.count = 500
	
	--------------
	-- nuclear
	
	data.raw.technology["uranium-processing"].unit.count = 2500
	data.raw.technology["nuclear-power"].unit.count = 3000
	data.raw.technology["nuclear-fuel-reprocessing"].unit.count = 250
	data.raw.technology["atomic-bomb"].unit.count = 5000

	
	--------------
	-- stats
	
	data.raw.technology["mining-productivity-3"].unit.count = 500	
	data.raw.technology["mining-productivity-4"].unit.count_formula = "(L^2)*200"				
	data.raw.technology["follower-robot-count-7"].unit.count_formula = "((L-6)^2)*7500"	 
	data.raw.technology["worker-robots-speed-6"].unit.count_formula = "((L-5)^2)*7500"	
