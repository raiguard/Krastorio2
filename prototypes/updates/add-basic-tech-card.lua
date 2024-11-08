for _, technology in pairs(data.raw.technology) do
  local unit = technology.unit
  if unit and #unit.ingredients == 1 and unit.ingredients[1][1] == "automation-science-pack" then
    table.insert(unit.ingredients, 1, { "basic-tech-card", 1 })
  end
end
