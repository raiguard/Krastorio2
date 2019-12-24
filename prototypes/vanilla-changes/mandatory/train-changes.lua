-- -- Give to trains more cargo with more energy consume
if settings.startup["reb-train"] and settings.startup["reb-train"].value then

	---------------------
	-- -- Locomotive
	data.raw.locomotive["locomotive"].weight = 8500
	data.raw.locomotive["locomotive"].max_speed = 1.2
	data.raw.locomotive["locomotive"].max_power = "2.5MW"
	data.raw.locomotive["locomotive"].burner.effectivity = 1	
	---------------------
	
	---------------------
	-- -- Cargo wagon
	data.raw["cargo-wagon"]["cargo-wagon"].inventory_size = 100
	---------------------
	
	---------------------
	-- -- Fluid wagon
	data.raw["fluid-wagon"]["fluid-wagon"].capacity = 50000
	---------------------
	
end