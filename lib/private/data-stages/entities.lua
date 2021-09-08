krastorio.entities = {}
local collision_mask_util = require("__core__/lualib/collision-mask-util")

-- -- -- TO DO

-- -- -- GETTING(READ) FUNCTIONS

--@ category_name
--@ entity_name
function krastorio.entities.getEntity(category_name, entity_name)
  local no_err, entity = pcall(function()
    return data.raw[category_name][entity_name]
  end)
  if no_err and entity ~= nil and next(entity) ~= nil then
    return entity
  end
  return nil
end

--@ category_name
--@ entity_name
function krastorio.entities.exist(category_name, entity_name)
  local entity = krastorio.entities.getEntity(category_name, entity_name)
  return entity and type(entity) == "table"
end

-- -- -- SETTING(WRITE) FUNCTIONS

--@ category_name
--@ entity_name
--@ to_remove_mask_name
function krastorio.entities.removeCollisionMaskOnEntity(category_name, entity_name, to_remove_mask_name)
  local entity = krastorio.entities.getEntity(category_name, entity_name)
  if entity then
    local no_err, collision_mask = pcall(function()
      return entity.collision_mask
    end)
    if no_err and collision_mask ~= nil then
      for i, mask_name in pairs(collision_mask) do
        if mask_name == to_remove_mask_name then
          table.remove(collision_mask, i)
          return true
        end
      end
    end
  end
  return false
end

--@ category_name
--@ entity_name
--@ to_add_mask_name
function krastorio.entities.addCollisionMaskOnEntity(category_name, entity_name, to_add_mask_name)
  local entity = krastorio.entities.getEntity(category_name, entity_name)
  if entity and to_add_mask_name ~= nil then
    local collision_mask = collision_mask_util.get_mask(entity)
      or { "item-layer", "object-layer", "player-layer", "water-tile" }
    local miss = true
    for _, mask_name in pairs(collision_mask) do
      if mask_name == to_add_mask_name then
        miss = false
        break
      end
    end
    if miss then
      table.insert(collision_mask, to_add_mask_name)
      entity.collision_mask = collision_mask
    end
    return true
  end
  return false
end

--@ category_name
--@ entity_name
--@ to_add_crafting_category
function krastorio.entities.addCraftingCategory(category_name, entity_name, to_add_crafting_category)
  local entity = krastorio.entities.getEntity(category_name, entity_name)
  if
    entity
    and (entity.type == "assembling-machine" or entity.type == "furnace" or entity.type == "rocket-silo")
    and data.raw["recipe-category"][to_add_crafting_category]
  then
    if entity.crafting_categories then
      table.insert(entity.crafting_categories, to_add_crafting_category)
    else
      entity.crafting_categories = { to_add_crafting_category }
    end
    return true
  end
  return false
end

--@ category_name
--@ entity_name
--@ to_remove_crafting_category
function krastorio.entities.removeCraftingCategory(category_name, entity_name, to_remove_crafting_category)
  local entity = krastorio.entities.getEntity(category_name, entity_name)
  if
    entity
    and (entity.type == "assembling-machine" or entity.type == "furnace" or entity.type == "rocket-silo")
    and entity.crafting_categories
  then
    for i, crafting_category in pairs(entity.crafting_categories) do
      if crafting_category == to_remove_crafting_category then
        table.remove(entity.crafting_categories, i)
        return true
      end
    end
  end
  return false
end

function krastorio.entities.getLabInputs(lab_name)
  if data.raw["lab"][lab_name] then
    if data.raw["lab"][lab_name].inputs == nil then
      data.raw["lab"][lab_name].inputs = {}
    end

    return data.raw["lab"][lab_name].inputs
  end
  return nil
end

function krastorio.entities.addLabInput(lab_name, input_name)
  local inputs = krastorio.entities.getLabInputs(lab_name)
  if inputs then
    local finded = false
    for _, input in pairs(inputs) do
      if input_name == input then
        finded = true
        break
      end
    end
    if not finded then
      table.insert(inputs, input_name)
      return true
    end
  end
  return false
end

function krastorio.entities.removeLabInput(lab_name, input_name)
  local inputs = krastorio.entities.getLabInputs(lab_name)
  if inputs then
    for key, input in pairs(inputs) do
      if input_name == input then
        inputs[key] = nil
        return true
      end
    end
  end
  return false
end

-- This should be used in control,
-- check if the entities is valid for be used.
-- @entity, entity
function krastorio.entities.isValid(entity)
  return entity and entity.valid ~= nil
end

-- This should be used in control,
-- check if entity has fluidbox,
-- check that if entity is not null too
-- @entity, entity to check fluidbox
function krastorio.entities.entityHasFluidbox(entity)
  if entity and type(entity) == "table" then
    local fluidbox = entity.fluidbox
    return fluidbox and #fluidbox > 0
  end
end

function krastorio.entities.removeFuelCategory(category_name, entity_name, fuel_category)
  local entity = krastorio.entities.getEntity(category_name, entity_name)

  if entity and type(entity) == "table" then
    if entity.energy_source and entity.energy_source.type == "burner" then
      if entity.energy_source.fuel_category and entity.energy_source.fuel_category == fuel_category then
        entity.energy_source.fuel_category = nil
      else
        for i, f_c in pairs(entity.energy_source.fuel_categories) do
          if f_c == fuel_category then
            table.remove(entity.energy_source.fuel_categories, i)
            break
          end
        end
      end
    end
  end
end

function krastorio.entities.addFuelCategory(category_name, entity_name, fuel_category)
  local entity = krastorio.entities.getEntity(category_name, entity_name)

  if entity and type(entity) == "table" then
    if entity.energy_source and entity.energy_source.type == "burner" then
      if entity.energy_source.fuel_category then
        local fuel_categories = { entity.energy_source.fuel_category, fuel_category }
        entity.energy_source.fuel_category = nil
        entity.energy_source.fuel_categories = fuel_categories
      else
        table.insert(entity.energy_source.fuel_categories, fuel_category)
      end
    end
  end
end

function krastorio.entities.overrideMiningResult(category_name, entity_name, mining_result)
  local entity = krastorio.entities.getEntity(category_name, entity_name)

  if entity and type(entity) == "table" then
    entity.minable = mining_result
  end
end
