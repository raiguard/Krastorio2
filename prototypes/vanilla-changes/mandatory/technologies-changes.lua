-- -- -- Modifications to vanilla technologies

-- -- Start game prerequisites

-- Addings
krastorio.technologies.addPrerequisite("logistic-science-pack", "automation-science-pack")
krastorio.technologies.addPrerequisite("logistics", "automation-science-pack")
krastorio.technologies.addPrerequisite("turrets", "automation-science-pack")
krastorio.technologies.addPrerequisite("automation", "automation-science-pack")
krastorio.technologies.addPrerequisite("automation", "automation-core")

-- -- Research unit ingredients

-- Conversions 
krastorio.technologies.convertResearchUnitIngredient("stone-walls", "automation-science-pack", "basic-tech-card")
krastorio.technologies.convertResearchUnitIngredient("military", "automation-science-pack", "basic-tech-card")

-- Addings
krastorio.technologies.addResearchUnitIngredient("automation", "basic-tech-card")

-- Removing
krastorio.technologies.removeResearchUnitIngredient("automation", "automation-science-pack")

-- Others

-- Adding coke unlocking to steel production technology
krastorio.technologies.addUnlockRecipe("steel-processing", "coke")

-- END CHANGING (this lines must remain at the end of file)

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