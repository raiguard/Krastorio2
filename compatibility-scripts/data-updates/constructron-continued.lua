if mods["Constructron-Continued"] then
  data.raw["spider-vehicle"]["constructron"].equipment_grid = "kr-spidertron-equipment-grid"
  constructron_se = data.raw["spider-vehicle"]["constructron-rocket-powered"]
  if constructron_se then
	constructron_se.equipment_grid = "kr-spidertron-equipment-grid"
  end
end
