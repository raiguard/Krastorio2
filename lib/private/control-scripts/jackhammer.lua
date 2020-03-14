require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

local cu = require("__Krastorio2__/lib/private/control-scripts/control-lib/collectors-utils")

tiles_items = 
{ 
	["stone-path"] = "stone-brick", 
	["concrete"] = "concrete", 
	["hazard-concrete-left"] = "hazard-concrete", 
	["hazard-concrete-right"] = "hazard-concrete", 
	["refined-concrete"] = "refined-concrete", 
	["refined-hazard-concrete-left"] = "refined-hazard-concrete", 
	["refined-hazard-concrete-right"] = "refined-hazard-concrete", 	
	["kr-white-reinforced-plate"] = "kr-white-reinforced-plate", 
	["kr-black-reinforced-plate"] = "kr-black-reinforced-plate"
}

if script.active_mods["Dectorio"] then
	if settings.startup["dectorio-painted-concrete"] and settings.startup["dectorio-painted-concrete"].value then
		local directions = 
		{
			"left",
			"right"
		}
		local paint_variants = 
		{
			"danger",
			"emergency",
			"caution",
			"radiation",
			"defect",
			"operations",
			"safety"
		}
		for _, variant in pairs(paint_variants) do
			for _, direction in pairs(directions) do				
				tiles_items["dect-paint-"..variant.."-"..direction] = "dect-paint-"..variant
				tiles_items["dect-paint-refined-"..variant.."-"..direction] = "dect-paint-refined-"..variant
			end
		end
	end
	if settings.startup["dectorio-concrete"] and settings.startup["dectorio-concrete"].value then
		tiles_items["dect-concrete-grid"] = "dect-concrete-grid"
	end
end

if settings.startup["kr-kl-stuff"] and settings.startup["kr-kl-stuff"].value then
	tiles_items["kr-white-reinforced-plate-l"] = "kr-white-reinforced-plate-l"
	tiles_items["kr-black-reinforced-plate-l"] = "kr-black-reinforced-plate-l"
end

local function onInitAndConf()
	if not global.krastorio.script_initialization_status["jackhammer"] then
		initializeJackhammerConstats()
		global.krastorio.script_initialization_status["jackhammer"] = true
	end
end

function initializeJackhammerConstats()
	global.MAX_TILE_DISTANCE = 15
end

local function onCollection(event)
	if event.item == "kr-jackhammer" then	
		local player = game.players[event.player_index] or false
		if player and player.valid and player.character and player.character.valid then
			if event.surface ~= player.character.surface or cu.isTooDistantFromArea(player.character.position, event.area) then
				cu.showDistanceErrorMessage(player.character)
			else
				local tiles = event.tiles
				if #tiles > 0 then
					local replacement_tile_name = cu.getNearestTileType(player.character.surface, event.area)
					local items = {}
					for _, tile in pairs(tiles) do
						local item_name = nil
						if cu.isInRange(player.character.position, tile.position) then	
							item_name = tiles_items[tile.name]
							if not items[item_name] then
								items[item_name] = {count=0, replacements={}}
							end
							
							table.insert(items[item_name].replacements, {name = replacement_tile_name, position = tile.position})
							items[item_name].count = items[item_name].count + 1
						end
					end
					
					if not next(items) then -- no item in range, then error
						cu.showDistanceErrorMessage(player.character)
					else
						local inventory = player.get_main_inventory()
						local insert_items_count = 0
						for item_name, item in pairs(items) do
							if inventory.can_insert({name = item_name, count=item.count}) then
								event.surface.set_tiles(item.replacements)
								local inserted = inventory.insert({name = item_name, count=item.count})
								if inserted ~= item.count then
									event.surface.spill_item_stack(player.character.position, {name = item_name, count=item.count - inserted})
								end
								insert_items_count = insert_items_count + inserted 
							end
						end
						if insert_items_count  == 0 then -- probabily not space, so inventory is full
							cu.showInventoryFullErrorMessage(player.character)
						else -- tell the quantity of inserted items 
							cu.showCollectionCountMessage(player.character, insert_items_count)
							cu.playJackhammerSound(player)
						end
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
