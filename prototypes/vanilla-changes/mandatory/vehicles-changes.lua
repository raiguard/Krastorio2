-- -- -- Vanilla Vehicles changes

---------------------
-- -- Car
--data.raw["item-with-entity-data"]["car"].subgroup = "k-vehicles"
--data.raw["item-with-entity-data"]["car"].order = "1[car]"

data.raw.car["car"].minable = {mining_time = 3, result = "car"}
data.raw.car["car"].burner.fuel_category = "vehicle-fuel"
data.raw.car["car"].burner.emissions_per_minute = 5
--aswil.recipes.setRecipeEnergyCost("car", 120)
---------------------

---------------------
-- -- Tank
--data.raw["item-with-entity-data"]["tank"].subgroup = "k-vehicles"
--data.raw["item-with-entity-data"]["tank"].order = "2[tank]"

data.raw.car["tank"].max_health = 3000
data.raw.car["tank"].minable = {mining_time = 5, result = "tank"}
data.raw.car["tank"].burner.fuel_category = "vehicle-fuel"
data.raw.car["tank"].burner.emissions_per_minute = 15
data.raw.car["tank"].inventory_size = 100
data.raw.car["tank"].weight = 30000
data.raw.car["tank"].consumption = "1MW"
data.raw.car["tank"].braking_power = "1.75MW"

--aswil.recipes.setRecipeEnergyCost("tank", 300, 600)
-- recipe modification
--aswil.recipes.replaceIngredient("tank", "engine-unit", {"engine-unit", 20})
--aswil.recipes.replaceIngredient("tank", "steel-plate", {"steel-plate", 60})
--aswil.recipes.addIngredient("tank", {"k-steel", 30})
---------------------

---------------------
-- -- Locomotive
data.raw.locomotive["locomotive"].max_health = 2000
data.raw.locomotive["locomotive"].braking_force = 40
data.raw.locomotive["locomotive"].burner.fuel_inventory_size = 3
data.raw.locomotive["locomotive"].burner.fuel_category = "vehicle-fuel"
data.raw.locomotive["locomotive"].burner.emissions_per_minute = 20
data.raw.locomotive["locomotive"].minable = {mining_time = 1, result = "locomotive"}

--aswil.recipes.setRecipeEnergyCost("locomotive", 180)
-- recipe modification
--aswil.recipes.replaceIngredient("locomotive", "steel-plate", {"steel-plate", 20})
--aswil.recipes.addIngredient("locomotive", {"k-steel", 60})
---------------------

---------------------
-- -- Cargo wagon
data.raw["cargo-wagon"]["cargo-wagon"].max_health = 1500
data.raw["cargo-wagon"]["cargo-wagon"].minable = {mining_time = 0.5, result = "cargo-wagon"}

--aswil.recipes.setRecipeEnergyCost("cargo-wagon", 60)
---------------------

---------------------
-- -- Fluid wagon
data.raw["fluid-wagon"]["fluid-wagon"].max_health = 1500
data.raw["fluid-wagon"]["fluid-wagon"].minable = {mining_time = 0.5, result = "fluid-wagon"}

--aswil.recipes.setRecipeEnergyCost("fluid-wagon", 60)
---------------------

---------------------
-- -- Artillery wagon
data.raw["artillery-wagon"]["artillery-wagon"].max_health = 2000
data.raw["artillery-wagon"]["artillery-wagon"].minable = {mining_time = 0.5, result = "artillery-wagon"}

--aswil.recipes.setRecipeEnergyCost("artillery-wagon", 120)
---------------------
	