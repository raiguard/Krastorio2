-- Initialization of needed variables for the script
-- must be called on on_init
function creepVariablesInitializing()
	-- CONSTANTS
	global.CREEP_NAME = "concrete"
	global.CREEP_SIZES =
	{
		[1]  = {max_x = 10, max_y = 11, half_max_x = 5, half_max_y = 5},
		[2]  = {max_x = 7 , max_y = 8 , half_max_x = 4, half_max_y = 4},
		[3]  = {max_x = 13, max_y = 10, half_max_x = 6, half_max_y = 5},
		[4]  = {max_x = 12, max_y = 8 , half_max_x = 6, half_max_y = 4},
		[5]  = {max_x = 14, max_y = 9 , half_max_x = 7, half_max_y = 4},
		[6]  = {max_x = 7 , max_y = 13, half_max_x = 3, half_max_y = 6},
		[7]  = {max_x = 9 , max_y = 7 , half_max_x = 4, half_max_y = 4},
		[8]  = {max_x = 8 , max_y = 10, half_max_x = 4, half_max_y = 5},
		[9]  = {max_x = 7 , max_y = 9 , half_max_x = 6, half_max_y = 8},
		[10] = {max_x = 9 , max_y = 14, half_max_x = 4, half_max_y = 7}
	}
	global.TOTAL_CREEP_SIZES = #global.CREEP_SIZES

	-- STATE VARIABLES
	global.last_creep_size = 0
	global.creeps_to_generate = {}
	global.creeps_generated = {}
	global.creep_index = 1
end

-- For avoid redundant calls
-- @surface, of nest
-- @position, of nest
function alreadySubmitted(surface, position)
	for _, creep in pairs(global.creeps_generated) do
		if  creep.surface == surface and
			creep.position.x == position.x and creep.position.y == position.y then
			return true
		end
	end
	for _, creep in pairs(global.creeps_to_generate) do
		if  creep.surface == surface and
			creep.position.x == position.x and creep.position.y == position.y then
			return true
		end
	end
	return false
end

-- Push for creep generation a surface and position under a biter nests
-- @event, on_biter_base_built or on_chunk_generated
function pushCreepToGenerate(event)
	local nest = event.entity or false

	if nest then		
		if not alreadySubmitted(nest.surface, nest.position) then
			table.insert(global.creeps_to_generate, {surface = nest.surface, position = nest.position})	
		end
	else		
		local nests = event.surface.find_entities_filtered
		{ 
			event.area, 
			type = "unit-spawner"
		}
		
		for _, nest in pairs(nests) do	
			if not alreadySubmitted(nest.surface, nest.position) then
				table.insert(global.creeps_to_generate, {surface = event.surface, position = nest.position})	
			end
		end		
	end	
end

-- Take and generate one section of creep to generate from the possible in the stack
-- @event, on_tick
function continueCreepGeneration(event)
	if #global.creeps_to_generate > 0 and event.tick % 10 == 0 then 
		-- Choose one index to calculate
		local i = global.creep_index
		global.creep_index = global.creep_index + 1
		if global.creep_index > #global.creeps_to_generate then
			global.creep_index = 1
		end		
		
		-- If no one have it calculate the generate the creep
		local creep = global.creeps_to_generate[i] or false
		if creep then
			table.remove(global.creeps_to_generate, i) -- remove from to-do
			table.insert(global.creeps_generated, creep) -- add in done
			spawnCreep(creep.surface, creep.position)			
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
	x.center = nest_position.x -- circle x-axis center
	local y  = 
	{
		max = start_y + creep_size.max_y, -- bottom y
		min = start_y                     -- top y
	}
	y.rad = (y.max - y.min)/2
	y.center = nest_position.y -- circle y-axis center
	local thetha = 0
	local thetha_points = {}
	while thetha <= 360 do
		local xP = math.floor(x.center + x.rad * math.cos(thetha)) -- calculate x point
		local yP = math.floor(y.center + y.rad * math.sin(thetha)) -- calculate y point
		thetha_points[xP] = thetha_points[xP] or {} -- countine existing x-axis or create new one
		thetha_points[xP][yP] = true          -- mark point on y axis along x axis
		thetha = thetha + 1
	end
	-- circle/edges
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
	-- inside 
	for x = 1, creep_size.half_max_x do
        for y = 1, creep_size.half_max_y do
            table.insert
			(
				creeps,
				{
					name = global.CREEP_NAME,
					position = { start_x + x, start_y + y }
				}
            )
        end
    end
	
	nest_surface.set_tiles(creeps)
end

-- Adding create creep callbacks
script.on_init(creepVariablesInitializing) -- For setup variables
script.on_event(defines.events.on_biter_base_built, pushCreepToGenerate) -- for migration
script.on_event(defines.events.on_chunk_generated, pushCreepToGenerate) -- for nests generated by game
script.on_event(defines.events.on_tick, continueCreepGeneration) -- creep generation processed slowly
