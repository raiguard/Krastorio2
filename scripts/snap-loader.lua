local direction_util = require("__flib__/direction")
local position = require("__flib__/position")

--- @type table<defines.direction, Vector>
local offsets = {
  [defines.direction.north] = { 0, -1 },
  [defines.direction.east] = { 1, 0 },
  [defines.direction.south] = { 0, 1 },
  [defines.direction.west] = { -1, 0 },
}

local snap_to_types = {
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
return function(entity)
  entity.update_connections()
  if entity.loader_container then
    return
  end

  local direction = entity.direction
  if entity.loader_type == "input" then
    direction = direction_util.opposite(direction)
  end
  local position = position.add(entity.position, offsets[direction])

  local num_entities =
    entity.surface.count_entities_filtered({ force = entity.force, position = position, type = snap_to_types })
  if num_entities == 0 then
    return
  end
  -- Check that it's not a composite loader entity
  local num_entities = entity.surface.count_entities_filtered({
    force = entity.force,
    position = position,
    type = { "loader", "loader-1x1" },
  })
  if num_entities > 0 then
    return
  end

  entity.direction = direction_util.opposite(entity.direction)
  entity.loader_type = entity.loader_type == "output" and "input" or "output"
end
