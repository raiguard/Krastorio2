-- Vanilla steam stat changes

-- Fusion turbine need an higher steam temperature, for that max temperature of vanilla steam must be 1500
data.raw.fluid["steam"].max_temperature = 1500
data.raw.fluid["steam"].heat_capacity = "0.25KJ"
data.raw["generator"]["steam-engine"].fluid_usage_per_tick = 0.5
data.raw["generator"]["steam-engine"].max_power_output = "1MW"
data.raw["boiler"]["boiler"].energy_consumption = "2MW"
