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
	local directions = 
	{
		{this="left", next="right"},
		{this="right", next="left"}
	}
	local paint_variants = 
	{
		{name="danger", color={r=0.81,g=0.31,b=0.31}},
		{name="emergency", color={r=0.86,g=0.36,b=0.38}},
		{name="caution", color={r=0.85,g=0.56,b=0.26}},
		{name="radiation", color={r=0.86,g=0.56,b=0.78}},
		{name="defect", color={r=0.47,g=0.50,b=1.00}},
		{name="operations", color={r=0.37,g=0.37,b=0.37}},
		{name="safety", color={r=0.61,g=0.77,b=0.40}}
	}
	for _, variant in pairs(paint_variants) do
		for _, direction in pairs(directions) do
			tiles_items["dect-paint-"..variant.name.."-"..direction.this] = "dect-paint-"..variant.name
			tiles_items["dect-paint-refined-"..variant.name.."-"..direction.this] = "dect-paint-refined-"..variant.name
		end
	end
	if settings.startup["dectorio-concrete"] and settings.startup["dectorio-concrete"].value then
		tiles_items["dect-concrete-grid"] = "dect-concrete-grid"
	end
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
			if cu.isTooDistantFromArea(player.character.position, event.area) then
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
								tiles[1].surface.set_tiles(item.replacements)
								local inserted = inventory.insert({name = item_name, count=item.count})
								if inserted ~= item.count then
									tiles[1].surface.spill_item_stack(player.character.position, {name = item_name, count=item.count - inserted})
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
