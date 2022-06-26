if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
  ---- Move Optimization Tech Card to new prototype instead of overwriting vanilla space-science-pack prototype
  krastorio.optimization_tech_card_name = "kr-optimization-tech-card"

  -- Create the item
  local optimization_tech_card_item = table.deepcopy(data.raw.tool["space-science-pack"])
  optimization_tech_card_item.name = krastorio.optimization_tech_card_name
  data:extend({ optimization_tech_card_item })

  -- Create the technology
  local optimization_tech_card_tech = table.deepcopy(data.raw.technology["space-science-pack"])
  optimization_tech_card_tech.name = krastorio.optimization_tech_card_name
  data:extend({ optimization_tech_card_tech })
end
