local patterns = {
  ["angels-crawler-locomotive"] = true,
  ["angels-petro-locomotive"] = true,
  ["angels-smelting-locomotive"] = true,
}
local robo_patterns = {
  ["angels-crawler-bot-wagon"] = true,
}

if mods["angelsaddons-mobility"] then
  for name, grid in pairs(data.raw["equipment-grid"]) do
    if patterns[name] then
      table.insert(grid.equipment_categories, "vehicle-motor")
    end
    if robo_patterns[name] then
      table.insert(grid.equipment_categories, "vehicle-robot-interaction-equipment")
    end
  end
end
