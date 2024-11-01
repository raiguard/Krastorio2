local data_util = require("data-util")
local flib_prototypes = require("__flib__.prototypes")
local flib_table = require("__flib__.table")

--- @param item_name data.ItemID
--- @param icon data.FileName
--- @param icon_size data.SpriteSizeType
--- @param sprite_size {[1]: data.SpriteSizeType, [2]: data.SpriteSizeType}
--- @param tier integer?
local function update_equipment_graphics(item_name, icon, icon_size, sprite_size, tier)
  local item = flib_prototypes.get("item", item_name)
  if tier then
    item.icon = nil
    item.icon_size = nil
    item.icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/" .. icon .. ".png", icon_size = icon_size },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-" .. tier .. ".png", icon_size = 64 },
    }
  else
    item.icon = "__Krastorio2Assets__/icons/equipment/" .. icon .. ".png"
    item.icon_size = icon_size
  end
  local equipment_id = item.place_as_equipment_result
  if not equipment_id then
    error("Item " .. item_name .. " has no related equipment.")
  end
  local equipment = flib_prototypes.get("equipment", equipment_id)
  equipment.sprite = {
    filename = "__Krastorio2Assets__/equipment/" .. icon .. ".png",
    size = sprite_size,
    scale = 0.5,
    priority = "medium",
  }
end

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

update_equipment_graphics("battery-equipment", "battery-mk1-equipment", 64, { 32, 64 }, 1)
update_equipment_graphics("battery-mk2-equipment", "battery-mk2-equipment", 64, { 32, 64 }, 2)
update_equipment_graphics("energy-shield-equipment", "energy-shield-mk1-equipment", 64, { 64, 64 }, 1)
update_equipment_graphics("energy-shield-mk2-equipment", "energy-shield-mk2-equipment", 64, { 64, 64 }, 2)
update_equipment_graphics("exoskeleton-equipment", "exoskeleton-equipment", 64, { 64, 128 }, 1)
update_equipment_graphics("fission-reactor-equipment", "fission-reactor-equipment", 64, { 128, 128 }, 2)
update_equipment_graphics("night-vision-equipment", "night-vision-equipment", 64, { 64, 64 }, 1)
update_equipment_graphics("personal-laser-defense-equipment", "personal-laser-defense-mk1-equipment", 64, { 64, 64 }, 1)
update_equipment_graphics("personal-roboport-equipment", "personal-roboport-equipment", 64, { 64, 64 }, 1)
update_equipment_graphics("personal-roboport-mk2-equipment", "personal-roboport-mk2-equipment", 64, { 64, 64 }, 2)
update_equipment_graphics("solar-panel-equipment", "solar-panel-equipment", 64, { 32, 32 }, 1)
