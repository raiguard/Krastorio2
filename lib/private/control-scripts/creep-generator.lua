local CREEP_NAME = "concrete"
local CREEP_SIZES =
{
	[1] = {max_x = 8, max_y = 9, half_max_x = 4, half_max_y = 5},
	[2] = {max_x = 5, max_y = 6, half_max_x = 3, half_max_y = 3},
	[3] = {max_x = 11, max_y = 8, half_max_x = 5, half_max_y = 4},
	[4] = {max_x = 10, max_y = 6, half_max_x = 5, half_max_y = 3},
	[5] = {max_x = 12, max_y = 7, half_max_x = 6, half_max_y = 3},
	[6] = {max_x = 5, max_y = 11, half_max_x = 2, half_max_y = 6},
	[7] = {max_x = 7, max_y = 5, half_max_x = 3, half_max_y = 3},
	[8] = {max_x = 6, max_y = 8, half_max_x = 3, half_max_y = 4},
	[9] = {max_x = 5, max_y = 7, half_max_x = 5, half_max_y = 7}
}
local TOTAL_CREEP_SIZES = #CREEP_SIZES
local last_creep_size = 0

local MIN_CREEP_DISTANCE = 3
local last_nest_position = {x = 0, y = 0}

function isFarEnough(position)
	local delta_nest_pos = {x = last_nest_position.x - position.x, y = last_nest_position.y - position.y}
	local vector_length = math.sqrt(delta_nest_pos.x*delta_nest_pos.x + delta_nest_pos.y*delta_nest_pos.y)	
	return vector_length > 3
end

-- Return a random number between _min and _max, interval includes.
function getNextCreepSize()
	last_creep_size = last_creep_size + 1
	if last_creep_size > TOTAL_CREEP_SIZES then
		last_creep_size = 1
	end
	return CREEP_SIZES[last_creep_size]
end

-- Generate creep in the specified position
function spawnCreep(nest_surface, nest_position)	
	local creep_size = getNextCreepSize()
	local start_x = nest_position.x - creep_size.half_max_x
	local start_y = nest_position.y + creep_size.half_max_y
    local tiles = {}
    for x = 1, creep_size.max_x do
        for y = 1, creep_size.max_y do
            table.insert
			(
				tiles,
				{
					name = CREEP_NAME,
					position = 
					{ 
						start_x + x, 
						start_y - y 
					}
				}
            )
        end
    end
    nest_surface.set_tiles(tiles)
end

-- Generate creep under the biter nests
function placeCreep(event)
	local nest = event.entity or false

	if nest then
		if isFarEnough(nest.position) then
			last_nest_position = nest_position -- set new last nest used
			spawnCreep(nest.surface, nest.position)
		end
	else
		local nests = event.surface.find_entities_filtered
		{ 
			event.area, 
			type = "unit-spawner"
		}
		
		for _, _nest in pairs(nests) do
			spawnCreep(_nest.surface, _nest.position)			
		end
	end	
end

-- Adding create creep callback
script.on_event(defines.events.on_biter_base_built, placeCreep)
script.on_event(defines.events.on_chunk_generated, placeCreep)
