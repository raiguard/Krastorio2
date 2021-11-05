local constants = require("scripts.constants")

local loader_snapping = {}

-- Checks for any K2 loaders around the belt entity, then snaps any it finds
function loader_snapping.snap_belt_neighbours(entity)
  local loaders = {}

  for _ = 1, entity.type == "transport-belt" and 4 or 2 do
    for _, neighbours in pairs(entity.belt_neighbours) do
      for _, neighbour in ipairs(neighbours) do
        if constants.loader_names[neighbour.name] then
          table.insert(loaders, neighbour)
        end
      end
    end
    entity.rotate()
  end

  for _, loader in pairs(loaders) do
    loader_snapping.snap(loader, entity)
  end
end

-- Snaps the loader to the transport-belt-connectable entity that it's facing
-- If `target` is supplied, it will check against that entity, and will not snap if it cannot connect to it
function loader_snapping.snap(entity, target)
  if not entity or not entity.valid then
    return
  end

  -- Check for a connected belt, then flip and try again, then flip back if failed
  for _ = 1, 2 do
    local loader_type = entity.loader_type

    local connection = entity.belt_neighbours[loader_type .. "s"][1]
    if connection and (not target or connection.unit_number == target.unit_number) then
      break
    else
      -- Flip the direction
      entity.loader_type = loader_type == "output" and "input" or "output"
    end
  end
end

return loader_snapping
