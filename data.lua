---------------------------------------------------------------------------
-- -- -- PRE INITIALIZATION
---------------------------------------------------------------------------
-- -- General Info
krastorio = {}
krastorio.internal_name = "Krastorio2"
krastorio.title_name = "Krastorio 2"
krastorio.version = mods[krastorio.internal_name]
krastorio.stage = "data"
-- -- Global Krastorio 2 library initialization, utilities library (support for main library)
require("__Krastorio2__/lib/private/data-stages/utils/krastorio_utils")
-- -- Global Krastorio 2 library initialization, Krastorio 2 main library
require("__Krastorio2__/lib/private/data-stages/entities")
require("__Krastorio2__/lib/private/data-stages/equipments")
require("__Krastorio2__/lib/private/data-stages/general")
require("__Krastorio2__/lib/private/data-stages/icons")
require("__Krastorio2__/lib/private/data-stages/items")
require("__Krastorio2__/lib/private/data-stages/modules")
require("__Krastorio2__/lib/private/data-stages/recipes")
require("__Krastorio2__/lib/private/data-stages/technologies")
---------------------------------------------------------------------------
-- -- -- COMPATIBILITY PRE-INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- -- Use vanilla Space Science Pack as the basis for the Optimization Tech Card
krastorio.optimization_tech_card_name = "space-science-pack"
-- -- Define Compatibility Script Path
-- -- Pre-Init Compat for SE
require("compatibility-scripts/data/space-exploration-pre-init")

---------------------------------------------------------------------------
-- -- -- CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- -- Adding new achievements
require("__Krastorio2__/prototypes/achievements/achievements-initialization")
-- -- Adding new categories
require("__Krastorio2__/prototypes/categories/categories-initialization")
-- -- Adding new damages
require("__Krastorio2__/prototypes/damages/damages-initialization")
-- -- Adding new entities
require("__Krastorio2__/prototypes/entities/entities-initialization")
-- -- Adding new equipments
require("__Krastorio2__/prototypes/equipments/equipments-initialization")
-- -- Adding new fluids
require("__Krastorio2__/prototypes/fluids/fluids-initialization")
-- -- GUI specifications
require("__Krastorio2__/prototypes/gui/gui-initialization")
-- -- Adding new tips and tricks
require("__Krastorio2__/prototypes/gui/tips-and-tricks-initialization")
-- -- Adding new items
require("__Krastorio2__/prototypes/items/items-initialization")
-- -- Adding new particles
require("__Krastorio2__/prototypes/particles/particles-initialization")
-- -- Adding new recipes
require("__Krastorio2__/prototypes/recipes/recipes-initialization")
-- -- Adding new resources
require("__Krastorio2__/prototypes/resources/resources-initialization")
-- -- Adding new sounds (prototypes)
require("__Krastorio2__/prototypes/sounds/sounds")
-- -- Adding new technologies
require("__Krastorio2__/prototypes/technologies/technologies-initialization")
-- -- Adding new tiles
require("__Krastorio2__/prototypes/tiles/tiles-initialization")
-- -- Adding new signals (virtual signals)
require("__Krastorio2__/prototypes/others/virtual-signals-initialization")
-- -- Adding new key binds
require("__Krastorio2__/prototypes/others/key-bind-initialization")
-- -- Adding new shortcuts
require("__Krastorio2__/prototypes/others/shortcut")
---------------------------------------------------------------------------
-- -- -- OPTIONAL CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- -- Execute Compatilbility Scripts for the data stage
require("compatibility-scripts/data/aircraft")
require("compatibility-scripts/data/early-electric-furnaces")
require("compatibility-scripts/data/deadlock-beltboxes-loaders")
require("compatibility-scripts/data/IndustrialRevolution")
require("compatibility-scripts/data/Squeak_Through")
---------------------------------------------------------------------------
