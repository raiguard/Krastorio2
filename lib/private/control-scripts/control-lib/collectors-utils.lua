local cu = {}

cu.not_valid_replacers = 
{ 
	["out-of-map"] = true, 
	["kr-creep"] = true, 
	["water"] = true, 
	["deepwater"] = true, 
	["water-green"] = true, 
	["deepwater-green"] = true, 
	["water-shallow"] = true, 
	["water-mud"] = true, 
	["landfill"] = true, 
	["stone-path"] = true, 
	["concrete"] = true, 
	["hazard-concrete-left"] = true, 
	["hazard-concrete-right"] = true, 
	["refined-concrete"] = true, 
	["refined-hazard-concrete-left"] = true, 
	["refined-hazard-concrete-right"] = true, 	
	["kr-white-reinforced-plate"] = true, 
	["kr-black-reinforced-plate"] = true
}

-- Krastorio 2 optional tiles
if settings.startup["kr-kl-stuff"] and settings.startup["kr-kl-stuff"].value then
	cu.not_valid_replacers["kr-white-reinforced-plate-l"] = true
	cu.not_valid_replacers["kr-black-reinforced-plate-l"] = true
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
				cu.not_valid_replacers["dect-paint-"..variant.."-"..direction] = true
				cu.not_valid_replacers["dect-paint-refined-"..variant.."-"..direction] = true
			end
		end
	end
	if settings.startup["dectorio-concrete"] and settings.startup["dectorio-concrete"].value then
		cu.not_valid_replacers["dect-concrete-grid"] = true
	end
end
-- Compatibility exception for AsphaltRoads
if script.active_mods["AsphaltRoads"] then	
	-- Asphalt roads tiles divided in list for the option that enabled them
	local asphalt_roads_tiles_per_options =
	{
		["AR-enable-basic-marking-tiles"] =
		{
			"Arci-asphalt",		
			"Arci-asphalt-zebra-crossing-horizontal",
			"Arci-asphalt-zebra-crossing-vertical",    
			"Arci-asphalt-triangle-white-up",
			"Arci-asphalt-triangle-white-left",
			"Arci-asphalt-triangle-white-down",
			"Arci-asphalt-triangle-white-right"
		},
		["AR-enable-colored-hazard-marking"] =
		{
			"Arci-asphalt-hazard-white-left",
			"Arci-asphalt-hazard-white-right",
			"Arci-asphalt-hazard-yellow-left",
			"Arci-asphalt-hazard-yellow-right",
			"Arci-asphalt-hazard-red-left",
			"Arci-asphalt-hazard-red-right",
			"Arci-asphalt-hazard-blue-left",
			"Arci-asphalt-hazard-blue-right",
			"Arci-asphalt-hazard-green-left",
			"Arci-asphalt-hazard-green-right"
		},
		["AR-enable-white-single-lines"] =
		{
			"Arci-marking-white-straight-vertical",    
			"Arci-marking-white-diagonal-right",
			"Arci-marking-white-straight-horizontal",  
			"Arci-marking-white-diagonal-left",
			"Arci-marking-white-right-turn-left",      
			"Arci-marking-white-left-turn-left",
			"Arci-marking-white-right-turn-down",      
			"Arci-marking-white-left-turn-down",
			"Arci-marking-white-right-turn-up",        
			"Arci-marking-white-left-turn-up",
			"Arci-marking-white-left-turn-right",      
			"Arci-marking-white-right-turn-right"
		},
		["AR-enable-yellow-single-lines"] =
		{
			"Arci-marking-yellow-straight-vertical",  
			"Arci-marking-yellow-diagonal-right",
			"Arci-marking-yellow-straight-horizontal",
			"Arci-marking-yellow-diagonal-left",
			"Arci-marking-yellow-right-turn-left",    
			"Arci-marking-yellow-left-turn-left",    
			"Arci-marking-yellow-right-turn-down",        
			"Arci-marking-yellow-left-turn-down",    
			"Arci-marking-yellow-right-turn-up",          
			"Arci-marking-yellow-left-turn-up",    
			"Arci-marking-yellow-left-turn-right",        
			"Arci-marking-yellow-right-turn-right"
		},
		["AR-enable-white-double-lines"] =
		{
			"Arci-marking-white-dl-straight-vertical",  
			"Arci-marking-white-dl-diagonal-right",
			"Arci-marking-white-dl-straight-horizontal",  
			"Arci-marking-white-dl-diagonal-left",
			"Arci-marking-white-dl-right-turn-left",      
			"Arci-marking-white-dl-left-turn-left",
			"Arci-marking-white-dl-right-turn-down",      
			"Arci-marking-white-dl-left-turn-down",
			"Arci-marking-white-dl-right-turn-up",        
			"Arci-marking-white-dl-left-turn-up",
			"Arci-marking-white-dl-left-turn-right",      
			"Arci-marking-white-dl-right-turn-right"
		},
		["AR-enable-yellow-double-lines"] =
		{
			"Arci-marking-yellow-dl-straight-vertical",  
			"Arci-marking-yellow-dl-diagonal-right",
			"Arci-marking-yellow-dl-straight-horizontal",
			"Arci-marking-yellow-dl-diagonal-left",
			"Arci-marking-yellow-dl-right-turn-left",    
			"Arci-marking-yellow-dl-left-turn-left",
			"Arci-marking-yellow-dl-right-turn-down",    
			"Arci-marking-yellow-dl-left-turn-down",
			"Arci-marking-yellow-dl-right-turn-up",      
			"Arci-marking-yellow-dl-left-turn-up",
			"Arci-marking-yellow-dl-left-turn-right",    
			"Arci-marking-yellow-dl-right-turn-right"
		}
	}	
	
	-- Iterate each list
	for option_name, tiles in pairs(asphalt_roads_tiles_per_options) do
		if settings.startup[option_name] and settings.startup[option_name].value then -- if the option is "true"
			for _, tile in pairs(tiles) do -- add each tiles
				cu.not_valid_replacers[tile] = true
			end
		end
	end
end

-- Util function for calculate the round of number
function cu.round(num)
    return (num + 0.5 - (num + 0.5) % 1.0)
end

function cu.droppedBiomass()
	return math.random(global.COLLECT_PROBABILITY, 80)
end

function cu.isTooDistantFromArea(position, area)
	local a, b = area.left_top or area[1], area.right_bottom or area[2]
	local area_min_pos = { x = math.min(a.x, b.x), y = math.min(a.y, b.y) }
	local area_max_pos = { x = math.max(a.x, b.x), y = math.max(a.y, b.y) }
	
	local delta_x = math.max(area_min_pos.x - position.x, 0, position.x - area_max_pos.x)
	local delta_y = math.max(area_min_pos.y - position.y, 0, position.y - area_max_pos.y)
	
	return math.sqrt(delta_x*delta_x + delta_y*delta_y) > global.MAX_TILE_DISTANCE
end

function cu.isInRange(char_pos, tile_pos)
	local delta_pos = {x = tile_pos.x - char_pos.x, y = tile_pos.y - char_pos.y}
	local vector_length = math.sqrt(delta_pos.x*delta_pos.x + delta_pos.y*delta_pos.y)	
	return vector_length <= global.MAX_TILE_DISTANCE
end

function cu.showDistanceErrorMessage(character)
	global.krastorio.flying_texts.showOnSurfaceText
	{
		entity = character,
		text   = {"other.kr-collect-distant-error"},
		color  = {1, 0, 0}
	}
end

function cu.showInventoryFullErrorMessage(character)
	global.krastorio.flying_texts.showOnSurfaceText
	{
		entity = character,
		text   = {"other.kr-player-inventory-full-error"},
		color  = {1, 0, 0}
	}
end

function cu.showCollectionBiomassCountMessage(character, percentage, num)
	global.krastorio.flying_texts.showOnSurfaceText
	{
		entity = character,
		text   = {"other.kr-collect-message-with-icon-prob", tostring(num), tostring(percentage), {"item-name.biomass"}, "biomass"},
		color  = {0.3, 1, 0.3}
	}
end

function cu.showCollectionCountMessage(character, num)
	global.krastorio.flying_texts.showOnSurfaceText
	{
		entity = character,
		text   = {"other.kr-collect-message", tostring(num), "tiles"},
		color  = {0.3, 1, 0.3}
	}
end

function cu.getNearestTileType(surface, area)
	local a, b = area.left_top or area[1], area.right_bottom or area[2]
	local mid_pos = {x = (a.x+b.x)/2,y = (a.y+b.y)/2}
	local delta_pos = {x = a.x - b.x, y = a.y - b.y}
	local vector_length = math.max(1, math.sqrt(delta_pos.x*delta_pos.x + delta_pos.y*delta_pos.y))
	local iteration = 0
	local tiles = nil
	local actual_radius = nil
	while iteration < 6 do
		actual_radius = vector_length*(iteration+10)
		tiles = surface.find_tiles_filtered
		{
			position = mid_pos,
			radius = math.min(50, actual_radius)
		}
		for _, tile in pairs(tiles) do
			if not cu.not_valid_replacers[tile.name] then
				return tile.name
			end
		end
		if actual_radius > 50 then
			break
		else
			iteration = iteration+1
		end
	end
	return "landfill"
end

function cu.playCollectCreepSound(player)
	player.play_sound
	{
		path            = "kr-collect-creep",
		position        = player.character.position,
		volume_modifier = 1.0
	}
end

function cu.playJackhammerSound(player)
	player.play_sound
	{
		path            = "kr-jackhammer",
		position        = player.character.position,
		volume_modifier = 1.0
	}
end

return cu
