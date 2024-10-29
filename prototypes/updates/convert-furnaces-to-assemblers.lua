local data_util = require("data-util")
local flib_table = require("__flib__.table")

for _, furnace in pairs(data.raw["furnace"]) do
  if flib_table.find(furnace.crafting_categories, "smelting") then
    data_util.furnace_to_assembler(furnace.name)
  end
end
