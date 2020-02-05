-----------------------------------------------------------------------------
-- -- -- CONSTANTS

-- Krastorio loader names
local KR_LOADERS_GROUP_NAME = "kr-loaders"
local KRASTORIO_LOADERS =
{
	["kr-loader"]          = true,
	["kr-fast-loader"]     = true,
	["kr-express-loader"]  = true,
	["kr-advanced-loader"] = true,
	["kr-superior-loader"] = true,
	["kr-se-loader"]       = true
}

-- Event filters
local KRASTORIO_LOADER_BUILT_EVENT_FILTER =
{
	-- Not a ghost
	-- {
	-- 	filter = "ghost", 
    -- 	invert = true
    -- },	
	-- Snappable
	{
		filter = "type", 
        type    = "transport-belt"
    },
	{
		filter = "type", 
        type    = "underground-belt"
    },
	{
		filter = "type", 
        type    = "splitter"
    },
	{
		filter = "type", 
        type    = "loader"
    },
	-- Loaders
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
        name   = "kr-advanced-loader"
    },
    {
		filter = "name", 
        name   = "kr-superior-loader"
    },
    {
		filter = "name", 
        name   = "kr-se-loader"
    }
}

-- Type of entities that snap with loaders
local SNAP_TYPES = 
{
	["transport-belt"] = true,
	["underground-belt"] = true,
	["splitter"] = true,
	["loader"] = true
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

-- Pre computed values
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
-- of entity in the direction x, y from the given entity,
-- can return nil values
-- @entity
local function getEntityFromEntity(entity, offset_x, offset_y)
	if entity.valid then
		local position = 
		{
			x = entity.position.x + offset_x,
			y = entity.position.y + offset_y
		}
		local entities    = entity.surface.find_entities({position, position})	
		local entity      = entities[1] or nil
		-- if is a character walking in the wrong place
		if entity and entity.get_main_inventory() then
			entity        = entities[2] or nil
		end
		local entity_name = getEffectiveName(entity)
		local entity_type = getEffectiveType(entity)
		return entity, entity_name, entity_type
	else
		return nil, nil, nil
	end
end

-- Return the entity, the name, and the type,
-- of entity in front from the given entity,
-- can return nil values
-- @entity
local function getFrontEntity(entity)
	return getEntityFromEntity
	(
		entity, 
		FRONT_POSITION_DIFFERENCE[entity.direction][1], 
		FRONT_POSITION_DIFFERENCE[entity.direction][2]
	)
end

-- Return the entity, the name, and the type,
-- of entity behind the given entity,
-- can return nil values
-- @entity
local function getBackEntity(entity)
	return getEntityFromEntity
	(
		entity, 
		BACK_POSITION_DIFFERENCE[entity.direction][1], 
		BACK_POSITION_DIFFERENCE[entity.direction][2]
	)
end

-- Change entity direction to the oppose side
-- @entity, to reverse the direction
local function reverseEntity(entity)
	if entity.valid then
		entity.direction = OPPOSITE_DIRECTIONS[entity.direction]
	end
end

-- Return if the entity have an inventory
-- @entity, to check if has an inventory
local function hasInventory(entity, entity_type)
	local e_entity_type = entity_type or getEffectiveType(entity) or ""
	if SNAP_TYPES[e_entity_type] then return false end
	if 
		e_entity_type == "container" or 
		e_entity_type == "assembling-machine" or 
		e_entity_type == "furnace" or
		e_entity_type == "rocket-silo" or
		e_entity_type == "lab" or
		e_entity_type == "mining-drill"
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
	loader.loader_type = "output" -- Fix for have an universal loader direction
	-- get entity in front of loader (should be the side when the belt go out of the loader)	
	local front_entity, _, front_entity_type = getFrontEntity(loader)
	-- get entity in behind loader (should be the side when the loader is attached to something)
	local back_entity, _, back_entity_type   = getBackEntity(loader)
	-- getting more precise information
	local front_snap, front_has_inventory = false, false
	local back_snap,  back_has_inventory  = false, false
	if front_entity and SNAP_TYPES[front_entity_type] then
		front_snap = true
	end
	if front_entity and not front_snap and hasInventory(front_entity, front_entity_type) then
		front_has_inventory = true
	end
	if back_entity and SNAP_TYPES[back_entity_type] then
		back_snap = true
	end
	if back_entity and not back_snap and hasInventory(back_entity, back_entity_type) then
		back_has_inventory = true
	end
	
	-- snapping	
	if front_entity and back_entity and
	   (front_snap ~= back_snap) and -- xor
	   (front_has_inventory ~= back_has_inventory) -- xor
	then -- both
		if back_snap then
			reverseEntity(loader)
			front_entity, back_entity = back_entity, front_entity
			front_snap, back_snap = back_snap, front_snap
			front_has_inventory, back_has_inventory = back_has_inventory, front_has_inventory			
		end
		if back_has_inventory then
			if OPPOSITE_DIRECTIONS[loader.direction] == front_entity.direction then
				loader.loader_type = "input"
			else
				loader.loader_type = "output"
			end
		elseif front_has_inventory then
			reverseEntity(loader)
			front_entity, back_entity = back_entity, front_entity
			front_snap, back_snap = back_snap, front_snap
			front_has_inventory, back_has_inventory = back_has_inventory, front_has_inventory
			if OPPOSITE_DIRECTIONS[loader.direction] == front_entity.direction then
				loader.loader_type = "input"
			else
				loader.loader_type = "output"
			end
		end
	elseif front_entity and not back_entity and (front_snap ~= front_has_inventory) then -- only front
		if front_snap then
			if OPPOSITE_DIRECTIONS[loader.direction] == front_entity.direction then
				loader.loader_type = "input"
			else
				loader.loader_type = "output"
			end
		elseif front_has_inventory then
			reverseEntity(loader)
		end
	elseif not front_entity and back_entity and (back_snap ~= back_has_inventory) then -- only back
		if back_snap then
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
	loader.loader_type = "output" -- Fix for have an universal loader direction
	-- get entity in front of loader (should be the side when the belt go out of the loader)
	local front_entity, _, front_entity_type = getFrontEntity(loader)
		
	if front_entity_type and SNAP_TYPES[front_entity_type] then
		if OPPOSITE_DIRECTIONS[loader.direction] == front_entity.direction then
			loader.loader_type = "input"
		else
			loader.loader_type = "output"			
		end
	end	
end
-----------------------------------------------------------------------------
-- -- -- CALLBACKS

-- @event, on_built_entity or on_robot_built_entity
local function onBuiltAnEntity(event)
	local entity = event.created_entity
	if entity.valid and not event.revived and entity.name ~= "entity-ghost" then
		local name = getEffectiveName(entity)
		local type = getEffectiveType(entity) 
		-- Check if is a krastorio loader
		if KRASTORIO_LOADERS[name] then
			snapLoader(entity)
		elseif SNAP_TYPES[type] then
			-- get entity in front of the belt		
			local front_entity, front_entity_name, front_entity_type = getFrontEntity(entity)
			-- get entity in behind the belt
			local back_entity, back_entity_name, back_entity_type = getBackEntity(entity)
			
			-- if that entities are loaders, snap it! (but only drop type)
			if
				front_entity and
				front_entity.valid and
				front_entity_name and
				KRASTORIO_LOADERS[front_entity_name]
			then
				snapLoaderDropDirection(front_entity)
			end
			if
				back_entity and
				back_entity.valid and
				back_entity_name and
				KRASTORIO_LOADERS[back_entity_name]
			then
				snapLoaderDropDirection(back_entity)
			end
		end	
	end
end
-----------------------------------------------------------------------------
-- -- -- ADDING CALLBACKS
if settings.startup["kr-loaders"] and settings.startup["kr-loaders"].value then
	return
	{ 
		-- -- Actions
		-- When bulding, if its a loader check for snapping and snap, if snapped or not snapping then add to list,
		-- check anything else built and check for loaders around it they may need correcting.		
		{ onBuiltAnEntity, "on_built_entity", KRASTORIO_LOADER_BUILT_EVENT_FILTER },
		{ onBuiltAnEntity, "on_robot_built_entity", KRASTORIO_LOADER_BUILT_EVENT_FILTER }		
	}
else
	return {}
end
-----------------------------------------------------------------------------
