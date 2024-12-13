local patterns = {
  ["angels-crawler-locomotive"] = true,
  ["angels-petro-locomotive"] = true,
  ["angels-smelting-locomotive"] = true,
}

if mods["angelsaddons-mobility"] then
  for name, grid in pairs(data.raw["equipment-grid"]) do
    if patterns[name] then
      table.insert(grid.equipment_categories, "vehicle-motor")
    end
  end
end
