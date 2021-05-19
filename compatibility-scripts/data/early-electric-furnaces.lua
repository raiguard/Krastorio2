-- -- Fix created by ChipWolf, for compatibility with early-electric-furnaces mod
if mods["Early-3x3-Electric-Furnaces"] then
  local function transferFromFurnacesToAssemblers(furnace_name)
    if data.raw.furnace[furnace_name] then
      local furnace = krastorio_utils.tables.fullCopy(data.raw.furnace[furnace_name])
      furnace.type = "assembling-machine"
      furnace.source_inventory_size = 2
      furnace.energy_source.emissions_per_minute = 2
      furnace.energy_usage = "0.2MW"
      data.raw.furnace[furnace_name] = nil
      data:extend({ furnace })
    end
  end

  local furnace_names = {
    "primitive-electric-furnace",
    "basic-electric-furnace",
  }

  for _, furnace_name in pairs(furnace_names) do
    transferFromFurnacesToAssemblers(furnace_name)
  end
end
