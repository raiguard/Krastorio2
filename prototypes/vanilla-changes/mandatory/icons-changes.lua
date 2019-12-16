-----------------------------------------------------------------
-- -- -- ITEMS
-- -- Adapting the vanilla science packs with the new icons style

-- Automation science pack
krastorio.icons.setItemIcon("automation-science-pack", kr_cards_icons_path .. "automation-tech-card.png")
data.raw.tool["automation-science-pack"].order = "b02[automation-tech-card]"

-- Logistic science pack
krastorio.icons.setItemIcon("logistic-science-pack", kr_cards_icons_path .. "logistic-tech-card.png")
data.raw.tool["logistic-science-pack"].order = "b03[logistic-tech-card]"
krastorio.icons.setTechnologyIcon("logistic-science-pack", kr_technologies_icons_path .. "logistic-tech-card.png")

-- Military science pack
krastorio.icons.setItemIcon("military-science-pack", kr_cards_icons_path .. "military-tech-card.png")
data.raw.tool["military-science-pack"].order = "b04[military-tech-card]"
krastorio.icons.setTechnologyIcon("military-science-pack", kr_technologies_icons_path .. "military-tech-card.png")

-- Chemical science pack
krastorio.icons.setItemIcon("chemical-science-pack", kr_cards_icons_path .. "chemical-tech-card.png")
data.raw.tool["chemical-science-pack"].order = "b05[chemical-tech-card]"
krastorio.icons.setTechnologyIcon("chemical-science-pack", kr_technologies_icons_path .. "chemical-tech-card.png")

-- Production science pack
krastorio.icons.setItemIcon("production-science-pack", kr_cards_icons_path .. "production-tech-card.png")
data.raw.tool["production-science-pack"].order = "b06[production-tech-card]"
krastorio.icons.setTechnologyIcon("production-science-pack", kr_technologies_icons_path .. "production-tech-card.png")

-- Utility science pack
krastorio.icons.setItemIcon("utility-science-pack", kr_cards_icons_path .. "utility-tech-card.png")
data.raw.tool["utility-science-pack"].order = "b07[utility-tech-card]"
krastorio.icons.setTechnologyIcon("utility-science-pack", kr_technologies_icons_path .. "utility-tech-card.png")

-- Space science pack
krastorio.icons.setItemIcon("space-science-pack", kr_cards_icons_path .. "optimization-tech-card.png")
data.raw.tool["space-science-pack"].order = "b09[optimization-tech-card]"
krastorio.icons.setTechnologyIcon("space-science-pack", kr_technologies_icons_path .. "optimization-tech-card.png")

-----------------------------------------------------------------
-- -- Chaning intermediate products icons

-- Chaning iron plate
krastorio.icons.setItemIcon("iron-plate", kr_icons_path .. "iron-plate.png")

-- Changing copper plate
krastorio.icons.setItemIcon("copper-plate", kr_icons_path .. "copper-plate.png")

-- Chaning steel icon
krastorio.icons.setItemIcon("steel-plate", kr_icons_path .. "steel-plate.png")

-- Changing iron gear wheel
krastorio.icons.setItemIcon("iron-gear-wheel", kr_icons_path .. "iron-gear-wheel.png")

-- Neural Networks icons
krastorio.icons.setItemIcon("arithmetic-combinator", kr_icons_path .. "nn-icons/arithmetic-combinator.png")
krastorio.icons.setItemIcon("artillery-turret", kr_icons_path .. "nn-icons/artillery-turret.png")
krastorio.icons.setItemIcon("artillery-wagon", kr_icons_path .. "nn-icons/artillery-wagon.png")
krastorio.icons.setItemIcon("assembling-machine-0", kr_icons_path .. "nn-icons/assembling-machine-0.png")
krastorio.icons.setItemIcon("assembling-machine-1", kr_icons_path .. "nn-icons/assembling-machine-1.png")
krastorio.icons.setItemIcon("assembling-machine-2", kr_icons_path .. "nn-icons/assembling-machine-2.png")
krastorio.icons.setItemIcon("assembling-machine-3", kr_icons_path .. "nn-icons/assembling-machine-3.png")


krastorio.icons.setItemIcon("copper-cable", kr_icons_path .. "nn-icons/copper-cable.png")
krastorio.icons.setItemIcon("wood", kr_icons_path .. "nn-icons/wood.png")

-- fluids
data.raw.fluid["water"].icon = kr_fluids_icons_path  .. "water.png"
data.raw.fluid["water"].icon_size = 64

data.raw.fluid["steam"].icon = kr_fluids_icons_path  .. "steam.png"
data.raw.fluid["steam"].icon_size = 64

data.raw.fluid["sulfuric-acid"].icon = kr_fluids_icons_path  .. "sulfuric-acid.png"
data.raw.fluid["sulfuric-acid"].icon_size = 64

data.raw.fluid["crude-oil"].icon = kr_fluids_icons_path  .. "oil.png"
data.raw.fluid["crude-oil"].icon_size = 64

data.raw.fluid["light-oil"].icon = kr_fluids_icons_path  .. "light-oil.png"
data.raw.fluid["light-oil"].icon_size = 64

data.raw.fluid["heavy-oil"].icon = kr_fluids_icons_path  .. "heavy-oil.png"
data.raw.fluid["heavy-oil"].icon_size = 64

data.raw.fluid["lubricant"].icon = kr_fluids_icons_path  .. "lubricant.png"
data.raw.fluid["lubricant"].icon_size = 64

data.raw.fluid["petroleum-gas"].icon = kr_fluids_icons_path  .. "petroleum-gas.png"
data.raw.fluid["petroleum-gas"].icon_size = 64
-----------------------------------------------------------------
-- -- -- TECHNOLOGIES

-- Logistics
krastorio.icons.setTechnologyIcon("logistics", kr_technologies_icons_path .. "logistics-1.png")
krastorio.icons.setTechnologyIcon("logistics-2", kr_technologies_icons_path .. "logistics-2.png")
krastorio.icons.setTechnologyIcon("logistics-3", kr_technologies_icons_path .. "logistics-3.png")

krastorio.icons.setTechnologyIcon("heavy-armor", kr_technologies_icons_path .. "heavy-armor.png")

krastorio.icons.setTechnologyIcon("oil-processing", kr_technologies_icons_path .. "oil-gathering.png")

-----------------------------------------------------------------
-- -- -- BUILDINGS
krastorio.icons.setItemIcon("pumpjack", kr_entities_icons_path .. "oil-pumpjack.png")

