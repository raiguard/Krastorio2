-----------------------------------------------------------------
-- -- -- ITEMS
-- -- Adapting the vanilla science packs with the new icons style

-- Automation science pack
krastorio.icons.setItemIcon("automation-science-pack",                kr_cards_icons_path .. "automation-tech-card.png")
data.raw.tool["automation-science-pack"].order = "b02[automation-tech-card]"

-- Logistic science pack
krastorio.icons.setItemIcon("logistic-science-pack",                  kr_cards_icons_path .. "logistic-tech-card.png")
data.raw.tool["logistic-science-pack"].order = "b03[logistic-tech-card]"
krastorio.icons.setTechnologyIcon("logistic-science-pack",            kr_technologies_icons_path .. "logistic-tech-card.png")

-- Military science pack
krastorio.icons.setItemIcon("military-science-pack",                  kr_cards_icons_path .. "military-tech-card.png")
data.raw.tool["military-science-pack"].order = "b04[military-tech-card]"
krastorio.icons.setTechnologyIcon("military-science-pack",            kr_technologies_icons_path .. "military-tech-card.png")

-- Chemical science pack
krastorio.icons.setItemIcon("chemical-science-pack",                  kr_cards_icons_path .. "chemical-tech-card.png")
data.raw.tool["chemical-science-pack"].order = "b05[chemical-tech-card]"
krastorio.icons.setTechnologyIcon("chemical-science-pack",            kr_technologies_icons_path .. "chemical-tech-card.png")

-- Production science pack
krastorio.icons.setItemIcon("production-science-pack",                kr_cards_icons_path .. "production-tech-card.png")
data.raw.tool["production-science-pack"].order = "b06[production-tech-card]"
krastorio.icons.setTechnologyIcon("production-science-pack",          kr_technologies_icons_path .. "production-tech-card.png")

-- Utility science pack
krastorio.icons.setItemIcon("utility-science-pack",                   kr_cards_icons_path .. "utility-tech-card.png")
data.raw.tool["utility-science-pack"].order = "b07[utility-tech-card]"
krastorio.icons.setTechnologyIcon("utility-science-pack",             kr_technologies_icons_path .. "utility-tech-card.png")

-- Space science pack
krastorio.icons.setItemIcon("space-science-pack",                     kr_cards_icons_path .. "optimization-tech-card.png")
data.raw.tool["space-science-pack"].order = "b09[optimization-tech-card]"
krastorio.icons.setTechnologyIcon("space-science-pack",               kr_technologies_icons_path .. "optimization-tech-card.png")

-- Other
krastorio.icons.setItemIcon("battery",                                kr_icons_path  .. "battery.png")
-----------------------------------------------------------------
-- -- Chaning intermediate products icons

-- Chaning iron plate
krastorio.icons.setItemIcon("iron-plate",                             kr_icons_path .. "iron-plate.png")

-- Changing copper plate
krastorio.icons.setItemIcon("copper-plate",                           kr_icons_path .. "copper-plate.png")

-- Chaning steel icon
krastorio.icons.setItemIcon("steel-plate",                            kr_icons_path .. "steel-plate.png")

-- Changing iron gear wheel
krastorio.icons.setItemIcon("iron-gear-wheel",                        kr_icons_path .. "iron-gear-wheel.png")

local light_oil_icon = nil
if data.raw.fluid["light-oil"].icon == "__base__/graphics/icons/fluid/light-oil.png" then
	light_oil_icon = kr_fluids_icons_path  .. "light-oil.png"
else
	light_oil_icon = data.raw.fluid["light-oil"].icon
end
local rocket_fuel_icons = 
{
	{ icon = kr_recipes_icons_path .. "rocket-fuel.png", icon_size = 64 },
	{ icon = light_oil_icon, icon_size = data.raw.fluid["light-oil"].icon_size or 64, scale = 0.26, shift = {8,-8}}
}
krastorio.icons.setRecipeIcons("rocket-fuel", rocket_fuel_icons)

--krastorio.icons.addOverlayIcons(krastorio.recipes.getRecipeFromName("rocket-fuel"), krastorio.icons.getIconsForOverlay(krastorio.items.getItem("light-oil")), 64, 0.28, {-4, 8})	

-----------------------------------------------------------------
-- -- Fluids
krastorio.icons.setItemIcon("water",                                  kr_fluids_icons_path  .. "water.png")
krastorio.icons.setItemIcon("steam",                                  kr_fluids_icons_path  .. "steam.png")
krastorio.icons.setItemIcon("sulfuric-acid",                          kr_fluids_icons_path  .. "sulfuric-acid.png")
krastorio.icons.setItemIcon("crude-oil",                              kr_fluids_icons_path  .. "oil.png")
krastorio.icons.setItemIcon("light-oil",                              kr_fluids_icons_path  .. "light-oil.png")
krastorio.icons.setItemIcon("heavy-oil",                              kr_fluids_icons_path  .. "heavy-oil.png")
krastorio.icons.setItemIcon("lubricant",                              kr_fluids_icons_path  .. "lubricant.png")
krastorio.icons.setItemIcon("petroleum-gas",                          kr_fluids_icons_path  .. "petroleum-gas.png")
-----------------------------------------------------------------
-- -- -- TECHNOLOGIES

krastorio.icons.setTechnologyIcon("steel-processing",                 kr_technologies_icons_path .. "steel-processing.png")
krastorio.icons.setTechnologyIcon("battery",                          kr_technologies_icons_path .. "battery.png")

-- Logistics
krastorio.icons.setTechnologyIcon("logistics",                        kr_technologies_icons_path .. "logistics-1.png")
krastorio.icons.setTechnologyIcon("logistics-2",                      kr_technologies_icons_path .. "logistics-2.png")
krastorio.icons.setTechnologyIcon("logistics-3",                      kr_technologies_icons_path .. "logistics-3.png")

krastorio.icons.setTechnologyIcon("oil-processing",                   kr_technologies_icons_path .. "oil-gathering.png")

krastorio.icons.setTechnologyIcon("mining-productivity-1",            kr_technologies_icons_path .. "mining-productivity-1.png")
krastorio.icons.setTechnologyIcon("mining-productivity-2",            kr_technologies_icons_path .. "mining-productivity-2.png")
krastorio.icons.setTechnologyIcon("mining-productivity-3",            kr_technologies_icons_path .. "mining-productivity-3.png")
krastorio.icons.setTechnologyIcon("mining-productivity-4",            kr_technologies_icons_path .. "mining-productivity-4.png")

krastorio.icons.setTechnologyIcon("steel-axe",                        kr_technologies_icons_path .. "steel-pickaxe.png")

-- Equipments
krastorio.icons.setTechnologyIcon("heavy-armor",                      kr_technologies_icons_path .. "heavy-armor.png")

krastorio.icons.setTechnologyIcon("night-vision-equipment",           kr_technologies_icons_path .. "night-vision-equipment.png")
krastorio.icons.setTechnologyIcon("energy-shield-equipment",          kr_technologies_icons_path .. "energy-shield-mk1-equipment.png")
krastorio.icons.setTechnologyIcon("energy-shield-mk2-equipment",      kr_technologies_icons_path .. "energy-shield-mk2-equipment.png")

krastorio.icons.setTechnologyIcon("personal-laser-defense-equipment", kr_technologies_icons_path .. "personal-laser-defense-mk1-equipments.png")

-----------------------------------------------------------------
-- -- -- BUILDINGS
krastorio.icons.setItemIcon("pumpjack",                               kr_entities_icons_path .. "oil-pumpjack.png")
-----------------------------------------------------------------
