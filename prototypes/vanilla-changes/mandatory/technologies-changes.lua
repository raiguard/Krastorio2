-- -- -- Modifications to vanilla technologies

--------------------------------------------------------------------
-- -- Prerequisites
--------------------------------------------------------------------

-- Addings
krastorio.technologies.addPrerequisite("automation", "kr-automation-core")
krastorio.technologies.addPrerequisite("automation", "automation-science-pack")
krastorio.technologies.addPrerequisite("logistic-science-pack", "automation-science-pack")
krastorio.technologies.addPrerequisite("logistic-science-pack", "electronics")
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
krastorio.technologies.addPrerequisite("electronics", "plastics")
krastorio.technologies.addPrerequisite("advanced-electronics", "electronics")

--Removing
krastorio.technologies.removePrerequisite("heavy-armor", "military")
krastorio.technologies.removePrerequisite("fluid-handling", "automation-2")
krastorio.technologies.removePrerequisite("engine", "steel-processing")
krastorio.technologies.removePrerequisite("advanced-electronics", "plastics")

--------------------------------------------------------------------
-- -- Research unit ingredients
--------------------------------------------------------------------

-- Conversions 
krastorio.technologies.convertResearchUnitIngredient("stone-walls", "automation-science-pack", "basic-tech-card")
krastorio.technologies.convertResearchUnitIngredient("military", "automation-science-pack", "basic-tech-card")

-- Addings
krastorio.technologies.addResearchUnitIngredient("automation", "basic-tech-card")

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

-- Removings

-- Moving inserters unlocking in early game
krastorio.technologies.removeUnlockRecipe("automation", "long-handed-inserter")
krastorio.technologies.removeUnlockRecipe("oil-processing", "chemical-plant")

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
for technology_name, technology in pairs(data.raw.technology) do
	if krastorio.technologies.hasIngredient(technology_name, "automation-science-pack") then
		krastorio.technologies.addResearchUnitIngredient(technology_name, "basic-tech-card")
	end
end

-- Remove basic tech card to all technologies of T2 tier
for technology_name, technology in pairs(data.raw.technology) do
	if 
		krastorio.technologies.hasIngredient(technology_name, "production-science-pack") or
		krastorio.technologies.hasIngredient(technology_name, "utility-science-pack") or
		krastorio.technologies.hasIngredient(technology_name, "matter-tech-card")
	then
		krastorio.technologies.removeResearchUnitIngredient(technology_name, "basic-tech-card")
	end
end
