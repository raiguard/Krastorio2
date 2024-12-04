local flib_position = require("__flib__.position")
local flib_table = require("__flib__.table")

local data_util = {}

--- Overwrites or adds ammo effects for the given technology.
--- @param tech data.TechnologyPrototype
--- @param effects data.Modifier[]
function data_util.update_ammo_effects(tech, effects)
  if not tech.effects then
    tech.effects = {}
  end

  for _, updated_effect in pairs(effects) do
    local exists = false
    for _, effect in pairs(tech.effects) do
      if
        effect.type == updated_effect.type
        and (
          (effect.ammo_category ~= nil and effect.ammo_category == updated_effect.ammo_category)
          or (effect.turret_id ~= nil and effect.turret_id == updated_effect.turret_id)
        )
      then
        effect.modifier = updated_effect.modifier
        exists = true
        break
      end
    end
    if not exists then
      table.insert(
        tech.effects,
        { type = updated_effect.type, ammo_category = updated_effect.ammo_category, modifier = updated_effect.modifier }
      )
    end
  end
end

--- @param technology_name data.TechnologyID
--- @param new_effect data.Modifier
function data_util.add_effect(technology_name, new_effect)
  local technology = data.raw.technology[technology_name]
  if not technology then
    error("Technology " .. technology_name .. " does not exist.")
  end
  local effects = technology.effects
  if not effects or not next(effects) then
    technology.effects = { new_effect }
    return
  end

  local found = false
  for _, effect in pairs(effects) do
    if effect.type == new_effect.type then
      -- TODO: Update for new effect types.
      if effect.type == "gun-speed" then
        if effect.ammo_category == new_effect.ammo_category and effect.modifier == new_effect.modifier then
          found = true
          break
        end
      elseif effect.type == "ammo-damage" then
        if effect.ammo_category == new_effect.ammo_category and effect.modifier == new_effect.modifier then
          found = true
          break
        end
      elseif effect.type == "give-item" then
        if effect.item == new_effect.item and effect.count == new_effect.count then
          found = true
          break
        end
      elseif effect.type == "turret-attack" then
        if effect.turret_id == new_effect.turret_id and effect.modifier == new_effect.modifier then
          found = true
          break
        end
      elseif effect.type == "unlock-recipe" then
        if effect.recipe == new_effect.recipe then
          found = true
          break
        end
      elseif effect.type == "nothing" then
        if effect.effect_description == new_effect.effect_description then
          found = true
          break
        end
      else
        if effect.modifier == new_effect.modifier then
          found = true
          break
        end
      end
    end
  end

  if not found then
    table.insert(effects, new_effect)
  end
end

-- Remove the technology entirely
function data_util.remove_technology(technology_name)
  data.raw.technology[technology_name] = nil
end

-- Remove research trigger from technology
function data_util.remove_research_trigger(technology_name)
  local technology = data.raw.technology[technology_name]
  if not technology then
    error("Technology " .. technology_name .. " does not exist.")
  end
  technology.research_trigger = nil
end

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

--- Adds research unit to the technology.
--- @param technology_id data.TechnologyID
--- @param count integer
--- @param time number
function data_util.add_research_unit(technology_id, count, time)
  local technology = data.raw.technology[technology_id]
  if not technology then
    error("Technology " .. technology_id .. " does not exist.")
  end

  if technology.unit then
    error("Technology " .. technology_id .. "already has a research unit")
  end

  technology.unit = {
    count = count,
    time = time,
    ingredients = {}
  }
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

--- Converts the given prototype's icons to the standard format and returns a reference to them.
--- The game will throw an error if you provide an empty icons array, so if using the function, care must be taken to
--- ensure that at least one icon layer exists at tne end of loading.
--- @param prototype k2.PrototypeWithIcons
--- @return data.IconData[]
function data_util.standardize_icons(prototype)
  if not prototype.icons then
    prototype.icons = {}
    if prototype.icon then
      table.insert(prototype.icons, { icon = prototype.icon, icon_size = prototype.icon_size })
      prototype.icon = nil
      prototype.icon_size = nil
    end
  end
  return prototype.icons
end

--- Overrides the prototype's icon.
--- @param prototype k2.PrototypeWithIcons
--- @param icon data.FileName
--- @param icon_size double?
function data_util.set_icon(prototype, icon, icon_size)
  assert(prototype, "Provided prototype was nil.")
  if prototype.icons then
    prototype.icons = nil
  end
  prototype.icon = icon
  prototype.icon_size = icon_size
end

--- Overrides the prototype's icons array.
--- @param prototype k2.PrototypeWithIcons
--- @param icons data.IconData[]
function data_util.set_icons(prototype, icons)
  assert(prototype, "Provided prototype was nil.")
  prototype.icons = icons
  prototype.icon = nil
  prototype.icon_size = nil
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

--- Adds or replaces the recipe's ingredient matching the given name.
--- @param recipe_name data.RecipeID
--- @param old_ingredient_name data.FluidID|data.ItemID
--- @param new_ingredient data.IngredientPrototype
function data_util.add_or_replace_ingredient(recipe_name, old_ingredient_name, new_ingredient)
  local recipe = data.raw.recipe[recipe_name]
  if not recipe then
    error("Recipe " .. recipe_name .. " does not exist.")
  end
  if not recipe.ingredients then
    recipe.ingredients = { new_ingredient }
    return
  end
  for i, ingredient in pairs(recipe.ingredients) do
    if ingredient.name == old_ingredient_name then
      recipe.ingredients[i] = new_ingredient
      return
    end
  end
  table.insert(recipe.ingredients, new_ingredient)
end

--- Converts the given ingredient to the new ingredient, carrying over other properties.
--- @param recipe_name data.RecipeID
--- @param old_ingredient_name data.FluidID|data.ItemID
--- @param new_ingredient_name data.FluidID|data.ItemID
function data_util.convert_ingredient(recipe_name, old_ingredient_name, new_ingredient_name)
  local recipe = data.raw.recipe[recipe_name]
  if not recipe then
    error("Recipe " .. recipe_name .. " does not exist.")
  end
  if not recipe.ingredients then
    error("Recipe " .. recipe_name .. " has no ingredients.")
    return
  end
  for i, ingredient in pairs(recipe.ingredients) do
    if ingredient.name == old_ingredient_name then
      ingredient.name = new_ingredient_name
      break
    end
  end
end


--- Remove the given ingredient from the recipe.
--- @param recipe_name data.RecipeID
--- @param ingredient_name data.FluidID|data.ItemID
function data_util.remove_ingredient(recipe_name, ingredient_name)
  local recipe = data.raw.recipe[recipe_name]
  if not recipe then
    error("Recipe " .. recipe_name .. " does not exist.")
  end
  if not recipe.ingredients then
    error("Recipe " .. recipe_name .. " has no ingredients.")
    return
  end
  for i, ingredient in pairs(recipe.ingredients) do
    if ingredient.name == ingredient_name then
      table.remove(recipe.ingredients, i)
      return
    end
  end
  error("Recipe " .. recipe_name .. " does not have ingredient " .. ingredient_name .. ".")
end

--- Adds or replaces the recipe's product matching the given name.
--- @param recipe_name data.RecipeID
--- @param old_product_name data.FluidID|data.ItemID
--- @param new_product data.IngredientPrototype
function data_util.add_or_replace_product(recipe_name, old_product_name, new_product)
  local recipe = data.raw.recipe[recipe_name]
  if not recipe then
    error("Recipe " .. recipe_name .. " does not exist.")
  end
  if not recipe.results then
    recipe.results = { new_product }
    return
  end
  for i, product in pairs(recipe.results) do
    if product.name == old_product_name then
      recipe.results[i] = new_product
      return
    end
  end
  table.insert(recipe.results, new_product)
end

--- @param lab_name data.EntityID
--- @param input_name data.ItemID
function data_util.remove_lab_input(lab_name, input_name)
  local lab = data.raw.lab[lab_name]
  assert(lab, "Lab " .. lab_name .. " does not exist.")
  local inputs = lab.inputs
  assert(inputs, "Lab inputs are nil.")
  for i = 1, #inputs do
    if inputs[i] == input_name then
      table.remove(inputs, i)
      return
    end
  end
  error("Lab " .. lab_name .. " does not contain input " .. input_name .. ".")
end

return data_util
