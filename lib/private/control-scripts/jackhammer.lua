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

-- Krastorio 2 optional tiles
if settings.startup["kr-kl-stuff"] and settings.startup["kr-kl-stuff"].value then
	tiles_items["kr-white-reinforced-plate-l"] = "kr-white-reinforced-plate-l"
	tiles_items["kr-black-reinforced-plate-l"] = "kr-black-reinforced-plate-l"
end

-- Compatibility exception for Dectorio
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
-- Compatibility exception for AsphaltRoads
if script.active_mods["AsphaltRoads"] then	
	-- Asphalt roads tiles divided in list for the option that enabled them
	local asphalt_roads_tiles_per_options =
	{
		["AR-enable-basic-marking-tiles"] =
		{
			["Arci-asphalt"] = "Arci-asphalt",		
			["Arci-asphalt-zebra-crossing-horizontal"] = "Arci-asphalt-zebra",
			["Arci-asphalt-zebra-crossing-vertical"] = "Arci-asphalt-zebra",    
			["Arci-asphalt-triangle-white-up"] = "Arci-asphalt-triangle-white",
			["Arci-asphalt-triangle-white-left"] = "Arci-asphalt-triangle-white",
			["Arci-asphalt-triangle-white-down"] = "Arci-asphalt-triangle-white",
			["Arci-asphalt-triangle-white-right"] = "Arci-asphalt-triangle-white"
		},
		["AR-enable-colored-hazard-marking"] =
		{
			["Arci-asphalt-hazard-white-left"] = "Arci-asphalt-hazard-white",
			["Arci-asphalt-hazard-white-right"] = "Arci-asphalt-hazard-white",
			["Arci-asphalt-hazard-yellow-left"] = "Arci-asphalt-hazard-yellow",
			["Arci-asphalt-hazard-yellow-right"] = "Arci-asphalt-hazard-yellow",
			["Arci-asphalt-hazard-red-left"] = "Arci-asphalt-hazard-red",
			["Arci-asphalt-hazard-red-right"] = "Arci-asphalt-hazard-red",
			["Arci-asphalt-hazard-blue-left"] = "Arci-asphalt-hazard-blue",
			["Arci-asphalt-hazard-blue-right"] = "Arci-asphalt-hazard-blue",
			["Arci-asphalt-hazard-green-left"] = "Arci-asphalt-hazard-green",
			["Arci-asphalt-hazard-green-right"] = "Arci-asphalt-hazard-green"
		},
		["AR-enable-white-single-lines"] =
		{
			["Arci-marking-white-straight-vertical"] = "Arci-marking-white-straight",    
			["Arci-marking-white-straight-horizontal"] = "Arci-marking-white-straight", 
			["Arci-marking-white-diagonal-right"] = "Arci-marking-white-diagonal",			 
			["Arci-marking-white-diagonal-left"] = "Arci-marking-white-diagonal",
			["Arci-marking-white-right-turn-left"] = "Arci-marking-white-right-turn",      
			["Arci-marking-white-right-turn-down"] = "Arci-marking-white-right-turn",
			["Arci-marking-white-right-turn-up"] = "Arci-marking-white-right-turn", 
			["Arci-marking-white-right-turn-right"] = "Arci-marking-white-right-turn",
			["Arci-marking-white-left-turn-left"] = "Arci-marking-white-left-turn",			      
			["Arci-marking-white-left-turn-down"] = "Arci-marking-white-left-turn",			       
			["Arci-marking-white-left-turn-up"] = "Arci-marking-white-left-turn",
			["Arci-marking-white-left-turn-right"] = "Arci-marking-white-left-turn"		
		},
		["AR-enable-yellow-single-lines"] =
		{
			["Arci-marking-yellow-straight-vertical"] = "Arci-marking-yellow-straight",  
			["Arci-marking-yellow-straight-horizontal"] = "Arci-marking-yellow-straight",
			["Arci-marking-yellow-diagonal-right"] = "Arci-marking-yellow-diagonal",			
			["Arci-marking-yellow-diagonal-left"] = "Arci-marking-yellow-diagonal",
			["Arci-marking-yellow-left-turn-left"] = "Arci-marking-yellow-left-turn", 
			["Arci-marking-yellow-left-turn-down"] = "Arci-marking-yellow-left-turn",	
			["Arci-marking-yellow-left-turn-up"] = "Arci-marking-yellow-left-turn",    
			["Arci-marking-yellow-left-turn-right"] = "Arci-marking-yellow-left-turn", 
			["Arci-marking-yellow-right-turn-left"] = "Arci-marking-yellow-right-turn",			
			["Arci-marking-yellow-right-turn-down"] = "Arci-marking-yellow-right-turn",        
			["Arci-marking-yellow-right-turn-up"] = "Arci-marking-yellow-right-turn",                 
			["Arci-marking-yellow-right-turn-right"] = "Arci-marking-yellow-right-turn"
		},
		["AR-enable-white-double-lines"] =
		{
			["Arci-marking-white-dl-straight-vertical"] = "Arci-marking-white-dl-straight",  			
			["Arci-marking-white-dl-straight-horizontal"] = "Arci-marking-white-dl-straight",  
			["Arci-marking-white-dl-diagonal-right"] = "Arci-marking-white-dl-diagonal",
			["Arci-marking-white-dl-diagonal-left"] = "Arci-marking-white-dl-diagonal",    
			["Arci-marking-white-dl-left-turn-left"] = "Arci-marking-white-dl-left-turn",
			["Arci-marking-white-dl-left-turn-up"] = "Arci-marking-white-dl-left-turn",
			["Arci-marking-white-dl-left-turn-right"] = "Arci-marking-white-dl-left-turn", 
			["Arci-marking-white-dl-left-turn-down"] = "Arci-marking-white-dl-left-turn",
			["Arci-marking-white-dl-right-turn-left"] = "Arci-marking-white-dl-right-turn",  
			["Arci-marking-white-dl-right-turn-down"] = "Arci-marking-white-dl-right-turn",      
			["Arci-marking-white-dl-right-turn-up"] = "Arci-marking-white-dl-right-turn",     
			["Arci-marking-white-dl-right-turn-right"] = "Arci-marking-white-dl-right-turn"
		},
		["AR-enable-yellow-double-lines"] =
		{
			["Arci-marking-yellow-dl-straight-vertical"] = "Arci-marking-yellow-dl-straight", 			
			["Arci-marking-yellow-dl-straight-horizontal"] = "Arci-marking-yellow-dl-straight",
			["Arci-marking-yellow-dl-diagonal-right"] = "Arci-marking-yellow-dl-diagonal",
			["Arci-marking-yellow-dl-diagonal-left"] = "Arci-marking-yellow-dl-diagonal",
			["Arci-marking-yellow-dl-left-turn-left"] = "Arci-marking-yellow-dl-left-turn",			    
			["Arci-marking-yellow-dl-left-turn-down"] = "Arci-marking-yellow-dl-left-turn",			      
			["Arci-marking-yellow-dl-left-turn-up"] = "Arci-marking-yellow-dl-left-turn",
			["Arci-marking-yellow-dl-left-turn-right"] = "Arci-marking-yellow-dl-left-turn",   
			["Arci-marking-yellow-dl-right-turn-down"] = "Arci-marking-yellow-dl-right-turn",
			["Arci-marking-yellow-dl-right-turn-up"] = "Arci-marking-yellow-dl-right-turn",
			["Arci-marking-yellow-dl-right-turn-left"] = "Arci-marking-yellow-dl-right-turn", 			
			["Arci-marking-yellow-dl-right-turn-right"] = "Arci-marking-yellow-dl-right-turn"
		}
	}	
	
	-- Iterate each list
	for option_name, tiles in pairs(asphalt_roads_tiles_per_options) do
		if settings.startup[option_name] and settings.startup[option_name].value then -- if the option is "true"
			for tile_name, item_tile in pairs(tiles) do -- add each tiles
				tiles_items[tile_name] = item_tile
			end
		end
	end
end

local function onInitAndConf()
	initializeJackhammerConstats()
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
