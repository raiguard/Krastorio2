
if global.biter_virus_active == nil then
	global.biter_virus_active = false
end
if global.creep_virus_active == nil then
	global.creep_virus_active = false
end

-- Remove all creep tiles for the indicated surface
function removeAllCreepTiles(surface)
	if surface and type(surface) == "table" and not global.creep_virus_active then
		-- Find all creep
		local creeps = surface.find_tiles_filtered
		{ 
			name = global.CREEP_NAME
		}
		local creeps_count = #creeps
		if creeps_count > 0 and not global.creep_virus_active then
			global.creep_virus_active = true
			local random_generator = game.create_random_generator()
			math.randomseed(random_generator()) 
			local function slowlyRemoveCreep()
				local creep_to_remove_this_cicle = math.min(creeps_count, 100)
				local tiles_to_replace = {}	
				local creep_tile = nil
				local choosen_index = 0
				-- Create a list of tiles to replace with a landfill (this need to be improved)
				while creep_to_remove_this_cicle > 0 do
					choosen_index = math.random(1, creeps_count)
					creep_tile = creeps[choosen_index]
					if creep_tile and creep_tile.valid then
						table.insert(tiles_to_replace, {name = "landfill", position = {x = creep_tile.position.x or creep_tile.position[1], y = creep_tile.position.y or creep_tile.position[2]}})
						creep_to_remove_this_cicle = creep_to_remove_this_cicle - 1
						creeps_count = creeps_count - 1
					end
					creeps[choosen_index] = nil
				end
				surface.set_tiles(tiles_to_replace)
				if creeps_count <= 0 then
					ccm:unlistenCallBack("on_nth_tick", 36)
					global.creep_virus_active = false
				end
			end
			ccm:listenCallBack(
			{
				callback = slowlyRemoveCreep,
				event_name = "on_nth_tick",
				filter = 10,
				index = 36
			}) 
		end
	end
end

-- Function to remove definitively creep
function playerThrowAntiCreep(event)
	if event.item and event.item.name == "kr-creep-virus" then
		-- Disable/Permanenlty creep generation
		global.creep_on_chunk_generated  = false
		global.creep_on_biter_base_built = false
		ccm:unlistenCallBack("on_chunk_generated", 1)
		ccm:unlistenCallBack("on_biter_base_built", 1) 
		-- Reduce by 33% enemy evolution factor
		game.forces["enemy"].evolution_factor = game.forces["enemy"].evolution_factor * 0.66
		
		-- Remove all generated creeps
		for _, surface in pairs(game.surfaces) do
			removeAllCreepTiles(surface)
		end
	end
end

-- Function to remove biters the 33% of biters on the surface where the capsule is throwed
function playerThrowAntiBiter(event)
	if event.item and event.item.name == "kr-biter-virus" and not global.biter_virus_active then
		local player = game.players[event.player_index]
		if player and player.valid and player.character and player.character.valid then
			global.biter_virus_active = true
			local actual_player_surface = player.character.surface
			local enemy_entities = actual_player_surface.find_entities_filtered
			{
				force = "enemy"
			}
			
			local enemy_count = #enemy_entities
			local entity_to_kill = enemy_count/3
			local random_generator = game.create_random_generator()
			math.randomseed(random_generator()) 
			local function slowlyKillSomeBiters()
				local entity_to_kill_this_cicle = math.min(entity_to_kill, 100)
				entity_to_kill = entity_to_kill - entity_to_kill_this_cicle
				local entity = nil
				local choosen_index = 0
				while entity_to_kill_this_cicle > 0 do
					choosen_index = math.random(1, enemy_count)
					entity = enemy_entities[choosen_index]
					if entity and entity.valid then
						entity.die(player.force)
					end
					entity_to_kill_this_cicle = entity_to_kill_this_cicle - 1
					enemy_count               = enemy_count - 1
					enemy_entities[choosen_index] = nil
				end
				if entity_to_kill <= 0 then
					ccm:unlistenCallBack("on_nth_tick", 33)
					global.biter_virus_active = false
				end
			end
			ccm:listenCallBack(
			{
				callback = slowlyKillSomeBiters,
				event_name = "on_nth_tick",
				filter = 10,
				index = 33
			}) 
			
			game.forces["enemy"].kill_all_units()
			
			-- Reduce by 33% enemy evolution factor
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