---------------------------------------------------------------------------
-- -- -- PRE FINAL FIXES
---------------------------------------------------------------------------
krastorio.stage = "data-final-fixes"
---------------------------------------------------------------------------
-- -- -- RECIPES
-- Apply the choosen science pack recipes
require(kr_prototypes_path .. "vanilla-changes/optional/modify-science-packs-recipes")

-- Apply module limitations
for recipe_name, recipe in pairs(data.raw.recipe) do
	if recipe.mod == "Krastorio2" then 
		if recipe.allow_efficiency == true then
			krastorio.modules.addEfficiencyLimitation(recipe_name, true)
		elseif recipe.allow_speed == true then
			krastorio.modules.addSpeedLimitation(recipe_name, true)
		elseif recipe.allow_productivity == true then
			krastorio.modules.addProductivityLimitation(recipe_name, true)
		elseif recipe.allow_pollution_reduction == true then
			krastorio.modules.addLessPollutionLimitation(recipe_name, true)
		end
	end
end
---------------------------------------------------------------------------
-- -- -- SCIENCE PACK SANITIZING

-- -- Krastorio 2 science pack collection
krastorio.technologies.addSciencePackCollection("Krastorio2",
{
	"basic-tech-card",
	"automation-science-pack",
	"logistic-science-pack",
	"military-science-pack",
	"chemical-science-pack",
	"production-science-pack",
	"utility-science-pack",
	"matter-tech-card",
	"space-science-pack",
	"advanced-tech-card",
	"singularity-tech-card"
})

-- sanitize Krastorio Technologies with other mods
krastorio.technologies.sanitizeUnitsOfAllTechnologiesInPacks("Krastorio2", false)

-- -- Sanitize T2 only (in bottom up on tree for correct result)
local science_pack_incompatibilities = 
{
	"basic-tech-card",
	"automation-science-pack",
	"logistic-science-pack",
	"military-science-pack",
	"chemical-science-pack"
}

-- Sanitize matter tech card from T1 packs
krastorio.technologies.removeSciencePackIncompatibleWith("matter-tech-card", science_pack_incompatibilities)
-- Sanitize space science pack from T1 packs
krastorio.technologies.removeSciencePackIncompatibleWith("space-science-pack", science_pack_incompatibilities)
-- Sanitize advanced tech card from T1 packs
krastorio.technologies.removeSciencePackIncompatibleWith("advanced-tech-card", science_pack_incompatibilities)
-- Sanitize singularity tech card from T1 packs
krastorio.technologies.removeSciencePackIncompatibleWith("singularity-tech-card", science_pack_incompatibilities)

-- -- Sanitize T1 only (in bottom up on tree for correct result)
science_pack_incompatibilities = 
{
	"basic-tech-card"
}

-- Sanitize production science pack from T0 packs
krastorio.technologies.removeSciencePackIncompatibleWith("production-science-pack",	science_pack_incompatibilities)
-- Sanitize utility science pack from T0 packs
krastorio.technologies.removeSciencePackIncompatibleWith("utility-science-pack", science_pack_incompatibilities)

-- -- -- ENFORCE SCIENCE PACK PREREQUISITE COHERENCE 
krastorio.technologies.enforceUsedSciencePacksInPrerequisites()
---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data final fixes stage)
---------------------------------------------------------------------------
local scripts_path = "compatibility-scripts/data-final-fixes/"
require(scripts_path .. "aai-industry")
require(scripts_path .. "aai-vehicles-chaingunner")
require(scripts_path .. "aai-vehicles-hauler")
require(scripts_path .. "aircraft")
require(scripts_path .. "DeadlockLargerLamp")
require(scripts_path .. "deadlock-beltboxes-loaders")
require(scripts_path .. "Hovercrafts")
require(scripts_path .. "LightedPolesPlus")
-- Pyanodons
require(scripts_path .. "Pyanodon")
require(scripts_path .. "realistic-electric-trains")
require(scripts_path .. "space-exploration")
require(scripts_path .. "vtk-armor-plating")
---------------------------------------------------------------------------
-- Filter inserter fix
krastorio.recipes.addOrReplaceIngredient("filter-inserter", "automation-core", {"electronic-circuit", 2})
---------------------------------------------------------------------------
if krastorio.general.getSafeSettingValue("kr-rebalance-vehicles&fuels") then
	
	data.raw.item["wood"].fuel_acceleration_multiplier = 0.35 --empty
	data.raw.item["wood"].fuel_top_speed_multiplier = 0.5 --empty
	data.raw.item["wood"].fuel_emissions_multiplier = 3 --empty
	
	data.raw.item["coal"].fuel_acceleration_multiplier = 0.5 --empty
	data.raw.item["coal"].fuel_top_speed_multiplier = 0.6 --empty
	data.raw.item["coal"].fuel_emissions_multiplier = 3 --empty
	
	data.raw.item["coke"].fuel_acceleration_multiplier = 0.6 --empty
	data.raw.item["coke"].fuel_top_speed_multiplier = 0.7 --empty
	data.raw.item["coke"].fuel_emissions_multiplier = 3 --empty
	
	data.raw.item["solid-fuel"].fuel_acceleration_multiplier = 0.75 --empty
	data.raw.item["solid-fuel"].fuel_top_speed_multiplier = 0.75 --empty
	data.raw.item["solid-fuel"].fuel_emissions_multiplier = 2 --empty
	
	data.raw.item["rocket-fuel"].fuel_value = "15MJ"
	data.raw.item["rocket-fuel"].fuel_acceleration_multiplier = 1 --empty
	data.raw.item["rocket-fuel"].fuel_top_speed_multiplier = 1 --empty
	data.raw.item["rocket-fuel"].fuel_emissions_multiplier = 1.5 --empty
	
end
---------------------------------------------------------------------------
if krastorio.general.getSafeSettingValue("kr-peaceful-mod") then
krastorio.recipes.overrideIngredients
(
	"fertilizer", 
	{
			{type="fluid", name="sulfuric-acid", amount=50},
			{type="fluid", name="nitric-acid", amount=50},
			{name="coal", amount=1}
	}
)
krastorio.recipes.overrideIngredients
(
	"first-aid-kit", 
	{
			{"raw-fish", 1},
			{"wood", 1},
			{"iron-plate", 1}
	}
)

end
--------------------------------------------------------------------