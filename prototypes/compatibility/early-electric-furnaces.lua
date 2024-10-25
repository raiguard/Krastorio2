-- -- Fix created by ChipWolf, for compatibility with early-electric-furnaces mod
if not mods["Early-3x3-Electric-Furnaces"] then
  return
end

local data_util = require("data-util")

data_util.furnace_to_assembler("primitive-electric-furnace")
data_util.furnace_to_assembler("basic-electric-furnace")
