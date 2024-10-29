local data_util = require("data-util")
local flib_table = require("__flib__.table")

table.insert(data.raw["equipment-grid"]["large-equipment-grid"].equipment_categories, "robot-interaction-equipment")
table.insert(data.raw["equipment-grid"]["large-equipment-grid"].equipment_categories, "universal-equipment")
table.insert(data.raw["equipment-grid"]["medium-equipment-grid"].equipment_categories, "robot-interaction-equipment")
table.insert(data.raw["equipment-grid"]["medium-equipment-grid"].equipment_categories, "universal-equipment")
table.insert(data.raw["equipment-grid"]["small-equipment-grid"].equipment_categories, "robot-interaction-equipment")
table.insert(data.raw["equipment-grid"]["small-equipment-grid"].equipment_categories, "universal-equipment")

data.raw["equipment-grid"]["large-equipment-grid"].height = 8
data.raw["equipment-grid"]["large-equipment-grid"].width = 8
data.raw["equipment-grid"]["medium-equipment-grid"].height = 6
data.raw["equipment-grid"]["medium-equipment-grid"].width = 6
data.raw["equipment-grid"]["small-equipment-grid"].height = 4
data.raw["equipment-grid"]["small-equipment-grid"].width = 4

table.insert(
  flib_table.get_or_insert(data.raw.armor["modular-armor"], "resistances", {}),
  { type = "radioactive", decrease = 2, percent = 15 }
)
table.insert(
  flib_table.get_or_insert(data.raw.armor["power-armor"], "resistances", {}),
  { type = "radioactive", decrease = 3, percent = 30 }
)
table.insert(
  flib_table.get_or_insert(data.raw.armor["power-armor-mk2"], "resistances", {}),
  { type = "radioactive", decrease = 4, percent = 45 }
)
