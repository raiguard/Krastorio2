if not mods["squeak-through-2"] then
  return
end

--- @param type string
--- @param name string
local function add_exclusion(type, name)
  local prototype = data.raw[type][name]
  if prototype then
    prototype.squeak_behaviour = false --- @diagnostic disable-line
  end
end

add_exclusion("accumulator", "kr-energy-storage")
add_exclusion("accumulator", "kr-intergalactic-transceiver")

add_exclusion("ammo-turret", "kr-railgun-turret")
add_exclusion("ammo-turret", "kr-rocket-turret")

add_exclusion("assembling-machine", "kr-advanced-chemical-plant")
add_exclusion("assembling-machine", "kr-advanced-furnace")
add_exclusion("assembling-machine", "kr-air-filter")
add_exclusion("assembling-machine", "kr-atmospheric-condenser")
add_exclusion("assembling-machine", "kr-bio-lab")
add_exclusion("assembling-machine", "kr-electrolysis-plant")
add_exclusion("assembling-machine", "kr-filtration-plant")
add_exclusion("assembling-machine", "kr-fuel-refinery")
add_exclusion("assembling-machine", "kr-fuel-refinery")
add_exclusion("assembling-machine", "kr-greenhouse")
add_exclusion("assembling-machine", "kr-matter-associator")
add_exclusion("assembling-machine", "kr-matter-plant")
add_exclusion("assembling-machine", "kr-quantum-computer")

add_exclusion("beacon", "kr-singularity-beacon")

add_exclusion("burner-generator", "kr-antimatter-reactor")

add_exclusion("container", "kr-shelter-container")
add_exclusion("container", "kr-shelter-plus-container")
add_exclusion("container", "kr-storehouse")
add_exclusion("container", "kr-warehouse")

add_exclusion("electric-energy-interface", "kr-activated-intergalactic-transceiver")
add_exclusion("electric-energy-interface", "kr-shelter")
add_exclusion("electric-energy-interface", "kr-shelter-plus")
add_exclusion("electric-energy-interface", "kr-wind-turbine")

add_exclusion("furnace", "kr-air-purifier")
add_exclusion("furnace", "kr-crusher")
add_exclusion("furnace", "kr-crusher")
add_exclusion("furnace", "kr-flare-stack")
add_exclusion("furnace", "kr-fusion-reactor")
add_exclusion("furnace", "kr-stabilizer-charging-station")

add_exclusion("generator", "kr-advanced-steam-turbine")
add_exclusion("generator", "kr-gas-power-station")

add_exclusion("lab", "biusart_lab")
add_exclusion("lab", "kr-singularity-lab")

add_exclusion("loader-1x1", "kr-express-loader")
add_exclusion("loader-1x1", "kr-fast-loader")
add_exclusion("loader-1x1", "kr-loader")
add_exclusion("loader-1x1", "kr-se-loader")
add_exclusion("loader-1x1", "kr-superior-loader")

add_exclusion("logistic-container", "kr-active-provider-storehouse")
add_exclusion("logistic-container", "kr-active-provider-warehouse")
add_exclusion("logistic-container", "kr-buffer-storehouse")
add_exclusion("logistic-container", "kr-buffer-warehouse")
add_exclusion("logistic-container", "kr-passive-provider-storehouse")
add_exclusion("logistic-container", "kr-passive-provider-warehouse")
add_exclusion("logistic-container", "kr-requester-storehouse")
add_exclusion("logistic-container", "kr-requester-warehouse")
add_exclusion("logistic-container", "kr-storage-storehouse")
add_exclusion("logistic-container", "kr-storage-warehouse")

add_exclusion("mining-drill", "kr-mineral-water-pumpjack")
add_exclusion("mining-drill", "kr-quarry-drill")

add_exclusion("radar", "kr-sentinel")

add_exclusion("roboport", "kr-big-roboport")
add_exclusion("roboport", "kr-small-roboport")

add_exclusion("simple-entity", "kr-planetary-teleporter-collision-1")
add_exclusion("simple-entity", "kr-planetary-teleporter-collision-2")
add_exclusion("simple-entity", "kr-planetary-teleporter-collision-3")
add_exclusion("simple-entity", "kr-planetary-teleporter-front-layer")

add_exclusion("solar-panel", "kr-advanced-solar-panel")

add_exclusion("storage-tank", "big-storage-tank")
add_exclusion("storage-tank", "huge-storage-tank")
