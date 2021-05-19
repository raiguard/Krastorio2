if mods["angelsaddons-cab"] then
  if data.raw["equipment-grid"]["angels-cab"] then
    table.insert(data.raw["equipment-grid"]["angels-cab"].equipment_categories, "universal-equipment")
    table.insert(data.raw["equipment-grid"]["angels-cab"].equipment_categories, "vehicle-equipment")
  end
end
