local util = require("scripts.util")

--- @class ShelterData
--- @field container LuaEntity
--- @field electric LuaEntity
--- @field light LuaEntity
--- @field former_spawn_point MapPosition

--- @param force LuaForce
local function init_force(force)
  if not storage.shelter then
    return
  end
  storage.shelter.forces[force.index] = {}
end

local function spawn_flying_texts()
  for unit_number, entity in pairs(storage.shelter.inactive) do
    if entity.valid then
      util.entity_flying_text(entity, { "message.kr-shelter-is-inactive" }, { r = 1 })
    else
      storage.shelter.inactive[unit_number] = nil
    end
  end
end

--- @param e EntityBuiltEvent
local function on_entity_built(e)
  local entity = e.entity or e.destination
  if not entity.valid then
    return
  end
  if entity.name ~= "kr-shelter-container" and entity.name ~= "kr-shelter-plus-container" then
    return
  end
  --- @cast entity LuaEntity

  local force = entity.force
  local surface = entity.surface
  local force_shelters = storage.shelter.forces[force.index]

  if force_shelters[surface.index] then
    local name = entity.name:gsub("kr%-", "kr-inactive-"):gsub("%-container", "")
    local position = entity.position
    local force = entity.force
    local player = entity.last_user
    local surface = entity.surface
    entity.destroy()

    local new_entity = surface.create_entity({
      name = name,
      position = position,
      force = force,
      player = player,
      create_build_effect_smoke = false,
      raise_built = true,
    })
    if new_entity and new_entity.valid then
      storage.shelter.inactive[new_entity.unit_number] = new_entity
    end
    return
  end

  -- Build entities
  local _, _, base_name = string.find(entity.name, "^(.*)%-container")
  --- @type ShelterData
  local shelter_data = { container = entity }

  for key, suffix in pairs({ electric = "", light = "-light" }) do
    local name = base_name .. suffix
    shelter_data[key] = surface.create_entity({
      name = name,
      position = entity.position,
      force = force,
      player = entity.last_user,
      create_build_effect_smoke = false,
      raise_built = true,
    })
  end

  -- Set spawn point
  shelter_data.former_spawn_point = force.get_spawn_position(surface)
  force.set_spawn_position({ x = entity.position.x, y = entity.position.y + 3.5 }, surface)

  force_shelters[surface.index] = shelter_data
end

--- @param e EntityDestroyedEvent
local function on_entity_destroyed(e)
  local entity = e.entity
  if not entity or not entity.valid then
    return
  end
  if entity.name ~= "kr-shelter-container" and entity.name ~= "kr-shelter-plus-container" then
    return
  end

  local inactive = storage.shelter.inactive[entity.unit_number]
  if inactive then
    storage.shelter.inactive[entity.unit_number] = nil
  else
    local force = entity.force

    local force_shelters = storage.shelter.forces[force.index]
    if not force_shelters then
      return
    end

    local surface_index = entity.surface.index
    local shelter_data = force_shelters[surface_index]
    if not shelter_data then
      return
    end

    -- Destroy entities
    shelter_data.electric.destroy()
    shelter_data.light.destroy()
    force_shelters[surface_index] = nil

    -- Restore former spawn point
    force.set_spawn_position(shelter_data.former_spawn_point, surface_index)
  end
end

--- @param e EventData.on_force_created
local function on_force_created(e)
  if e.force.valid then
    init_force(e.force)
  end
end

local shelter = {}

function shelter.on_init()
  storage.shelter = {
    --- @type table<uint, table<uint, ShelterData>>
    forces = {},
    --- @type table<uint, LuaEntity>
    inactive = {},
  }

  for _, force in pairs(game.forces) do
    init_force(force)
  end
end

shelter.events = {
  [defines.events.on_built_entity] = on_entity_built,
  [defines.events.on_entity_cloned] = on_entity_built,
  [defines.events.on_entity_died] = on_entity_destroyed,
  [defines.events.on_force_created] = on_force_created,
  [defines.events.on_player_mined_entity] = on_entity_destroyed,
  [defines.events.on_robot_built_entity] = on_entity_built,
  [defines.events.on_robot_mined_entity] = on_entity_destroyed,
  [defines.events.script_raised_built] = on_entity_built,
  [defines.events.script_raised_destroy] = on_entity_destroyed,
  [defines.events.script_raised_revive] = on_entity_built,
  [defines.events.on_space_platform_built_entity] = on_entity_built,
  [defines.events.on_space_platform_mined_entity] = on_entity_destroyed,
}

shelter.on_nth_tick = {
  [180] = spawn_flying_texts,
}

return shelter
