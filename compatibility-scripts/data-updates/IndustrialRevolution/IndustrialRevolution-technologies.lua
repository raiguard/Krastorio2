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
	krastorio.technologies.convertPrerequisiteFromAllTechnologies("flammables", "oil-processing", true)
	
	-- Addings
	krastorio.technologies.addPrerequisite("kr-basic-fluid-handling", "deadlock-iron-age")
	krastorio.technologies.addPrerequisite("kr-shelter", "deadlock-iron-age")
	krastorio.technologies.addPrerequisite("deadlock-steam-power", "kr-basic-fluid-handling")
	krastorio.technologies.addPrerequisite("deadlock-grinding-1", "kr-stone-processing")	
	krastorio.technologies.addPrerequisite("kr-greenhouse", "deadlock-steam-power")
	---------------------------------------------------------
	-- -- -- Research unit ingredients
	---------------------------------------------------------
	-- Addings
	krastorio.technologies.addResearchUnitIngredient("kr-basic-fluid-handling", "automation-science-pack")
	
	-- Removing
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
	
	-- Automation core
	data:extend({
		{
			type = "recipe",
			name = "automation-core-tin",
			icons = krastorio.icons.createOverlappedIcon
			(
				2, 
				kr_icons_path .. "automation-core.png", 
				64, 
				"__IndustrialRevolution__/graphics/icons/64/tin-ingot-2.png", 
				64
			),
			energy_required = 3,
			enabled = false,
			ingredients =
			{
				{"tin-gear-wheel", 4},
				{"tin-rod", 4},
				{"copper-plate", 4}
			},
			result = "automation-core",
			result_count = 1
		}
	})
	krastorio.technologies.addUnlockRecipe("kr-automation-core", "automation-core-tin")	
	krastorio.technologies.addUnlockRecipe("deadlock-iron-age", "automation-core")
	data.raw.recipe["automation-core"].icons = 
	krastorio.icons.createOverlappedIcon
	(
		2, 
		kr_icons_path .. "automation-core.png", 
		64, 
		"__IndustrialRevolution__/graphics/icons/64/iron-ingot.png", 
		64
	)
	
	-- Logistics
	krastorio.technologies.addUnlockRecipe("deadlock-inserters-1", "kr-loader")
	
	krastorio.technologies.addUnlockRecipe("deadlock-steam-power", "kr-wind-turbine"); krastorio.recipes.disable("kr-wind-turbine")
	-- Removing
	krastorio.technologies.removeUnlockRecipe("deadlock-steam-power", "pipe")
	krastorio.technologies.removeUnlockRecipe("deadlock-steam-power", "pipe-to-ground")
	krastorio.technologies.removeUnlockRecipe("deadlock-steam-power", "offshore-pump")	
	krastorio.technologies.removeUnlockRecipe("deadlock-steam-power", "copper-cable"); krastorio.recipes.enable("copper-cable")
	
	krastorio.technologies.removeUnlockRecipe("kr-automation-core", "automation-core")	
	---------------------------------------------------------
	-- -- REMOVED technology
	data.raw.technology["kr-steam-engine"] = nil -- REDUNDANT
	data.raw.technology["kr-electric-mining-drill"] = nil -- REDUNDANT
	data.raw.technology["kr-radar&watchtower"] = nil -- REDUNDANT
	
	-- -- Pickaxes

	data.raw.technology["kr-iron-pickaxe"].prerequisites = {"deadlock-iron-age"}
	krastorio.technologies.addResearchUnitIngredient("kr-iron-pickaxe", "automation-science-pack")

	data.raw.technology["steel-axe"].enabled = true
	data.raw.technology["steel-axe"].hidden = false
	data.raw.technology["steel-axe"].prerequisites = {"deadlock-steel-age", "kr-iron-pickaxe"}
	krastorio.technologies.addResearchUnitIngredient("kr-iron-pickaxe", "logistic-science-pack")

end
