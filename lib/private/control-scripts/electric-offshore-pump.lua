local KRASTORIO_OFFSHORE_PUMP_EVENT_FILTER =
{
	-- offshore pump entity name
	{
		filter = "name", 
        name   = "offshore-pump"
    },
}

-- @event, on_built_entity or on_robot_built_entity
local function onBuiltAnEntity(event)
	local old_entity = event.created_entity or event.entity
	if old_entity.valid and old_entity.name == "offshore-pump" then
		local with_damage        = old_entity.prototype.max_health - old_entity.health
		local network            = old_entity.circuit_connection_definitions
		local pos                = old_entity.position
		local force              = old_entity.force
		local direction          = old_entity.direction
		local surface            = old_entity.surface
		local player             = old_entity.last_user
		
		if old_entity and old_entity.valid then
			old_entity.destroy()
		end
		
		local new_entity = surface.create_entity
		{
			name                      = "kr-electric-offshore-pump",
			position                  = pos,
			direction                 = direction,
			force                     = force,
			player                    = player,
			create_build_effect_smoke = false,
			raise_built               = false
		}
		
		if game.active_mods["WaterAsAResource"] then
			remote.call("WaaR","build", new_entity, true)
		end
		
		-- Set in the new entity the health of the destroyed entity
		if with_damage > 0 then
			new_entity.damage(with_damage, game.forces.neutral)
		end
	end
end

function onBlueprint(event)
    local player = game.players[event.player_index]
	if 
		player and 
		player.valid and
		player.cursor_stack and
		player.cursor_stack.valid_for_read and
		player.cursor_stack.is_blueprint and
		player.cursor_stack.is_blueprint_setup() 
	then
		local blueprint_entities = player.cursor_stack.get_blueprint_entities()
		if blueprint_entities and next(blueprint_entities) then
			local have_an_offshore_pump = false
			for _, entity in pairs(blueprint_entities) do
				if entity.name == "kr-electric-offshore-pump" then
					entity.name = "offshore-pump"
					have_an_offshore_pump = true
				end
			end
			if have_an_offshore_pump then
				player.cursor_stack.set_blueprint_entities(blueprint_entities)
			end
		end
	end
end		

if script.active_mods["aai-industry"] then
	return {}
else
	return
	{ 
		-- -- Actions		
		{ onBuiltAnEntity, "on_built_entity", KRASTORIO_OFFSHORE_PUMP_EVENT_FILTER },
		{ onBuiltAnEntity, "on_robot_built_entity", KRASTORIO_OFFSHORE_PUMP_EVENT_FILTER },
		{ onBuiltAnEntity, "script_raised_built" },
		{ onBuiltAnEntity, "script_raised_revive" },
		{ onBlueprint, "on_player_setup_blueprint" },
		{ onBlueprint, "on_player_configured_blueprint" }
	}
end
