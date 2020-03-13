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
-- Generating buring recipes for fluids
local fluid_burner_util = require(kr_public_lib .. "fluid-burner-util")
fluid_burner_util.generateBurnFluidsRecipes()
-- Generate for each item that can't be processed from the crusher
-- a void recipe for destroy it
-- (This must be done after adding other recipes)
require(kr_recipes_prototypes_path .. "generate-void-crushing-recipes")
local matter_util = require(kr_public_lib .. "matter-util")
matter_util.createStandardKrastorioMatterRecipes()
---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data update stage)
---------------------------------------------------------------------------
local scripts_path = "compatibility-scripts/data-updates/"
require(scripts_path .. "Flow_Control")
require(scripts_path .. "Load-Furn")
-- Pyanodons
require(scripts_path .. "Pyanodon")
---------------------------------------------------------------------------
