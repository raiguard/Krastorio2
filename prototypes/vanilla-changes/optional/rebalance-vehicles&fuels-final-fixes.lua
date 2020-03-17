if krastorio.general.getSafeSettingValue("kr-rebalance-vehicles&fuels") then
	
	data.raw.item["wood"].fuel_acceleration_multiplier = 0.35 --empty
	data.raw.item["wood"].fuel_top_speed_multiplier = 0.5 --empty
	data.raw.item["wood"].fuel_emissions_multiplier = 3 --empty
	
	data.raw.item["coal"].fuel_acceleration_multiplier = 0.5 --empty
	data.raw.item["coal"].fuel_top_speed_multiplier = 0.6 --empty
	data.raw.item["coal"].fuel_emissions_multiplier = 3 --empty
	
	data.raw.item["coke"].fuel_acceleration_multiplier = 0.6 --empty
	data.raw.item["coke"].fuel_top_speed_multiplier = 0.7 --empty
	data.raw.item["coke"].fuel_emissions_multiplier = 3 --empty
	
	data.raw.item["solid-fuel"].fuel_acceleration_multiplier = 0.75 --empty
	data.raw.item["solid-fuel"].fuel_top_speed_multiplier = 0.75 --empty
	data.raw.item["solid-fuel"].fuel_emissions_multiplier = 2 --empty
	
	data.raw.item["rocket-fuel"].fuel_value = "15MJ"
	data.raw.item["rocket-fuel"].fuel_acceleration_multiplier = 1 --empty
	data.raw.item["rocket-fuel"].fuel_top_speed_multiplier = 1 --empty
	data.raw.item["rocket-fuel"].fuel_emissions_multiplier = 1.5 --empty
	
end
