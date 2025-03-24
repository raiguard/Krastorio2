local flib_table = require("__flib__.table")

--- Equipment category name -> entities
--- @type table<string, string[]>
local category_to_owners = {}
for entity_name, entity in pairs(prototypes.entity) do
  local grid = entity.grid_prototype
  if grid then
    for _, category_name in pairs(grid.equipment_categories) do
      table.insert(flib_table.get_or_insert(category_to_owners, category_name, {}), "entity/" .. entity_name)
    end
  end
end
for item_name, item in pairs(prototypes.item) do
  local grid = item.equipment_grid
  if grid then
    for _, category_name in pairs(grid.equipment_categories) do
      table.insert(flib_table.get_or_insert(category_to_owners, category_name, {}), "item/" .. item_name)
    end
  end
end

--- @type table<string, string[]>
local equipment_to_owners = {}
for equipment_name, equipment in pairs(prototypes.equipment) do
  local owners = {}
  for _, category_name in pairs(equipment.equipment_categories) do
    local category_owners = category_to_owners[category_name]
    if category_owners then
      for _, owner in pairs(category_owners) do
        table.insert(owners, owner)
      end
    else
      log("NO owners for " .. category_name)
    end
  end
  equipment_to_owners[equipment_name] = owners
end

for _, owners in pairs(equipment_to_owners) do
  table.sort(owners)
end

log(serpent.block(equipment_to_owners))
