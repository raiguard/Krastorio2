--[[ Copyright (c) 2017 Optera
 * Part of Loader Redux
 *
 * See MIT license for information about.
--]]

local snapping = {}

local snapTypes = {
  ["loader"] = true,
  ["splitter"] = true,
  ["underground-belt"] = true,
  ["transport-belt"] = true
}

-- set loader direction according to adjacent belts
local function snap_loader_to_target(loader, entity, event)
  if not entity or not entity.valid or not loader or not loader.valid then
    log("Entity or Loader where invalid.")
    return
  end

  if not snapTypes[entity.type] then
    log(entity.type.." not a valid entity for loader connection")
    return
  end
  -- local targetio = nil
  -- if entity.type == "loader" then targetio = entity.loader_type end
  -- if entity.type == "underground-belt" then targetio = entity.belt_to_ground_type end
  -- log("target: "..entity.name.." position: "..entity.position.x..","..entity.position.y.."	direction: "..entity.direction.." "..tostring(targetio))
  -- log("loader: "..loader.name.." position: "..loader.position.x..","..loader.position.y.."	direction: "..loader.direction.." "..loader.loader_type)

  -- loader facing
  -- north 0: Loader 0 output or 4 input
  -- east	2: Loader 2 output or 6 input
  -- south 4: Loader 4 output or 0 input
  -- west	6: Loader 6 output or 2 input

  local direction = loader.direction
  local loader_type = loader.loader_type

  if loader.direction == 0 or loader.direction == 4 then -- loader and entity are aligned vertically
    if loader.position.y > entity.position.y then
      if entity.direction == 4 then
        direction = 4
        loader_type = "input"
      else
        direction = 0
        loader_type = "output"
      end
    elseif loader.position.y < entity.position.y then
      if entity.direction == 0 then
        direction = 0
        loader_type = "input"
      else
        direction = 4
        loader_type = "output"
      end
    end
  else -- loader and entity are aligned horizontally
    if loader.position.x > entity.position.x then
      if entity.direction == 2 then
        direction = 2
        loader_type = "input"
      else
        direction = 6
        loader_type = "output"
      end
    elseif loader.position.x < entity.position.x then
      if entity.direction == 6 then
        direction = 6
        loader_type = "input"
      else
        direction = 2
        loader_type = "output"
      end
    end
  end

  -- set loader_type first or the loader will end up in different positions than intended
  if loader.direction ~= direction or loader.loader_type ~= loader_type then
    --loader.surface.create_entity{name="flying-text", position={loader.position.x-.25, loader.position.y-.5}, text = "^", color = {g=1}}
    loader.loader_type = loader_type
    loader.direction = direction
  end
end

-- returns loaders next to a given entity
local function find_loader_by_entity(entity, supported_loader_names)
  local position = entity.position
  local box = entity.prototype.selection_box
  local area = {
    {position.x + box.left_top.x-1, position.y + box.left_top.y-1},
    {position.x + box.right_bottom.x + 1, position.y + box.right_bottom.y + 1}
  }
  return entity.surface.find_entities_filtered{type="loader", name=supported_loader_names, area=area, force=entity.force}
end

-- returns entities in front and behind a given loader
local function find_entity_by_loader(loader)
  local lbox = loader.prototype.selection_box
  local check
  if loader.direction == 0 or loader.direction == 4 then
    check = {
      {loader.position.x -.4, loader.position.y + lbox.left_top.y -1},
      {loader.position.x +.4, loader.position.y + lbox.right_bottom.y +1}
    }
  else
    check = {
      {loader.position.x + lbox.left_top.x - 1, loader.position.y - .4},
      {loader.position.x + lbox.right_bottom.x + 1, loader.position.y + .4}
    }
  end
  return loader.surface.find_entities_filtered{area=check, force=loader.force}
end

-- called when entity was rotated or non loader was built
function snapping.check_for_loaders(event, supported_loader_names)
  local entity = event.created_entity or event.entity
  if snapTypes[entity.type] then
    local loaders = find_loader_by_entity(entity, supported_loader_names)
    for _, loader in pairs(loaders) do
    local entities = find_entity_by_loader(loader)
      for _, ent in pairs(entities) do
        if ent == entity and ent ~= loader and snapTypes[ent.type] then
          snap_loader_to_target(loader, ent, event)
        end
      end
    end

    -- also scan other exit of underground belt
    if entity.type == "underground-belt" and entity.neighbours then
      local loaders = find_loader_by_entity(entity.neighbours, supported_loader_names)
      for _, loader in pairs(loaders) do
      local entities = find_entity_by_loader(loader)
        for _, ent in pairs(entities) do
          if ent == entity.neighbours and ent ~= loader and snapTypes[ent.type] then
            snap_loader_to_target(loader, ent, event)
          end
        end
      end
    end

  end
end

-- called when loader was built
function snapping.snap_loader(loader, event)
  local entities = find_entity_by_loader(loader)
  local snapped = false
  for _, ent in pairs(entities) do
    if ent.valid and ent ~= loader and snapTypes[ent.type] then
      snap_loader_to_target(loader, ent, event)
      snapped = true
    end
  end
end

return snapping
