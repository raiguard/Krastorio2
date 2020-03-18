require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

local cu = require("__Krastorio2__/lib/private/control-scripts/control-lib/collectors-utils")

local function onInitAndConf()
	initializeCreepCollectorConstats()
end

function initializeCreepCollectorConstats()
	global.MAX_TILE_DISTANCE   = 10
	global.COLLECT_PROBABILITY = 35
end

local function onCollection(event)
	if event.item == "kr-creep-collector" then	
		local player = game.players[event.player_index] or false
		if player and player.valid and player.character and player.character.valid then
			if event.surface ~= player.character.surface or cu.isTooDistantFromArea(player.character.position, event.area) then
				cu.showDistanceErrorMessage(player.character)
			else
				local tiles = event.tiles
				if #tiles > 0 then
					local inventory = player.get_main_inventory()	

					local replacement_tile_name = cu.getNearestTileType(player.character.surface, event.area)
					local count = 0
					local replacements = {}
					for _, tile in pairs(tiles) do
						if cu.isInRange(player.character.position, tile.position) then		
							table.insert(replacements, {name = replacement_tile_name, position = tile.position})
							count = count + 1
						end
					end

					local percentage = cu.droppedBiomass()
					local effective_count = cu.round(count*(percentage/100))					
					if effective_count > 0 and (not inventory.can_insert({type = "item", name = "biomass", count = effective_count})) then
						cu.showInventoryFullErrorMessage(player.character)
					elseif count == 0 and #replacements == 0 then
						cu.showDistanceErrorMessage(player.character)
					elseif count > 0 and effective_count > 0 then
						event.surface.set_tiles(replacements)
						local inserted = inventory.insert({type = "item", name = "biomass", count = effective_count})
						if inserted ~= effective_count then
							event.surface.spill_item_stack(player.character.position, {type = "item", name = "biomass", count=effective_count - inserted})
						end						
						inventory.insert({type = "item", name = "biomass", count = effective_count})
						cu.showCollectionBiomassCountMessage(player.character, percentage, inserted)
						cu.playCollectCreepSound(player)
					elseif count > 0 and effective_count == 0 then
						event.surface.set_tiles(replacements)
						cu.showCollectionBiomassCountMessage(player.character, 0, 0)
						cu.playCollectCreepSound(player)
					end
				end
			end
		end
	end
end

return
{
	-- -- Bootstrap
	-- For setup variables
	{ onInitAndConf, "on_init" },    
	{ onInitAndConf, "on_configuration_changed" },
	-- -- Actions
	-- When player select creep
	{ onCollection, "on_player_selected_area" }
}
