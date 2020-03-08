require("__Krastorio2__/lib/private/control-scripts/control-lib/control-lib-initialization")

not_valid_replacers =
{ 
	"kr-creep", 
	"water", 
	"deepwater", 
	"water-green", 
	"deepwater-green", 
	"water-shallow", 
	"water-mud",
	"landfill",
	"stone-brick",
	"refined-concrete",
	"refined-hazard-concrete",
	"hazard-concrete",
	"concrete",
	"kr-white-reinforced-plate",
	"kr-black-reinforced-plate"
}
random_generator = nil

local function onInitAndConf()
	if not global.krastorio.script_initialization_status["creep-collector"] then
		initializeCreepCollectorConstats()
		global.krastorio.script_initialization_status["creep-collector"] = true
	end
end

function initializeCreepCollectorConstats()
	global.MAX_TILE_DISTANCE   = 10
	global.COLLECT_PROBABILITY = 75
end

-- Util function for calculate the round of number
function round(num)
    return (num + 0.5 - (num + 0.5) % 1.0)
end

function droppedBiomass()
	if not random_generator or not random_generator.valid then
		random_generator = game.create_random_generator()
		math.randomseed(random_generator())
	end
	return math.random(global.COLLECT_PROBABILITY, 100)
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

function showCollectionCountMessage(character, percentage, num)
	global.krastorio.flying_texts.showOnSurfaceText
	{
		entity = character,
		text   = {"other.kr-collect-message-with-icon-prob", tostring(num), tostring(percentage), {"item-name.biomass"}, "biomass"},
		color  = {0.3, 1, 0.3}
	}
end

function isAValidReplacer(name)
	for _, tile_name in pairs(not_valid_replacers) do
		if name == tile_name then
			return false
		end
	end
	return true
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
			if isAValidReplacer(tile.name) then
				return tile.name
			end
		end
		iteration = iteration+2
	end
	return "landfill"
end

function onCollection(event)
	if event.item == "kr-creep-collector" then	
		local player = game.players[event.player_index] or false
		if player and player.valid and player.character and player.character.valid then
			if isTooDistantFromArea(player.character.position, event.area) then
				showDistanceErrorMessage(player.character)
			else
				local tiles = event.tiles
				if #tiles > 0 then
					local inventory = player.get_main_inventory()				
					local count = 0
					local inventory_error = false
					local replacement_tile_name = getNearestTileType(player.character.surface, event.area)
					local replacements = {}
					for _, tile in pairs(tiles) do
						if not inventory.can_insert({type = "item", name = "biomass", count = count+1}) then
							inventory_error = true
							break 
						end
						if isInRange(player.character.position, tile.position) then		
							table.insert(replacements, {name = replacement_tile_name, position = tile.position})
							count = count + 1
						end
					end

					local percentage = droppedBiomass()
					local effective_count = round(count*(percentage/100))					
					if inventory_error then
						showInventoryFullErrorMessage(player.character)
					elseif count == 0 and #replacements == 0 then
						showDistanceErrorMessage(player.character)
					elseif count > 0 and effective_count > 0 then
						tiles[1].surface.set_tiles(replacements)
						inventory.insert({type = "item", name = "biomass", count = effective_count})
						showCollectionCountMessage(player.character, percentage, effective_count)
					elseif count > 0 and effective_count == 0 then
						tiles[1].surface.set_tiles(replacements)
						showCollectionCountMessage(player.character, 0, 0)
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