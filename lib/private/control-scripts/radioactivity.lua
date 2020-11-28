-- Remotes
if not remote.interfaces["kr-radioactivity"] then
	remote.add_interface("kr-radioactivity",
	{
		set_no_radioactivity = 
		function(bool)
			if type(bool) ~= "boolean" then 
				error("Value for 'set_no_radioactivity' must be a boolean.")
			end
			global.radioactivity_enabled = not bool
		end,
		add_radioactive_entity = 
		function(entity_name)
			if type(entity_name) ~= "string" then 
				error("Value for 'entity_name' must be a string.")
			end
			
			if not global.krastorio.radioactive_entities then
				global.krastorio.radioactive_entities = {}
			end
			table.insert(global.krastorio.radioactive_entities, entity_name)
		end,
		remove_radioactive_entity = 
		function(entity_name)
			if type(entity_name) ~= "string" then 
				error("Value for 'entity_name' must be a string.")
			end
			
			if global.krastorio.radioactive_entities then
				for i, name in pairs(global.krastorio.radioactive_entities) do
					if entity_name == name then
						table.remove(global.krastorio.radioactive_entities, i)
						break
					end
				end
			end
		end,
		add_radioactive_item = 
		function(item_name)
			if type(item_name) ~= "string" then 
				error("Value for 'item_name' must be a string.")
			end
			
			if not global.krastorio.radioactive_items then
				global.krastorio.radioactive_items = {}
			end
			table.insert(global.krastorio.radioactive_items, item_name)
		end,
		remove_radioactive_item = 
		function(item_name)
			if type(item_name) ~= "string" then 
				error("Value for 'item_name' must be a string.")
			end
			
			if global.krastorio.radioactive_items then
				for i, name in pairs(global.krastorio.radioactive_items) do
					if item_name == name then
						table.remove(global.krastorio.radioactive_items, i)
						break
					end
				end
			end
		end,
		set_radioactive_area_offset =
		function(radius)
			if type(radius) ~= "number" then 
				error("Value for 'radius' must be a number.")
			end
			if type(radius) < 1 then 
				error("Value for 'radius' must be greater of zero.")
			end
				
			global.krastorio.radioactive_area_offset = radius
		end
	})
end

-- Commands for users
if not commands.commands["kr-enable-radioactivity"] then
	local function enableRadioactivity()
		global.radioactivity_enabled = true
		game.print({"other.kr-enable-radioactivity"})
	end
	commands.add_command("kr-enable-radioactivity", {"other.kr-enable-radioactivity-help"}, enableRadioactivity)
end
if not commands.commands["kr-disable-radioactivity"] then
	local function disableRadioactivity()
		global.radioactivity_enabled = false
		game.print({"other.kr-disable-radioactivity"})
	end
	commands.add_command("kr-disable-radioactivity", {"other.kr-disable-radioactivity-help"}, disableRadioactivity)
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
	
	if game.active_mods["Nuclear Fuel"] then
		table.insert(global.krastorio.radioactive_items, "plutonium")
		table.insert(global.krastorio.radioactive_items, "breeder-fuel-cell")
		table.insert(global.krastorio.radioactive_items, "used-up-breeder-fuel-cell")
	end
	
	global.krastorio.radioactive_area_offset = 6
end

function doRadioactiveDamage(player)
	if player.valid and player.character and player.character.valid then
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
		player.add_custom_alert(character, {type="virtual", name="kr-nuclear-2"}, {"other.kr-taking-radioactive-damage"}, false)
	end
end

local function radioactivity()
	if global.radioactivity_enabled ~= false and global.krastorio.radioactivity_lock then	
		global.krastorio.radioactivity_lock = false
		for _, player in pairs(game.connected_players) do
			local character = player.valid and player.character
			local cursor_stack = false
			if player.valid and player.cursor_stack and player.cursor_stack.valid_for_read then
				cursor_stack = player.cursor_stack.name
			end
			if character and character.valid then			
				local position = character.position
				--local taken_damage = false
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
					--taken_damage = true
				end
				
				-- -- Items damages	
				-------------------
				-- Cursor item
				if cursor_stack then
					for _, item_name in pairs(global.krastorio.radioactive_items) do
						if cursor_stack == item_name then
							doRadioactiveDamage(player)
							--taken_damage = true
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
							--taken_damage = true
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
							--taken_damage = true
							break
						end
					end
				end	
				-------------------
				--if taken_damage == false then
					--player.remove_alert{entity=character, icon={type="virtual", name="kr-nuclear-2"}, message={"other.kr-taking-radioactive-damage"}}				
				--end
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