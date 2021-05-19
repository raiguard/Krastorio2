-- Adding grids to AI controlled vehicles that do not have them
if mods["aai-programmable-vehicles"] then
  if mods["aai-vehicles-hauler"] and data.raw["car"]["vehicle-hauler-0"] then
    data.raw["car"]["vehicle-hauler-0"].equipment_grid = "kr-car-grid"
  end
  if mods["aai-vehicles-hauler"] and data.raw["car"]["vehicle-chaingunner-vehicle-chaingunner-gun"] then
    data.raw["car"]["vehicle-chaingunner-vehicle-chaingunner-gun"].equipment_grid = "kr-car-grid"
  end
  if mods["aai-vehicles-warden"] and data.raw["car"]["vehicle-warden-electro-bolter-gun"] then
    data.raw["car"]["vehicle-warden-electro-bolter-gun"].equipment_grid = "kr-car-grid"
  end
  if mods["aai-vehicles-flame-tumbler"] and data.raw["car"]["vehicle-flame-tumbler-flame-tumbler-flamethrower"] then
    if mods["Aircraft"] then
      data.raw["car"]["vehicle-flame-tumbler-flame-tumbler-flamethrower"].equipment_grid = "kr-flying-fortress-grid"
    else
      data.raw["car"]["vehicle-flame-tumbler-flame-tumbler-flamethrower"].equipment_grid = "kr-car-grid"
    end
  end
  if mods["aai-vehicles-flame-tank"] and data.raw["car"]["vehicle-flame-tank-flame-tank-flamethrower"] then
    data.raw["car"]["vehicle-flame-tank-flame-tank-flamethrower"].equipment_grid = "kr-tank-grid"
  end
  if mods["aai-vehicles-laser-tank"] and data.raw["car"]["vehicle-laser-tank-laser-tank-cannon"] then
    data.raw["car"]["vehicle-laser-tank-laser-tank-cannon"].equipment_grid = "kr-tank-grid"
  end
  if mods["aai-vehicles-miner"] then
    if data.raw["car"]["vehicle-miner-0"] then
      data.raw["car"]["vehicle-miner-0"].equipment_grid = "kr-car-grid"
    end
    if data.raw["car"]["vehicle-miner-mk2-0"] then
      data.raw["car"]["vehicle-miner-mk2-0"].equipment_grid = "kr-car-grid"
    end
    if data.raw["car"]["vehicle-miner-mk3-0"] then
      data.raw["car"]["vehicle-miner-mk3-0"].equipment_grid = "kr-car-grid"
    end
    if data.raw["car"]["vehicle-miner-mk4-0"] then
      data.raw["car"]["vehicle-miner-mk4-0"].equipment_grid = "kr-tank-grid"
    end
    if data.raw["car"]["vehicle-miner-mk5-0"] then
      data.raw["car"]["vehicle-miner-mk5-0"].equipment_grid = "kr-tank-grid"
    end
  end
end
