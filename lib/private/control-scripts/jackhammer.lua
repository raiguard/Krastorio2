require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

not_valid_replacers = require("__Krastorio2__/lib/private/control-scripts/control-lib/not-valid-replacers")
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

local function onInitAndConf()
	if not global.krastorio.script_initialization_status["jackhammer"] then
		initializeJackhammerConstats()
		global.krastorio.script_initialization_status["jackhammer"] = true
	end
end

function initializeJackhammerConstats()
	global.MAX_TILE_DISTANCE   = 10
end

function isTooDistantFromArea(position, area)
	local a, b = area.left_top or area[1], area.right_bottom or area[2]
	local area_min_pos = { x = math.min(a.x, b.x), y = math.min(a.y, b.y) }
	local area_max_pos = { x = math.max(a.x, b.x), y = math.max(a.y, b.y) }
	
	local delta_x = math.max(area_min_pos.x - position.x, 0, position.x - area_max_pos.x)
	local delta_y = math.max(area_min_pos.y - position.y, 0, position.y - area_max_pos.y)
	
	return math.sqrt(delta_x*delta_x + delta_y*delta_y) > global.MAX_TILE_DISTANCE
end

function isInRange(char_pos, tile_pos)
	local delta_pos = {x = tile_pos.x - char_pos.x, y = tile_pos.y - char_pos.y}
	local vector_length = math.sqrt(delta_pos.x*delta_pos.x + delta_pos.y*delta_pos.y)	
	return vector_length <= global.MAX_TILE_DISTANCE
end

function showDistanceErrorMessage(character)
	global.krastorio.flying_texts.showOnSurfaceText
	{
		entity = character,
		text   = {"other.kr-collect-distant-error"},
		color  = {1, 0, 0}
	}
end

function showInventoryFullErrorMessage(character)
	global.krastorio.flying_texts.showOnSurfaceText
	{
		entity = character,
		text   = {"other.kr-player-inventory-full-error"},
		color  = {1, 0, 0}
	}
end

function showCollectionCountMessage(character, num)
	global.krastorio.flying_texts.showOnSurfaceText
	{
		entity = character,
		text   = {"other.kr-collect-message", tostring(num), "tiles"},
		color  = {0.3, 1, 0.3}
	}
end

function getNearestTileType(surface, area)
	local a, b = area.left_top or area[1], area.right_bottom or area[2]
	local mid_pos = {x = (a.x+b.x)/2,y = (a.y+b.y)/2}
	local delta_pos = {x = a.x - b.x, y = a.y - b.y}
	local vector_length = math.sqrt(delta_pos.x*delta_pos.x + delta_pos.y*delta_pos.y)	
	local iteration = 0
	local tiles = nil
	while iteration < 11 do
		tiles = surface.find_tiles_filtered
		{
			position = mid_pos,
			radius = vector_length*(iteration+2)
		}
		for _, tile in pairs(tiles) do
			if not not_valid_replacers[tile.name] then
				return tile.name
			end
		end
		iteration = iteration+2
	end
	return "landfill"
end

function onCollection(event)
	if event.item == "kr-jackhammer" then	
		local player = game.players[event.player_index] or false
		if player and player.valid and player.character and player.character.valid then
			if isTooDistantFromArea(player.character.position, event.area) then
				showDistanceErrorMessage(player.character)
			else
				local tiles = event.tiles
				if #tiles > 0 then
					local replacement_tile_name = getNearestTileType(player.character.surface, event.area)
					local items = {}
					for _, tile in pairs(tiles) do
						local item_name = nil
						if isInRange(player.character.position, tile.position) then	
							item_name = tiles_items[tile.name]
							if not items[item_name] then
								items[item_name] = {count=0, replacements={}}
							end
							
							table.insert(items[item_name].replacements, {name = replacement_tile_name, position = tile.position})
							items[item_name].count = items[item_name].count + 1
						end
					end
					
					if not next(items) then -- no item in range, then error
						showDistanceErrorMessage(player.character)
					else
						local inventory = player.get_main_inventory()
						local insert_items_count = 0
						for item_name, item in pairs(items) do
							if inventory.can_insert({name = item_name, count=item.count}) then
								tiles[1].surface.set_tiles(item.replacements)
								inventory.insert({name = item_name, count=item.count})
								insert_items_count = insert_items_count + item.count
							end
						end
						if insert_items_count  == 0 then -- probabily not space, so inventory is full
							showInventoryFullErrorMessage(player.character)
						else -- tell the quantity of inserted items 
							showCollectionCountMessage(player.character, insert_items_count)
						end
					end
				end
			end
		end
	end
end

--[[
					local inventory = player.get_main_inventory()
					
					local replacement_tile_name = getNearestTileType(player.character.surface, event.area)
					local replacements = {}
					local items = {}
					for _, tile in pairs(tiles) do
						if isInRange(player.character.position, tile.position) then		
							table.insert(replacements, {name = replacement_tile_name, position = tile.position})
							table.insert(items, {name = tiles_items[tile.name], count=1})
						end
					end

					if #items == 0 and #replacements == 0 then
						showDistanceErrorMessage(player.character)
					elseif #items > 0  then
						tiles[1].surface.set_tiles(replacements)
						for _, item in pairs(items) do
							inventory.insert(item)
						end
						showCollectionCountMessage(player.character, #items)
					end
--]]

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
