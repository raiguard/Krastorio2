local data_util = {}

--- Adds the given recipe as an unlock of the given technology.
--- @param technology_name string
--- @param recipe_name string
function data_util.add_recipe_unlock(technology_name, recipe_name)
  local technology = data.raw.technology[technology_name]
  if not technology then
    error("data_util.add_recipe_unlock(): Technology " .. technology_name .. " does not exist.")
  end
  if technology.research_trigger then
    error("data_util.add_recipe_unlock(): Technology " .. technology_name .. " is a trigger technology.")
  end
  table.insert(technology.effects, { type = "unlock-recipe", recipe = recipe_name })
end

--- Converts a furnace prototype into an assembling machine prototype.
--- @param furnace_name string
--- @return data.AssemblingMachinePrototype
function data_util.furnace_to_assembler(furnace_name)
  local furnace = data.raw.furnace[furnace_name]
  if not furnace then
    error("data_util.furnace_to_assembler(): Furnace " .. furnace_name .. " does not exist.")
  end

  local assembler = table.deepcopy(furnace) --[[@as data.AssemblingMachinePrototype]]
  assembler.type = "assembling-machine"
  assembler.source_inventory_size = nil --- @diagnostic disable-line
  assembler.energy_source.emissions_per_minute = { pollution = 2 }
  assembler.energy_usage = "0.2MW"
  data.raw.furnace[furnace_name] = nil
  data:extend({ assembler })
  return assembler
end

return data_util
