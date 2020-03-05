if mods["aai-vehicles-chaingunner"] then
	if data.raw["car"]["vehicle-chaingunner"] then
		data.raw["car"]["vehicle-chaingunner"].equipment_grid = "kr-car-grid"
		krastorio.technologies.addPrerequisite("vehicle-chaingunner", "kr-fuel")
	end
end