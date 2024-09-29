require("prototypes.updates.create-roboport-variations")
---------------------------------------------------------------------------
-- -- -- PRE UPDATES
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-- -- -- CONTENTS UPDATES (data updates)
---------------------------------------------------------------------------
-- -- Modifing vanilla game objects
require("prototypes.vanilla-changes.mandatory-vanilla-updates")
require("prototypes.vanilla-changes.optional-vanilla-updates")
-- Generate tree and rock recipes
require("prototypes.recipes.greenhouse")
-- Generating buring recipes for fluids
local fluid_burner_util = require("lib.public.data-stages.fluid-burner-util")
fluid_burner_util.generateBurnFluidsRecipes()
-- Generate for each item that can't be processed from the crusher
-- a void recipe for destroy it
-- (This must be done after adding other recipes)
require("prototypes.recipes.generate-void-crushing-recipes")
local matter_util = require("lib.public.data-stages.matter-util")
matter_util.createStandardKrastorioMatterRecipes()
---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data update stage)
---------------------------------------------------------------------------
require("compatibility-scripts.data-updates.angelsaddons-mobility")
require("compatibility-scripts.data-updates.angelsaddons-smeltingtrain")
require("compatibility-scripts.data-updates.Construction_Drones")
require("compatibility-scripts.data-updates.ElectricTrain")
require("compatibility-scripts.data-updates.Flow_Control")
require("compatibility-scripts.data-updates.Load-Furn")
require("compatibility-scripts.data-updates.MineLiquidOres")
require("compatibility-scripts.data-updates.RealisticReactors")
-- AAI (Programmable) Vehicles
require("compatibility-scripts.data-updates.aai-vehicles")
require("compatibility-scripts.data-updates.aai-programmable-vehicles")
-- Pyanodons
require("compatibility-scripts.data-updates.Pyanodon")
-- Schall Uranium Processing
require("compatibility-scripts.data-updates.SchallUranium")
require("compatibility-scripts.data-updates.Tral-robot-tree-farm")
---------------------------------------------------------------------------
-- -- -- OTHER
---------------------------------------------------------------------------

-- Map generation presets
require("prototypes.vanilla-changes.mandatory.map-gen-preset-updates")
