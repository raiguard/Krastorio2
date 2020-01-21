-- -- -- Vanilla Vehicles changes
if krastorio.general.getSafeSettingValue("kr-rebalance-vehicles&fuels") then

	---------------------
	-- -- Car
	--data.raw["item-with-entity-data"]["car"].subgroup = "k-vehicles"
	--data.raw["item-with-entity-data"]["car"].order = "1[car]"

	data.raw.car["car"].minable = {mining_time = 3, result = "car"}
	data.raw.car["car"].burner.fuel_category = "vehicle-fuel"
	data.raw.car["car"].burner.emissions_per_minute = 5
	krastorio.recipes.setEnergyCost("car", 120)
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

	-- recipe modification
	krastorio.recipes.setEnergyCost("tank", 300, 600)
	krastorio.recipes.replaceIngredient("tank", "engine-unit", {"engine-unit", 20})
	krastorio.recipes.replaceIngredient("tank", "steel-plate", {"steel-plate", 60})
	krastorio.recipes.replaceIngredient("tank", "iron-gear-wheel", {"steel-gear-wheel", 30})
	---------------------

	
	
end

	