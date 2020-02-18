function initializeCreepCollectorConstats
	global.MAX_CREEP_COLLECTED = 100
	global.MAX_TILE_DISTANCE = 10
	global.COLLECT_PROBABILITY = 0.7
end

function collectTile(inventory, tile)

end

function onCollection(event)
	if event.item == "kr-creep-collector" then	
		local player = game.players[event.player_index] or false
		if player and player.valid then
			local inventory = player.get_main_inventory()
			local tiles = event.tiles
			
		end
	end
end

return
{
	-- -- Bootstrap
	-- For setup variables
	{ creepVariablesInitializing, "on_init" },    
	-- -- Actions
	-- When player select creep
	{ onCollection, "on_player_selected_area" }
}