radioactivity_enabled = true

if not remote.interfaces["kr-radioactivity"] then
	remote.add_interface("kr-radioactivity",
	{
		set_no_radioactivity = 
		function(bool)
			if type(bool) ~= "boolean" then 
				error("Value for 'set_no_radioactivity' must be a boolean.")
			end
			radioactivity_enabled = bool
		end
	})
end

local function onInitAndConf()
	if not global.krastorio.radioactivity_lock then
		global.krastorio.radioactivity_lock = true
	end
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
		local character = player.character
		local base_damage = 7.25
		player.play_sound
		{
			path            = "kr-radioactive",
			position        = character.position,
			volume_modifier = 0.5
		}
		if character.grid and character.grid.valid then
			if character.grid.shield > 0 then
				base_damage = base_damage + (character.grid.max_shield*0.08)
			end
		end
		character.damage(base_damage, "enemy", "radioactive")
	end
end

local function radioactivity()
	if radioactivity_enabled and global.krastorio.radioactivity_lock then	
		global.krastorio.radioactivity_lock = false
		for _, player in pairs(game.connected_players) do
			local character = player.valid and player.character
			local cursor_stack = false
			if player.valid and player.cursor_stack and player.cursor_stack.valid_for_read then
				cursor_stack = player.cursor_stack.name
			end
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
				
				-- -- Items damages	
				-------------------
				-- Cursor item
				if cursor_stack then
					for _, item_name in pairs(global.krastorio.radioactive_items) do
						if cursor_stack == item_name then
							doRadioactiveDamage(player)
							break
						end
					end
				end	
				
				-- Main inventory
				local inventory = player.valid and player.get_main_inventory()
				if inventory and inventory.valid and not inventory.is_empty() then
					for _, item_name in pairs(global.krastorio.radioactive_items) do
						if inventory.get_item_count(item_name) > 0 then
							doRadioactiveDamage(player)
							break
						end
					end
				end		
				
				-- Trash inventory
				local trash_inventory = character.valid and character.get_inventory(defines.inventory.character_trash)
				if trash_inventory and trash_inventory.valid and not trash_inventory.is_empty() then
					for _, item_name in pairs(global.krastorio.radioactive_items) do
						if trash_inventory.get_item_count(item_name) > 0 then
							doRadioactiveDamage(player)
							break
						end
					end
				end	
				-------------------
			end
		end
		global.krastorio.radioactivity_lock = true
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