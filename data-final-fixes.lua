---------------------------------------------------------------------------
-- -- -- PRE FINAL FIXES
---------------------------------------------------------------------------
krastorio.stage = "data-final-fixes"
---------------------------------------------------------------------------
-- -- -- RECIPES
-- Apply the choosen science pack recipes
require(kr_prototypes_path .. "vanilla-changes/optional/modify-science-packs-recipes")
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
-- Sanitize matter tech card from T0 packs
krastorio.technologies.removeSciencePackIncompatibleWith("matter-tech-card", science_pack_incompatibilities)

-- -- -- ENFORCE SCIENCE PACK PREREQUISITE COHERENCE 
krastorio.technologies.enforceUsedSciencePacksInPrerequisites()
---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data final fixes stage)
---------------------------------------------------------------------------
local scripts_path = "compatibility-scripts/data-final-fixes/"
-- Pyanodons
require(scripts_path .. "Pyanodon")
---------------------------------------------------------------------------