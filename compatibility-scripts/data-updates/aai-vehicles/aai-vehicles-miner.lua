if mods["aai-vehicles-miner"] then
  if data.raw["car"]["vehicle-miner"] then
    data.raw["car"]["vehicle-miner"].equipment_grid = "kr-car-grid"
    if mods["aai-industry"] and krastorio.general.getSafeSettingValue("aai-fuel-processor") then
      krastorio.technologies.addPrerequisite("basic-vehicles", "fuel-processing")
    else
      krastorio.technologies.addPrerequisite("basic-vehicles", "kr-fuel")
    end
  end
  if data.raw["car"]["vehicle-miner-mk2"] then
    data.raw["car"]["vehicle-miner-mk2"].equipment_grid = "kr-car-grid"
  end
  if data.raw["car"]["vehicle-miner-mk3"] then
    data.raw["car"]["vehicle-miner-mk3"].equipment_grid = "kr-car-grid"
  end
  if data.raw["car"]["vehicle-miner-mk4"] then
    data.raw["car"]["vehicle-miner-mk4"].equipment_grid = "kr-tank-grid"
  end
  if data.raw["car"]["vehicle-miner-mk5"] then
    data.raw["car"]["vehicle-miner-mk5"].equipment_grid = "kr-tank-grid"
  end
end
