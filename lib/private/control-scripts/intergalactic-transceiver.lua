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
end

-- @event, on_built_entity or on_robot_built_entity
local function onBuiltAnEntity(event)
	local entity = event.created_entity
	if entity and entity.valid and entity.name == "kr-intergalactic-transceiver" then
		local force = entity.force.index
		if not global.intergalactic_transceivers[force] then
			global.intergalactic_transceivers[force] = entity
		else
			for _, product in pairs(entity.prototype.mineable_properties.products) do
				entity.last_user.insert{name=product.name or product[1], count=product.amount or product[2]}
			end				
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
		local force = entity.force.index
		if global.intergalactic_transceivers[force] then
			global.intergalactic_transceivers[force] = nil
		end
	end
end

-- Test if a team have with every 2 seconds
local function checkVictory()
    for force_index, it in pairs(global.intergalactic_transceivers) do
        if it.valid and it.energy == it.prototype.electric_energy_source_prototype.buffer_capacity then
            game.set_game_state{game_finished = true, player_won = true, can_continue = true, victorious_force = game.forces[force_index]}
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
