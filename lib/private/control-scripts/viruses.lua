--------------------------------------------------------
-- Utils
-- Function for calculate the round of number
function round(num)
    return (num + 0.5 - (num + 0.5) % 1.0)
end

-- Modifier to change the quantity of objects iterated for each round of the function, based on the total 
function deincreaserPerIteration(count)
	if count <= 1000 then
		return 20
	elseif count <= 5000 then
		return 40
	elseif count <= 10000 then
		return 80
	elseif count <= 20000 then
		return 160
	elseif count <= 30000 then
		return 280
	elseif count <= 40000 then
		return 300
	elseif count <= 50000 then
		return 400
	else
		return 800
	end
end
--------------------------------------------------------
-- -- Functions

-- Remove all creep tiles for the indicated surface
function removeCreepFromTheSurface(surface)
	-- Find all creep
	local creeps = surface.find_tiles_filtered
	{ 
		name = global.CREEP_NAME
	}
	if #creeps < 1 then
		ccm:unlistenCallBack("on_nth_tick", 2000+surface.index, 10)
		global.viruses.creep_virus_active[surface.index] = false		
		return false
	end

	local creeps_count = #creeps
	local tiles_to_replace = {}
	local creeps_for_cicle = 0
	
	-- if is too much to iterate will do an instat big replace to reduce the long term ups consume
	if creeps_count >= 100000 then 
		local pre_tiles_to_replace = {}
		
		-- Create a list of tiles to fast-replace with a landfill
		while creeps_count > 0 do
			if (creeps_count % 4) == 0 then
				table.insert(pre_tiles_to_replace, {name = "landfill", position = creeps[creeps_count].position})
			else
				table.insert(tiles_to_replace, {name = "landfill", position = creeps[creeps_count].position})
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
	if creeps_count > 0 then				
		-- Function on 10th ticks (will automatically remove itselft from the list of callbacks when the works is finished)
		local function slowlyRemoveCreep()			
			if surface and surface.valid then
				local creep_to_remove_this_cicle = math.min(creeps_count, creeps_for_cicle)
				local tiles_to_replace_this_cicle = {}	
				local choosen_index = 0
				
				-- Iterate the creep
				while creep_to_remove_this_cicle > 0 do
					choosen_index = math.random(1, creeps_count) -- Select an index
					
					table.insert(tiles_to_replace_this_cicle, tiles_to_replace[choosen_index]) -- Move to the list to replace this round
					creep_to_remove_this_cicle = creep_to_remove_this_cicle - 1 -- Reduce counter of this round
					
					tiles_to_replace[choosen_index] = tiles_to_replace[creeps_count] -- Overwrite taken tile with the the latest tile of the list 
					tiles_to_replace[creeps_count] = nil										
					
					creeps_count = creeps_count - 1 -- Reduce global counter
				end
				
				-- Remove creeps
				if surface.valid then
					surface.set_tiles(tiles_to_replace_this_cicle)
				else
					ccm:unlistenCallBack("on_nth_tick", 2000+surface.index, 10) -- Remove callback from be executed each tick
					global.viruses.creep_virus_active[surface.index] = nil -- Release semaphore
				end
				
				-- If all creeps is removed un-register the function
				if creeps_count <= 0 then
					ccm:unlistenCallBack("on_nth_tick", 2000+surface.index, 10) -- Remove callback from be executed each tick
					global.viruses.creep_virus_active[surface.index] = nil -- Release semaphore
				end
			end
		end
		
		-- register function
		ccm:listenCallBack(
		{
			callback = slowlyRemoveCreep,
			event_name = "on_nth_tick",
			filter = 10,
			index = 2000+surface.index
		}) 
	end	
end

-- Function to remove definitively creep
function playerThrowAntiCreep(event)
	if event.item and event.item.name == "kr-creep-virus" then
		local player = game.players[event.player_index]
		if player and player.valid and player.character and player.character.valid then
			local actual_player_surface = player.character.surface
			-- Disable/Permanenlty creep generation (from all surfaces)
			global.creep_on_chunk_generated  = false
			global.creep_on_biter_base_built = false
			ccm:unlistenCallBack("on_chunk_generated", 1)
			ccm:unlistenCallBack("on_biter_base_built", 1) 

			-- Remove all generated creeps
			if global.viruses == nil then
				global.viruses = {}
			end
			if global.viruses.creep_virus_active == nil then
				global.viruses.creep_virus_active = {}
			end
			global.viruses.creep_virus_active[actual_player_surface.index] = true -- Lock semaphore and sign surface to clean
			
			-- Reduce by 33% enemy evolution factor
			game.forces["enemy"].evolution_factor = game.forces["enemy"].evolution_factor * 0.67
		end
	end
end

function checkIfCreepMustBeRemoved()
	if global.viruses == nil then
		global.viruses = {}
	end
	if global.viruses.creep_virus_active == nil then
		global.viruses.creep_virus_active = {}
	end
	-- Active creep degeneration if the player throw a capsule in that surface
	if global.viruses.creep_virus_active and #global.viruses.creep_virus_active > 0 then
		for surface_index, lock in pairs(global.viruses.creep_virus_active) do
			if lock == true and not ccm:existCallBack("on_nth_tick", 2000+surface_index) then
				local surface = game.surfaces[surface_index]
				if surface and surface.valid then
					removeCreepFromTheSurface(surface)
				end
			end
		end
	end
end

-- Function to remove biters the 33% of biters on the surface where the capsule is throwed
function playerThrowAntiBiter(event)
	if event.item and event.item.name == "kr-biter-virus" then
		local player = game.players[event.player_index]
		if player and player.valid and player.character and player.character.valid then
			local actual_player_surface = player.character.surface
			if global.viruses == nil then
				global.viruses = {}
			end
			if global.viruses.biter_virus_active == nil then
				global.viruses.biter_virus_active = {}
			end
			if global.viruses.biter_virus_active[actual_player_surface.index] ~= true then
				global.viruses.biter_virus_active[actual_player_surface.index] = true	
				
				local enemy_entities = actual_player_surface.find_entities_filtered
				{
					force = "enemy"
				}
				if not enemy_entities or not next(enemy_entities) then
					ccm:unlistenCallBack("on_nth_tick", 1000+actual_player_surface.index, 10)
					global.viruses.biter_virus_active[actual_player_surface.index] = false		
					return false
				end
				
				local enemy_count = #enemy_entities
				local enemy_for_cicle = round(enemy_count/deincreaserPerIteration(enemy_count))
				local entity_to_kill = enemy_count/3
				local function slowlyKillSomeBiters()
					local entity_to_kill_this_cicle = math.min(entity_to_kill, round(enemy_for_cicle))
					entity_to_kill = entity_to_kill - entity_to_kill_this_cicle
					local entity = nil
					local choosen_index = 0
					while entity_to_kill_this_cicle > 0 do
						choosen_index = math.random(1, enemy_count)
						entity = enemy_entities[choosen_index] or false
						if entity and entity.valid then
							entity.die(player.force)
						end
						entity_to_kill_this_cicle     = entity_to_kill_this_cicle - 1
						enemy_entities[choosen_index] = enemy_entities[enemy_count]
						enemy_entities[enemy_count]   = nil
						enemy_count                   = enemy_count - 1
					end
					if entity_to_kill <= 0 then
						ccm:unlistenCallBack("on_nth_tick", 1000+actual_player_surface.index, 10)
						global.viruses.biter_virus_active[actual_player_surface.index] = false
					end
				end

				game.forces["enemy"].kill_all_units()
				
				-- Reduce by 33% enemy evolution factor
				game.forces["enemy"].evolution_factor = game.forces["enemy"].evolution_factor * 0.67
				
				ccm:listenCallBack(
				{
					callback = slowlyKillSomeBiters,
					event_name = "on_nth_tick",
					filter = 10,
					index = 1000+actual_player_surface.index
				})
			end
		end	
	end
end

return 
{
	{ playerThrowAntiCreep, "on_player_used_capsule" },
	{ playerThrowAntiBiter, "on_player_used_capsule" },
	{ checkIfCreepMustBeRemoved, "on_nth_tick", 60 }    
}
