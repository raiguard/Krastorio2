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
    local ingredients = data.ingredients or { { "wood", 1 } }
    local enabled = data.enabled or false
    local energy_required = data.energy_required or standard_loaders_crafting_speed
    return {
      ["type"] = "recipe",
      ["name"] = name,
      ["category"] = category,
      ["ingredients"] = ingredients,
      ["enabled"] = enabled,
      ["energy_required"] = energy_required,
      ["result"] = name,
      ["mod"] = "Krastorio2",
    }
  end

  local recipes = {
    kr_loader_recipe({
      name = loader_names[1],
      ingredients = {
        { "transport-belt", 1 },
        { "iron-gear-wheel", 10 },
        { "iron-beam", 2 },
      },
    }),
    kr_loader_recipe({
      name = loader_names[2],
      ingredients = {
        { "fast-transport-belt", 1 },
        { "kr-loader", 2 },
        { "iron-gear-wheel", 10 },
      },
    }),
    kr_loader_recipe({
      name = loader_names[3],
      ingredients = {
        { "express-transport-belt", 1 },
        { "kr-fast-loader", 2 },
        { "steel-gear-wheel", 10 },
      },
    }),
    kr_loader_recipe({
      name = loader_names[4],
      ingredients = {
        { "kr-advanced-transport-belt", 1 },
        { "kr-express-loader", 2 },
        { "rare-metals", 10 },
      },
    }),
    kr_loader_recipe({
      name = loader_names[5],
      ingredients = {
        { "kr-superior-transport-belt", 1 },
        { "kr-advanced-loader", 2 },
        { "imersium-gear-wheel", 10 },
      },
    }),
  }
  data:extend(recipes)
end
