local flib_direction = require("__flib__.direction")
local flib_position = require("__flib__.position")

--- @type table<defines.direction, Vector>
local offsets = {
  [defines.direction.north] = { 0, -1 },
  [defines.direction.east] = { 1, 0 },
  [defines.direction.south] = { 0, 1 },
  [defines.direction.west] = { -1, 0 },
}

local belt_types = {
  "linked-belt",
  "loader",
  "loader-1x1",
  "splitter",
  "transport-belt",
  "underground-belt",
}

local container_types = {
  "assembling-machine",
  "beacon",
  "boiler",
  "burner-generator",
  "container",
  "curved-rail",
  "furnace",
  "infinity-container",
  "lab",
  "logistic-container",
  "mining-drill",
  "rail",
  "reactor",
  "rocket-silo",
  "straight-rail",
}

--- @param entity LuaEntity
local function flip_loader(entity)
  entity.direction = flib_direction.opposite(entity.direction)
  entity.loader_type = entity.loader_type == "output" and "input" or "output"
end

--- Find entities and entity ghosts of the corresponding types.
--- @param surface LuaSurface
--- @param position MapPosition
--- @param force ForceIdentification
--- @param types string[]
--- @return LuaEntity[]
local function find_entities(surface, position, force, types)
  local entities = surface.find_entities_filtered({
    force = force,
    position = position,
    type = types,
  })
  local ghosts = surface.find_entities_filtered({
    force = force,
    ghost_type = types,
    position = position,
  })
  for i = 1, #ghosts do
    entities[#entities + 1] = ghosts[i]
  end
  return entities
end

--- Find entities and entity ghosts of the corresponding types.
--- @param surface LuaSurface
--- @param position MapPosition
--- @param force ForceIdentification
--- @param types string[]
--- @return uint
local function count_entities(surface, position, force, types)
  local count = surface.count_entities_filtered({
    force = force,
    position = position,
    type = types,
  })
  count = count
    + surface.count_entities_filtered({
      force = force,
      ghost_type = types,
      position = position,
    })
  return count
end

--- Ensure that the loader has the belt on the correct side.
--- @param entity LuaEntity
local function snap_direction(entity)
  local offset_direction = entity.direction
  if entity.loader_type == "input" then
    offset_direction = flib_direction.opposite(offset_direction)
  end
  local front_position = flib_position.add(entity.position, offsets[offset_direction])
  local back_position = flib_position.add(entity.position, offsets[flib_direction.opposite(offset_direction)])

  -- Case 1: If a container is in front, then flip the loader
  -- Extra check: Don't do anything if there are containers on both sides
  local front_containers = find_entities(entity.surface, front_position, entity.force, container_types)
  local back_containers = count_entities(entity.surface, back_position, entity.force, container_types)
  if #front_containers > 0 and back_containers > 0 then
    return
  end
  if #front_containers > 0 then
    -- Check that it's not a composite loader entity
    local is_composite = entity.surface.count_entities_filtered({
      force = entity.force,
      position = front_position,
      type = { "loader", "loader-1x1" },
    }) > 0
    if not is_composite then
      flip_loader(entity)
      return
    end
  end

  -- Case 2: If a belt is behind, then flip the loader
  -- Extra check: Don't do anything if there are belts on both sides
  local front_belt_exists = count_entities(entity.surface, front_position, entity.force, belt_types) > 0
  local back_belt = find_entities(entity.surface, back_position, entity.force, belt_types)[1]
  if front_belt_exists and back_belt or not back_belt then
    return
  end

  local belt_type = back_belt.type
  if belt_type == "entity-ghost" then
    belt_type = back_belt.ghost_type
  end
  if
    belt_type == "transport-belt"
    or belt_type == "underground-belt"
    or math.abs(offset_direction - back_belt.direction) % 4 == 0
  then
    flip_loader(entity)
  end
end

--- @param entity LuaEntity
local function snap_to_belt(entity)
  local offset_direction = entity.direction
  if entity.loader_type == "input" then
    offset_direction = flib_direction.opposite(offset_direction)
  end
  local belt_position = flib_position.add(entity.position, offsets[offset_direction])

  local belt = find_entities(entity.surface, belt_position, entity.force, belt_types)[1]
  if not belt then
    return
  end

  local belt_direction = belt.direction
  local belt_type = belt.type
  if belt_type == "entity-ghost" then
    belt_type = belt.ghost_type
  end
  if entity.direction == belt_direction then
    -- Pass
  elseif entity.direction == flib_direction.opposite(belt_direction) then
    entity.loader_type = "input"
  elseif belt_type == "transport-belt" or belt_type == "underground-belt" then
    -- Sideloading
    entity.loader_type = "output"
  end
end

--- @param entity LuaEntity
return function(entity)
  entity.update_connections()
  if not entity.loader_container then
    snap_direction(entity)
  end

  snap_to_belt(entity)
end
