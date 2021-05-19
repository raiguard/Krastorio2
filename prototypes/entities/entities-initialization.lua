---------------------------------------------------------------------------------------
-- -- -- PIPE PATCH AND COVERS
---------------------------------------------------------------------------------------
require(kr_entities_prototypes_path .. "buildings/pipe-covers/pipe-patch")
require(kr_entities_prototypes_path .. "buildings/pipe-covers/steel-pipecovers")
---------------------------------------------------------------------------------------
-- -- -- BUILDINGS
---------------------------------------------------------------------------------------
-- Crash site
require(kr_entities_prototypes_path .. "buildings/crash-site/crash-site-assembling-machine-1")
require(kr_entities_prototypes_path .. "buildings/crash-site/crash-site-assembling-machine-2")
require(kr_entities_prototypes_path .. "buildings/crash-site/crash-site-chest-1")
require(kr_entities_prototypes_path .. "buildings/crash-site/crash-site-chest-2")
require(kr_entities_prototypes_path .. "buildings/crash-site/crash-site-generator")
require(kr_entities_prototypes_path .. "buildings/crash-site/crash-site-lab")
require(kr_entities_prototypes_path .. "buildings/crash-site/mineable-wreckage")
-- -- Generals
require(kr_entities_prototypes_path .. "buildings/advanced-chemical-plant")
require(kr_entities_prototypes_path .. "buildings/advanced-furnace")
require(kr_entities_prototypes_path .. "buildings/advanced-solar-panel")
require(kr_entities_prototypes_path .. "buildings/advanced-steam-turbine")
require(kr_entities_prototypes_path .. "buildings/air-purifier")
require(kr_entities_prototypes_path .. "buildings/antimatter-reactor")
require(kr_entities_prototypes_path .. "buildings/atmospheric-condenser")
require(kr_entities_prototypes_path .. "buildings/bio-lab")
require(kr_entities_prototypes_path .. "buildings/crusher")
require(kr_entities_prototypes_path .. "buildings/electrolysis-plant")
require(kr_entities_prototypes_path .. "buildings/energy-storage")
require(kr_entities_prototypes_path .. "buildings/filtration-plant")
require(kr_entities_prototypes_path .. "buildings/fluid-burner")
require(kr_entities_prototypes_path .. "buildings/fuel-refinery")
require(kr_entities_prototypes_path .. "buildings/fusion-reactor")
require(kr_entities_prototypes_path .. "buildings/gas-power-station")
require(kr_entities_prototypes_path .. "buildings/greenhouse")
require(kr_entities_prototypes_path .. "buildings/intergalactic-transceiver")
require(kr_entities_prototypes_path .. "buildings/planetary-teleporter")
require(kr_entities_prototypes_path .. "buildings/matter-assembler")
require(kr_entities_prototypes_path .. "buildings/matter-plant")
require(kr_entities_prototypes_path .. "buildings/mineral-water-pumpjack")
require(kr_entities_prototypes_path .. "buildings/quantum-computer")
require(kr_entities_prototypes_path .. "buildings/quarry-drill")
require(kr_entities_prototypes_path .. "buildings/research-server")
require(kr_entities_prototypes_path .. "buildings/sentinel")
require(kr_entities_prototypes_path .. "buildings/shelter")
require(kr_entities_prototypes_path .. "buildings/shelter-plus")
require(kr_entities_prototypes_path .. "buildings/singularity-beacon")
require(kr_entities_prototypes_path .. "buildings/stabilizer-charging-station")
require(kr_entities_prototypes_path .. "buildings/iron-pipe")
require(kr_entities_prototypes_path .. "buildings/steel-pipe")
require(kr_entities_prototypes_path .. "buildings/steel-pipe-to-ground")
require(kr_entities_prototypes_path .. "buildings/steel-pump")
require(kr_entities_prototypes_path .. "buildings/substation-mk2")
require(kr_entities_prototypes_path .. "buildings/superior-inserters")
require(kr_entities_prototypes_path .. "buildings/wind-turbine")
require(kr_entities_prototypes_path .. "buildings/advanced-assembling-machine")
require(kr_entities_prototypes_path .. "buildings/electric-mining-drills")
require(kr_entities_prototypes_path .. "buildings/tesla-coil")
require(kr_entities_prototypes_path .. "buildings/logo")
-- -- Turrets
require(kr_entities_prototypes_path .. "buildings/turrets/railgun-turret")
require(kr_entities_prototypes_path .. "buildings/turrets/rocket-turret")
require(kr_entities_prototypes_path .. "buildings/turrets/laser-artillery-turret")
-- -- Laboratories
require(kr_entities_prototypes_path .. "buildings/biusart-lab")
require(kr_entities_prototypes_path .. "buildings/singularity-lab")
-- -- Roboports
require(kr_entities_prototypes_path .. "buildings/small-roboport")
require(kr_entities_prototypes_path .. "buildings/large-roboport")
-- -- Conteiners
-- Mediums
require(kr_entities_prototypes_path .. "buildings/containers/medium-containers/medium-container")
require(kr_entities_prototypes_path .. "buildings/containers/medium-containers/medium-active-provider-container")
require(kr_entities_prototypes_path .. "buildings/containers/medium-containers/medium-buffer-container")
require(kr_entities_prototypes_path .. "buildings/containers/medium-containers/medium-passive-provider-container")
require(kr_entities_prototypes_path .. "buildings/containers/medium-containers/medium-requester-container")
require(kr_entities_prototypes_path .. "buildings/containers/medium-containers/medium-storage-container")
-- Big
require(kr_entities_prototypes_path .. "buildings/containers/big-containers/big-container")
require(kr_entities_prototypes_path .. "buildings/containers/big-containers/big-active-provider-container")
require(kr_entities_prototypes_path .. "buildings/containers/big-containers/big-buffer-container")
require(kr_entities_prototypes_path .. "buildings/containers/big-containers/big-passive-provider-container")
require(kr_entities_prototypes_path .. "buildings/containers/big-containers/big-requester-container")
require(kr_entities_prototypes_path .. "buildings/containers/big-containers/big-storage-container")
-- -- Fluid storages
require(kr_entities_prototypes_path .. "buildings/fluid-storages/fluid-storage-1")
require(kr_entities_prototypes_path .. "buildings/fluid-storages/fluid-storage-2")
-- -- Belts
-- Advanced
require(kr_entities_prototypes_path .. "buildings/transport-belts/advanced-transport-belt/animation-set") -- Must be loaded before the belts set
require(kr_entities_prototypes_path .. "buildings/transport-belts/advanced-transport-belt/advanced-splitter")
require(kr_entities_prototypes_path .. "buildings/transport-belts/advanced-transport-belt/advanced-transport-belt")
require(kr_entities_prototypes_path .. "buildings/transport-belts/advanced-transport-belt/advanced-underground-belt")
-- Superior
require(kr_entities_prototypes_path .. "buildings/transport-belts/superior-transport-belt/animation-set") -- Must be loaded before the belts set
require(kr_entities_prototypes_path .. "buildings/transport-belts/superior-transport-belt/superior-splitter")
require(kr_entities_prototypes_path .. "buildings/transport-belts/superior-transport-belt/superior-transport-belt")
require(kr_entities_prototypes_path .. "buildings/transport-belts/superior-transport-belt/superior-underground-belt")
-- Loaders
require(kr_entities_prototypes_path .. "buildings/loaders") -- Must be required after belts
---------------------------------------------------------------------------------------
-- -- -- REMNANTS
---------------------------------------------------------------------------------------
require(kr_entities_prototypes_path .. "remnants/advanced-tank-remnant")
require(kr_entities_prototypes_path .. "remnants/fusion-reactor-remnant")
require(kr_entities_prototypes_path .. "remnants/antimatter-reactor-remnant")
require(kr_entities_prototypes_path .. "remnants/kr-big-random-pipes-remnant")
require(kr_entities_prototypes_path .. "remnants/kr-medium-random-pipes-remnant")
require(kr_entities_prototypes_path .. "remnants/kr-mineral-water-pumpjack-remnant")
require(kr_entities_prototypes_path .. "remnants/matter-plant")
require(kr_entities_prototypes_path .. "remnants/superior-inserter-remnant")
require(kr_entities_prototypes_path .. "remnants/turret")
-- -- Belts
-- Advanced
require(kr_entities_prototypes_path .. "remnants/transport-belts/advanced-transport-belt/advanced-splitter-remnant")
require(
  kr_entities_prototypes_path .. "remnants/transport-belts/advanced-transport-belt/advanced-transport-belt-remnant"
)
require(
  kr_entities_prototypes_path .. "remnants/transport-belts/advanced-transport-belt/advanced-underground-belt-remnant"
)
-- Superior
require(kr_entities_prototypes_path .. "remnants/transport-belts/superior-transport-belt/superior-splitter-remnant")
require(
  kr_entities_prototypes_path .. "remnants/transport-belts/superior-transport-belt/superior-transport-belt-remnant"
)
require(
  kr_entities_prototypes_path .. "remnants/transport-belts/superior-transport-belt/superior-underground-belt-remnant"
)
---------------------------------------------------------------------------------------
-- -- -- VEHICLES
---------------------------------------------------------------------------------------
require(kr_entities_prototypes_path .. "vehicles/advanced-tank")
require(kr_entities_prototypes_path .. "vehicles/nuclear-locomotive")
---------------------------------------------------------------------------------------
-- -- -- Explosions&projectiles
---------------------------------------------------------------------------------------
require(kr_entities_prototypes_path .. "explosions&projectiles/explosions")
require(kr_entities_prototypes_path .. "explosions&projectiles/projectiles")
---------------------------------------------------------------------------------------
