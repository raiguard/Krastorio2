---------------------------------------------------------------------------------------
-- -- -- PIPE PATCH AND COVERS
---------------------------------------------------------------------------------------
require("prototypes.entities.buildings.pipe-covers.pipe-patch")
require("prototypes.entities.buildings.pipe-covers.steel-pipecovers")
---------------------------------------------------------------------------------------
-- -- -- BUILDINGS
---------------------------------------------------------------------------------------
-- -- Generals
require("prototypes.entities.buildings.advanced-chemical-plant")
require("prototypes.entities.buildings.advanced-furnace")
require("prototypes.entities.buildings.advanced-solar-panel")
require("prototypes.entities.buildings.advanced-steam-turbine")
require("prototypes.entities.buildings.air-purifier")
require("prototypes.entities.buildings.antimatter-reactor")
require("prototypes.entities.buildings.atmospheric-condenser")
require("prototypes.entities.buildings.bio-lab")
require("prototypes.entities.buildings.crusher")
require("prototypes.entities.buildings.electrolysis-plant")
require("prototypes.entities.buildings.energy-storage")
require("prototypes.entities.buildings.filtration-plant")
require("prototypes.entities.buildings.fluid-burner")
require("prototypes.entities.buildings.fuel-refinery")
require("prototypes.entities.buildings.fusion-reactor")
require("prototypes.entities.buildings.gas-power-station")
require("prototypes.entities.buildings.greenhouse")
require("prototypes.entities.buildings.intergalactic-transceiver")
require("prototypes.entities.buildings.planetary-teleporter")
require("prototypes.entities.buildings.matter-assembler")
require("prototypes.entities.buildings.matter-plant")
require("prototypes.entities.buildings.mineral-water-pumpjack")
require("prototypes.entities.buildings.quantum-computer")
require("prototypes.entities.buildings.quarry-drill")
require("prototypes.entities.buildings.research-server")
require("prototypes.entities.buildings.sentinel")
require("prototypes.entities.buildings.shelter")
require("prototypes.entities.buildings.shelter-plus")
require("prototypes.entities.buildings.singularity-beacon")
require("prototypes.entities.buildings.stabilizer-charging-station")
require("prototypes.entities.buildings.iron-pipe")
require("prototypes.entities.buildings.steel-pipe")
require("prototypes.entities.buildings.steel-pipe-to-ground")
require("prototypes.entities.buildings.steel-pump")
require("prototypes.entities.buildings.substation-mk2")
require("prototypes.entities.buildings.superior-inserters")
require("prototypes.entities.buildings.wind-turbine")
require("prototypes.entities.buildings.advanced-assembling-machine")
require("prototypes.entities.buildings.electric-mining-drills")
require("prototypes.entities.buildings.tesla-coil")
require("prototypes.entities.buildings.logo")
-- -- Turrets
require("prototypes.entities.buildings.turrets.railgun-turret")
require("prototypes.entities.buildings.turrets.rocket-turret")
require("prototypes.entities.buildings.turrets.laser-artillery-turret")
-- -- Laboratories
require("prototypes.entities.buildings.biusart-lab")
require("prototypes.entities.buildings.singularity-lab")
-- -- Roboports
require("prototypes.entities.buildings.small-roboport")
require("prototypes.entities.buildings.large-roboport")
-- -- Conteiners
-- Mediums
require("prototypes.entities.buildings.containers.medium-containers.medium-container")
require("prototypes.entities.buildings.containers.medium-containers.medium-active-provider-container")
require("prototypes.entities.buildings.containers.medium-containers.medium-buffer-container")
require("prototypes.entities.buildings.containers.medium-containers.medium-passive-provider-container")
require("prototypes.entities.buildings.containers.medium-containers.medium-requester-container")
require("prototypes.entities.buildings.containers.medium-containers.medium-storage-container")
-- Big
require("prototypes.entities.buildings.containers.big-containers.big-container")
require("prototypes.entities.buildings.containers.big-containers.big-active-provider-container")
require("prototypes.entities.buildings.containers.big-containers.big-buffer-container")
require("prototypes.entities.buildings.containers.big-containers.big-passive-provider-container")
require("prototypes.entities.buildings.containers.big-containers.big-requester-container")
require("prototypes.entities.buildings.containers.big-containers.big-storage-container")
-- -- Fluid storages
require("prototypes.entities.buildings.fluid-storages.fluid-storage-1")
require("prototypes.entities.buildings.fluid-storages.fluid-storage-2")
-- -- Belts
-- Advanced
require("prototypes.entities.buildings.transport-belts.advanced-transport-belt.animation-set") -- Must be loaded before the belts set
require("prototypes.entities.buildings.transport-belts.advanced-transport-belt.advanced-splitter")
require("prototypes.entities.buildings.transport-belts.advanced-transport-belt.advanced-transport-belt")
require(
  "__Krastorio2__/prototypes/entities/buildings/transport-belts/advanced-transport-belt/advanced-underground-belt"
)
-- Superior
require("prototypes.entities.buildings.transport-belts.superior-transport-belt.animation-set") -- Must be loaded before the belts set
require("prototypes.entities.buildings.transport-belts.superior-transport-belt.superior-splitter")
require("prototypes.entities.buildings.transport-belts.superior-transport-belt.superior-transport-belt")
require(
  "__Krastorio2__/prototypes/entities/buildings/transport-belts/superior-transport-belt/superior-underground-belt"
)
-- Loaders
require("prototypes.entities.buildings.loaders") -- Must be required after belts
---------------------------------------------------------------------------------------
-- -- -- REMNANTS
---------------------------------------------------------------------------------------
require("prototypes.entities.remnants.advanced-tank-remnant")
require("prototypes.entities.remnants.fusion-reactor-remnant")
require("prototypes.entities.remnants.antimatter-reactor-remnant")
require("prototypes.entities.remnants.kr-big-random-pipes-remnant")
require("prototypes.entities.remnants.kr-medium-random-pipes-remnant")
require("prototypes.entities.remnants.kr-mineral-water-pumpjack-remnant")
require("prototypes.entities.remnants.matter-plant")
require("prototypes.entities.remnants.superior-inserter-remnant")
require("prototypes.entities.remnants.turret")
-- -- Belts
-- Advanced
require("prototypes.entities.remnants.transport-belts.advanced-transport-belt.advanced-splitter-remnant")
require(
  "__Krastorio2__/prototypes/entities/remnants/transport-belts/advanced-transport-belt/advanced-transport-belt-remnant"
)
require(
  "__Krastorio2__/prototypes/entities/remnants/transport-belts/advanced-transport-belt/advanced-underground-belt-remnant"
)
-- Superior
require("prototypes.entities.remnants.transport-belts.superior-transport-belt.superior-splitter-remnant")
require(
  "__Krastorio2__/prototypes/entities/remnants/transport-belts/superior-transport-belt/superior-transport-belt-remnant"
)
require(
  "__Krastorio2__/prototypes/entities/remnants/transport-belts/superior-transport-belt/superior-underground-belt-remnant"
)
---------------------------------------------------------------------------------------
-- -- -- VEHICLES
---------------------------------------------------------------------------------------
require("prototypes.entities.vehicles.advanced-tank")
require("prototypes.entities.vehicles.nuclear-locomotive")
---------------------------------------------------------------------------------------
-- -- -- Explosions&projectiles
---------------------------------------------------------------------------------------
require("prototypes.entities.explosions&projectiles.explosions")
require("prototypes.entities.explosions&projectiles.projectiles")
---------------------------------------------------------------------------------------
