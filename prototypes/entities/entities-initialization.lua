---------------------------------------------------------------------------------------
-- -- -- PIPE PATCH AND COVERS
---------------------------------------------------------------------------------------
require("buildings/pipe-covers/pipe-patch")
require("buildings/pipe-covers/steel-pipecovers")
---------------------------------------------------------------------------------------
-- -- -- BUILDINGS
---------------------------------------------------------------------------------------
-- -- Generals
require("buildings/advanced-furnace")
require("buildings/advanced-steam-turbine")
require("buildings/air-purifier")
require("buildings/antimatter-reactor")
require("buildings/atmospheric-condenser")
require("buildings/crash-site")
require("buildings/crusher")
require("buildings/electrolysis-plant")
require("buildings/filtration-plant")
require("buildings/fluid-burner")
require("buildings/fuel-refinery")
require("buildings/fusion-reactor")
require("buildings/greenhouse")
require("buildings/quarry-drill")
require("buildings/research-server")
require("buildings/sentinel")
require("buildings/shelter")
require("buildings/steel-pipe")
require("buildings/steel-pipe-to-ground")
require("buildings/steel-pump")
require("buildings/mineral-water-pumpjack")
require("buildings/wind-turbine")
require("buildings/matter-plant")
require("buildings/matter-assembler")
require("buildings/gas-power-station")
require("buildings/intergalactic-transceiver")
-- -- Turrets
require("buildings/turrets/railgun-turret")
require("buildings/turrets/rocket-turret")
-- -- Laboratories
require("buildings/biusart-lab")
require("buildings/singularity-lab")
-- -- Roboports
require("buildings/small-roboport")
require("buildings/large-roboport")
-- -- Conteiners
-- Mediums
require("buildings/containers/medium-containers/medium-active-provider-container")
require("buildings/containers/medium-containers/medium-buffer-container")
require("buildings/containers/medium-containers/medium-container")
require("buildings/containers/medium-containers/medium-passive-provider-container")
require("buildings/containers/medium-containers/medium-requester-container")
require("buildings/containers/medium-containers/medium-storage-container")
-- Big
require("buildings/containers/big-containers/big-active-provider-container")
require("buildings/containers/big-containers/big-buffer-container")
require("buildings/containers/big-containers/big-container")
require("buildings/containers/big-containers/big-passive-provider-container")
require("buildings/containers/big-containers/big-requester-container")
require("buildings/containers/big-containers/big-storage-container")
-- -- Fluid storages
require("buildings/fluid-storages/fluid-storage-1")
require("buildings/fluid-storages/fluid-storage-2")
-- -- Belts
-- Advanced
require("buildings/transport-belts/advanced-transport-belt/animation-set") -- Must be loaded before the belts set
require("buildings/transport-belts/advanced-transport-belt/advanced-splitter")
require("buildings/transport-belts/advanced-transport-belt/advanced-transport-belt")
require("buildings/transport-belts/advanced-transport-belt/advanced-underground-belt")
-- Superior
require("buildings/transport-belts/superior-transport-belt/animation-set") -- Must be loaded before the belts set
require("buildings/transport-belts/superior-transport-belt/superior-splitter")
require("buildings/transport-belts/superior-transport-belt/superior-transport-belt")
require("buildings/transport-belts/superior-transport-belt/superior-underground-belt")
-- Loaders
require("buildings/loaders") -- Must be required after belts
---------------------------------------------------------------------------------------
-- -- -- REMNANTS
---------------------------------------------------------------------------------------
require("remnants/advanced-tank-remnant")
require("remnants/fusion-reactor-remnant")
require("remnants/antimatter-reactor-remnant")
require("remnants/kr-big-random-pipes-remnant")
require("remnants/kr-medium-random-pipes-remnant")
require("remnants/kr-mineral-water-pumpjack-remnant")
require("remnants/matter-plant")
-- -- Belts
-- Advanced
require("remnants/transport-belts/advanced-transport-belt/advanced-splitter-remnant")
require("remnants/transport-belts/advanced-transport-belt/advanced-transport-belt-remnant")
require("remnants/transport-belts/advanced-transport-belt/advanced-underground-belt-remnant")
-- Superior
require("remnants/transport-belts/superior-transport-belt/superior-splitter-remnant")
require("remnants/transport-belts/superior-transport-belt/superior-transport-belt-remnant")
require("remnants/transport-belts/superior-transport-belt/superior-underground-belt-remnant")
---------------------------------------------------------------------------------------
-- -- -- VEHICLES
---------------------------------------------------------------------------------------
require("vehicles/advanced-tank")
require("vehicles/nuclear-locomotive")
---------------------------------------------------------------------------------------
-- -- -- Explosions&projectiles
---------------------------------------------------------------------------------------
require("explosions&projectiles/explosions")
require("explosions&projectiles/projectiles")
---------------------------------------------------------------------------------------