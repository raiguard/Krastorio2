if mods["vtk-armor-plating"] then
  --[[
  if data.raw["battery-equipment"]["vtk-armor-plating-equipment"] then
    data.raw["battery-equipment"]["vtk-armor-plating-equipment"].categories = { "vehicle-equipment" }
  end

  if data.raw["battery-equipment"]["vtk-armor-plating-equipment-energized"] then
    data.raw["battery-equipment"]["vtk-armor-plating-equipment-energized"].categories = { "vehicle-equipment" }
  end
  --]]

  table.insert(data.raw["equipment-grid"]["kr-car-grid"].equipment_categories, "vtk-armor-plating")
  table.insert(data.raw["equipment-grid"]["kr-tank-grid"].equipment_categories, "vtk-armor-plating")
  table.insert(data.raw["equipment-grid"]["kr-tank-grid-2"].equipment_categories, "vtk-armor-plating")
  table.insert(data.raw["equipment-grid"]["kr-locomotive-grid"].equipment_categories, "vtk-armor-plating")
  table.insert(data.raw["equipment-grid"]["kr-wagons-grid"].equipment_categories, "vtk-armor-plating")
end
