kr_optimization_tech_card_name = "space-science-pack"
require("prototypes.compatibility.space-exploration-pre")

require("prototypes.achievements")

---------------------------------------------------------------------------
-- -- -- PRE INITIALIZATION
---------------------------------------------------------------------------
-- -- General Info
krastorio = {}
-- -- Global Krastorio 2 library initialization, utilities library (support for main library)
require("lib.private.data-stages.utils.krastorio_utils")
-- -- Global Krastorio 2 library initialization, Krastorio 2 main library
require("lib.private.data-stages.entities")
require("lib.private.data-stages.equipments")
require("lib.private.data-stages.general")
require("lib.private.data-stages.icons")
require("lib.private.data-stages.items")
require("lib.private.data-stages.modules")
require("lib.private.data-stages.recipes")
require("lib.private.data-stages.technologies")

---------------------------------------------------------------------------
-- -- -- CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- -- Adding new categories
require("prototypes.categories.categories-initialization")
-- -- Adding new damages
require("prototypes.damages.damages-initialization")
-- -- Adding new entities
require("prototypes.entities.entities-initialization")
-- -- Adding new equipments
require("prototypes.equipments.equipments-initialization")
-- -- Adding new fluids
require("prototypes.fluids.fluids-initialization")
-- -- GUI specifications
require("prototypes.gui.gui-initialization")
-- -- Adding new tips and tricks
require("prototypes.gui.tips-and-tricks-initialization")
-- -- Adding new items
require("prototypes.items.items-initialization")
-- -- Adding new particles
require("prototypes.particles.particles-initialization")
-- -- Adding new recipes
require("prototypes.recipes.recipes-initialization")
-- -- Adding new resources
require("prototypes.resources.resources-initialization")
-- -- Adding new sounds (prototypes)
require("prototypes.sounds.sounds")
-- -- Adding new technologies
require("prototypes.technologies.technologies-initialization")
-- -- Adding new tiles
require("prototypes.tiles.tiles-initialization")
-- -- Adding new signals (virtual signals)
require("prototypes.others.virtual-signals-initialization")
-- -- Adding new key binds
require("prototypes.others.key-bind-initialization")
-- -- Adding new shortcuts
require("prototypes.others.shortcut")
---------------------------------------------------------------------------
-- -- -- OPTIONAL CONTENTS INITIALIZATION (data stage)
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data stage)
---------------------------------------------------------------------------
-- -- Execute Compatilbility Scripts for the data stage
require("compatibility-scripts.data.aircraft")
require("compatibility-scripts.data.early-electric-furnaces")
require("compatibility-scripts.data.deadlock-beltboxes-loaders")
require("compatibility-scripts.data.IndustrialRevolution")
require("compatibility-scripts.data.Squeak_Through")
---------------------------------------------------------------------------
