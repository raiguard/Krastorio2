-----------------------------------------------------------------------------
-- -- -- CONSTANTS

-- Krastorio loader names
local KRASTORIO_LOADERS =
{
	["kr-loader"]          = true,
	["kr-fast-loader"]     = true,
	["kr-express-loader"]  = true,
	["kr-superior-loader"] = true,
	["kr-se-loader"]       = true
}

local KRASTORIO_LOADER_BUILT_EVENT_FILTER =
{
    {
		filter = "name", 
        name   = "kr-loader"
    },
    {
		filter = "name", 
        name   = "kr-fast-loader"
    },
    {
		filter = "name", 
        name   = "kr-express-loader"
    },
    {
		filter = "name", 
        name   = "kr-superior-loader"
    },
    {
		filter = "name", 
        name   = "kr-se-loader"
    },
	{
		filter = "ghost_name",
        name   = "kr-loader"
    },
    {
		filter = "ghost_name",
        name   = "kr-fast-loader"
    },
    {
		filter = "ghost_name",
        name   = "kr-express-loader"
    },
    {
		filter = "ghost_name",
        name   = "kr-superior-loader"
    },
    {
		filter = "ghost_name",
        name   = "kr-se-loader"
    }
}

-- Type of entities that snap with loaders
local SNAP_TYPES = 
{
	["loader"] = true,
	["splitter"] = true,
	["underground-belt"] = true,
	["transport-belt"] = true
}

--[[
	Direction is a Types/uint32 who's value can be any of the following:
	Factorio: 0.17.79
	Direction|Num  |Variable	
	--------------------------------------
	North     - 0 - defines.direction.north
	Northeast - 1 - defines.direction.northeast
	East      - 2 - defines.direction.east
	Southeast - 3 - defines.direction.southeast
	South     - 4 - defines.direction.south
	Southwest - 5 - defines.direction.southwest
	West      - 6 - defines.direction.west
	Northwest - 7 - defines.direction.northwest
--]]

local OPPOSITE_DIRECTIONS =
{
	[0] = 4,
	[2] = 6,
	[4] = 0,
	[6] = 2
}

local FRONT_POSITION_DIFFERENCE =
{
	[0] = {0 , -1}, 
	[2] = {1 ,  0},
	[4] = {0 ,  1},
	[6] = {-1,  0}
}

local BACK_POSITION_DIFFERENCE =
{
	[0] = FRONT_POSITION_DIFFERENCE[OPPOSITE_DIRECTIONS[0]],
	[2] = FRONT_POSITION_DIFFERENCE[OPPOSITE_DIRECTIONS[2]],
	[4] = FRONT_POSITION_DIFFERENCE[OPPOSITE_DIRECTIONS[4]],
	[6] = FRONT_POSITION_DIFFERENCE[OPPOSITE_DIRECTIONS[6]]
}
-----------------------------------------------------------------------------
-- -- -- FUNCTION UTILS

-- Return the real type of entity if is a ghost, or the type otherwise
-- @entity, entity to look for type
local function getEffectiveName(entity)
	if entity then
		if entity.name == "entity-ghost" then
			return entity.ghost_name
		else
			return entity.name
		end			
	else
		return nil
	end
end

-- Return the real type of entity if is a ghost, or the type otherwise
-- @entity, entity to look for type
local function getEffectiveType(entity)
	if entity then
		if entity.name == "entity-ghost" then
			return entity.ghost_type
		else
			return entity.type
		end			
	else
		return nil
	end
end

-- Return the entity, the name, and the type,
-- of entity in front from the given entity,
-- can return nil values
-- @entity
local function getFrontEntity(entity)
	local front_position = 
	{
		x = entity.position.x + FRONT_POSITION_DIFFERENCE[entity.direction][1],
		y = entity.position.y + FRONT_POSITION_DIFFERENCE[entity.direction][2]
	}
	local front_entity      = entity.surface.find_entities({front_position, front_position})[1] or nil
	local front_entity_name = getEffectiveName(front_entity)
	local front_entity_type = getEffectiveType(front_entity)
	return front_entity, front_entity_name, front_entity_type
end

-- Return the entity, the name, and the type,
-- of entity behind the given entity,
-- can return nil values
-- @entity
local function getBackEntity(entity)
	local back_position =
	{
		x = entity.position.x + BACK_POSITION_DIFFERENCE[entity.direction][1],
		y = entity.position.y + BACK_POSITION_DIFFERENCE[entity.direction][2]
	}	
	local back_entity      = entity.surface.find_entities({back_position, back_position})[1] or nil
	local back_entity_name = getEffectiveName(back_entity)
	local back_entity_type = getEffectiveType(back_entity)
	return back_entity, back_entity_name, back_entity_type
end

-- Change entity direction to the oppose side
-- @entity, to reverse the direction
local function reverseEntity(entity)
	entity.direction = OPPOSITE_DIRECTIONS[entity.direction]
end

-- Return if the entity have an inventory
-- @entity, to check if has an inventory
local function hasInventory(entity)
	local entity_type = getEffectiveType(entity)
	if 
		entity_type == "container" or 
		entity_type == "assembling-machine" or 
		entity_type == "furnace" or
		entity_type == "rocket-silo"
	then
		return true
	end
	for _, inventory_type in pairs(defines.inventory) do
		if entity.get_inventory(inventory_type) then
			return true
		end
	end
	return false
end

-- Snap the given loader with the front and/or back entities
-- @loader, loader to swap
local function snapLoader(loader)	
	-- get entity in front of loader (should be the side when the belt go out of the loader)	
	local front_entity, _, front_entity_type = getFrontEntity(loader)
	-- get entity in behind loader (should be the side when the loader is attached to something)
	local back_entity, _, back_entity_type   = getBackEntity(loader)
	
	-- snapping
	if front_entity and back_entity then -- both
		if SNAP_TYPES[front_entity_type] and SNAP_TYPES[back_entity_type] or
		   hasInventory(front_entity) and hasInventory(back_entity)
		then
			return nil
		end
		if SNAP_TYPES[back_entity_type] then
			reverseEntity(loader)
			front_entity, back_entity = back_entity, front_entity
		end
		if hasInventory(front_entity) then
			reverseEntity(loader)
			front_entity, back_entity = back_entity, front_entity
			if OPPOSITE_DIRECTIONS[loader.direction] == back_entity.direction then
				loader.loader_type = "input"
			else
				loader.loader_type = "output"
			end
		end
		if hasInventory(back_entity) then
			if OPPOSITE_DIRECTIONS[loader.direction] == front_entity.direction then
				loader.loader_type = "input"
			else
				loader.loader_type = "output"
			end
		end
	elseif front_entity and not back_entity then -- only front
		if SNAP_TYPES[front_entity_type] then
			if OPPOSITE_DIRECTIONS[loader.direction] == front_entity.direction then
				loader.loader_type = "input"
			else
				loader.loader_type = "output"
			end
		elseif hasInventory(front_entity) then
			reverseEntity(loader)
		end
	elseif not front_entity and back_entity then -- only back
		if SNAP_TYPES[back_entity_type] then
			reverseEntity(loader)
			if OPPOSITE_DIRECTIONS[loader.direction] == back_entity.direction then
				loader.loader_type = "input"
			else
				loader.loader_type = "output"
			end
		end
	end
end

-- Snap only the loader_type
-- of the given loader with the front entity
-- @loader, loader to swap
local function snapLoaderDropDirection(loader)
	-- get entity in front of loader (should be the side when the belt go out of the loader)
	local front_entity, _, front_entity_type = getFrontEntity(loader)
		
	if front_entity_type and SNAP_TYPES[front_entity_type] then
		if OPPOSITE_DIRECTIONS[loader.direction] == front_entity.direction then
			loader.loader_type = "input"
		end
	end	
end
-----------------------------------------------------------------------------
-- -- -- CALLBACKS
local function onPreMinedEntity(event) 
	local tags = event.entity.tags
	if tags then
		for key, tag in pairs(tags) do
			game.print("Key: "..tostring(key).."|Value: "..tostring(tag))
		end
	end
end

-- @event, on_built_entity or on_robot_built_entity
local function onBuiltAnEntity(event)
	local loader = event.created_entity
	local name   = getEffectiveName(loader)
	local type   = getEffectiveType(loader)
	game.print("test")
	-- Check requisites for work on loader
	if 
		type == "loader" and 
		loader.valid and
		KRASTORIO_LOADERS[name] and
		not event.revived
	then
		if event.tags then
			for key, tag in pairs(event.tags) do
				game.print("Key2: "..tostring(key).."|Value: "..tostring(tag))
			end
		end

		if loader.name == "entity-ghost" then
			loader.tags = {[name]=true}
		end
		snapLoader(loader)
		return true
	end
	return false
end

-- @event, on_robot_built_entity
local function onRobotBuiltAnEntity(event)
	local entity = event.created_entity
	local type   = getEffectiveType(entity) 
	if not onBuiltAnEntity(event) and SNAP_TYPES[type] then
		-- get entity in front of the belt		
		local front_entity, front_entity_name, front_entity_type = getFrontEntity(entity)
		-- get entity in behind the belt
		local back_entity, back_entity_name, back_entity_type = getBackEntity(entity)
		
		-- if that entities are loaders, snap it! (but only drop type)
		if
			front_entity and
			front_entity_type == "loader" and
			front_entity.valid and
			front_entity_name and
			KRASTORIO_LOADERS[front_entity_name]
		then
			snapLoaderDropDirection(front_entity)
		end
		if
			back_entity and
			back_entity_type == "loader" and
			back_entity.valid and
			back_entity_name and
			KRASTORIO_LOADERS[back_entity_name]
		then
			snapLoaderDropDirection(back_entity)
		end
	end	
end
-----------------------------------------------------------------------------
-- -- -- ADDING CALLBACKS
if settings.startup["loaders"] and settings.startup["loaders"].value then
	return
	{
		-- -- Actions
		-- When bulding, if its a loader check for snapping and snap, if snapped or not snapping then add to list,
		-- check anything else built and check for loaders around it they may need correcting.
		{ onPreMinedEntity, "on_pre_player_mined_item", KRASTORIO_LOADER_BUILT_EVENT_FILTER},
		{ onBuiltAnEntity, "on_built_entity", KRASTORIO_LOADER_BUILT_EVENT_FILTER },
		{ onRobotBuiltAnEntity, "on_robot_built_entity", KRASTORIO_LOADER_BUILT_EVENT_FILTER }		
	}
else
	return {}
end
-----------------------------------------------------------------------------
