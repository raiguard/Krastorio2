require("prototypes.updates.create-roboport-variations")
require("prototypes.updates.generate-flare-stack-recipes")
require("prototypes.updates.generate-greenhouse-recipes")
require("prototypes.updates.generate-void-crushing-recipes")
---------------------------------------------------------------------------
-- -- -- PRE UPDATES
---------------------------------------------------------------------------
krastorio = {}
require("lib.private.data-stages.utils.krastorio_utils")
require("lib.private.data-stages.entities")
require("lib.private.data-stages.equipments")
require("lib.private.data-stages.general")
require("lib.private.data-stages.icons")
require("lib.private.data-stages.items")
require("lib.private.data-stages.modules")
require("lib.private.data-stages.recipes")
require("lib.private.data-stages.technologies")
---------------------------------------------------------------------------
-- -- -- CONTENTS UPDATES (data updates)
---------------------------------------------------------------------------
-- -- Modifing vanilla game objects
require("prototypes.vanilla-changes.mandatory-vanilla-updates")
require("prototypes.vanilla-changes.optional-vanilla-updates")
-- Generate for each item that can't be processed from the crusher
-- a void recipe for destroy it
-- (This must be done after adding other recipes)
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
