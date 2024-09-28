kr_optimization_tech_card_name = "space-science-pack"
require("prototypes.compatibility.space-exploration-pre")

require("prototypes.achievements")
require("prototypes.custom-inputs")
require("prototypes.damage-types")
require("prototypes.equipment-grids")
require("prototypes.fluids")
require("prototypes.gui-styles")
require("prototypes.shortcuts")
require("prototypes.sounds")
require("prototypes.tips-and-tricks")
require("prototypes.virtual-signals")

require("prototypes.armors.power-armor-mk3")
require("prototypes.armors.power-armor-mk4")

require("prototypes.categories.ammo-categories")
require("prototypes.categories.equipment-categories")
require("prototypes.categories.fuel-categories")
require("prototypes.categories.item-subgroups")
require("prototypes.categories.recipe-categories")
require("prototypes.categories.resource-categories")

require("prototypes.entities.advanced-chemical-plant")
require("prototypes.entities.advanced-furnace")
require("prototypes.entities.advanced-solar-panel")
require("prototypes.entities.advanced-steam-turbine")
require("prototypes.entities.air-purifier")
require("prototypes.entities.antimatter-reactor")
require("prototypes.entities.atmospheric-condenser")
require("prototypes.entities.bio-lab")
require("prototypes.entities.crash-site-assembling-machine-1")
require("prototypes.entities.crash-site-assembling-machine-2")
require("prototypes.entities.crash-site-generator")
require("prototypes.entities.crash-site-lab")
require("prototypes.entities.crusher")
require("prototypes.entities.electrolysis-plant")
require("prototypes.entities.energy-storage")
require("prototypes.entities.filtration-plant")
require("prototypes.entities.flare-stack")
require("prototypes.entities.fuel-refinery")
require("prototypes.entities.fusion-reactor")
require("prototypes.entities.gas-power-station")
require("prototypes.entities.greenhouse")
require("prototypes.entities.intergalactic-transceiver")
require("prototypes.entities.matter-assembler")
require("prototypes.entities.matter-plant")
require("prototypes.entities.mineral-water-pumpjack")
require("prototypes.entities.planetary-teleporter")
require("prototypes.entities.quantum-computer")
require("prototypes.entities.quarry-drill")
require("prototypes.entities.research-server")
require("prototypes.entities.sentinel")
require("prototypes.entities.shelter")
require("prototypes.entities.shelter-plus")
require("prototypes.entities.singularity-beacon")
require("prototypes.entities.stabilizer-charging-station")
require("prototypes.entities.steel-pipe")
require("prototypes.entities.steel-pipe-to-ground")
require("prototypes.entities.superior-substation")

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
require("prototypes.equipment.superior-exoskeleton-equipment")
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
-- -- Adding new entities
require("prototypes.entities.entities-initialization")
-- -- Adding new items
require("prototypes.items.items-initialization")
-- -- Adding new particles
require("prototypes.particles.particles-initialization")
-- -- Adding new recipes
require("prototypes.recipes.recipes-initialization")
-- -- Adding new resources
require("prototypes.resources.resources-initialization")
-- -- Adding new sounds (prototypes)
-- -- Adding new technologies
require("prototypes.technologies.technologies-initialization")
-- -- Adding new tiles
require("prototypes.tiles.tiles-initialization")
-- -- Adding new signals (virtual signals)
-- -- Adding new key binds
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
