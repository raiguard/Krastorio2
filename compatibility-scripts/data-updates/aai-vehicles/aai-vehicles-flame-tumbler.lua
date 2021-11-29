if mods["aai-vehicles-flame-tumbler"] and data.raw["car"]["vehicle-flame-tumbler"] then
  -- easter egg from AAI-BobEquipment compatibility mod, afterburner on a racer
  if mods["Aircraft"] then
    data.raw["car"]["vehicle-flame-tumbler"].equipment_grid = "kr-flying-fortress-grid"
  else
    data.raw["car"]["vehicle-flame-tumbler"].equipment_grid = "kr-car-grid"
  end
end
