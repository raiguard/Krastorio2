if data.raw.fluid["petroleum-gas"] then
	data.raw.fluid["petroleum-gas"].fuel_value = "400KJ"
	data.raw.fluid["petroleum-gas"].fuel_category = "burnable-fluid-fuel"
	data.raw.fluid["petroleum-gas"].fuel_emissions_multiplier = 1.2
end