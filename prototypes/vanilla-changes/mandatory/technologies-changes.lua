-- -- -- Modifications to vanilla technologies

-- Start game prerequisites
krastorio.technologies.addPrerequisite("logistic-science-pack", "automation-science-pack")
krastorio.technologies.addPrerequisite("logistics", "automation-science-pack")
krastorio.technologies.addPrerequisite("turrets", "automation-science-pack")

-- research units
krastorio.technologies.convertResearchUnitIngredient("stone-walls", "automation-science-pack", "basic-tech-card")
krastorio.technologies.convertResearchUnitIngredient("military", "automation-science-pack", "basic-tech-card")

-- Adding coke unlocking to steel production technology
krastorio.technologies.addUnlockRecipe("steel-processing", "coke")