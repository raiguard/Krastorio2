-- -- -- Vehicles minable changes
if krastorio.general.getSafeSettingValue("kr-vehicles-minable-changes") then

	data.raw.car["car"].minable = nil
	data.raw.car["tank"].minable = nil
	data.raw.car["kr-advanced-tank"].minable = nil
	
	data.raw.locomotive["locomotive"].minable = nil
	data.raw.locomotive["kr-nuclear-locomotive"].minable = nil
	data.raw["cargo-wagon"]["cargo-wagon"].minable = nil
	data.raw["fluid-wagon"]["fluid-wagon"].minable = nil
	
end

	