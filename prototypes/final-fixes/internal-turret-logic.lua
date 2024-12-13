local flib_table = require("__flib__.table")

-- Make characters be targeted by the teleporter turrets
for _, character in pairs(data.raw["character"]) do
  local mask = character.trigger_target_mask or { "common", "ground-unit" }
  character.trigger_target_mask = mask

  -- FIXME: Use a proper name
  table.insert(mask, "character")
end

-- Make anything with an equipment grid of the correct category be targetable by tesla coils
local types_have_grid = {
  "artillery-wagon",
  "car",
  "cargo-wagon",
  "character",
  "fluid-wagon",
  "locomotive",
  "spider-vehicle",
}
local grids = data.raw["equipment-grid"]
for _, type in pairs(types_have_grid) do
  for _, prototype in pairs(data.raw[type]) do
    if type ~= "character" then
      local grid = grids[prototype.equipment_grid]
      if not grid or not flib_table.find(grid.equipment_categories, "universal-equipment") then
        goto continue
      end
    end

    local mask = prototype.trigger_target_mask or { "common", "ground-unit" }
    prototype.trigger_target_mask = mask
    -- The tesla coil turrets will only target entities with this mask
    table.insert(mask, "kr-tesla-coil-trigger")
    -- If the entity is not considered a "military target", then the tesla coil turrets will not wake up when the entity
    -- gets within range
    prototype.is_military_target = true

    ::continue::
  end
end
