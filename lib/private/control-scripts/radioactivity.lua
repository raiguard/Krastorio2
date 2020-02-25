local function onInitAndConf()
	if not global.krastorio.script_initialization_status["radioactivity"] then
		setupKRRadioactivityGlobalVariables()
		global.krastorio.script_initialization_status["radioactivity"] = true
	end
end

function setupKRRadioactivityGlobalVariables()
	global.krastorio.radioactivity_lock = true
	
	global.krastorio.radioactive_entities =
	{
		"uranium-ore"
	}

	global.krastorio.radioactive_items =
	{
		-- Uranium
		"uranium-ore",
		"uranium-235",
		"uranium-238",
		"uranium-fuel-cell",
		"nuclear-fuel",
		"used-up-uranium-fuel-cell"
	}
	
	global.krastorio.radioactive_area_offset = 6
end

function doRadioactiveDamage(player)
	if player.valid and player.character.valid then
		player.play_sound
		{
			path            = "kr-radioactive",
			position        = player.character.position,
			volume_modifier = 0.5
		}
		player.character.damage(7.25, "enemy", "radioactive")
	end
end

local function radioactivity()
	if global.krastorio.radioactivity_lock then	
		global.krastorio.radioactivity_lock = false
		for _, player in pairs(game.connected_players) do
			local character = player.valid and player.character
			if character and character.valid then			
				local position = character.position
				-- Entities damages
				if player.surface.count_entities_filtered
				{
					name = global.krastorio.radioactive_entities, 
					area =
					{
						{position.x - global.krastorio.radioactive_area_offset, position.y - global.krastorio.radioactive_area_offset}, 
						{position.x + global.krastorio.radioactive_area_offset, position.y + global.krastorio.radioactive_area_offset}
					}
				} > 0 
				then
					doRadioactiveDamage(player)				
				end
				-- Items damages				
				local inventory = player.valid and player.get_main_inventory()
				if inventory and inventory.valid and not inventory.is_empty() then
					for _, item_name in pairs(global.krastorio.radioactive_items) do
						if inventory.valid and inventory.get_item_count(item_name) > 0 then
							doRadioactiveDamage(player)
							break
						end
					end
				end				
			end
		end
		global.radioactivity_lock = true
	end
end

return
{
	-- -- Bootstrap
	-- For setup variables
	{ onInitAndConf, "on_init" },
	{ onInitAndConf, "on_configuration_changed" },
	-- -- Actions
	{ radioactivity, "on_nth_tick", 20 }
}