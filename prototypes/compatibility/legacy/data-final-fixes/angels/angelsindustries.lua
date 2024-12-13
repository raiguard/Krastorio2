if mods["angelsindustries"] then
  local angels_equipment_categories = {
    "angels-energy",
    "angels-construction",
    "angels-heavy-attack",
    "angels-heavy-defense",
    "angels-light-attack",
    "angels-light-defence",
    "angels-moviment",
    "angels-repair",
  }

  local krastori_vehicles_equipment_grids = {
    "kr-car-grid",
    "kr-tank-grid",
    "kr-tank-grid-2",
    "kr-locomotive-grid",
    "kr-wagons-grid",
  }

  if mods["Aircraft"] then
    table.insert(krastori_vehicles_equipment_grids, "kr-gunship-grid")
    table.insert(krastori_vehicles_equipment_grids, "kr-cargo-plane-grid")
    table.insert(krastori_vehicles_equipment_grids, "kr-jet-grid")
    table.insert(krastori_vehicles_equipment_grids, "kr-flying-fortress-grid")
  end

  for _, grid_name in pairs(krastori_vehicles_equipment_grids) do
    for _, equipment_name in pairs(angels_equipment_categories) do
      if data.raw["equipment-category"][equipment_name] then
        table.insert(data.raw["equipment-grid"][grid_name].equipment_categories, equipment_name)
      end
    end
  end

  -- Removing not useful recipes

  data.raw.technology["angels-ghosting-angels-construction-robots"] = nil
  data.raw.technology["angels-ghosting-construction-robots"] = nil
end
