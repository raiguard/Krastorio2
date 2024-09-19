-- -- -- Vanilla and Non Trains changes
-- Give to trains more cargo with more energy consume
if krastorio.general.getSafeSettingValue("kr-rebalance-vehicles-fuels") then
  ---------------------
  -- -- Locomotive
  data.raw.locomotive["locomotive"].max_health = 1000
  data.raw.locomotive["locomotive"].braking_force = 30
  data.raw.locomotive["locomotive"].energy_source.fuel_inventory_size = 3
  data.raw.locomotive["locomotive"].energy_source.fuel_categories = { "chemical", "vehicle-fuel" }
  data.raw.locomotive["locomotive"].energy_source.emissions_per_minute = { pollution = 20 }
  data.raw.locomotive["locomotive"].minable = { mining_time = 1, result = "locomotive" }
  data.raw.locomotive["locomotive"].weight = 10000
  data.raw.locomotive["locomotive"].max_speed = 1.0185
  data.raw.locomotive["locomotive"].max_power = "2MW"
  data.raw.locomotive["locomotive"].energy_source.effectivity = 1

  -- recipe modification
  krastorio.recipes.setEnergyCost("locomotive", 60, 120)
  krastorio.recipes.replaceIngredient("locomotive", "steel-plate", { type = "item", name = "steel-plate", amount = 80 })
  ---------------------

  ---------------------
  -- -- Cargo wagon
  data.raw["cargo-wagon"]["cargo-wagon"].max_health = 750
  data.raw["cargo-wagon"]["cargo-wagon"].minable = { mining_time = 0.5, result = "cargo-wagon" }
  data.raw["cargo-wagon"]["cargo-wagon"].weight = 2000

  krastorio.recipes.setEnergyCost("cargo-wagon", 20)
  ---------------------

  ---------------------
  -- -- Fluid wagon
  data.raw["fluid-wagon"]["fluid-wagon"].max_health = 150
  data.raw["fluid-wagon"]["fluid-wagon"].minable = { mining_time = 0.5, result = "fluid-wagon" }
  data.raw["fluid-wagon"]["fluid-wagon"].weight = 2000

  krastorio.recipes.setEnergyCost("fluid-wagon", 20)
  ---------------------

  ---------------------
  -- -- Artillery wagon
  data.raw["artillery-wagon"]["artillery-wagon"].max_health = 1000
  data.raw["artillery-wagon"]["artillery-wagon"].minable = { mining_time = 0.5, result = "artillery-wagon" }
  data.raw["artillery-wagon"]["artillery-wagon"].weight = 3000

  krastorio.recipes.overrideIngredients("artillery-wagon", {
    { type = "item", name = "artillery-turret", amount = 1 },
    { type = "item", name = "cargo-wagon", amount = 1 },
    { type = "item", name = "rare-metals", amount = 20 },
    { type = "item", name = "steel-plate", amount = 20 },
    { type = "item", name = "steel-gear-wheel", amount = 20 },
  })

  krastorio.recipes.replaceIngredient("artillery-turret", "pipe", { type = "item", name = "steel-plate", amount = 80 })

  krastorio.recipes.setEnergyCost("artillery-wagon", 40)
  ---------------------
end
