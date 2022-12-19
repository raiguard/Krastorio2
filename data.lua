---------------------------------------------------------------------------
-- -- -- PRE INITIALIZATION
---------------------------------------------------------------------------
-- -- General Info
krastorio = {}
krastorio.internal_name = "Krastorio2"
krastorio.title_name = "Krastorio 2"
krastorio.version = mods[krastorio.internal_name]
krastorio.stage = "data"
-- -- Global Krastorio 2 Paths
require("__Krastorio2__/lib/public/data-stages/paths")
-- -- Global Krastorio 2 library initialization, utilities library (support for main library)
require(kr_path .. "lib/private/data-stages/utils/krastorio_utils")
-- -- Global Krastorio 2 library initialization, Krastorio 2 main library
require(kr_path .. "lib/private/data-stages/entities")
require(kr_path .. "lib/private/data-stages/equipments")
require(kr_path .. "lib/private/data-stages/general")
require(kr_path .. "lib/private/data-stages/icons")
require(kr_path .. "lib/private/data-stages/items")
require(kr_path .. "lib/private/data-stages/modules")
require(kr_path .. "lib/private/data-stages/recipes")
require(kr_path .. "lib/private/data-stages/technologies")
---------------------------------------------------------------------------
-- -- -- COMPATIBILITY PRE-INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- -- Use vanilla Space Science Pack as the basis for the Optimization Tech Card
krastorio.optimization_tech_card_name = "space-science-pack"
-- -- Define Compatibility Script Path
local scripts_path = "compatibility-scripts/data/"
-- -- Pre-Init Compat for SE
require(scripts_path .. "space-exploration-pre-init")

---------------------------------------------------------------------------
-- -- -- CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- -- Adding new achievements
require(kr_achievements_path .. "achievements-initialization")
-- -- Adding new categories
require(kr_categories_path .. "categories-initialization")
-- -- Adding new damages
require(kr_damages_path .. "damages-initialization")
-- -- Adding new entities
require(kr_entities_prototypes_path .. "entities-initialization")
-- -- Adding new equipments
require(kr_equipments_prototypes_path .. "equipments-initialization")
-- -- Adding new fluids
require(kr_fluids_prototypes_path .. "fluids-initialization")
-- -- GUI specifications
require(kr_gui_path .. "gui-initialization")
-- -- Adding new tips and tricks
require(kr_gui_path .. "tips-and-tricks-initialization")
-- -- Adding new items
require(kr_items_prototypes_path .. "items-initialization")
-- -- Adding new particles
require(kr_particles_prototypes_path .. "particles-initialization")
-- -- Adding new recipes
require(kr_recipes_prototypes_path .. "recipes-initialization")
-- -- Adding new resources
require(kr_resources_path .. "resources-initialization")
-- -- Adding new sounds (prototypes)
require(kr_prototypes_path .. "sounds/sounds")
-- -- Adding new technologies
require(kr_technologies_prototypes_path .. "technologies-initialization")
-- -- Adding new tiles
require(kr_tiles_prototypes_path .. "tiles-initialization")
-- -- Adding new signals (virtual signals)
require(kr_others_prototypes_path .. "virtual-signals-initialization")
-- -- Adding new key binds
require(kr_others_prototypes_path .. "key-bind-initialization")
-- -- Adding new shortcuts
require(kr_others_prototypes_path .. "shortcut")
---------------------------------------------------------------------------
-- -- -- OPTIONAL CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- -- Execute Compatilbility Scripts for the data stage
require(scripts_path .. "aircraft")
require(scripts_path .. "early-electric-furnaces")
require(scripts_path .. "deadlock-beltboxes-loaders")
require(scripts_path .. "IndustrialRevolution")
require(scripts_path .. "Squeak_Through")
---------------------------------------------------------------------------
