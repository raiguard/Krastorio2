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
-- Generate tree and rock recipes
require("prototypes.others.greenhouse")
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
require(scripts_path .. "angelsaddons-mobility")
require(scripts_path .. "angelsaddons-smeltingtrain")
require(scripts_path .. "Construction_Drones")
require(scripts_path .. "ElectricTrain")
require(scripts_path .. "Flow_Control")
require(scripts_path .. "Load-Furn")
require(scripts_path .. "MineLiquidOres")
require(scripts_path .. "RealisticReactors")
-- AAI (Programmable) Vehicles
require(scripts_path .. "aai-vehicles")
require(scripts_path .. "aai-programmable-vehicles")
-- Pyanodons
require(scripts_path .. "Pyanodon")
-- Schall Uranium Processing
require(scripts_path .. "SchallUranium")
require(scripts_path .. "Tral-robot-tree-farm")
---------------------------------------------------------------------------
-- -- -- OTHER
---------------------------------------------------------------------------

-- Map generation presets
require(kr_others_prototypes_path .. "map-gen-preset-updates")
