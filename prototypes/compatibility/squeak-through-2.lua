if not mods["squeak-through-2"] then
  return
end

--- @diagnostic disable:inject-field

data.raw["accumulator"]["kr-energy-storage"].squeak_behavior = false
data.raw["accumulator"]["kr-intergalactic-transceiver"].squeak_behavior = false

data.raw["ammo-turret"]["kr-railgun-turret"].squeak_behavior = false
data.raw["ammo-turret"]["kr-rocket-turret"].squeak_behavior = false

data.raw["assembling-machine"]["kr-advanced-chemical-plant"].squeak_behavior = false
data.raw["assembling-machine"]["kr-advanced-furnace"].squeak_behavior = false
data.raw["assembling-machine"]["kr-atmospheric-condenser"].squeak_behavior = false
data.raw["assembling-machine"]["kr-bio-lab"].squeak_behavior = false
data.raw["assembling-machine"]["kr-electrolysis-plant"].squeak_behavior = false
data.raw["assembling-machine"]["kr-filtration-plant"].squeak_behavior = false
data.raw["assembling-machine"]["kr-fuel-refinery"].squeak_behavior = false
data.raw["assembling-machine"]["kr-fuel-refinery"].squeak_behavior = false
data.raw["assembling-machine"]["kr-greenhouse"].squeak_behavior = false
data.raw["assembling-machine"]["kr-matter-associator"].squeak_behavior = false
data.raw["assembling-machine"]["kr-matter-plant"].squeak_behavior = false
data.raw["assembling-machine"]["kr-quantum-computer"].squeak_behavior = false

data.raw["beacon"]["kr-singularity-beacon"].squeak_behavior = false

data.raw["burner-generator"]["kr-antimatter-reactor"].squeak_behavior = false

data.raw["container"]["kr-shelter-container"].squeak_behavior = false
data.raw["container"]["kr-shelter-plus-container"].squeak_behavior = false

data.raw["electric-energy-interface"]["kr-activated-intergalactic-transceiver"].squeak_behavior = false
data.raw["electric-energy-interface"]["kr-shelter"].squeak_behavior = false
data.raw["electric-energy-interface"]["kr-shelter-plus"].squeak_behavior = false
data.raw["electric-energy-interface"]["kr-wind-turbine"].squeak_behavior = false

data.raw["furnace"]["kr-air-purifier"].squeak_behavior = false
data.raw["furnace"]["kr-crusher"].squeak_behavior = false
data.raw["furnace"]["kr-crusher"].squeak_behavior = false
data.raw["furnace"]["kr-flare-stack"].squeak_behavior = false
data.raw["furnace"]["kr-stabilizer-charging-station"].squeak_behavior = false

data.raw["generator"]["kr-advanced-steam-turbine"].squeak_behavior = false
data.raw["generator"]["kr-gas-power-station"].squeak_behavior = false

data.raw["lab"]["kr-advanced-lab"].squeak_behavior = false
data.raw["lab"]["kr-singularity-lab"].squeak_behavior = false

data.raw["mining-drill"]["kr-mineral-water-pumpjack"].squeak_behavior = false
data.raw["mining-drill"]["kr-quarry-drill"].squeak_behavior = false

data.raw["radar"]["kr-sentinel"].squeak_behavior = false

data.raw["roboport"]["kr-big-roboport"].squeak_behavior = false
data.raw["roboport"]["kr-small-roboport"].squeak_behavior = false

data.raw["simple-entity"]["kr-planetary-teleporter-collision-1"].squeak_behavior = false
data.raw["simple-entity"]["kr-planetary-teleporter-collision-2"].squeak_behavior = false
data.raw["simple-entity"]["kr-planetary-teleporter-collision-3"].squeak_behavior = false
data.raw["simple-entity"]["kr-planetary-teleporter-front-layer"].squeak_behavior = false

data.raw["solar-panel"]["kr-advanced-solar-panel"].squeak_behavior = false

data.raw["storage-tank"]["kr-big-storage-tank"].squeak_behavior = false
data.raw["storage-tank"]["kr-huge-storage-tank"].squeak_behavior = false

if settings.startup["kr-containers"].value then
  data.raw["container"]["kr-strongbox"].squeak_behavior = false
  data.raw["container"]["kr-warehouse"].squeak_behavior = false
  data.raw["logistic-container"]["kr-active-provider-strongbox"].squeak_behavior = false
  data.raw["logistic-container"]["kr-active-provider-warehouse"].squeak_behavior = false
  data.raw["logistic-container"]["kr-buffer-strongbox"].squeak_behavior = false
  data.raw["logistic-container"]["kr-buffer-warehouse"].squeak_behavior = false
  data.raw["logistic-container"]["kr-passive-provider-strongbox"].squeak_behavior = false
  data.raw["logistic-container"]["kr-passive-provider-warehouse"].squeak_behavior = false
  data.raw["logistic-container"]["kr-requester-strongbox"].squeak_behavior = false
  data.raw["logistic-container"]["kr-requester-warehouse"].squeak_behavior = false
  data.raw["logistic-container"]["kr-storage-strongbox"].squeak_behavior = false
  data.raw["logistic-container"]["kr-storage-warehouse"].squeak_behavior = false
end

if settings.startup["kr-loaders"].value then
  data.raw["loader-1x1"]["kr-advanced-loader"].squeak_behavior = false
  data.raw["loader-1x1"]["kr-express-loader"].squeak_behavior = false
  data.raw["loader-1x1"]["kr-fast-loader"].squeak_behavior = false
  data.raw["loader-1x1"]["kr-loader"].squeak_behavior = false
  data.raw["loader-1x1"]["kr-superior-loader"].squeak_behavior = false
end
