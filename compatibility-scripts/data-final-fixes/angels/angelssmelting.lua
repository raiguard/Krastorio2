if mods["angelssmelting"] then
  -- -- Adjustments for enriched ores

  -- Increase yield
  krastorio.recipes.replaceProduct(
    "enriched-iron",
    "enriched-iron",
    { type = "item", name = "enriched-iron", amount = 8 }
  )
  krastorio.recipes.replaceProduct(
    "enriched-copper",
    "enriched-copper",
    { type = "item", name = "enriched-copper", amount = 8 }
  )

  -- Add new recipes
  local enriched_iron = krastorio.items.getItem("enriched-iron")
  local enriched_copper = krastorio.items.getItem("enriched-copper")

  krastorio.recipes.addWithOverrideSafeNewRecipe({
    type = "recipe",
    name = "enriched-iron-smelting",
    icons = {
      { icon = "__angelssmelting__/graphics/icons/ingot-iron.png", icon_size = 64 },
      { icon = enriched_iron.icon, icon_size = enriched_iron.icon_size, scale = 0.20, shift = { -8, -8 } },
    },
    category = "blast-smelting",
    subgroup = "angels-iron",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "enriched-iron", amount = 12 },
    },
    results = {
      { type = "item", name = "ingot-iron", amount = 24 },
    },
    icon_size = 32,
    order = "e[ingot-iron]-d",
  })
  krastorio.recipes.addWithOverrideSafeNewRecipe({
    type = "recipe",
    name = "enriched-copper-smelting",
    icons = {
      { icon = "__angelssmelting__/graphics/icons/ingot-copper.png", icon_size = 64 },
      { icon = enriched_copper.icon, icon_size = enriched_copper.icon_size, scale = 0.20, shift = { -8, -8 } },
    },
    category = "blast-smelting",
    subgroup = "angels-copper",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "enriched-copper", amount = 12 },
    },
    results = {
      { type = "item", name = "ingot-copper", amount = 24 },
    },
    icon_size = 32,
    order = "e[ingot-copper]-d",
  })
  krastorio.recipes.addWithOverrideSafeNewRecipe({
    type = "recipe",
    name = "enriched-iron-processing",
    icons = {
      { icon = "__angelssmelting__/graphics/icons/processed-iron.png", icon_size = 64 },
      { icon = enriched_iron.icon, icon_size = enriched_iron.icon_size, scale = 0.20, shift = { -8, -8 } },
    },
    category = "blast-smelting",
    subgroup = "angels-iron",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "enriched-iron", amount = 2 },
    },
    results = {
      { type = "item", name = "processed-iron", amount = 2 },
    },
    icon_size = 32,
    order = "b[processed-iron]-b",
  })
  krastorio.recipes.addWithOverrideSafeNewRecipe({
    type = "recipe",
    name = "enriched-copper-processing",
    icons = {
      { icon = "__angelssmelting__/graphics/icons/processed-copper.png", icon_size = 64 },
      { icon = enriched_copper.icon, icon_size = enriched_copper.icon_size, scale = 0.20, shift = { -8, -8 } },
    },
    category = "blast-smelting",
    subgroup = "angels-copper",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "enriched-copper", amount = 2 },
    },
    results = {
      { type = "item", name = "processed-copper", amount = 2 },
    },
    icon_size = 32,
    order = "b[processed-copper]-b",
  })
  krastorio.technologies.addUnlockRecipe(
    "kr-enriched-ores",
    krastorio.recipes.changed_names["enriched-iron-smelting"] or "enriched-iron-smelting"
  )
  krastorio.technologies.addUnlockRecipe(
    "kr-enriched-ores",
    krastorio.recipes.changed_names["enriched-copper-smelting"] or "enriched-copper-smelting"
  )
  krastorio.technologies.addUnlockRecipe(
    "kr-enriched-ores",
    krastorio.recipes.changed_names["enriched-iron-processing"] or "enriched-iron-processing"
  )
  krastorio.technologies.addUnlockRecipe(
    "kr-enriched-ores",
    krastorio.recipes.changed_names["enriched-copper-processing"] or "enriched-copper-processing"
  )

  -- Icons

  -- Coppers
  local copper_recipes = {
    "angelsore3-crushed-smelting",
    "angels-copper-pebbles-smelting",
    "angels-copper-nugget-smelting",
    "copper-plate",
  }

  for _, recipe_name in pairs(copper_recipes) do
    if data.raw.recipe[recipe_name] then
      data.raw.recipe[recipe_name].icons[1].icon = kr_items_icons_path .. "copper-plate.png"
      data.raw.recipe[recipe_name].icons[1].icon_size = 64 -- override the base sprite size
      data.raw.recipe[recipe_name].icons[1].scale = 32/64
      data.raw.recipe[recipe_name].icons[2].icon_size = 32
      data.raw.recipe[recipe_name].icons[2].scale = 32/64
      data.raw.recipe[recipe_name].icon_size = 64 -- override the composite sprite size
      data.raw.recipe[recipe_name].scale = 32/64
    end
  end

  -- These recipes use different scaling than the others
  local badly_scaled_recipes = {
    "angels-plate-copper",
    "angels-roll-copper-converting",
  }
  -- Implement relative custom scaling
  for _, recipe_name in pairs(badly_scaled_recipes) do
    if data.raw.recipe[recipe_name] then
      data.raw.recipe[recipe_name].icons[1].icon = kr_items_icons_path .. "copper-plate.png"
      data.raw.recipe[recipe_name].icons[1].icon_size = 64 -- override the base sprite size
      -- double the scale, because the background is double the size
      data.raw.recipe[recipe_name].icons[2].scale = data.raw.recipe[recipe_name].icons[2].scale * 2
      -- double the offset, because the background is twice the size
      data.raw.recipe[recipe_name].icons[2].shift[1] = data.raw.recipe[recipe_name].icons[2].shift[1] * 2
      data.raw.recipe[recipe_name].icons[2].shift[2] = data.raw.recipe[recipe_name].icons[2].shift[2] * 2
    end
  end


  data.raw.recipe["enriched-copper-plate"].icons = {
    { icon = kr_items_icons_path .. "copper-plate.png", icon_size = 64 },
    {
      icon = kr_items_with_variations_icons_path .. "enriched-copper/enriched-copper.png",
      icon_size = 64,
      scale = 0.2,
      shift = { -10, -10 },
    },
  }

  -- Irons
  local iron_recipes = {
    "angels-plate-steel",
    "angels-roll-steel-converting",
  }

  -- Needs to be handled separately because it uses icon instead of icons
  if data.raw.recipe["steel-plate"] then
    print("steel-plate")
    data.raw.recipe["steel-plate"].icon = kr_items_icons_path .. "steel-plate.png"
    data.raw.recipe["steel-plate"].icon_size = 64
  end

  for _, recipe_name in pairs(iron_recipes) do
    if data.raw.recipe[recipe_name] then
      print(recipe_name)
      data.raw.recipe[recipe_name].icons[1].icon = kr_items_icons_path .. "steel-plate.png"
      --         data.raw.recipe[recipe_name].icons[2].icon_size = 32 -- Doing this actually removed (or made the icon appear VERY small)
      data.raw.recipe[recipe_name].icon_size = 64
    end
  end
end
