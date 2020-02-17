local radioactive_entities =
{
	"uranium-ore"
}
local radioactive_items =
{
	-- Uranium
	"uranium-ore",
	"uranium-235",
	"uranium-238",
	"uranium-fuel-cell",
	"nuclear-fuel",
	"used-up-uranium-fuel-cell"
}
local radioactive_area_offset = 6

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

local function setupRadioactivityGlobalVariables()
	global.radioactivity_lock = true
end

local function radioactivity()
	if global.radioactivity_lock then	
		global.radioactivity_lock = false
		for _, player in pairs(game.connected_players) do
			local character = player.valid and player.character
			if character and character.valid then			
				local position = character.position
				-- Entities damages
				if player.surface.count_entities_filtered
				{
					name = radioactive_entities, 
					area =
					{
						{position.x - radioactive_area_offset, position.y - radioactive_area_offset}, 
						{position.x + radioactive_area_offset, position.y + radioactive_area_offset}
					}
				} > 0 
				then
					doRadioactiveDamage(player)				
				end
				-- Items damages				
				local inventory = player.valid and player.get_main_inventory()
				if inventory and inventory.valid and not inventory.is_empty() then
					for _, item_name in pairs(radioactive_items) do
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
	{ setupRadioactivityGlobalVariables, "on_init" },
	-- -- Actions
	{ radioactivity, "on_nth_tick", 20 }
}