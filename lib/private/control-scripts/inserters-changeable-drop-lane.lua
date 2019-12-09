-- Adding inserters changeable drop lane 
-----------------------------------------------------------------------------
-- Constant
DROP_POSITIONS_FRAC = 
{
    [true]  = { [0] = {0.0, -0.2}, [2] = {0.2, 0.0},  [4] = {0.0, 0.2},  [6] = {-0.2, 0.0} }, -- near lane
    [false] = { [0] = {0.0, 0.2},  [2] = {-0.2, 0.0}, [4] = {0.0, -0.2}, [6] = {0.2, 0.0}  }  -- far lane
}

-- Util function for calculate the round of number
function round(num)
    return (num + 0.5 - (num + 0.5) % 1.0)
end

function changeInserterDropLane(event)
	local inserter = game.players[event.player_index].selected or nil
	if inserter and inserter.type == "inserter" then
		local delta_drop_pos = {x = inserter.drop_position.x - inserter.position.x, y = inserter.drop_position.y - inserter.position.y}
		local vector_length = math.sqrt(delta_drop_pos.x*delta_drop_pos.x + delta_drop_pos.y*delta_drop_pos.y)	
		local dpf = DROP_POSITIONS_FRAC[math.fmod(vector_length, 1.0) < 0.5][inserter.direction]
		inserter.drop_position = 
		{
			inserter.position.x + round(delta_drop_pos.x) + dpf[1],
			inserter.position.y + round(delta_drop_pos.y) + dpf[2]
		}
	end
end

-- Adding inserters changeable drop lane callback

-- Normal way
-- script.on_event("kr-inserter-change-lane", changeInserterDropLane)
-- With control-callbacks-merger
return { callback = changeInserterDropLane, event_name = "kr-inserter-change-lane" }
-----------------------------------------------------------------------------
