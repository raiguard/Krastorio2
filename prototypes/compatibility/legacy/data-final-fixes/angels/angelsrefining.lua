if mods["angelsrefining"] then
  -- -- Re-Chaning intermediate products icons

  -- Chaning iron plate
  krastorio.icons.setItemIcon("iron-plate", "__Krastorio2Assets__/icons/items/iron-plate.png", 64, 4)

  -- Changing copper plate
  krastorio.icons.setItemIcon("copper-plate", "__Krastorio2Assets__/icons/items/copper-plate.png", 64, 4)

  -- Chaning steel icon
  krastorio.icons.setItemIcon("steel-plate", "__Krastorio2Assets__/icons/items/steel-plate.png", 64, 4)

  -- Changing iron gear wheel
  krastorio.icons.setItemIcon("iron-gear-wheel", "__Krastorio2Assets__/icons/items/iron-gear-wheel.png", 64, 4)

  -- Other smelting icon recipes
  -- Irons
  local iron_recipes = {
    "angelsore1-crushed-smelting",
    "angels-iron-pebbles-smelting",
    "angels-iron-nugget-smelting",
    "iron-plate",
  }

  for _, recipe_name in pairs(iron_recipes) do
    if data.raw.recipe[recipe_name] then
      data.raw.recipe[recipe_name].icons[1].icon = "__Krastorio2Assets__/icons/items/iron-plate.png"
      data.raw.recipe[recipe_name].icons[1].icon_size = 64 -- override the base sprite size
      data.raw.recipe[recipe_name].icons[1].scale = 32 / 64
      data.raw.recipe[recipe_name].icons[2].icon_size = 32 -- override the 'exponent' sprite size
      data.raw.recipe[recipe_name].icons[2].scale = 32 / 64
      data.raw.recipe[recipe_name].icon_size = 64 -- override the composite sprite size
      data.raw.recipe[recipe_name].scale = 32 / 64
    end
  end

  -- These recipes use different scaling than the others
  local badly_scaled_recipes = {
    "angels-plate-iron",
    "angels-roll-iron-converting",
  }
  -- Implement relative custom scaling
  for _, recipe_name in pairs(badly_scaled_recipes) do
    if data.raw.recipe[recipe_name] then
      data.raw.recipe[recipe_name].icons[1].icon = "__Krastorio2Assets__/icons/items/iron-plate.png"
      data.raw.recipe[recipe_name].icons[1].icon_size = 64 -- override the base sprite size
      -- double the scale, because the background is double the size
      data.raw.recipe[recipe_name].icons[2].scale = data.raw.recipe[recipe_name].icons[2].scale * 2
      -- double the offset, because the background is twice the size
      data.raw.recipe[recipe_name].icons[2].shift[1] = data.raw.recipe[recipe_name].icons[2].shift[1] * 2
      data.raw.recipe[recipe_name].icons[2].shift[2] = data.raw.recipe[recipe_name].icons[2].shift[2] * 2
    end
  end

  data.raw.recipe["enriched-iron-plate"].icons = {
    { icon = "__Krastorio2Assets__/icons/items/iron-plate.png", icon_size = 64 },
    {
      icon = "__Krastorio2Assets__/icons/items/enriched-iron.png",
      icon_size = 64,
      scale = 0.2,
      shift = { -10, -10 },
    },
  }

  -- Add crush stone to sand recipe variation
  local stone_item = krastorio.items.getItem("stone")
  local crushed_stone_item = krastorio.items.getItem("stone-crushed")
  local sand_item = krastorio.items.getItem("sand")

  krastorio.recipes.addWithOverrideSafeNewRecipe({
    type = "recipe",
    name = "sand-2",
    category = "crushing",
    subgroup = "processing-crafting",
    icons = {
      { icon = sand_item.icon, icon_size = sand_item.icon_size },
      { icon = crushed_stone_item.icon, icon_size = crushed_stone_item.icon_size, scale = 0.20, shift = { -8, -8 } },
    },
    icon_size = sand_item.icon_size,
    hide_from_player_crafting = false,
    always_show_made_in = true,
    allow_as_intermediate = false,
    allow_intermediates = false,
    always_show_products = true,
    energy_required = 1,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "stone-crushed", amount = 6 },
    },
    results = {
      { type = "item", name = "sand", amount_min = 7, amount_max = 8 },
    },
  })
  krastorio.technologies.addUnlockRecipe("kr-stone-processing", "sand-2")
  data.raw.recipe["kr-crush-stone-crushed"] = nil

  if data.raw.recipe["sand"] then
    data.raw.recipe["sand"].icon = nil
    data.raw.recipe["sand"].icons = {
      { icon = sand_item.icon, icon_size = sand_item.icon_size },
      { icon = stone_item.icon, icon_size = stone_item.icon_size, scale = 0.20, shift = { -8, -8 } },
    }
    data.raw.recipe["sand"].icon_size = sand_item.icon_size
    data.raw.recipe["sand"].subgroup = "processing-crafting"
  end
end
