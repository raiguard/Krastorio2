-- Filter for building events
local KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER =
{
	-- intergalactic-transceiver entity name
	{
		filter = "name", 
        name   = "kr-intergalactic-transceiver"
    }
}

-- Called when the game is created
local function intergalactic_transceiverVariablesInitializing()
	global.intergalactic_transceivers = {}
	global.intergalactic_transceivers_energy_status = {}
end

-- @event, on_built_entity or on_robot_built_entity
local function onBuiltAnEntity(event)
	local entity = event.created_entity
	if entity and entity.valid and entity.name == "kr-intergalactic-transceiver" then
		local force_index = entity.force.index
		if not global.intergalactic_transceivers[force_index] then
			global.intergalactic_transceivers[force_index] = entity
		else
			entity.last_user.insert{name="kr-intergalactic-transceiver", count=1}
			krastorio.flying_texts.showOnSurfaceText
			{
				entity = entity,
				text   = {"other.kr-intergalactic-transceiver-error"},
				color  = {1, 0, 0}
			}
			entity.destroy()
		end
	end
end

-- @event, on_player_mined_entity or on_robot_mined_entity or on_entity_died
local function onRemovingAnEntity(event)
	local entity = event.entity	
	if entity and entity.valid and entity.name == "kr-intergalactic-transceiver" then
		local force_index = entity.force.index
		if global.intergalactic_transceivers[force_index] then
			global.intergalactic_transceivers[force_index] = nil
			global.intergalactic_transceivers_energy_status[force_index] = nil
		end
	end
end

-- Test if a team have with every 2 seconds
local function checkVictory()
    for force_index, it in pairs(global.intergalactic_transceivers) do
        if it.valid and it.energy == it.prototype.electric_energy_source_prototype.buffer_capacity then -- Win!
            game.set_game_state{game_finished = true, player_won = true, can_continue = true, victorious_force = game.forces[force_index]}
		elseif it.valid then -- Energy drain			
			if not global.intergalactic_transceivers_energy_status[force_index] then -- Initialize
				global.intergalactic_transceivers_energy_status[force_index] = it.energy
			else -- Exist entity
				if it.energy ~= 0 and global.intergalactic_transceivers_energy_status[force_index] == it.energy then -- Must drain
					if global.intergalactic_transceivers_energy_status[force_index] <= 2000000000 then -- Cut off
						it.energy = 0
						global.intergalactic_transceivers_energy_status[force_index] = 0
					else -- Reduce to 20%
						it.energy = it.energy - (it.energy * 20 / 100)
						global.intergalactic_transceivers_energy_status[force_index] = it.energy
					end
				else -- Not building in use so update the latest value
					global.intergalactic_transceivers_energy_status[force_index] = it.energy
				end
			end
        end
    end
end

return
{ 
	-- -- Bootstrap
	-- For setup variables
	{ intergalactic_transceiverVariablesInitializing, "on_init" },
	-- -- Actions		
	{ onBuiltAnEntity, "on_built_entity", KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER },
	{ onBuiltAnEntity, "on_robot_built_entity", KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER },
	{ onRemovingAnEntity, "on_player_mined_entity", KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER },
	{ onRemovingAnEntity, "on_robot_mined_entity", KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER },
	{ onRemovingAnEntity, "on_entity_died", KRASTORIO_INTERGALACTIC_TRANSCEIVER_EVENT_FILTER },
	{ checkVictory, "on_nth_tick", 120 }    
}
