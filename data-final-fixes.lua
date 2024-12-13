require("prototypes.final-fixes.enforce-science-pack-prerequisites")

local flib_table = require("__flib__.table")
---------------------------------------------------------------------------
-- -- -- PRE FINAL FIXES
-- -- -- SCIENCE PACK SANITIZING

-- -- Krastorio 2 science pack collection
krastorio.technologies.addSciencePackCollection("Krastorio2", {
  "basic-tech-card",
  "automation-science-pack",
  "logistic-science-pack",
  "military-science-pack",
  "chemical-science-pack",
  "production-science-pack",
  "utility-science-pack",
  "matter-tech-card",
  kr_optimization_tech_card_name,
  "advanced-tech-card",
  "singularity-tech-card",
})

-- sanitize Krastorio Technologies with other mods
-- krastorio.technologies.sanitizeUnitsOfAllTechnologiesInPacks("Krastorio2", false)

-- -- Sanitize T2 only (in bottom up on tree for correct result)
local science_pack_incompatibilities = {
  "basic-tech-card",
  "automation-science-pack",
  "logistic-science-pack",
  "military-science-pack",
  "chemical-science-pack",
}

-- Sanitize matter tech card from T1 packs
krastorio.technologies.removeSciencePackIncompatibleWith("matter-tech-card", science_pack_incompatibilities)
-- Sanitize space science pack from T1 packs
krastorio.technologies.removeSciencePackIncompatibleWith(kr_optimization_tech_card_name, science_pack_incompatibilities)
-- Sanitize advanced tech card from T1 packs
krastorio.technologies.removeSciencePackIncompatibleWith("advanced-tech-card", science_pack_incompatibilities)
-- Sanitize singularity tech card from T1 packs
krastorio.technologies.removeSciencePackIncompatibleWith("singularity-tech-card", science_pack_incompatibilities)

-- -- Sanitize T1 only (in bottom up on tree for correct result)
science_pack_incompatibilities = {
  "basic-tech-card",
}

-- Sanitize production science pack from T0 packs
krastorio.technologies.removeSciencePackIncompatibleWith("production-science-pack", science_pack_incompatibilities)
-- Sanitize utility science pack from T0 packs
krastorio.technologies.removeSciencePackIncompatibleWith("utility-science-pack", science_pack_incompatibilities)

---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data final fixes stage)
---------------------------------------------------------------------------
-- Angels (multiple scripts)
require("compatibility-scripts.data-final-fixes.angels")
require("compatibility-scripts.data-final-fixes.aai-industry")
require("compatibility-scripts.data-final-fixes.aircraft")
require("compatibility-scripts.data-final-fixes.nco-SpaceShuttle")
require("compatibility-scripts.data-final-fixes.AsphaltRoads")
-- Bobs (multiple scripts)
require("compatibility-scripts.data-final-fixes.bobs_mod")
require("compatibility-scripts.data-final-fixes.Clockwork")
require("compatibility-scripts.data-final-fixes.Dectorio")
require("compatibility-scripts.data-final-fixes.DeadlockLargerLamp")
require("compatibility-scripts.data-final-fixes.deadlock-beltboxes-loaders")
require("compatibility-scripts.data-final-fixes.ElectricTrain")
require("compatibility-scripts.data-final-fixes.FoodIndustry")
require("compatibility-scripts.data-final-fixes.Hovercrafts")
require("compatibility-scripts.data-final-fixes.LightedPolesPlus")
require("compatibility-scripts.data-final-fixes.Nuclear Fuel")
-- Pyanodons (multiple scripts)
require("compatibility-scripts.data-final-fixes.Pyanodon")
require("compatibility-scripts.data-final-fixes.realistic-electric-trains")
require("compatibility-scripts.data-final-fixes.Tral-robot-tree-farm")
require("compatibility-scripts.data-final-fixes.vtk-armor-plating")
require("compatibility-scripts.data-final-fixes.RealisticReactors")
-- Other
require("compatibility-scripts.data-final-fixes.spidertron-tiers")
---------------------------------------------------------------------------
-- -- -- POST ALL FIXES
---------------------------------------------------------------------------
-- Add new fuels to entities
krastorio.entities.addFuelCategory("assembling-machine", "stone-furnace", "vehicle-fuel")
krastorio.entities.addFuelCategory("assembling-machine", "steel-furnace", "vehicle-fuel")
krastorio.entities.addFuelCategory("boiler", "boiler", "vehicle-fuel")
krastorio.entities.addFuelCategory("inserter", "burner-inserter", "vehicle-fuel")
krastorio.entities.addFuelCategory("mining-drill", "burner-mining-drill", "vehicle-fuel")

-- Make characters be targeted by the teleporter turrets
for _, character in pairs(data.raw["character"]) do
  local mask = character.trigger_target_mask or { "common", "ground-unit" }
  character.trigger_target_mask = mask

  -- FIXME: Use a proper name
  table.insert(mask, "character")
end

-- Make anything with an equipment grid of the correct category be targetable by tesla coils
local types_have_grid = {
  "artillery-wagon",
  "car",
  "cargo-wagon",
  "character",
  "fluid-wagon",
  "locomotive",
  "spider-vehicle",
}
local grids = data.raw["equipment-grid"]
for _, type in pairs(types_have_grid) do
  for _, prototype in pairs(data.raw[type]) do
    if type ~= "character" then
      local grid = grids[prototype.equipment_grid]
      if not grid or not flib_table.find(grid.equipment_categories, "universal-equipment") then
        goto continue
      end
    end

    local mask = prototype.trigger_target_mask or { "common", "ground-unit" }
    prototype.trigger_target_mask = mask
    -- The tesla coil turrets will only target entities with this mask
    table.insert(mask, "kr-tesla-coil-trigger")
    -- If the entity is not considered a "military target", then the tesla coil turrets will not wake up when the entity
    -- gets within range
    prototype.is_military_target = true

    ::continue::
  end
end
