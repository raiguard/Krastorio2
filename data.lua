kr_optimization_tech_card_name = "space-science-pack"
require("prototypes.compatibility.space-exploration-pre")

require("prototypes.achievements")
require("prototypes.equipment-grids")
require("prototypes.damage-types")
require("prototypes.fluids")

require("prototypes.armors.power-armor-mk3")
require("prototypes.armors.power-armor-mk4")

require("prototypes.categories.ammo-categories")
require("prototypes.categories.equipment-categories")
require("prototypes.categories.fuel-categories")
require("prototypes.categories.item-subgroups")
require("prototypes.categories.recipe-categories")
require("prototypes.categories.resource-categories")

require("prototypes.equipment.additional-engine-equipment")
require("prototypes.equipment.advanced-additional-engine-equipment")
require("prototypes.equipment.advanced-exoskeleton-equipment")
require("prototypes.equipment.antimatter-reactor-equipment")
require("prototypes.equipment.battery-mk3-equipment")
require("prototypes.equipment.big-battery-equipment")
require("prototypes.equipment.big-battery-mk2-equipment")
require("prototypes.equipment.big-battery-mk3-equipment")
require("prototypes.equipment.big-solar-panel-equipment")
require("prototypes.equipment.big-superior-solar-panel-equipment")
require("prototypes.equipment.cyber-potato-equipment")
require("prototypes.equipment.energy-absorber-equipment")
require("prototypes.equipment.energy-shield-mk3-equipment")
require("prototypes.equipment.energy-shield-mk4-equipment")
require("prototypes.equipment.nuclear-reactor-equipment")
require("prototypes.equipment.personal-laser-defense-mk2-equipment")
require("prototypes.equipment.personal-laser-defense-mk3-equipment")
require("prototypes.equipment.personal-laser-defense-mk4-equipment")
require("prototypes.equipment.personal-submachine-laser-defense-mk1-equipment")
require("prototypes.equipment.personal-submachine-laser-defense-mk2-equipment")
require("prototypes.equipment.personal-submachine-laser-defense-mk3-equipment")
require("prototypes.equipment.personal-submachine-laser-defense-mk4-equipment")
require("prototypes.equipment.portable-generator-equipment")
require("prototypes.equipment.small-portable-generator-equipment")
require("prototypes.equipment.superior-exoskelton-equipment")
require("prototypes.equipment.superior-night-vision-equipment")
require("prototypes.equipment.superior-solar-panel-equipment")
require("prototypes.equipment.vehicle-roboport-equipment")

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
-- -- Adding new damages
-- -- Adding new entities
require("prototypes.entities.entities-initialization")
-- -- Adding new equipments
-- -- Adding new fluids
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
