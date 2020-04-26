
if creep_virus_active == nil then
	creep_virus_active = false
end
if biter_virus_active == nil then
	biter_virus_active = false
end

-- Util function for calculate the round of number
function round(num)
    return (num + 0.5 - (num + 0.5) % 1.0)
end


function deincreaserPerIteration(count)
	if count <= 1000 then
		return 60
	elseif count <= 5000 then
		return 120
	elseif count <= 10000 then
		return 240
	elseif count <= 20000 then
		return 480
	elseif count <= 30000 then
		return 540
	else
		return 600
	end
end

-- Remove all creep tiles for the indicated surface
function removeAllCreepTiles(surface)
	if surface and type(surface) == "table" and creep_virus_active ~= true then
		-- Find all creep
		local creeps = surface.find_tiles_filtered
		{ 
			name = global.CREEP_NAME
		}
	
		local creeps_count = #creeps
		local tiles_to_replace = {}
		local creeps_for_cicle = 0
		
		-- if is too much to iterate will do an instat big replace to reduce the long term ups consume
		if creeps_count >= 40000 then 
			local pre_tiles_to_replace = {}
			
			-- Create a list of tiles to replace with a landfill
			while creeps_count > 0 do
				if (creeps_count % 10) == 0 then
					table.insert(tiles_to_replace, {name = "landfill", position = creeps[creeps_count].position})
				else
					table.insert(pre_tiles_to_replace, {name = "landfill", position = creeps[creeps_count].position})
				end
				
				creeps_count = creeps_count - 1
			end
			
			if surface.valid then
				surface.set_tiles(pre_tiles_to_replace)
			end
		else	
			-- Create a list of tiles to replace with a landfill
			for _, creep in pairs(creeps) do
				table.insert(tiles_to_replace, {name = "landfill", position = creep.position})
			end
		end
		
		creeps_count = #tiles_to_replace
		creeps_for_cicle = round(creeps_count/deincreaserPerIteration(creeps_count))
		
		-- If exist some creep
		if creeps_count > 0 and creep_virus_active ~= true then
			creep_virus_active = true -- Lock semaphore
			
			-- Common random generator
			local random_generator = game.create_random_generator()
			random_generator.re_seed(666)
			
			game.print("starting removing creep, total: "..creeps_count)
			
			-- Function on 10th ticks (will automatically remove itselft from the list of callback when the works is finished)
			local function slowlyRemoveCreep()
				local creep_to_remove_this_cicle = math.min(creeps_count, creeps_for_cicle)
				local tiles_to_replace_this_cicle = {}	
				local choosen_index = 0
				
				-- Iterate the creep
				while creep_to_remove_this_cicle > 0 do
					choosen_index = random_generator(1, creeps_count) -- Select an index
					table.insert(tiles_to_replace_this_cicle, tiles_to_replace[choosen_index]) -- Move to the list to replace this round
					creep_to_remove_this_cicle = creep_to_remove_this_cicle - 1 -- Reduce counter of this round
					
					creeps_count = creeps_count - 1 -- Reduce global counter
					table.remove(tiles_to_replace, choosen_index)
				end
				
				-- Remove creeps
				if surface.valid then
					surface.set_tiles(tiles_to_replace_this_cicle)
				else
					ccm:unlistenCallBack("on_nth_tick", 36)
					creep_virus_active = false -- Release semaphore
				end
				
				-- If all creeps is removed un-register the function
				if creeps_count <= 0 then
					ccm:unlistenCallBack("on_nth_tick", 36)
					creep_virus_active = false -- Release semaphore
				end
			end
			
			-- register function
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
	if event.item and event.item.name == "kr-biter-virus" and not biter_virus_active then
		local player = game.players[event.player_index]
		if player and player.valid and player.character and player.character.valid then
			biter_virus_active = true
			local actual_player_surface = player.character.surface
			local enemy_entities = actual_player_surface.find_entities_filtered
			{
				force = "enemy"
			}
			
			local enemy_count = #enemy_entities
			local enemy_for_cicle = round(enemy_count/60)
			local entity_to_kill = enemy_count/3
			local random_generator = game.create_random_generator()
			random_generator.re_seed(666) 
			local function slowlyKillSomeBiters()
				local entity_to_kill_this_cicle = math.min(entity_to_kill, round(enemy_for_cicle))
				entity_to_kill = entity_to_kill - entity_to_kill_this_cicle
				local entity = nil
				local choosen_index = 0
				while entity_to_kill_this_cicle > 0 do
					choosen_index = random_generator(1, enemy_count)
					entity = enemy_entities[choosen_index] or false
					if entity and entity.valid then
						entity.die(player.force)
					end
					entity_to_kill_this_cicle = entity_to_kill_this_cicle - 1
					enemy_count               = enemy_count - 1
					table.remove(enemy_entities, choosen_index)
				end
				if entity_to_kill <= 0 then
					ccm:unlistenCallBack("on_nth_tick", 33)
					biter_virus_active = false
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
		end
	end	
end

return
{
	{ playerThrowAntiCreep, "on_player_used_capsule" },
	{ playerThrowAntiBiter, "on_player_used_capsule" }
}