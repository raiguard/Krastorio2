-- -- -- SNAPPING UTILS
-----------------------------------------------------------------------------
--[[ 
 * ---
 * This part of code is under:
 * Optera (MIT) Copyright (c) 2017
 * See MIT license for information about.
 * Taken mod:  Loader Redux
 * Taken from: Version: 1.4.1
 * ---
 * This version is not the original one, is modified
 * and adapter for the purpose of this mod.
 * ---
--]]

local snapTypes = 
{
	["loader"] = true,
	["splitter"] = true,
	["underground-belt"] = true,
	["transport-belt"] = true
}

-- set loader direction according to adjacent belts
local function snap_loader_to_target(loader, entity, event)
  if not entity or not entity.valid or not loader or not loader.valid then
    log("Krastorio 2 - Entity or Loader where invalid.")
    return
  end

  if not snapTypes[entity.type] then
    log("Krastorio 2 - "..entity.type.." not a valid entity for loader connection")
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
local function find_loader_by_entity(entity)
	local position = entity.position
	local box = entity.prototype.selection_box
	local area = 
	{
		{position.x + box.left_top.x-1, position.y + box.left_top.y-1},
		{position.x + box.right_bottom.x + 1, position.y + box.right_bottom.y + 1}
	}
	return entity.surface.find_entities_filtered{type="loader", name=global.supported_loader_names, area=area, force=entity.force}
end

-- returns entities in front and behind a given loader
local function find_entity_by_loader(loader)
	local lbox = loader.prototype.selection_box
	local check
	if loader.direction == 0 or loader.direction == 4 then
		check = 
		{
			{loader.position.x -.4, loader.position.y + lbox.left_top.y -1},
			{loader.position.x +.4, loader.position.y + lbox.right_bottom.y +1}
		}
		else
		check = 
		{
			{loader.position.x + lbox.left_top.x - 1, loader.position.y - .4},
			{loader.position.x + lbox.right_bottom.x + 1, loader.position.y + .4}
		}
	end
	return loader.surface.find_entities_filtered{area=check, force=loader.force}
end

-- called when entity was rotated or non loader was built
function check_for_loaders(event)
  local entity = event.created_entity or event.entity
  if snapTypes[entity.type] then
    local loaders = find_loader_by_entity(entity)
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
      local loaders = find_loader_by_entity(entity.neighbours)
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
function snap_loader(loader, event)
	local entities = find_entity_by_loader(loader)
	local snapped = false
	for _, ent in pairs(entities) do
		if ent.valid and ent ~= loader and snapTypes[ent.type] then
			snap_loader_to_target(loader, ent, event)
			snapped = true
		end
	end
end
-----------------------------------------------------------------------------
-- -- -- SNAPPING

global.supported_loaders = {} -- dictionary indexed by supported entity name 
global.supported_loader_names = {}  -- list of loader names for find_entities_filtered

-- remote interface to add and remove loaders from whitelist
remote.add_interface("kr-loader",	
{
	-- add loader name if it doesn't already exist
	add_loader = 
	function(name)
		if name then
			global.supported_loaders[name] = true
			table.insert(global.supported_loader_names, name)
		end
	end,
	-- remove loader name
	remove_loader = 
	function(name)		
		if name then			
			for key, loader_name in pairs(global.supported_loader_names) do
				if loader_name == name then
					table.remove(global.supported_loader_names, key)
					global.supported_loaders[name] = nil
					break
				end
			end			
		end
	end
})

-- Direction rotating [a] --to-> b
local active_directions = 
{
	output = 
	{
		[0] = 0,
		[2] = 2,
		[4] = 4,
		[6] = 6
	},
	input = 
	{
		[0] = 4,
		[2] = 6,
		[4] = 0,
		[6] = 2
	}
}

local function loader_active(loader_data)
	local loader = loader_data.loader
	return loader and loader.valid and active_directions[loader.loader_type][loader.direction] == loader_data.direction
end

function init_supported_loaders()
	local loader_names = 
	{
		"kr-loader",
		"kr-fast-loader",
		"kr-express-loader",
		"kr-superior-loader"
	}
	
	for _, name in pairs(loader_names) do
		remote.call("kr-loader", "add_loader", name)
	end
end

function onBuiltAnEntity(event)
	local entity = event.created_entity
	if entity.type == "loader" and global.supported_loaders[entity.name] then
		snap_loader(entity, event)
		check_for_loaders(event)
	end
end

-----------------------------------------------------------------------------
-- -- -- ADDING CALLBACKS
return
{
	-- -- Bootstrap
	-- On first install scan the map and find any loaders that might need work!
	{ init_supported_loaders, "on_init" },
	{ init_supported_loaders, "on_load" },
	-- -- Actions
	-- Check for loaders around rotated entities that may need snapping
	{ check_for_loaders, "on_player_rotated_entity" },
	-- When bulding, if its a loader check for snapping and snap, if snapped or not snapping then add to list,
	-- check anything else built and check for loaders around it they may need correcting.
	{ onBuiltAnEntity, "on_built_entity" },
	{ onBuiltAnEntity, "on_robot_built_entity" }	
}
-----------------------------------------------------------------------------
