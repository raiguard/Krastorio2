local spiders = {
  "assault_spidertron_mk1",
  "assault_spidertron_mk2",
  "bulwark_spidertron_mk1",
  "bulwark_spidertron_mk2",
  "scout_spidertron_mk1",
  "scout_spidertron_mk2",
  "spidertron_mk0",
  "spidertron_mk2",
  "spidertron_mk3",
  "spidertron_mkn1",
  "voyage_spidertron_mk1",
  "voyage_spidertron_mk2",
}

if mods["spidertrontiers"] then
  for _, name in pairs(spiders) do
    local spider = data.raw["spider-vehicle"][name]
    if spider then
      local grid_name = spider.equipment_grid
      if grid_name then
        local grid = data.raw["equipment-grid"][grid_name]
        if grid then
          table.insert(grid.equipment_categories, "universal-equipment")
          table.insert(grid.equipment_categories, "robot-interaction-equipment")
          table.insert(grid.equipment_categories, "vehicle-robot-interaction-equipment")
          table.insert(grid.equipment_categories, "vehicle-equipment")
          table.insert(grid.equipment_categories, "vehicle-motor")
        end
      end
    end
  end
end
