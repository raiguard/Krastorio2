-----------------------------------------------------------------
-- -- -- ITEMS
-- -- Adapting the vanilla science packs with the new icons style

-- Automation science pack
krastorio.icons.setItemIcon("automation-science-pack", kr_cards_icons_path .. "automation-tech-card.png", 64, 4)
if data.raw.tool["automation-science-pack"] then
  data.raw.tool["automation-science-pack"].order = "b02[automation-tech-card]"
  data.raw.tool["automation-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_cards_icons_path .. "automation-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_cards_icons_path .. "automation-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end

-- Logistic science pack
krastorio.icons.setItemIcon("logistic-science-pack", kr_cards_icons_path .. "logistic-tech-card.png", 64, 4)
if data.raw.tool["automation-science-pack"] then
  data.raw.tool["logistic-science-pack"].order = "b03[logistic-tech-card]"
  data.raw.tool["logistic-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_cards_icons_path .. "logistic-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_cards_icons_path .. "logistic-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  "logistic-science-pack",
  kr_technologies_icons_path .. "logistic-tech-card.png",
  256,
  4
)

-- Military science pack
krastorio.icons.setItemIcon("military-science-pack", kr_cards_icons_path .. "military-tech-card.png", 64, 4)
if data.raw.tool["military-science-pack"] then
  data.raw.tool["military-science-pack"].order = "b04[military-tech-card]"
  data.raw.tool["military-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_cards_icons_path .. "military-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_cards_icons_path .. "military-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  "military-science-pack",
  kr_technologies_icons_path .. "military-tech-card.png",
  256,
  4
)

-- Chemical science pack
krastorio.icons.setItemIcon("chemical-science-pack", kr_cards_icons_path .. "chemical-tech-card.png", 64, 4)
if data.raw.tool["chemical-science-pack"] then
  data.raw.tool["chemical-science-pack"].order = "b05[chemical-tech-card]"
  data.raw.tool["chemical-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_cards_icons_path .. "chemical-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_cards_icons_path .. "chemical-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  "chemical-science-pack",
  kr_technologies_icons_path .. "chemical-tech-card.png",
  256,
  4
)

-- Production science pack
krastorio.icons.setItemIcon("production-science-pack", kr_cards_icons_path .. "production-tech-card.png", 64, 4)
if data.raw.tool["production-science-pack"] then
  data.raw.tool["production-science-pack"].order = "b06[production-tech-card]"
  data.raw.tool["production-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_cards_icons_path .. "production-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_cards_icons_path .. "production-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  "production-science-pack",
  kr_technologies_icons_path .. "production-tech-card.png",
  256,
  4
)

-- Utility science pack
krastorio.icons.setItemIcon("utility-science-pack", kr_cards_icons_path .. "utility-tech-card.png", 64, 4)
if data.raw.tool["utility-science-pack"] then
  data.raw.tool["utility-science-pack"].order = "b07[utility-tech-card]"
  data.raw.tool["utility-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_cards_icons_path .. "utility-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_cards_icons_path .. "utility-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon("utility-science-pack", kr_technologies_icons_path .. "utility-tech-card.png", 256, 4)

-- Space science pack
krastorio.icons.setItemIcon("space-science-pack", kr_cards_icons_path .. "optimization-tech-card.png", 64, 4)
if data.raw.tool["space-science-pack"] then
  data.raw.tool["space-science-pack"].order = "b08[optimization-tech-card]"
  data.raw.tool["space-science-pack"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_cards_icons_path .. "optimization-tech-card.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_cards_icons_path .. "optimization-tech-card-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setTechnologyIcon(
  "space-science-pack",
  kr_technologies_icons_path .. "optimization-tech-card.png",
  256,
  4
)

-----------------------------------------------------------------
-- Items
-----------------------------------------------------------------
-- -- Chaning intermediate products icons

-- Chaning iron plate
krastorio.icons.setItemIcon("iron-plate", kr_items_icons_path .. "iron-plate.png", 64, 4)

-- Changing copper plate
krastorio.icons.setItemIcon("copper-plate", kr_items_icons_path .. "copper-plate.png", 64, 4)

-- Chaning steel icon
krastorio.icons.setItemIcon("steel-plate", kr_items_icons_path .. "steel-plate.png", 64, 4)

-- Changing iron gear wheel
krastorio.icons.setItemIcon("iron-gear-wheel", kr_items_icons_path .. "iron-gear-wheel.png", 64, 4)

local light_oil_icon = nil
if data.raw.fluid["light-oil"].icon == "__base__/graphics/icons/fluid/light-oil.png" then
  light_oil_icon = kr_fluids_icons_path .. "light-oil.png"
else
  light_oil_icon = data.raw.fluid["light-oil"].icon
end
local rocket_fuel_icons = {
  { icon = kr_recipes_icons_path .. "rocket-fuel.png", icon_size = 64 },
  { icon = light_oil_icon, icon_size = data.raw.fluid["light-oil"].icon_size or 64, scale = 0.26, shift = { 8, -8 } },
}
krastorio.icons.setRecipeIcons("rocket-fuel", rocket_fuel_icons)

krastorio.icons.setItemIcon("electronic-circuit", kr_items_icons_path .. "electronic-circuit.png", 64, 4)
krastorio.icons.setItemIcon("advanced-circuit", kr_items_icons_path .. "advanced-circuit.png", 64, 4)
krastorio.icons.setItemIcon("processing-unit", kr_items_icons_path .. "processing-unit.png", 64, 4)

-----------------------------------------------------------------
-- -- Recipes
-----------------------------------------------------------------
krastorio.icons.setRecipeIcon("heavy-oil-cracking", kr_recipes_icons_path .. "heavy-oil-cracking.png", 64, 4)
krastorio.icons.setRecipeIcon("light-oil-cracking", kr_recipes_icons_path .. "light-oil-cracking.png", 64, 4)
krastorio.icons.setRecipeIcon("coal-liquefaction", kr_recipes_icons_path .. "coal-liquefaction.png", 64, 4)

local vanilla_iron_plate_recipe = krastorio.recipes.getRecipeFromName("iron-plate")
if vanilla_iron_plate_recipe then
  vanilla_iron_plate_recipe.icon = nil
  vanilla_iron_plate_recipe.icon_size = 64

  local iron_ore = krastorio.items.getItem("iron-ore")
  vanilla_iron_plate_recipe.icons = {
    { icon = kr_items_icons_path .. "iron-plate.png", icon_size = 64 },
    { icon = iron_ore.icon, icon_size = iron_ore.icon_size, scale = 0.22, shift = { -8, -8 } },
  }
end

local vanilla_copper_plate_recipe = krastorio.recipes.getRecipeFromName("copper-plate")
if vanilla_copper_plate_recipe then
  vanilla_copper_plate_recipe.icon = nil
  vanilla_copper_plate_recipe.icon_size = 64

  local copper_ore = krastorio.items.getItem("copper-ore")
  vanilla_copper_plate_recipe.icons = {
    { icon = kr_items_icons_path .. "copper-plate.png", icon_size = 64 },
    { icon = copper_ore.icon, icon_size = copper_ore.icon_size, scale = 0.22, shift = { -8, -8 } },
  }
end

-----------------------------------------------------------------
-- -- Fluids
krastorio.icons.setItemIcon("water", kr_fluids_icons_path .. "water.png", 64, 4)
krastorio.icons.setItemIcon("steam", kr_fluids_icons_path .. "steam.png", 64, 4)
krastorio.icons.setItemIcon("sulfuric-acid", kr_fluids_icons_path .. "sulfuric-acid.png", 64, 4)
krastorio.icons.setItemIcon("crude-oil", kr_fluids_icons_path .. "oil.png", 64, 4)
krastorio.icons.setItemIcon("light-oil", kr_fluids_icons_path .. "light-oil.png", 64, 4)
krastorio.icons.setItemIcon("heavy-oil", kr_fluids_icons_path .. "heavy-oil.png", 64, 4)
krastorio.icons.setItemIcon("lubricant", kr_fluids_icons_path .. "lubricant.png", 64, 4)
krastorio.icons.setItemIcon("petroleum-gas", kr_fluids_icons_path .. "petroleum-gas.png", 64, 4)
-----------------------------------------------------------------
-- -- -- TECHNOLOGIES

krastorio.icons.setTechnologyIcon("steel-processing", kr_technologies_icons_path .. "steel-processing.png", 256, 4)
krastorio.icons.setTechnologyIcon("coal-liquefaction", kr_technologies_icons_path .. "coal-liquefaction.png", 256, 4)

-- Logistics
krastorio.icons.setTechnologyIcon("logistics", kr_technologies_icons_path .. "logistics-1.png", 256, 4)
krastorio.icons.setTechnologyIcon("logistics-2", kr_technologies_icons_path .. "logistics-2.png", 256, 4)
krastorio.icons.setTechnologyIcon("logistics-3", kr_technologies_icons_path .. "logistics-3.png", 256, 4)

krastorio.icons.setTechnologyIcon("oil-processing", kr_technologies_icons_path .. "oil-gathering.png", 256, 4)

krastorio.icons.setTechnologyIcons("steel-axe", {
  {
    icon = kr_technologies_icons_path .. "steel-pickaxe.png",
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
krastorio.icons.setTechnologyIcon("heavy-armor", kr_technologies_icons_path .. "heavy-armor.png", 256, 4)

krastorio.icons.setTechnologyIcon(
  "night-vision-equipment",
  kr_technologies_icons_path .. "night-vision-equipment.png",
  256,
  4
)
krastorio.icons.setTechnologyIcon(
  "energy-shield-equipment",
  kr_technologies_icons_path .. "energy-shield-mk1-equipment.png",
  256,
  4
)
krastorio.icons.setTechnologyIcon(
  "energy-shield-mk2-equipment",
  kr_technologies_icons_path .. "energy-shield-mk2-equipment.png",
  256,
  4
)

krastorio.icons.setTechnologyIcon(
  "personal-laser-defense-equipment",
  kr_technologies_icons_path .. "personal-laser-defense-mk1-equipments.png",
  256,
  4
)

krastorio.icons.setTechnologyIcon(
  "battery-mk2-equipment",
  kr_technologies_icons_path .. "battery-mk2-equipment.png",
  256,
  4
)

-----------------------------------------------------------------
-- -- -- BUILDINGS
krastorio.icons.setItemIcon("pumpjack", kr_entities_icons_path .. "oil-pumpjack.png", 64, 4)
krastorio.icons.setItemIcon("substation", kr_entities_icons_path .. "substation.png")
krastorio.icons.setItemIcon("electric-mining-drill", kr_entities_icons_path .. "electric-mining-drill.png")
-----------------------------------------------------------------

-----------------------------------------------------------------
-- -- -- OTHER
-----------------------------------------------------------------
krastorio.icons.setItemIcon("atomic-bomb", kr_ammo_icons_path .. "atomic-bomb.png", 64, 4)
if data.raw.ammo["atomic-bomb"] then
  data.raw.ammo["atomic-bomb"].pictures = {
    layers = {
      {
        size = 64,
        filename = kr_ammo_icons_path .. "atomic-bomb.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = kr_ammo_icons_path .. "atomic-bomb-light.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
  }
end
krastorio.icons.setItemIcon("artillery-shell", kr_icons_path .. "ammo/artillery-shell.png", 64, 4)
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
