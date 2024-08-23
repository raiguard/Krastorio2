-----------------------------------------------------------------
-- -- -- ITEMS
-- -- Adapting the vanilla science packs with the new icons style

-- Automation science pack
krastorio.icons.setItemIcon(
  "automation-science-pack",
  "__Krastorio2Assets__/icons/cards/automation-tech-card.png",
  64,
  4
)
if data.raw.tool["automation-science-pack"] then
  data.raw.tool["automation-science-pack"].order = "b02[automation-tech-card]"
  data.raw.tool["automation-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/automation-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/automation-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end

-- Logistic science pack
krastorio.icons.setItemIcon("logistic-science-pack", "__Krastorio2Assets__/icons/cards/logistic-tech-card.png", 64, 4)
if data.raw.tool["automation-science-pack"] then
  data.raw.tool["logistic-science-pack"].order = "b03[logistic-tech-card]"
  data.raw.tool["logistic-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/logistic-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/logistic-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  "logistic-science-pack",
  "__Krastorio2Assets__/technologies/logistic-tech-card.png",
  256,
  4
)

-- Military science pack
krastorio.icons.setItemIcon("military-science-pack", "__Krastorio2Assets__/icons/cards/military-tech-card.png", 64, 4)
if data.raw.tool["military-science-pack"] then
  data.raw.tool["military-science-pack"].order = "b04[military-tech-card]"
  data.raw.tool["military-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/military-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/military-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  "military-science-pack",
  "__Krastorio2Assets__/technologies/military-tech-card.png",
  256,
  4
)

-- Chemical science pack
krastorio.icons.setItemIcon("chemical-science-pack", "__Krastorio2Assets__/icons/cards/chemical-tech-card.png", 64, 4)
if data.raw.tool["chemical-science-pack"] then
  data.raw.tool["chemical-science-pack"].order = "b05[chemical-tech-card]"
  data.raw.tool["chemical-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/chemical-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/chemical-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  "chemical-science-pack",
  "__Krastorio2Assets__/technologies/chemical-tech-card.png",
  256,
  4
)

-- Production science pack
krastorio.icons.setItemIcon(
  "production-science-pack",
  "__Krastorio2Assets__/icons/cards/production-tech-card.png",
  64,
  4
)
if data.raw.tool["production-science-pack"] then
  data.raw.tool["production-science-pack"].order = "b06[production-tech-card]"
  data.raw.tool["production-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/production-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/production-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  "production-science-pack",
  "__Krastorio2Assets__/technologies/production-tech-card.png",
  256,
  4
)

-- Utility science pack
krastorio.icons.setItemIcon("utility-science-pack", "__Krastorio2Assets__/icons/cards/utility-tech-card.png", 64, 4)
if data.raw.tool["utility-science-pack"] then
  data.raw.tool["utility-science-pack"].order = "b07[utility-tech-card]"
  data.raw.tool["utility-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/utility-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/utility-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  "utility-science-pack",
  "__Krastorio2Assets__/technologies/utility-tech-card.png",
  256,
  4
)

-- Space science pack
krastorio.icons.setItemIcon(
  kr_optimization_tech_card_name,
  "__Krastorio2Assets__/icons/cards/optimization-tech-card.png",
  64,
  4
)
if data.raw.tool[kr_optimization_tech_card_name] then
  data.raw.tool[kr_optimization_tech_card_name].order = "b08[optimization-tech-card]"
  data.raw.tool[kr_optimization_tech_card_name].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/optimization-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/cards/optimization-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  kr_optimization_tech_card_name,
  "__Krastorio2Assets__/technologies/optimization-tech-card.png",
  256,
  4
)

-----------------------------------------------------------------
-- Items
-----------------------------------------------------------------
-- -- Chaning intermediate products icons

-- Chaning iron plate
krastorio.icons.setItemIcon("iron-plate", "__Krastorio2Assets__/icons/items/iron-plate.png", 64, 4)

-- Changing copper plate
krastorio.icons.setItemIcon("copper-plate", "__Krastorio2Assets__/icons/items/copper-plate.png", 64, 4)

-- Chaning steel icon
krastorio.icons.setItemIcon("steel-plate", "__Krastorio2Assets__/icons/items/steel-plate.png", 64, 4)

-- Changing iron gear wheel
krastorio.icons.setItemIcon("iron-gear-wheel", "__Krastorio2Assets__/icons/items/iron-gear-wheel.png", 64, 4)

local light_oil_icon = nil
if data.raw.fluid["light-oil"].icon == "__base__/graphics/icons/fluid/light-oil.png" then
  light_oil_icon = "__Krastorio2Assets__/icons/fluids/light-oil.png"
else
  light_oil_icon = data.raw.fluid["light-oil"].icon
end
local rocket_fuel_icons = {
  { icon = "__Krastorio2Assets__/icons/recipes/rocket-fuel.png", icon_size = 64 },
  { icon = light_oil_icon, icon_size = data.raw.fluid["light-oil"].icon_size or 64, scale = 0.26, shift = { 8, -8 } },
}
krastorio.icons.setRecipeIcons("rocket-fuel", rocket_fuel_icons)

local fluids_for_solid_fuel = { "petroleum-gas", "light-oil", "heavy-oil" }
for _, fluid in ipairs(fluids_for_solid_fuel) do
  local icons = {
    { icon = "__base__/graphics/icons/solid-fuel.png", icon_size = 64 },
    {
      icon = "__Krastorio2Assets__/icons/fluids/" .. fluid .. ".png",
      icon_size = data.raw.fluid[fluid].icon_size or 64,
      scale = 0.26,
      shift = { -8, -8 },
    },
  }
  krastorio.icons.setRecipeIcons("solid-fuel-from-" .. fluid, icons)
end

krastorio.icons.setItemIcon("electronic-circuit", "__Krastorio2Assets__/icons/items/electronic-circuit.png", 64, 4)
krastorio.icons.setItemIcon("advanced-circuit", "__Krastorio2Assets__/icons/items/advanced-circuit.png", 64, 4)
krastorio.icons.setItemIcon("processing-unit", "__Krastorio2Assets__/icons/items/processing-unit.png", 64, 4)

-----------------------------------------------------------------
-- -- Recipes
-----------------------------------------------------------------
krastorio.icons.setRecipeIcon("heavy-oil-cracking", "__Krastorio2Assets__/icons/recipes/heavy-oil-cracking.png", 64, 4)
krastorio.icons.setRecipeIcon("light-oil-cracking", "__Krastorio2Assets__/icons/recipes/light-oil-cracking.png", 64, 4)
krastorio.icons.setRecipeIcon("coal-liquefaction", "__Krastorio2Assets__/icons/recipes/coal-liquefaction.png", 64, 4)

local vanilla_iron_plate_recipe = krastorio.recipes.getRecipeFromName("iron-plate")
if vanilla_iron_plate_recipe then
  vanilla_iron_plate_recipe.icon = nil
  vanilla_iron_plate_recipe.icon_size = 64

  local iron_ore = krastorio.items.getItem("iron-ore")
  vanilla_iron_plate_recipe.icons = {
    { icon = "__Krastorio2Assets__/icons/items/iron-plate.png", icon_size = 64 },
    { icon = iron_ore.icon, icon_size = iron_ore.icon_size, scale = 0.22, shift = { -8, -8 } },
  }
end

local vanilla_copper_plate_recipe = krastorio.recipes.getRecipeFromName("copper-plate")
if vanilla_copper_plate_recipe then
  vanilla_copper_plate_recipe.icon = nil
  vanilla_copper_plate_recipe.icon_size = 64

  local copper_ore = krastorio.items.getItem("copper-ore")
  vanilla_copper_plate_recipe.icons = {
    { icon = "__Krastorio2Assets__/icons/items/copper-plate.png", icon_size = 64 },
    { icon = copper_ore.icon, icon_size = copper_ore.icon_size, scale = 0.22, shift = { -8, -8 } },
  }
end

-----------------------------------------------------------------
-- -- Fluids
krastorio.icons.setItemIcon("water", "__Krastorio2Assets__/icons/fluids/water.png", 64, 4)
krastorio.icons.setItemIcon("steam", "__Krastorio2Assets__/icons/fluids/steam.png", 64, 4)
krastorio.icons.setItemIcon("sulfuric-acid", "__Krastorio2Assets__/icons/fluids/sulfuric-acid.png", 64, 4)
krastorio.icons.setItemIcon("crude-oil", "__Krastorio2Assets__/icons/fluids/oil.png", 64, 4)
krastorio.icons.setItemIcon("light-oil", "__Krastorio2Assets__/icons/fluids/light-oil.png", 64, 4)
krastorio.icons.setItemIcon("heavy-oil", "__Krastorio2Assets__/icons/fluids/heavy-oil.png", 64, 4)
krastorio.icons.setItemIcon("lubricant", "__Krastorio2Assets__/icons/fluids/lubricant.png", 64, 4)
krastorio.icons.setItemIcon("petroleum-gas", "__Krastorio2Assets__/icons/fluids/petroleum-gas.png", 64, 4)
-----------------------------------------------------------------
-- -- -- TECHNOLOGIES

krastorio.icons.setTechnologyIcon("steel-processing", "__Krastorio2Assets__/technologies/steel-processing.png", 256, 4)
krastorio.icons.setTechnologyIcon(
  "coal-liquefaction",
  "__Krastorio2Assets__/technologies/coal-liquefaction.png",
  256,
  4
)

-- Logistics
krastorio.icons.setTechnologyIcon("logistics", "__Krastorio2Assets__/technologies/logistics-1.png", 256, 4)
krastorio.icons.setTechnologyIcon("logistics-2", "__Krastorio2Assets__/technologies/logistics-2.png", 256, 4)
krastorio.icons.setTechnologyIcon("logistics-3", "__Krastorio2Assets__/technologies/logistics-3.png", 256, 4)

krastorio.icons.setTechnologyIcon("oil-processing", "__Krastorio2Assets__/technologies/oil-gathering.png", 256, 4)

krastorio.icons.setTechnologyIcons("steel-axe", {
  {
    icon = "__Krastorio2Assets__/technologies/steel-pickaxe.png",
    icon_size = 256,
    icon_mipmaps = 4,
  },
  {
    icon = "__core__/graphics/icons/technology/constants/constant-mining.png",
    icon_size = 128,
    icon_mipmaps = 3,
    shift = { 100, 100 },
  },
}, 256, 4)

-- Equipments
krastorio.icons.setTechnologyIcon("heavy-armor", "__Krastorio2Assets__/technologies/heavy-armor.png", 256, 4)

krastorio.icons.setTechnologyIcon(
  "night-vision-equipment",
  "__Krastorio2Assets__/technologies/night-vision-equipment.png",
  256,
  4
)
krastorio.icons.setTechnologyIcon(
  "energy-shield-equipment",
  "__Krastorio2Assets__/technologies/energy-shield-mk1-equipment.png",
  256,
  4
)
krastorio.icons.setTechnologyIcon(
  "energy-shield-mk2-equipment",
  "__Krastorio2Assets__/technologies/energy-shield-mk2-equipment.png",
  256,
  4
)

krastorio.icons.setTechnologyIcon(
  "personal-laser-defense-equipment",
  "__Krastorio2Assets__/technologies/personal-laser-defense-mk1-equipments.png",
  256,
  4
)

krastorio.icons.setTechnologyIcon(
  "battery-mk2-equipment",
  "__Krastorio2Assets__/technologies/battery-mk2-equipment.png",
  256,
  4
)

-----------------------------------------------------------------
-- -- -- BUILDINGS
krastorio.icons.setItemIcon("pumpjack", "__Krastorio2Assets__/icons/entities/oil-pumpjack.png", 64, 4)
krastorio.icons.setItemIcon("substation", "__Krastorio2Assets__/icons/entities/substation.png")
krastorio.icons.setItemIcon("electric-mining-drill", "__Krastorio2Assets__/icons/entities/electric-mining-drill.png")
data.raw["mining-drill"]["electric-mining-drill"].icon = "__Krastorio2Assets__/icons/entities/electric-mining-drill.png"
-----------------------------------------------------------------

-----------------------------------------------------------------
-- -- -- OTHER
-----------------------------------------------------------------
krastorio.icons.setItemIcon("atomic-bomb", "__Krastorio2Assets__/icons/ammo/atomic-bomb.png", 64, 4)
if data.raw.ammo["atomic-bomb"] then
  data.raw.ammo["atomic-bomb"].pictures = {
    layers = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/ammo/atomic-bomb.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = "__Krastorio2Assets__/icons/ammo/atomic-bomb-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setItemIcon("artillery-shell", "__Krastorio2Assets__/icons/ammo/artillery-shell.png", 64, 4)
-- Landfill
local landfill = krastorio.recipes.getRecipeFromName("landfill") or false
local stone = krastorio.items.getItem("stone")
if landfill and stone then
  krastorio.icons.addOverlayIcons(
    landfill,
    { { icon = stone.icon, icon_size = stone.icon_size } },
    landfill.icon_size,
    0.26,
    { 8, -8 }
  )
end
-----------------------------------------------------------------
