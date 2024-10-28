local flib_position = require("__flib__.position")
local flib_table = require("__flib__.table")

local data_util = {}

--- Adds the given recipe as an unlock of the given technology.
--- @param technology_name data.TechnologyID
--- @param recipe_name data.RecipeID
function data_util.add_recipe_unlock(technology_name, recipe_name)
  local technology = data.raw.technology[technology_name]
  if not technology then
    error("Technology " .. technology_name .. " does not exist.")
  end
  for _, effect in pairs(technology.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
      error("Technology " .. technology_name .. " already unlocks recipe " .. recipe_name .. ".")
    end
  end
  table.insert(technology.effects, { type = "unlock-recipe", recipe = recipe_name })
end

--- Adds the given prerequisite to the technology.
--- @param technology_id data.TechnologyID
--- @param prerequisite_id data.TechnologyID
function data_util.add_prerequisite(technology_id, prerequisite_id)
  local technology = data.raw.technology[technology_id]
  if not technology then
    error("Technology " .. technology_id .. " does not exist.")
  end
  local prerequisite = data.raw.technology[prerequisite_id]
  if not prerequisite then
    error("Technology prerequisite " .. technology_id .. " does not exist.")
  end
  if not technology.prerequisites then
    technology.prerequisites = { prerequisite_id }
    return
  end
  if flib_table.find(technology.prerequisites, prerequisite_id) then
    error("Technology " .. technology_id .. " already has prerequisite " .. prerequisite_id)
  end
  table.insert(technology.prerequisites, prerequisite_id)
end

--- Removes the given prerequisite from the technology.
--- @param technology_id data.TechnologyID
--- @param prerequisite_id data.TechnologyID
function data_util.remove_prerequisite(technology_id, prerequisite_id)
  local technology = data.raw.technology[technology_id]
  if not technology then
    error("Technology " .. technology_id .. " does not exist.")
  end
  local prerequisite = data.raw.technology[prerequisite_id]
  if not prerequisite then
    error("Technology prerequisite " .. technology_id .. " does not exist.")
  end
  local i = flib_table.find(technology.prerequisites or {}, prerequisite_id)
  if not i then
    error("Technology " .. technology_id .. " does not have prerequisite " .. prerequisite_id)
  end
  table.remove(technology.prerequisites, i)
end

--- Converts a furnace prototype into an assembling machine prototype.
--- @param furnace_name data.EntityID
--- @return data.AssemblingMachinePrototype
function data_util.furnace_to_assembler(furnace_name)
  local furnace = data.raw.furnace[furnace_name]
  if not furnace then
    error("Furnace " .. furnace_name .. " does not exist.")
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

--- Returns a copy of the given prototype's icons in the standard format.
--- @param prototype k2.PrototypeWithIcons
--- @return data.IconData[]
function data_util.get_icons(prototype)
  local icons = prototype.icons -- LuaLS isn't inferring the dropped optional unless we assign it to a local first.
  if icons then
    return table.deepcopy(icons)
  end
  return { { icon = prototype.icon, icon_size = prototype.icon_size } }
end

--- Fields are analagous to `data.IconData`.
--- @class k2.IconTransformOptions
--- @field shift Vector?
--- @field scale double?

--- Applies the given transformations to each layer in the icons array in-place and returns the array.
--- @param icons data.IconData[]
--- @param transforms k2.IconTransformOptions
--- @return data.IconData[]
function data_util.transform_icons(icons, transforms)
  for _, icon in pairs(icons) do
    if transforms.shift then
      icon.shift = flib_position.add((icon.shift or { 0, 0 }), transforms.shift)
    end
    if transforms.scale then
      icon.scale = (icon.scale or 1) * transforms.scale
    end
  end
  return icons
end

return data_util
