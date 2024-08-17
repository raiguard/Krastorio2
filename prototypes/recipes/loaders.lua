if krastorio.general.getSafeSettingValue("kr-loaders") then
  local standard_loaders_crafting_speed = 2

  -- Variable utils
  local loader_names = {
    [1] = "kr-loader",
    [2] = "kr-fast-loader",
    [3] = "kr-express-loader",
    [4] = "kr-advanced-loader",
    [5] = "kr-superior-loader",
  }

  -- RECIPES

  function kr_loader_recipe(data)
    local name = data.name or "loader-test"
    local category = data.category or nil
    local ingredients = data.ingredients or { { type = "item", name = "wood", amount = 1 } }
    local enabled = data.enabled or false
    local energy_required = data.energy_required or standard_loaders_crafting_speed
    return {
      type = "recipe",
      name = name,
      category = category,
      ingredients = ingredients,
      enabled = enabled,
      energy_required = energy_required,
      results = { { type = "item", name = name, amount = 1 } },
      mod = "Krastorio2",
    }
  end

  local recipes = {
    kr_loader_recipe({
      name = loader_names[1],
      ingredients = {
        { type = "item", name = "transport-belt", amount = 1 },
        { type = "item", name = "iron-gear-wheel", amount = 10 },
        { type = "item", name = "iron-beam", amount = 2 },
      },
    }),
    kr_loader_recipe({
      name = loader_names[2],
      ingredients = {
        { type = "item", name = "fast-transport-belt", amount = 1 },
        { type = "item", name = "kr-loader", amount = 2 },
        { type = "item", name = "iron-gear-wheel", amount = 10 },
      },
    }),
    kr_loader_recipe({
      name = loader_names[3],
      ingredients = {
        { type = "item", name = "express-transport-belt", amount = 1 },
        { type = "item", name = "kr-fast-loader", amount = 2 },
        { type = "item", name = "steel-gear-wheel", amount = 10 },
      },
    }),
    kr_loader_recipe({
      name = loader_names[4],
      ingredients = {
        { type = "item", name = "kr-advanced-transport-belt", amount = 1 },
        { type = "item", name = "kr-express-loader", amount = 2 },
        { type = "item", name = "rare-metals", amount = 10 },
      },
    }),
    kr_loader_recipe({
      name = loader_names[5],
      ingredients = {
        { type = "item", name = "kr-superior-transport-belt", amount = 1 },
        { type = "item", name = "kr-advanced-loader", amount = 2 },
        { type = "item", name = "imersium-gear-wheel", amount = 10 },
      },
    }),
  }
  data:extend(recipes)
end
