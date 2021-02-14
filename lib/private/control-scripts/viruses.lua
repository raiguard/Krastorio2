--------------------------------------------------------
-- Utils
-- Function for calculate the round of number
function round(num)
	return (num + 0.5 - (num + 0.5) % 1.0)
end

-- Modifier to change the quantity of objects iterated for each round of the function, based on the total
function get_count_to_remove(count)
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
	-- reset viruses table when mod configuration changes
	-- this is a brute-force way of doing it, but my hand is forced by the weird ControlCallBackManager system
	global.viruses = {
		biter_viruses = {},
		creep_viruses = {}
	}
end

-- Function to remove definitively creep
function playerThrowAntiCreep(event)
	if event.item.name == "kr-creep-virus" then
		local creep_viruses = global.viruses.creep_viruses

		-- remove all generated creep on this surface
		local player = game.players[event.player_index]
		local surface = player.surface
		local surface_index = surface.index
		if not creep_viruses[surface_index] then
			-- disable creep generation
			global.creep_on_chunk_generated = false
			global.creep_on_biter_base_built = false
			global.creep_on_remote_interface = false
			ccm:unlistenCallBack("on_chunk_generated", 1)
			ccm:unlistenCallBack("on_biter_base_built", 1)
			ccm:unlistenCallBack("on_nth_tick", 1, 10)

			-- begin creep removal
			local creep_tiles = surface.find_tiles_filtered{name = "kr-creep"}
			creep_viruses[surface_index] = {
				surface = surface,
				tiles = creep_tiles,
				tiles_len = #creep_tiles
			}
		end

		-- reduce enemy evolution factor by 33%
		local enemy = game.forces.enemy
		enemy.evolution_factor = enemy.evolution_factor * 0.67
	end
end

function removeCreep()
	local creep_viruses = global.viruses.creep_viruses
	for surface_index, data in pairs(creep_viruses) do
		local surface = data.surface
		if surface and surface.valid then
			local creeps = data.tiles
			local len = data.tiles_len
			local tiles_to_replace = {}
			for i = 1, get_count_to_remove(len) do
				if len == 0 then
					creep_viruses[surface_index] = nil
					break
				end
				local j = math.random(1, len)
				local tile = creeps[j]
				tiles_to_replace[i] = {name = tile.hidden_tile or "landfill", position = tile.position}
				-- move the element at the end to the gap
				-- this has a O(1) performance impact, while `table.remove()` has an O(n) impact
				creeps[j] = creeps[len]
				creeps[len] = nil
				len = len - 1
			end
			data.tiles_len = len
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
		local surface = player.surface
		local surface_index = surface.index

		local biter_viruses = global.viruses.biter_viruses
		if not biter_viruses[surface_index] then
			-- reduce evolution factor
			local enemy = game.forces.enemy
			enemy.evolution_factor = enemy.evolution_factor * 0.67

			-- begin gradual enemy killoff
			local enemy_entities = surface.find_entities_filtered{force = "enemy"}
			local len = #enemy_entities
			if len > 0 then
				biter_viruses[surface_index] = {
					entities = enemy_entities,
					entities_killed = 0,
					entities_len = len,
					entities_to_kill = len / 2.5,
					force = player.force
				}
			end
		end
	end
end

function killEnemyEntities()
	local biter_viruses = global.viruses.biter_viruses
	for surface_index, data in pairs(biter_viruses) do
		local entities = data.entities
		local entities_killed = data.entities_killed
		local entities_to_kill = data.entities_to_kill
		local force = data.force
		local len = data.entities_len

		-- kill some entities
		for _ = 1, len / get_count_to_remove(len) do
			if entities_killed >= entities_to_kill then
				biter_viruses[surface_index] = nil
				break
			end

			local i = math.random(1, len)
			local entity = entities[i]
			if entity and entity.valid then
				entity.die(force)

				-- move the element at the end to the gap
				-- this has a O(1) performance impact, while `table.remove()` has an O(n) impact
				entities[i] = entities[len]
				entities[len] = nil

				entities_killed = entities_killed + 1
				len = len - 1
			end
		end

		data.entities_killed = entities_killed
		data.tiles_len = len
	end
end

return
{
	{ onInitAndConfigChanged, "on_init"},
	{ onInitAndConfigChanged, "on_configuration_changed"},
	{ playerThrowAntiCreep, "on_player_used_capsule" },
	{ playerThrowAntiBiter, "on_player_used_capsule" },
	{ removeCreep, "on_nth_tick", 10 },
	{ killEnemyEntities, "on_nth_tick", 10 },
}
