if mods["angelsrefining"] then
  -- -- Re-Chaning intermediate products icons

  -- Chaning iron plate
  krastorio.icons.setItemIcon("iron-plate", kr_items_icons_path .. "iron-plate.png", 64, 4)

  -- Changing copper plate
  krastorio.icons.setItemIcon("copper-plate", kr_items_icons_path .. "copper-plate.png", 64, 4)

  -- Chaning steel icon
  krastorio.icons.setItemIcon("steel-plate", kr_items_icons_path .. "steel-plate.png", 64, 4)

  -- Changing iron gear wheel
  krastorio.icons.setItemIcon("iron-gear-wheel", kr_items_icons_path .. "iron-gear-wheel.png", 64, 4)

  -- Other smelting icon recipes
  -- Irons
  local iron_recipes = {
    "angelsore1-crushed-smelting",
    "angels-iron-pebbles-smelting",
    "angels-iron-nugget-smelting",
    "iron-plate",
    "angels-plate-iron",
    "angels-roll-iron-converting",
  }

  for _, recipe_name in pairs(iron_recipes) do
    if data.raw.recipe[recipe_name] then
      data.raw.recipe[recipe_name].icons[1].icon = kr_items_icons_path .. "iron-plate.png"
      data.raw.recipe[recipe_name].icons[2].icon_size = 32
      data.raw.recipe[recipe_name].icon_size = 64
    end
  end

  data.raw.recipe["enriched-iron-plate"].icons = {
    { icon = kr_items_icons_path .. "iron-plate.png", icon_size = 64 },
    {
      icon = kr_items_with_variations_icons_path .. "enriched-iron/enriched-iron.png",
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
  data.raw.recipe["kr-vc-stone-crushed"] = nil

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
