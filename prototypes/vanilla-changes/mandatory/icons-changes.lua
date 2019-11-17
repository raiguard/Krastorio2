-----------------------------------------------------------------
-- -- Adapting the vanilla science packs with the new icons style

-- Automation science pack
data.raw.tool["automation-science-pack"].icon = kr_cards_icons_path .. "automation-tech-card.png"
data.raw.tool["automation-science-pack"].icon_size = 64
data.raw.tool["automation-science-pack"].order = "02[automation-tech-card]"

-- Logistic science pack
data.raw.tool["logistic-science-pack"].icon = kr_cards_icons_path .. "logistic-tech-card.png"
data.raw.tool["logistic-science-pack"].icon_size = 64
data.raw.tool["logistic-science-pack"].order = "03[logistic-tech-card]"
data.raw.technology["logistic-science-pack"].icon = kr_technologies_icons_path .. "logistic-tech-card.png"

-- Military science pack
data.raw.tool["military-science-pack"].icon = kr_cards_icons_path .. "military-tech-card.png"
data.raw.tool["military-science-pack"].icon_size = 64
data.raw.tool["military-science-pack"].order = "04[military-tech-card]"
data.raw.technology["logistic-science-pack"].icon = kr_technologies_icons_path .. "military-tech-card.png"

-- Chemical science pack
data.raw.tool["chemical-science-pack"].icon = kr_cards_icons_path .. "chemical-tech-card.png"
data.raw.tool["chemical-science-pack"].icon_size = 64
data.raw.tool["chemical-science-pack"].order = "05[chemical-tech-card]"
data.raw.technology["chemical-science-pack"].icon = kr_technologies_icons_path .. "chemical-tech-card.png"

-- Production science pack
data.raw.tool["production-science-pack"].icon = kr_cards_icons_path .. "production-tech-card.png"
data.raw.tool["production-science-pack"].icon_size = 64
data.raw.tool["production-science-pack"].order = "06[production-tech-card]"
data.raw.technology["production-science-pack"].icon = kr_technologies_icons_path .. "production-tech-card.png"

-- Utility science pack
data.raw.tool["utility-science-pack"].icon = kr_cards_icons_path .. "utility-tech-card.png"
data.raw.tool["utility-science-pack"].icon_size = 64
data.raw.tool["utility-science-pack"].order = "07[utility-tech-card]"
data.raw.technology["utility-science-pack"].icon = kr_technologies_icons_path .. "utility-tech-card.png"

-- Space science pack
data.raw.tool["space-science-pack"].icon = kr_cards_icons_path .. "space-tech-card.png"
data.raw.tool["space-science-pack"].icon_size = 64
data.raw.tool["space-science-pack"].order = "09[space-tech-card]"
data.raw.technology["space-science-pack"].icon = kr_technologies_icons_path .. "space-tech-card.png"

-----------------------------------------------------------------
-- -- Chaning steel icon

data.raw.item["steel-plate"].icon = kr_icons_path .. "steel-plate.png"
data.raw.item["steel-plate"].icon_mipmaps = 1
data.raw.item["steel-plate"].pictures =
{
	{ size = 64, filename = kr_mip_icons_path .. "steel-plate.png", scale = 0.25, mipmap_count = 4 }
}

-----------------------------------------------------------------


