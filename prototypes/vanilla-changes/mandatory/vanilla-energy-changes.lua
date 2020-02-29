-- Vanilla steam stat changes

--data.raw.fluid["steam"].max_temperature = 1000
data.raw.fluid["steam"].heat_capacity = "0.5KJ"
data.raw["generator"]["steam-engine"].effectivity = 0.5
data.raw["generator"]["steam-engine"].fluid_usage_per_tick = 1/3
data.raw["generator"]["steam-engine"].max_power_output = "0.75MW"
data.raw["boiler"]["boiler"].energy_consumption = "7.5MW"

-- -- -- Accumulator and solar panel modification

data.raw["accumulator"]["accumulator"].energy_source.buffer_capacity = "10MJ" --5
data.raw["accumulator"]["accumulator"].energy_source.input_flow_limit = "600kW" --300
data.raw["accumulator"]["accumulator"].energy_source.output_flow_limit = "6000kW" --300

data.raw["solar-panel"]["solar-panel"].production = "100kW" --100

data.raw["lamp"]["small-lamp"].glow_size = 8 --6

-- -- -- Vanilla inserters stats modifcation

-- Stack inserter
data.raw.inserter["stack-inserter"]       .energy_per_movement = "12KJ"
data.raw.inserter["stack-inserter"]       .energy_per_movement = "12KJ"

-- Filter stack inserter
data.raw.inserter["stack-filter-inserter"].energy_per_movement = "14KJ"
data.raw.inserter["stack-filter-inserter"].energy_per_movement = "14KJ"

-- --  Mining drills
----------------------------------------
-- Burner mining drill
if data.raw["mining-drill"]["burner-mining-drill"] then
	data.raw["mining-drill"]["burner-mining-drill"].energy_source.emissions_per_minute = 5
	data.raw["mining-drill"]["burner-mining-drill"].energy_usage = "100kW"
end

-- Electric mining drill
if data.raw["mining-drill"]["electric-mining-drill"] then
	data.raw["mining-drill"]["electric-mining-drill"].energy_source.emissions_per_minute = 7.5
	data.raw["mining-drill"]["electric-mining-drill"].energy_usage = "100kW"
	data.raw["mining-drill"]["electric-mining-drill"].module_specification.module_slots = 2
end
----------------------------------------
-- Laboratory
if data.raw.lab["lab"] then
	data.raw.lab["lab"].energy_usage = "250kW"
end
-- Electric furnace
if data.raw["furnace"]["electric-furnace"] then
	data.raw["furnace"]["electric-furnace"].energy_usage = "350kW"
	data.raw["furnace"]["electric-furnace"].energy_source.emissions_per_minute = 1
end