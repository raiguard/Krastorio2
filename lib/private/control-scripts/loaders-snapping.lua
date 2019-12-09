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
local function getEffectiveType(entity)
	if entity then
		if entity.type == "entity-ghost" then
			return entity.ghost_type
		else
			return entity.type
		end			
	else
		return nil
	end
end

-- Change entity direction to the oppose side
-- @entity, to reverse the direction
local function reverseEntity(entity)
	entity.direction = OPPOSITE_DIRECTIONS[entity.direction]
end

-- Return if the entity have an inventory
-- @entity, to check if has an inventory
local function hasInventory(entity)
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
	local front_position = 
	{
		x = loader.position.x + FRONT_POSITION_DIFFERENCE[loader.direction][1],
		y = loader.position.y + FRONT_POSITION_DIFFERENCE[loader.direction][2]
	}
	local front_entity = loader.surface.find_entities({front_position, front_position})[1] or nil
	local front_entity_type = getEffectiveType(front_entity)
	-- get entity in behind loader (should be the side when the loader is attached to something)
	local back_position =
	{
		x = loader.position.x + BACK_POSITION_DIFFERENCE[loader.direction][1],
		y = loader.position.y + BACK_POSITION_DIFFERENCE[loader.direction][2]
	}	
	local back_entity = loader.surface.find_entities({back_position, back_position})[1] or nil
	local back_entity_type = getEffectiveType(back_entity)
	
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
-----------------------------------------------------------------------------
-- -- -- CALLBACKS
-- @event, on_built_entity or on_robot_built_entity
local function onBuiltAnEntity(event)
	local loader = event.created_entity
	local type = returnEffectiveType(loader)
	-- Check requisites for work on loader
	if 
		loader.type == type and 
		loader.valid and
		KRASTORIO_LOADERS[loader.name] and
		not event.revived
	then
		snapLoader(loader)
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
		{ onBuiltAnEntity, "on_built_entity" },
		{ onBuiltAnEntity, "on_robot_built_entity" }
	}
else
	return {}
end
-----------------------------------------------------------------------------
