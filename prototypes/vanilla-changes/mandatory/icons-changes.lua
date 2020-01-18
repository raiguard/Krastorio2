-----------------------------------------------------------------
-- -- -- ITEMS
-- -- Adapting the vanilla science packs with the new icons style

-- Automation science pack
krastorio.icons.setItemIcon("automation-science-pack",          kr_cards_icons_path .. "automation-tech-card.png")
data.raw.tool["automation-science-pack"].order = "b02[automation-tech-card]"

-- Logistic science pack
krastorio.icons.setItemIcon("logistic-science-pack",            kr_cards_icons_path .. "logistic-tech-card.png")
data.raw.tool["logistic-science-pack"].order = "b03[logistic-tech-card]"
krastorio.icons.setTechnologyIcon("logistic-science-pack",      kr_technologies_icons_path .. "logistic-tech-card.png")

-- Military science pack
krastorio.icons.setItemIcon("military-science-pack",            kr_cards_icons_path .. "military-tech-card.png")
data.raw.tool["military-science-pack"].order = "b04[military-tech-card]"
krastorio.icons.setTechnologyIcon("military-science-pack",      kr_technologies_icons_path .. "military-tech-card.png")

-- Chemical science pack
krastorio.icons.setItemIcon("chemical-science-pack",            kr_cards_icons_path .. "chemical-tech-card.png")
data.raw.tool["chemical-science-pack"].order = "b05[chemical-tech-card]"
krastorio.icons.setTechnologyIcon("chemical-science-pack",      kr_technologies_icons_path .. "chemical-tech-card.png")

-- Production science pack
krastorio.icons.setItemIcon("production-science-pack",          kr_cards_icons_path .. "production-tech-card.png")
data.raw.tool["production-science-pack"].order = "b06[production-tech-card]"
krastorio.icons.setTechnologyIcon("production-science-pack",    kr_technologies_icons_path .. "production-tech-card.png")

-- Utility science pack
krastorio.icons.setItemIcon("utility-science-pack",             kr_cards_icons_path .. "utility-tech-card.png")
data.raw.tool["utility-science-pack"].order = "b07[utility-tech-card]"
krastorio.icons.setTechnologyIcon("utility-science-pack",       kr_technologies_icons_path .. "utility-tech-card.png")

-- Space science pack
krastorio.icons.setItemIcon("space-science-pack",               kr_cards_icons_path .. "optimization-tech-card.png")
data.raw.tool["space-science-pack"].order = "b09[optimization-tech-card]"
krastorio.icons.setTechnologyIcon("space-science-pack",         kr_technologies_icons_path .. "optimization-tech-card.png")

-----------------------------------------------------------------
-- -- Chaning intermediate products icons

-- Chaning iron plate
krastorio.icons.setItemIcon("iron-plate",                       kr_icons_path .. "iron-plate.png")

-- Changing copper plate
krastorio.icons.setItemIcon("copper-plate",                     kr_icons_path .. "copper-plate.png")

-- Chaning steel icon
krastorio.icons.setItemIcon("steel-plate",                      kr_icons_path .. "steel-plate.png")

-- Changing iron gear wheel
krastorio.icons.setItemIcon("iron-gear-wheel",                  kr_icons_path .. "iron-gear-wheel.png")

-- Neural Networks icons
krastorio.icons.setItemIcon("arithmetic-combinator",            kr_icons_path .. "nn-icons/arithmetic-combinator.png")
krastorio.icons.setItemIcon("artillery-turret",                 kr_icons_path .. "nn-icons/artillery-turret.png")
krastorio.icons.setItemIcon("artillery-wagon",                  kr_icons_path .. "nn-icons/artillery-wagon.png")
krastorio.icons.setItemIcon("assembling-machine-0",             kr_icons_path .. "nn-icons/assembling-machine-0.png")
krastorio.icons.setItemIcon("assembling-machine-1",             kr_icons_path .. "nn-icons/assembling-machine-1.png")
krastorio.icons.setItemIcon("assembling-machine-2",             kr_icons_path .. "nn-icons/assembling-machine-2.png")
krastorio.icons.setItemIcon("assembling-machine-3",             kr_icons_path .. "nn-icons/assembling-machine-3.png")
krastorio.icons.setItemIcon("battery",                          kr_icons_path .. "nn-icons/battery.png")
krastorio.icons.setItemIcon("beacon",                           kr_icons_path .. "nn-icons/beacon.png")
krastorio.icons.setItemIcon("belt-immunity-equipment",          kr_icons_path .. "nn-icons/belt-immunity-equipment.png")
krastorio.icons.setItemIcon("big-electric-pole",                kr_icons_path .. "nn-icons/big-electric-pole.png")
krastorio.icons.setItemIcon("boiler",                           kr_icons_path .. "nn-icons/boiler.png")
krastorio.icons.setItemIcon("burner-inserter",                  kr_icons_path .. "nn-icons/burner-inserter.png")
krastorio.icons.setItemIcon("burner-mining-drill",              kr_icons_path .. "nn-icons/burner-mining-drill.png")
krastorio.icons.setItemIcon("car",                              kr_icons_path .. "nn-icons/car.png")
krastorio.icons.setItemIcon("cargo-wagon",                      kr_icons_path .. "nn-icons/cargo-wagon.png")
krastorio.icons.setItemIcon("centrifuge",                       kr_icons_path .. "nn-icons/centrifuge.png")
krastorio.icons.setItemIcon("chemical-plant",                   kr_icons_path .. "nn-icons/chemical-plant.png")
krastorio.icons.setItemIcon("cliff-explosives",                 kr_icons_path .. "nn-icons/cliff-explosives.png")
krastorio.icons.setItemIcon("cluster-grenade",                  kr_icons_path .. "nn-icons/cluster-grenade.png")
krastorio.icons.setItemIcon("coin",                             kr_icons_path .. "nn-icons/coin.png")
krastorio.icons.setItemIcon("combat-shotgun",                   kr_icons_path .. "nn-icons/combat-shotgun.png")
krastorio.icons.setItemIcon("compilatron-chest",                kr_icons_path .. "nn-icons/compilatron-chest.png")
krastorio.icons.setItemIcon("concrete",                         kr_icons_path .. "nn-icons/concrete.png")
krastorio.icons.setItemIcon("constant-combinator",              kr_icons_path .. "nn-icons/constant-combinator.png")
krastorio.icons.setItemIcon("construction-robot",               kr_icons_path .. "nn-icons/construction-robot.png")
krastorio.icons.setItemIcon("copper-cable",                     kr_icons_path .. "nn-icons/copper-cable.png")
krastorio.icons.setItemIcon("decider-combinator",               kr_icons_path .. "nn-icons/decider-combinator.png")
krastorio.icons.setItemIcon("defender",                         kr_icons_path .. "nn-icons/defender.png")
krastorio.icons.setItemIcon("destroyer",                        kr_icons_path .. "nn-icons/destroyer.png")
krastorio.icons.setItemIcon("diesel-locomotive",                kr_icons_path .. "nn-icons/diesel-locomotive.png")
krastorio.icons.setItemIcon("discharge-defense-equipment",      kr_icons_path .. "nn-icons/discharge-defense-equipment.png")
krastorio.icons.setItemIcon("distractor",                       kr_icons_path .. "nn-icons/distractor.png")
krastorio.icons.setItemIcon("effectivity-module",               kr_icons_path .. "nn-icons/effectivity-module.png")
krastorio.icons.setItemIcon("effectivity-module-2",             kr_icons_path .. "nn-icons/effectivity-module-2.png")
krastorio.icons.setItemIcon("effectivity-module-3",             kr_icons_path .. "nn-icons/effectivity-module-3.png")
krastorio.icons.setItemIcon("electric-engine-unit",             kr_icons_path .. "nn-icons/electric-engine-unit.png")
krastorio.icons.setItemIcon("electric-furnace",                 kr_icons_path .. "nn-icons/electric-furnace.png")
krastorio.icons.setItemIcon("electric-mining-drill",            kr_icons_path .. "nn-icons/electric-mining-drill.png")
krastorio.icons.setItemIcon("engine-unit",                      kr_icons_path .. "nn-icons/engine-unit.png")
krastorio.icons.setItemIcon("explosive-rocket",                 kr_icons_path .. "nn-icons/explosive-rocket.png")
krastorio.icons.setItemIcon("explosives",                       kr_icons_path .. "nn-icons/explosives.png")
krastorio.icons.setItemIcon("express-splitter",                 kr_icons_path .. "nn-icons/express-splitter.png")
krastorio.icons.setItemIcon("express-transport-belt",           kr_icons_path .. "nn-icons/express-transport-belt.png")
krastorio.icons.setItemIcon("express-underground-belt",         kr_icons_path .. "nn-icons/express-underground-belt.png")
krastorio.icons.setItemIcon("fast-inserter",                    kr_icons_path .. "nn-icons/fast-inserter.png")
krastorio.icons.setItemIcon("fast-splitter",                    kr_icons_path .. "nn-icons/fast-splitter.png")
krastorio.icons.setItemIcon("fast-underground-belt",            kr_icons_path .. "nn-icons/fast-underground-belt.png")
krastorio.icons.setItemIcon("filter-inserter",                  kr_icons_path .. "nn-icons/filter-inserter.png")
krastorio.icons.setItemIcon("fish",                             kr_icons_path .. "nn-icons/fish.png")
krastorio.icons.setItemIcon("flamethrower",                     kr_icons_path .. "nn-icons/flamethrower.png")
krastorio.icons.setItemIcon("flamethrower-turret",              kr_icons_path .. "nn-icons/flamethrower-turret.png")
krastorio.icons.setItemIcon("fluid-wagon",                      kr_icons_path .. "nn-icons/fluid-wagon.png")
krastorio.icons.setItemIcon("flying-robot-frame",               kr_icons_path .. "nn-icons/flying-robot-frame.png")
krastorio.icons.setItemIcon("gate",                             kr_icons_path .. "nn-icons/gate.png")
krastorio.icons.setItemIcon("green-wire",                       kr_icons_path .. "nn-icons/green-wire.png")
krastorio.icons.setItemIcon("grenade",                          kr_icons_path .. "nn-icons/grenade.png")
krastorio.icons.setItemIcon("gun-turret",                       kr_icons_path .. "nn-icons/gun-turret.png")
krastorio.icons.setItemIcon("heat-exchanger",                   kr_icons_path .. "nn-icons/heat-boiler.png")
krastorio.icons.setItemIcon("heat-pipe",                        kr_icons_path .. "nn-icons/heat-pipe.png")
krastorio.icons.setItemIcon("infinity-chest",                   kr_icons_path .. "nn-icons/infinity-chest.png")
krastorio.icons.setItemIcon("inserter",                         kr_icons_path .. "nn-icons/inserter.png")
krastorio.icons.setItemIcon("iron-chest",                       kr_icons_path .. "nn-icons/iron-chest.png")
krastorio.icons.setItemIcon("iron-stick",                       kr_icons_path .. "nn-icons/iron-stick.png")
krastorio.icons.setItemIcon("lab",                              kr_icons_path .. "nn-icons/lab.png")
krastorio.icons.setItemIcon("landfill",                         kr_icons_path .. "nn-icons/landfill.png")
krastorio.icons.setItemIcon("land-mine",                        kr_icons_path .. "nn-icons/land-mine.png")
krastorio.icons.setItemIcon("laser-turret",                     kr_icons_path .. "nn-icons/laser-turret.png")
krastorio.icons.setItemIcon("logistic-chest-active-provider",   kr_icons_path .. "nn-icons/logistic-chest-active-provider.png")
krastorio.icons.setItemIcon("logistic-chest-buffer",            kr_icons_path .. "nn-icons/logistic-chest-buffer.png")
krastorio.icons.setItemIcon("logistic-chest-passive-provider",  kr_icons_path .. "nn-icons/logistic-chest-passive-provider.png")
krastorio.icons.setItemIcon("logistic-chest-requester",         kr_icons_path .. "nn-icons/logistic-chest-requester.png")
krastorio.icons.setItemIcon("logistic-chest-storage",           kr_icons_path .. "nn-icons/logistic-chest-storage.png")
krastorio.icons.setItemIcon("logistic-robot",                   kr_icons_path .. "nn-icons/logistic-robot.png")
krastorio.icons.setItemIcon("long-handed-inserter",             kr_icons_path .. "nn-icons/long-handed-inserter.png")
krastorio.icons.setItemIcon("market",                           kr_icons_path .. "nn-icons/market.png")
krastorio.icons.setItemIcon("medium-electric-pole",             kr_icons_path .. "nn-icons/medium-electric-pole.png")
krastorio.icons.setItemIcon("nuclear-fuel",                     kr_icons_path .. "nn-icons/nuclear-fuel.png")
krastorio.icons.setItemIcon("nuclear-reactor",                  kr_icons_path .. "nn-icons/nuclear-reactor.png")
krastorio.icons.setItemIcon("offshore-pump",                    kr_icons_path .. "nn-icons/offshore-pump.png")
krastorio.icons.setItemIcon("oil-refinery",                     kr_icons_path .. "nn-icons/oil-refinery.png")
krastorio.icons.setItemIcon("pipe",                             kr_icons_path .. "nn-icons/pipe.png")
krastorio.icons.setItemIcon("pipe-to-ground",                   kr_icons_path .. "nn-icons/pipe-to-ground.png")
krastorio.icons.setItemIcon("pistol",                           kr_icons_path .. "nn-icons/pistol.png")
krastorio.icons.setItemIcon("plastic-bar",                      kr_icons_path .. "nn-icons/plastic-bar.png")
krastorio.icons.setItemIcon("power-switch",                     kr_icons_path .. "nn-icons/power-switch.png")
krastorio.icons.setItemIcon("productivity-module",              kr_icons_path .. "nn-icons/productivity-module.png")
krastorio.icons.setItemIcon("productivity-module-2",            kr_icons_path .. "nn-icons/productivity-module-2.png")
krastorio.icons.setItemIcon("productivity-module-3",            kr_icons_path .. "nn-icons/productivity-module-3.png")
krastorio.icons.setItemIcon("programmable-speaker",             kr_icons_path .. "nn-icons/programmable-speaker.png")
krastorio.icons.setItemIcon("pump",                             kr_icons_path .. "nn-icons/pump.png")
krastorio.icons.setItemIcon("radar",                            kr_icons_path .. "nn-icons/radar.png")
krastorio.icons.setItemIcon("rail",                             kr_icons_path .. "nn-icons/rail.png")
krastorio.icons.setItemIcon("rail-chain-signal",                kr_icons_path .. "nn-icons/rail-chain-signal.png")
krastorio.icons.setItemIcon("rail-signal",                      kr_icons_path .. "nn-icons/rail-signal.png")
krastorio.icons.setItemIcon("red-wire",                         kr_icons_path .. "nn-icons/red-wire.png")
krastorio.icons.setItemIcon("refined-concrete",                 kr_icons_path .. "nn-icons/refined-concrete.png")
krastorio.icons.setItemIcon("refined-hazard-concrete",          kr_icons_path .. "nn-icons/refined-hazard-concrete.png")
krastorio.icons.setItemIcon("repair-pack",                      kr_icons_path .. "nn-icons/repair-pack.png")
krastorio.icons.setItemIcon("roboport",                         kr_icons_path .. "nn-icons/roboport.png")
krastorio.icons.setItemIcon("rocket",                           kr_icons_path .. "nn-icons/rocket.png")
krastorio.icons.setItemIcon("rocket-control-unit",              kr_icons_path .. "nn-icons/rocket-control-unit.png")
krastorio.icons.setItemIcon("rocket-fuel",                      kr_icons_path .. "nn-icons/rocket-fuel.png")
krastorio.icons.setItemIcon("rocket-launcher",                  kr_icons_path .. "nn-icons/rocket-launcher.png")
krastorio.icons.setItemIcon("rocket-part",                      kr_icons_path .. "nn-icons/rocket-part.png")
krastorio.icons.setItemIcon("rocket-silo",                      kr_icons_path .. "nn-icons/rocket-silo.png")
krastorio.icons.setItemIcon("low-density-structure",            kr_icons_path .. "nn-icons/rocket-structure.png")
krastorio.icons.setItemIcon("satellite",                        kr_icons_path .. "nn-icons/satellite.png")
krastorio.icons.setItemIcon("shotgun",                          kr_icons_path .. "nn-icons/shotgun.png")
krastorio.icons.setItemIcon("small-electric-pole",              kr_icons_path .. "nn-icons/small-electric-pole.png")
krastorio.icons.setItemIcon("small-lamp",                       kr_icons_path .. "nn-icons/small-lamp.png")
krastorio.icons.setItemIcon("solar-panel",                      kr_icons_path .. "nn-icons/solar-panel.png")
krastorio.icons.setItemIcon("solar-panel-equipment",            kr_icons_path .. "nn-icons/solar-panel-equipment.png")
krastorio.icons.setItemIcon("solid-fuel",                       kr_icons_path .. "nn-icons/solid-fuel.png")
krastorio.icons.setItemIcon("speed-module",                     kr_icons_path .. "nn-icons/speed-module.png")
krastorio.icons.setItemIcon("speed-module-2",                   kr_icons_path .. "nn-icons/speed-module-2.png")
krastorio.icons.setItemIcon("speed-module-3",                   kr_icons_path .. "nn-icons/speed-module-3.png")
krastorio.icons.setItemIcon("splitter",                         kr_icons_path .. "nn-icons/splitter.png")
krastorio.icons.setItemIcon("stack-filter-inserter",            kr_icons_path .. "nn-icons/stack-filter-inserter.png")
krastorio.icons.setItemIcon("stack-inserter",                   kr_icons_path .. "nn-icons/stack-inserter.png")
krastorio.icons.setItemIcon("steam-engine",                     kr_icons_path .. "nn-icons/steam-engine.png")
krastorio.icons.setItemIcon("steam-turbine",                    kr_icons_path .. "nn-icons/steam-turbine.png")
krastorio.icons.setItemIcon("steel-chest",                      kr_icons_path .. "nn-icons/steel-chest.png")
krastorio.icons.setItemIcon("steel-furnace",                    kr_icons_path .. "nn-icons/steel-furnace.png")
krastorio.icons.setItemIcon("stone-brick",                      kr_icons_path .. "nn-icons/stone-brick.png")
krastorio.icons.setItemIcon("stone-furnace",                    kr_icons_path .. "nn-icons/stone-furnace.png")
krastorio.icons.setItemIcon("storage-tank",                     kr_icons_path .. "nn-icons/storage-tank.png")
krastorio.icons.setItemIcon("submachine-gun",                   kr_icons_path .. "nn-icons/submachine-gun.png")
krastorio.icons.setItemIcon("substation",                       kr_icons_path .. "nn-icons/substation.png")
krastorio.icons.setItemIcon("sulfur",                           kr_icons_path .. "nn-icons/sulfur.png")
krastorio.icons.setItemIcon("tank",                             kr_icons_path .. "nn-icons/tank.png")
krastorio.icons.setItemIcon("train-stop",                       kr_icons_path .. "nn-icons/train-stop.png")
krastorio.icons.setItemIcon("transport-belt",                   kr_icons_path .. "nn-icons/transport-belt.png")
krastorio.icons.setItemIcon("underground-belt",                 kr_icons_path .. "nn-icons/underground-belt.png")
krastorio.icons.setItemIcon("uranium-235",                      kr_icons_path .. "nn-icons/uranium-235.png")
krastorio.icons.setItemIcon("uranium-238",                      kr_icons_path .. "nn-icons/uranium-238.png")
krastorio.icons.setItemIcon("uranium-fuel-cell",                kr_icons_path .. "nn-icons/uranium-fuel-cell.png")
krastorio.icons.setItemIcon("wall",                             kr_icons_path .. "nn-icons/wall.png")
krastorio.icons.setItemIcon("wood",                             kr_icons_path .. "nn-icons/wood.png")
krastorio.icons.setItemIcon("wooden-chest",                     kr_icons_path .. "nn-icons/wooden-chest.png")

-----------------------------------------------------------------
-- -- Fluids
krastorio.icons.setItemIcon("water",                            kr_fluids_icons_path  .. "water.png")
krastorio.icons.setItemIcon("steam",                            kr_fluids_icons_path  .. "steam.png")
krastorio.icons.setItemIcon("sulfuric-acid",                    kr_fluids_icons_path  .. "sulfuric-acid.png")
krastorio.icons.setItemIcon("crude-oil",                        kr_fluids_icons_path  .. "oil.png")
krastorio.icons.setItemIcon("light-oil",                        kr_fluids_icons_path  .. "light-oil.png")
krastorio.icons.setItemIcon("heavy-oil",                        kr_fluids_icons_path  .. "heavy-oil.png")
krastorio.icons.setItemIcon("lubricant",                        kr_fluids_icons_path  .. "lubricant.png")
krastorio.icons.setItemIcon("petroleum-gas",                    kr_fluids_icons_path  .. "petroleum-gas.png")
-----------------------------------------------------------------
-- -- -- TECHNOLOGIES

krastorio.icons.setTechnologyIcon("steel-processing",           kr_technologies_icons_path .. "steel-processing.png")

-- Logistics
krastorio.icons.setTechnologyIcon("logistics",                  kr_technologies_icons_path .. "logistics-1.png")
krastorio.icons.setTechnologyIcon("logistics-2",                kr_technologies_icons_path .. "logistics-2.png")
krastorio.icons.setTechnologyIcon("logistics-3",                kr_technologies_icons_path .. "logistics-3.png")

krastorio.icons.setTechnologyIcon("heavy-armor",                kr_technologies_icons_path .. "heavy-armor.png")

krastorio.icons.setTechnologyIcon("oil-processing",             kr_technologies_icons_path .. "oil-gathering.png")

krastorio.icons.setTechnologyIcon("mining-productivity-1",      kr_technologies_icons_path .. "mining-productivity-1.png")
krastorio.icons.setTechnologyIcon("mining-productivity-2",      kr_technologies_icons_path .. "mining-productivity-2.png")
krastorio.icons.setTechnologyIcon("mining-productivity-3",      kr_technologies_icons_path .. "mining-productivity-3.png")
krastorio.icons.setTechnologyIcon("mining-productivity-4",      kr_technologies_icons_path .. "mining-productivity-4.png")

krastorio.icons.setTechnologyIcon("steel-axe",                  kr_technologies_icons_path .. "steel-pickaxe.png")

-----------------------------------------------------------------
-- -- -- BUILDINGS
krastorio.icons.setItemIcon("pumpjack",                         kr_entities_icons_path .. "oil-pumpjack.png")
-----------------------------------------------------------------
