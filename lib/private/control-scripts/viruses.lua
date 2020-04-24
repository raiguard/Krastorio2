-- Remove all creep tiles for the indicated surface
function removeAllCreepTiles(surface)
	if surface and type(surface) == "table" then
		-- Find all creep
		local creeps = surface.find_tiles_filtered
		{ 
			name = global.CREEP_NAME
		}
		
		-- Create a list of tiles to replace with a landfill (this need to be improved)
		local tiles_to_replace = {}		
		for _, creep in pairs(creeps) do
			table.insert(tiles_to_replace, {name = "landfill", position = creep.position})
		end	
		surface.set_tiles(tiles_to_replace)
		
		-- Half enemy evolution
		game.forces["enemy"].evolution_factor = game.forces["enemy"].evolution_factor / 2
	end
end

-- Function to remove definitively creep
function playerThrowAntiCreep(event)
	if event.item and event.item.name == "kr-creep-virus" then
		-- Disable creep generation
		global.creep_on_chunk_generated  = false
		global.creep_on_biter_base_built = false
		
		for _, surface in pairs(game.surfaces) do
			removeAllCreepTiles(surface)
		end
	end
end

-- Function to remove biters the 33% of biters on the surface where the capsule is throwed
function playerThrowAntiBiter(event)
	if event.item and event.item.name == "kr-biter-virus" then
		local player = game.players[event.player_index]
		if player and player.valid and player.character and player.character.valid then
			local actual_player_surface = player.character.surface
			local enemy_entities = actual_player_surface.find_entities_filtered
			{
				force = "enemy"
			}
			
			local entity_to_kill = #enemy_entities/3
			for _, entity in pairs(enemy_entities) do
				if entity_to_kill > 0 then
					entity.die(player.force)
					entity_to_kill = entity_to_kill - 1
				else
					break
				end
			end			
			game.forces["enemy"].kill_all_units()
			
			-- reset biter evolution
			game.forces["enemy"].evolution_factor = game.forces["enemy"].evolution_factor * 0.66
			
			-- Remove all creep
			removeAllCreepTiles(actual_player_surface)
		end
	end	
end

return
{
	{ playerThrowAntiCreep, "on_player_used_capsule" },
	{ playerThrowAntiBiter, "on_player_used_capsule" }
}