-- Change roboport state 
-----------------------------------------------------------------------------
local supported_roboports =
{
	"roboport",
	"kr-small-roboport",
	"kr-large-roboport"
}

local function changeRoboportEntity(old_entity, new_entity_name, player_index, tooltip_name)
	local with_damage        = old_entity.prototype.max_health - old_entity.health
	local network            = old_entity.circuit_connection_definitions
	local energy             = old_entity.energy or false
	local pos                = old_entity.position
	local force              = old_entity.force
	local direction          = old_entity.direction
	local surface            = old_entity.surface
	local inventory_robot    = old_entity.get_inventory(defines.inventory.roboport_robot).get_contents()
	local inventory_material = old_entity.get_inventory(defines.inventory.roboport_material).get_contents()
	
	if old_entity and old_entity.valid then
		old_entity.destroy()
	end
	
	local new_entity = surface.create_entity
	{
		name                      = new_entity_name,
		position                  = pos,
		direction                 = direction,
		force                     = force,
		player                    = player_index,
		create_build_effect_smoke = false,
		raise_built               = false
	}
	
	-- Reinsert in the new entity the energy of the destroyed entity
	if energy then
		new_entity.energy = energy
	end
	-- Set in the new entity the health of the destroyed entity
	if with_damage > 0 then
		new_entity.damage(with_damage, game.forces.neutral)
	end
	-- Reinsert items
	for item, quantity in pairs(inventory_robot) do
		if quantity > 0 then
			new_entity.insert({name=item, count=quantity})
		end
	end
	for item, quantity in pairs(inventory_material) do
		if quantity > 0 then
			new_entity.insert({name=item, count=quantity})
		end
	end
	global.krastorio.flying_texts.showOnSurfaceText
	{
		entity = new_entity,
		text   = tooltip_name,
		color  = {1, 0.615, 0.235},
		time_to_live = 300
	}
end

function changeRoboportState(event)
	local roboport = game.players[event.player_index].selected or nil
	if roboport and roboport.type == "roboport" then
		if string.find(roboport.name, "%-logistic%-mode") then
			changeRoboportEntity(roboport, string.sub(roboport.name, 1, -15) .. "-construction-mode", event.player_index, {"other.to-construction-mode"})
		elseif string.find(roboport.name, "%-construction%-mode") then
			changeRoboportEntity(roboport, string.sub(roboport.name, 1, -19), event.player_index, {"other.to-normal-mode"})
		else
			changeRoboportEntity(roboport, roboport.name .. "-logistic-mode", event.player_index, {"other.to-logistic-mode"})
		end
	end
end

-- Adding change roboport state 

-- Normal way
-- script.on_event("kr-change-roboport-state", changeRoboportState)
-- With control-callbacks-merger
return { callback = changeRoboportState, event_name = "kr-change-roboport-state" }
-----------------------------------------------------------------------------
