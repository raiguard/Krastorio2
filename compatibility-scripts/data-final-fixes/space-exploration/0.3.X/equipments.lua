if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
  -- Apply K2 armors grid to the SE armors to have the same grids and equipment categories
  data.raw.armor["se-thruster-suit"].equipment_grid = "medium-equipment-grid"
  data.raw.armor["se-thruster-suit-2"].equipment_grid = "large-equipment-grid"
  data.raw.armor["se-thruster-suit-3"].equipment_grid = "mk3-armor-grid"
  data.raw.armor["se-thruster-suit-4"].equipment_grid = "mk4-armor-grid"

  -- Fix property of SE shields
  -- Energy shield mk5
  data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].categories = { "armor" }
  data.raw.item["energy-shield-mk5-equipment"].subgroup = "character-equipment"
  data.raw.item["energy-shield-mk5-equipment"].order = "s[energy-shield]-s5[energy-shield]"

  -- Energy shield mk6
  data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].categories = { "armor" }
  data.raw.item["energy-shield-mk6-equipment"].subgroup = "character-equipment"
  data.raw.item["energy-shield-mk6-equipment"].order = "s[energy-shield]-s6[energy-shield]"

  -- Adaptive armors (only order changing)
  data.raw.item["se-adaptive-armour-equipment-1"].subgroup = "character-equipment"
  data.raw.item["se-adaptive-armour-equipment-1"].order = "s[energy-shield]-a1[adaptive-armour]"
  data.raw.item["se-adaptive-armour-equipment-2"].subgroup = "character-equipment"
  data.raw.item["se-adaptive-armour-equipment-2"].order = "s[energy-shield]-a2[adaptive-armour]"
  data.raw.item["se-adaptive-armour-equipment-3"].subgroup = "character-equipment"
  data.raw.item["se-adaptive-armour-equipment-3"].order = "s[energy-shield]-a3[adaptive-armour]"
  data.raw.item["se-adaptive-armour-equipment-4"].subgroup = "character-equipment"
  data.raw.item["se-adaptive-armour-equipment-4"].order = "s[energy-shield]-a4[adaptive-armour]"
  data.raw.item["se-adaptive-armour-equipment-5"].subgroup = "character-equipment"
  data.raw.item["se-adaptive-armour-equipment-5"].order = "s[energy-shield]-a5[adaptive-armour]"

  -- -- Rebalance Portable RTGs stats compared with K2 balancing
  -- Portable RTG
  data.raw.item["se-rtg-equipment"].subgroup = "equipment"
  data.raw.item["se-rtg-equipment"].order = "a2[energy-source]-a41[portable-nuclear-core]"
  data.raw["generator-equipment"]["se-rtg-equipment"].power = "800kW"
  table.insert(data.raw["generator-equipment"]["se-rtg-equipment"].categories, "universal-equipment")

  -- Portable RTG 2
  data.raw.item["se-rtg-equipment-2"].subgroup = "equipment"
  data.raw.item["se-rtg-equipment-2"].order = "a2[energy-source]-a42[portable-nuclear-core]"
  data.raw["generator-equipment"]["se-rtg-equipment-2"].power = "1200kW"
  table.insert(data.raw["generator-equipment"]["se-rtg-equipment-2"].categories, "universal-equipment")
end
