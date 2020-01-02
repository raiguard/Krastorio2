---------------------------------------------------------------------------
-- -- -- PRE UPDATES
---------------------------------------------------------------------------
krastorio.stage = "data-updates"
---------------------------------------------------------------------------
-- -- -- CONTENTS UPDATES (data updates)
---------------------------------------------------------------------------
-- -- Modifing vanilla game objects
require(kr_prototypes_path .. "vanilla-changes/mandatory-vanilla-updates")
require(kr_prototypes_path .. "vanilla-changes/optional-vanilla-updates")
---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data update stage)
---------------------------------------------------------------------------
local scripts_path = "compatibility-scripts/data-updates/"
require(scripts_path .. "Flow_Control")
require(scripts_path .. "Load-Furn")
-- Deadlocks
require(scripts_path .. "IndustrialRevolution")
-- Pyanodons
require(scripts_path .. "Pyanodon")
---------------------------------------------------------------------------
