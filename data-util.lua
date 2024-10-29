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

--- Removes the given recipe from the unlocks of the given technology.
--- @param technology_name data.TechnologyID
--- @param recipe_name data.RecipeID
function data_util.remove_recipe_unlock(technology_name, recipe_name)
  local technology = data.raw.technology[technology_name]
  if not technology then
    error("Technology " .. technology_name .. " does not exist.")
  end
  for i, effect in pairs(technology.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
      table.remove(technology.effects, i)
      return
    end
  end
  error("Technology " .. technology_name .. " does not unlock recipe " .. recipe_name .. ".")
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

--- Converts one research unit ingredient to another, updating science pack prerequisites if needed.
--- @param technology_id data.TechnologyID
--- @param from_id data.ItemID
--- @param to_id data.ItemID
function data_util.convert_research_unit_ingredient(technology_id, from_id, to_id)
  local technology = data.raw.technology[technology_id]
  if not technology then
    error("Technology " .. technology_id .. " does not exist.")
  end
  if not technology.unit or not technology.unit.ingredients then
    error("Technology " .. technology_id .. " has no research unit ingredients.")
  end
  local converted = false
  for _, ingredient in pairs(technology.unit.ingredients) do
    if ingredient[1] == from_id then
      converted = true
      ingredient[1] = to_id
    elseif ingredient[1] == to_id then
      error("Technology " .. technology_id .. " already has research unit ingredient " .. to_id)
    end
  end
  if not converted then
    error("Technology " .. technology_id .. " does not have research unit ingredient " .. from_id)
  end
  -- TODO: Hardcoding the science pack name like this feels bad, but it's what the old code did...
  local from_index = flib_table.find(technology.prerequisites, from_id)
  if from_index then
    table.remove(technology.prerequisites, from_index)
  end
  local new_tech = data.raw.technology[to_id]
  if not new_tech then
    log("Aborting due to lack of " .. to_id .. " tech")
    return
  end
  if not technology.prerequisites then
    technology.prerequisites = { to_id }
    return
  end
  if not flib_table.find(technology.prerequisites, to_id) then
    log("Adding prerequisite " .. to_id)
    table.insert(technology.prerequisites, to_id)
  end
end

--- Adds the given research ingredient to the technology.
--- @param technology_id data.TechnologyID
--- @param ingredient_id data.ItemID
--- @param ingredient_count uint? Defaults to 1.
function data_util.add_research_unit_ingredient(technology_id, ingredient_id, ingredient_count)
  ingredient_count = ingredient_count or 1
  local technology = data.raw.technology[technology_id]
  if not technology then
    error("Technology " .. technology_id .. " does not exist.")
  end
  -- TODO: Make this a base game error.
  if technology.research_trigger then
    error("Technology " .. technology_id .. " has a research trigger, so cannot have ingredients.")
  end
  local unit = technology.unit
  if not unit then
    error("Technology " .. technology_id .. " has no research unit.")
  end
  for _, ingredient in pairs(technology.unit.ingredients) do
    if ingredient[1] == ingredient_id then
      error("Technology " .. technology_id .. " already has research unit ingredient" .. ingredient_id)
    end
  end
  table.insert(technology.unit.ingredients, { ingredient_id, ingredient_count })
  -- TODO: Automatically add science pack prereq?
end

--- Removes the given research ingredient from the technology.
--- @param technology_id data.TechnologyID
--- @param ingredient_id data.ItemID
function data_util.remove_research_unit_ingredient(technology_id, ingredient_id)
  local technology = data.raw.technology[technology_id]
  if not technology then
    error("Technology " .. technology_id .. " does not exist.")
  end
  if not technology.unit then
    error("Technology " .. technology_id .. " has no research units.")
  end
  for i, ingredient in pairs(technology.unit.ingredients) do
    if ingredient[1] == ingredient_id then
      table.remove(technology.unit.ingredients, i)
      return
    end
  end
  error("Technology " .. technology_id .. " does not have research unit ingredient " .. ingredient_id .. ".")
end

--- Returns a technology that unlocks the given recipe. The technology returned will be the one that was added earliest.
--- @param recipe_id data.RecipeID
--- @return data.TechnologyPrototype?
function data_util.get_technology_for_recipe(recipe_id)
  for _, technology in pairs(data.raw.technology) do
    for _, effect in pairs(technology.effects) do
      if effect.type == "unlock-recipe" and effect.recipe == recipe_id then
        return technology
      end
    end
  end
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
