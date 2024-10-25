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

return data_util
