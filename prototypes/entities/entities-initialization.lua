-- -- -- PIPE PATCH
require("buildings/pipe-patch")

-- -- -- BUILDINGS
-- -- Generals
require("buildings/wind-turbine")
require("buildings/greenhouse")
require("buildings/crusher")
require("buildings/loaders")
require("buildings/water-pumpjack")
-- -- Laboratory
require("buildings/biusart-lab")
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

-- -- -- REMNANTS
require("remnants/kr-medium-random-pipes-remnant")
require("remnants/kr-big-random-pipes-remnant")
require("remnants/kr-water-pumpjack-remnant")