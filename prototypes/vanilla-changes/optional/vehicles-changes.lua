-- -- -- Vanilla Vehicles changes
if krastorio.general.getSafeSettingValue("kr-rebalance-vehicles&fuels") then
  ---------------------
  -- -- Car
  --data.raw["item-with-entity-data"]["car"].subgroup = "k-vehicles"
  --data.raw["item-with-entity-data"]["car"].order = "1[car]"

  data.raw.car["car"].minable = { mining_time = 3, result = "car" }
  data.raw.car["car"].burner.fuel_category = "vehicle-fuel"
  data.raw.car["car"].burner.emissions_per_minute = 5
  krastorio.recipes.setEnergyCost("car", 30)
  ---------------------

  ---------------------
  -- -- Tank
  --data.raw["item-with-entity-data"]["tank"].subgroup = "k-vehicles"
  --data.raw["item-with-entity-data"]["tank"].order = "2[tank]"

  data.raw.car["tank"].max_health = 3000
  data.raw.car["tank"].minable = { mining_time = 5, result = "tank" }
  data.raw.car["tank"].burner.fuel_category = "vehicle-fuel"
  data.raw.car["tank"].burner.emissions_per_minute = 15
  data.raw.car["tank"].inventory_size = 100
  data.raw.car["tank"].weight = 30000
  data.raw.car["tank"].consumption = "1MW"
  data.raw.car["tank"].braking_power = "1.75MW"

  -- recipe modification
  krastorio.recipes.setEnergyCost("tank", 60, 120)
  krastorio.recipes.replaceIngredient("tank", "engine-unit", { "engine-unit", 20 })
  krastorio.recipes.replaceIngredient("tank", "steel-plate", { "steel-plate", 60 })
  krastorio.recipes.replaceIngredient("tank", "iron-gear-wheel", { "steel-gear-wheel", 30 })
  ---------------------

  ---------------------
  -- -- Fuels
  for _, car in pairs(data.raw.car) do
    if car.burner then
      car.burner.fuel_category = "vehicle-fuel"
      car.burner.fuel_categories = nil
    end
  end

  ---------------------
  -- -- Add Nuclear Locomotive

  data:extend({
    {
      type = "recipe",
      name = "kr-nuclear-locomotive",
      energy_required = 60,
      enabled = false,
      allow_productivity = true,
      ingredients = {
        { "locomotive", 1 },
        { "electronic-components", 20 },
        { "steel-gear-wheel", 20 },
        { "processing-unit", 20 },
        { "rare-metals", 80 },
      },
      result = "kr-nuclear-locomotive",
    },
    {
      type = "technology",
      name = "kr-nuclear-locomotive",
      mod = "Krastorio2",
      icon = kr_technologies_icons_path .. "nuclear-locomotive.png",
      icon_size = 256,
      icon_mipmaps = 4,
      effects = {
        {
          type = "unlock-recipe",
          recipe = krastorio.recipes.changed_names["kr-nuclear-locomotive"] or "kr-nuclear-locomotive",
        },
      },
      prerequisites = { "railway", "nuclear-power", "production-science-pack" },
      unit = {
        count = 500,
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "chemical-science-pack", 1 },
          { "production-science-pack", 1 },
        },
        time = 60,
      },
    },
  })
end
