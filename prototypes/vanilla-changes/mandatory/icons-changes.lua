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
krastorio.icons.setItemMipmaps("steel-plate", 
{
	{ size = 64, filename = kr_mip_icons_path .. "steel-plate.png", scale = 0.25, mipmap_count = 4 }
})

-- Changing iron gear wheel
krastorio.icons.setItemIcon("iron-gear-wheel", kr_icons_path .. "iron-gear-wheel.png")
-----------------------------------------------------------------
-- -- -- TECHNOLOGIES

-- Logistics
krastorio.icons.setTechnologyIcon("logistics", kr_technologies_icons_path .. "logistics-1.png")
krastorio.icons.setTechnologyIcon("logistics-2", kr_technologies_icons_path .. "logistics-2.png")
krastorio.icons.setTechnologyIcon("logistics-3", kr_technologies_icons_path .. "logistics-3.png")

krastorio.icons.setTechnologyIcon("heavy-armor", kr_technologies_icons_path .. "heavy-armor.png")


