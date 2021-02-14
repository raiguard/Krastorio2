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

function onInitAndConfigChanged()
	-- create global tables if they don't exist
	if global.viruses == nil then
		global.viruses = {}
	end
	if global.viruses.creep_virus_active == nil then
		global.viruses.creep_virus_active = {}
	end
end

-- Function to remove definitively creep
function playerThrowAntiCreep(event)
	if event.item.name == "kr-creep-virus" then
		-- disable creep generation
		global.creep_on_chunk_generated = false
		global.creep_on_biter_base_built = false
		global.creep_on_remote_interface = false
		ccm:unlistenCallBack("on_chunk_generated", 1)
		ccm:unlistenCallBack("on_biter_base_built", 1)
		ccm:unlistenCallBack("on_nth_tick", 1, 10)

		local creep_viruses = global.viruses.creep_virus_active

		-- remove all generated creep on this surface
		local player = game.players[event.player_index]
		local surface = player.surface
		local surface_index = surface.index
		if not creep_viruses[surface_index] then
			creep_viruses[surface_index] = {
				iterator = surface.get_chunks(),
				surface = surface
			}
		end

		-- reduce enemy evolution factor by 33%
		local enemy = game.forces.enemy
		enemy.evolution_factor = enemy.evolution_factor * 0.67
	end
end

function removeCreep()
	local creep_viruses = global.viruses.creep_virus_active
	for surface_index, data in pairs(creep_viruses) do
		local surface = data.surface
		if surface and surface.valid then
			local iterator = data.iterator
			local tiles_to_replace = {}
			local i = 0
			for _ = 1, 30 do
				local chunk = iterator()
				if chunk then
					for _, tile in pairs(surface.find_tiles_filtered{name = "kr-creep", area = chunk.area}) do
						i = i + 1
						tiles_to_replace[i] = {name = tile.hidden_tile or "landfill", position = tile.position}
					end
				else
					creep_viruses[surface_index] = nil
					break
				end
			end
			surface.set_tiles(tiles_to_replace)
		else
			creep_viruses[surface_index] = nil
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
	{ onInitAndConfigChanged, "on_init"},
	{ onInitAndConfigChanged, "on_configuration_changed"},
	{ playerThrowAntiCreep, "on_player_used_capsule" },
	{ playerThrowAntiBiter, "on_player_used_capsule" },
	{ removeCreep, "on_nth_tick", 10 }
}
