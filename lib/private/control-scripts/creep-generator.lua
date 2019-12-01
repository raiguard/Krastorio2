local CREEP_NAME = "concrete"
local MIN_CREEP_SIZE, MAX_CREEP_SIZE = 10, 15
local A1, A2 = 727595, 798405  
local D20, D40 = 1048576, 1099511627776
local x1, x2 = 0, 1

-- Return a random number between _min and _max, interval includes.
function getRandom(_min, _max)
    local u = x2*A2
    local v = (x1*A2 + x2*A1) % D20
    v = (v*D20 + u) % D40
    x1 = math.floor(v/D20)
    x2 = v - x1*D20
    local randomseed = v/D40
	math.randomseed(randomseed)
	return math.random(_min, _max)
end

-- Generate creep in the specified position
function spawnCreep(nest_surface, nest_position)
	local max_x, max_y = getRandom(MIN_CREEP_SIZE, MAX_CREEP_SIZE), getRandom(MIN_CREEP_SIZE, MAX_CREEP_SIZE)
	local half_max_x, half_max_y = math.floor(max_x/2), math.ceil(max_y/2)
    local tiles = {}
    for x = 1, max_x do
        for y = 1, max_y do
            table.insert
			(
				tiles,
				{
					name = CREEP_NAME,
					position = { (nest_position.x - half_max_x) + x, (nest_position.y + half_max_y) - y }
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
		spawnCreep(nest.surface, nest.position)
	else
		local nests = event.surface.find_entities_filtered
		{ 
			event.area, 
			name = { "spitter-spawner", "biter-spawner" } 
		}
		
		for _, _nest in pairs(nests) do
			spawnCreep(_nest.surface, _nest.position)
		end
	end
	
end

-- Adding create creep callback
script.on_event(defines.events.on_biter_base_built, placeCreep)
script.on_event(defines.events.on_chunk_generated, placeCreep)
