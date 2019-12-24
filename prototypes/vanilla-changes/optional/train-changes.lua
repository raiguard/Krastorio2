-- -- -- Vanilla and Non Trains changes
-- Give to trains more cargo with more energy consume
if krastorio.general.getSafeSettingValue("kr-rebalance-vehicles&fuels") then

	---------------------	
	-- -- Locomotive
	data.raw.locomotive["locomotive"].max_health = 2000
	data.raw.locomotive["locomotive"].braking_force = 40
	data.raw.locomotive["locomotive"].burner.fuel_inventory_size = 3
	data.raw.locomotive["locomotive"].burner.fuel_category = "vehicle-fuel"
	data.raw.locomotive["locomotive"].burner.emissions_per_minute = 20
	data.raw.locomotive["locomotive"].minable = {mining_time = 1, result = "locomotive"}
	data.raw.locomotive["locomotive"].weight = 8500
	data.raw.locomotive["locomotive"].max_speed = 1.2
	data.raw.locomotive["locomotive"].max_power = "2.5MW"
	data.raw.locomotive["locomotive"].burner.effectivity = 1

	-- recipe modification
	krastorio.recipes.setEnergyCost("locomotive", 180, 360)	
	krastorio.recipes.replaceIngredient("locomotive", "steel-plate", {"steel-plate", 80})
	---------------------
	
	---------------------
	-- -- Cargo wagon
	for _, wagon in pairs(data.raw["cargo-wagon"]) do 
		if wagon.inventory_size < 75 then -- mod compatibility check
			wagon.inventory_size = wagon.inventory_size * 2
		end
	end
	data.raw["cargo-wagon"]["cargo-wagon"].max_health = 1500
	data.raw["cargo-wagon"]["cargo-wagon"].minable = {mining_time = 0.5, result = "cargo-wagon"}
	
	krastorio.recipes.setEnergyCost("cargo-wagon", 60)
	---------------------
	
	---------------------
	-- -- Fluid wagon
	data.raw["fluid-wagon"]["fluid-wagon"].capacity = 50000
	data.raw["fluid-wagon"]["fluid-wagon"].max_health = 1500
	data.raw["fluid-wagon"]["fluid-wagon"].minable = {mining_time = 0.5, result = "fluid-wagon"}
	
	krastorio.recipes.setEnergyCost("fluid-wagon", 60)
	---------------------
	
	---------------------
	-- -- Artillery wagon
	data.raw["artillery-wagon"]["artillery-wagon"].max_health = 2000
	data.raw["artillery-wagon"]["artillery-wagon"].minable = {mining_time = 0.5, result = "artillery-wagon"}

	krastorio.recipes.setEnergyCost("artillery-wagon", 120)
	---------------------
	
end