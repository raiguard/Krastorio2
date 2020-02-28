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
	local old_entity = event.created_entity
	if old_entity.valid and old_entity.name == "offshore-pump" then
		local with_damage        = old_entity.prototype.max_health - old_entity.health
		local network            = old_entity.circuit_connection_definitions
		local pos                = old_entity.position
		local force              = old_entity.force
		local direction          = old_entity.direction
		local surface            = old_entity.surface
		
		if old_entity and old_entity.valid then
			old_entity.destroy()
		end
		
		local new_entity = surface.create_entity
		{
			name                      = "kr-electric-offshore-pump",
			position                  = pos,
			direction                 = direction,
			force                     = force,
			player                    = player_index,
			create_build_effect_smoke = false,
			raise_built               = false
		}
		
		-- Set in the new entity the health of the destroyed entity
		if with_damage > 0 then
			new_entity.damage(with_damage, game.forces.neutral)
		end
	end
end

return
{ 
	-- -- Actions		
	{ onBuiltAnEntity, "on_built_entity", KRASTORIO_OFFSHORE_PUMP_EVENT_FILTER },
	{ onBuiltAnEntity, "on_robot_built_entity", KRASTORIO_OFFSHORE_PUMP_EVENT_FILTER }
}