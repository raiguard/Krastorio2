-----------------------------------------------------------------------------
-- Remotes
if not remote.interfaces["kr-creep"] then
	remote.add_interface("kr-creep",
	{
		set_creep_on_chunk_generated = 
		function(bool)
			if type(bool) ~= "boolean" then 
				error("Value for 'creep_on_chunk_generated' must be a boolean.")
			end
			global.creep_on_chunk_generated = bool
		end,
		set_creep_on_biter_base_built = 
		function(bool)
			if type(bool) ~= "boolean" then 
				error("Value for 'creep_on_biter_base_built' must be a boolean.")
			end
			global.creep_on_biter_base_built = bool
		end,
		spawn_creep_at_position = 
		function(surface, position)
			if type(surface) ~= "table" or type(position) ~= "table" or not surface.valid then 
				error("The surface or the position are invalid.")
			end
			table.insert(global.creeps_to_generate, {surface = surface, position = position})	
		end
	})
end
-----------------------------------------------------------------------------
local function onInitAndConf()
	if not global.krastorio.script_initialization_status["creep-generator"] then
		creepVariablesInitializing()
		global.krastorio.script_initialization_status["creep-generator"] = true
	end
end

local function onConfChange()
	onInitAndConf()
	if global.creeps_to_generate and #global.creeps_to_generate > 0 then
		for i, creep_data in pairs(global.creeps_to_generate) do
			if creep_data.name and not(game.entity_prototypes[creep_data.name] ~= nil) then
				global.creeps_to_generate[i].name = nil
			end
		end
	end
end

-- Initialization of needed variables for the script
-- must be called on on_init
function creepVariablesInitializing()
	-- CONSTANTS
	global.CREEP_NAME = "kr-creep"
	global.CREEP_SIZES =
	{
		[1]  = {max_x = 10, max_y = 12, half_max_x = 5, half_max_y = 6},
		[2]  = {max_x = 7 , max_y = 9 , half_max_x = 3, half_max_y = 4},
		[3]  = {max_x = 11, max_y = 10, half_max_x = 6, half_max_y = 5},
		[4]  = {max_x = 8, max_y = 10 , half_max_x = 6, half_max_y = 7},
		[5]  = {max_x = 11, max_y = 9 , half_max_x = 7, half_max_y = 6},
		[6]  = {max_x = 8 , max_y = 10, half_max_x = 4, half_max_y = 5},
		[7]  = {max_x = 9 , max_y = 10 , half_max_x = 6, half_max_y = 6},
		[8]  = {max_x = 7 , max_y = 8, half_max_x = 3, half_max_y = 5},
		[9]  = {max_x = 8 , max_y = 7 , half_max_x = 4, half_max_y = 3},
		[10] = {max_x = 12 , max_y = 10, half_max_x = 8, half_max_y = 7},
		[11] = {max_x = 11, max_y = 8 , half_max_x = 7, half_max_y = 6},
		[12] = {max_x = 12, max_y = 10, half_max_x = 10, half_max_y = 9}
	}
	global.TOTAL_CREEP_SIZES = #global.CREEP_SIZES
	global.MIN_CREEP_DISTANCE = 3

	-- STATE VARIABLES
	global.last_creep_size = 0
	global.last_nest_position = {x = 0, y = 0}
	global.creeps_to_generate = {}
	global.creep_index = 1
end

-- Used only for biter migration, for avoid this problem written in the documentation:
-- on_biter_base_built, called when a biter migration builds a base.
-- Note: This will be called multiple times as each biter in a given migration is sacrificed and builds part of the base.
-- Factorio 0.17.79
function isFarEnough(position)
	local delta_nest_pos = {x = global.last_nest_position.x - position.x, y = global.last_nest_position.y - position.y}
	local vector_length = math.sqrt(delta_nest_pos.x*delta_nest_pos.x + delta_nest_pos.y*delta_nest_pos.y)	
	return vector_length > global.MIN_CREEP_DISTANCE
end

-- Push in the creep stack for creep generation a surface and position under a biter nests
-- @event, on_biter_base_built or on_chunk_generated
function pushCreepToGenerate(event)
	local nest = event.entity or false

	if nest then
		if isFarEnough(nest.position) then
			global.last_nest_position = nest.position -- set new last nest finded
			table.insert(global.creeps_to_generate, {name = nest.name, surface = nest.surface, position = nest.position})
		end
	else		
		local nests = event.surface.find_entities_filtered
		{ 
			type = "unit-spawner",
			area = event.area, 
			force = "enemy"
		}
		
		for _, nest in pairs(nests) do	
			table.insert(global.creeps_to_generate, {name = nest.name, surface = event.surface, position = nest.position})	
		end		
	end	
end

local function creepOnChunkGenerated(event)
	if global.creep_on_chunk_generated ~= false then
		pushCreepToGenerate(event)
	end
end

local function creepOnBiterBaseBuilt(event)
	if global.creep_on_biter_base_built ~= false then
		pushCreepToGenerate(event)
	end
end

-- Take and generate one section of creep to generate from the possible in the stack
-- @event, on_tick
function continueCreepGeneration(event)
	if #global.creeps_to_generate > 0 then --and event.tick % 10 == 0 then 
		-- Choose one index to calculate
		local i = global.creep_index
		global.creep_index = global.creep_index + 1
		if global.creep_index > #global.creeps_to_generate then
			global.creep_index = 1
		end		
		
		-- If no one have calculate it then generate the creep
		local creep = global.creeps_to_generate[i] or false
		if creep then
			table.remove(global.creeps_to_generate, i) -- remove from to-do
			if creep.surface.valid and (creep.name == nil or creep.surface.find_entity(creep.name, creep.position) ~= nil) then
				spawnCreep(creep.surface, creep.position)
			else
				continueCreepGeneration(event)
			end
		end
	end	
end

-- Return a pseudo-random(in succession) creep size data from the precalculated.
function getNextCreepSize()
	local lcs = global.last_creep_size
	if lcs + 1 > global.TOTAL_CREEP_SIZES then
		lcs = 1
	else
		lcs = lcs + 1
	end
	global.last_creep_size = lcs
	return global.CREEP_SIZES[lcs]
end

-- Generate creep in the specified position
-- @nest_surface, of nest
-- @nest_position, of nest
function spawnCreep(nest_surface, nest_position)	
	local creep_size = getNextCreepSize()
	local creeps = {}
	
	local start_x = nest_position.x - creep_size.half_max_x
	local start_y = nest_position.y - creep_size.half_max_y	
	local x  = 
	{
		max  = start_x + creep_size.max_x, -- right most x
		min  = start_x                     -- left most x
	}
	x.rad    = math.floor(x.max - x.min)/2 -- radius
	local y  = 
	{
		max  = start_y + creep_size.max_y, -- bottom y
		min  = start_y                     -- top y
	}
	y.rad = (y.max - y.min)/2
	local thetha = 0
	local thetha_points = {} -- ellipse draw points 	
	local xP, yP = nil
	while thetha <= 360 do
		xP = math.floor(nest_position.x + x.rad * math.cos(thetha)) -- calculate x point
		yP = math.floor(nest_position.y + y.rad * math.sin(thetha)) -- calculate y point

		-- bottom left ellipse points
		for xIP = xP, nest_position.x do 
			thetha_points[xIP] = thetha_points[xIP] or {} -- countine existing x-axis or create new one
			for yIP = yP, nest_position.y do 				
				thetha_points[xIP][yIP] = true -- mark point on y axis along x axis
			end
		end	
		-- bottom right ellipse points
		for xIP = xP, nest_position.x do  	
			thetha_points[xIP] = thetha_points[xIP] or {}
			for yIP = nest_position.y, yP do 	
				thetha_points[xIP][yIP] = true
			end
		end	

		-- upper right ellipse points
		for xIP = nest_position.x, xP do 
			thetha_points[xIP] = thetha_points[xIP] or {}
			for yIP = nest_position.y, yP do 				
				thetha_points[xIP][yIP] = true
			end
		end
		-- upper right ellipse points
		for xIP = nest_position.x, xP do 
			thetha_points[xIP] = thetha_points[xIP] or {}
			for yIP = yP, nest_position.y do 	
				thetha_points[xIP][yIP] = true
			end
		end

		thetha = thetha + 1
	end
	-- set of tile points
	for x, yT in pairs(thetha_points) do
		for y in pairs(yT) do
			table.insert
			(
				creeps,
				{
					name = global.CREEP_NAME,
					position = { x, y }
				}
			)			
		end
	end
	
	if nest_surface.valid then
		nest_surface.set_tiles(creeps)
	end
end
-----------------------------------------------------------------------------
-- Adding create creep callbacks
--[[
--Normal way
script.on_init(creepVariablesInitializing) -- For setup variables
script.on_event(defines.events.on_biter_base_built, pushCreepToGenerate) -- for migration
script.on_event(defines.events.on_chunk_generated, pushCreepToGenerate) -- for nests generated by game
script.on_event(defines.events.on_tick, continueCreepGeneration) -- creep generation processed slowly
--]]
-- With control-callbacks-merger
return
{
	-- -- Bootstrap
	-- For setup variables
	{ onInitAndConf, "on_init" },   
	{ onConfChange, "on_configuration_changed" },	
	-- -- Actions
	-- For generate creep when a nest is generated by game
	{ creepOnChunkGenerated, "on_chunk_generated", nil, 1 },
	-- For generate creep when a biter migrate
	{ creepOnBiterBaseBuilt, "on_biter_base_built", nil, 1 },   
	-- Creep generation processed slowly
	{ continueCreepGeneration, "on_nth_tick", 10 }         
}
-----------------------------------------------------------------------------
