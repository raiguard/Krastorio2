if not mods["space-exploration"] then
  return
end

-- Create a new prototype instead of overwriting the space science pack
kr_optimization_tech_card_name = "kr-optimization-tech-card"

local optimization_tech_card_item = table.deepcopy(data.raw.tool["space-science-pack"])
optimization_tech_card_item.name = kr_optimization_tech_card_name
data:extend({ optimization_tech_card_item })

local optimization_tech_card_tech = table.deepcopy(data.raw.technology["space-science-pack"])
optimization_tech_card_tech.name = kr_optimization_tech_card_name
data:extend({ optimization_tech_card_tech })
