require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

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
	local inserter = game.players[event.player_index].selected or false
	if inserter and inserter.type == "inserter" then
		-- Change lane
		local delta_drop_pos = {x = inserter.drop_position.x - inserter.position.x, y = inserter.drop_position.y - inserter.position.y}
		local vector_length = math.sqrt(delta_drop_pos.x*delta_drop_pos.x + delta_drop_pos.y*delta_drop_pos.y)	
		local is_near = math.fmod(vector_length, 1.0) < 0.5
		local dpf = DROP_POSITIONS_FRAC[is_near][inserter.direction]
		inserter.drop_position = 
		{
			inserter.position.x + round(delta_drop_pos.x) + dpf[1],
			inserter.position.y + round(delta_drop_pos.y) + dpf[2]
		}
		-- Tooltip
		local tooltip_name = is_near and {"other.drop-near"} or {"other.drop-far"}
		global.krastorio.flying_texts.showOnSurfaceText
		{
			entity       = inserter,
			position     = {inserter.position.x, inserter.position.y-1},
			text         = tooltip_name,
			color        = {1, 0.615, 0.235},
			time_to_live = 200
		}
		-- Welding sound
		game.play_sound
		{
			path            = "kr-welding",
			position        = inserter.position,
			volume_modifier = 1.0
		}
		-- Welding particle
		inserter.surface.create_particle
		{
			name           = "kr-welding-particle",
			position       = {inserter.position.x, inserter.position.y+1},		
			movement       = {0.0, -0.05},
			height         = 1.0,
			vertical_speed = 0.015,
			frame_speed    = 1
		}
	end
end

-- Adding inserters changeable drop lane callback

-- Normal way
-- script.on_event("kr-inserter-change-lane", changeInserterDropLane)
-- With control-callbacks-merger
if script.active_mods["bobinserters"] then
	return {}
else
	return { callback = changeInserterDropLane, event_name = "kr-inserter-change-lane" }
end
-----------------------------------------------------------------------------
