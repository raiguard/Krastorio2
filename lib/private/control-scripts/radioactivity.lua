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
	if player.character.valid then
		player.character.damage(8, "enemy", "radioactive")
		player.play_sound
		{
			path            = "radioactive",
			position        = player.character.position,
			volume_modifier = 0.5
		}
	end
end

local function radioactivity()
	for i, player in pairs(game.connected_players) do
		local character = player.character
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
			if character.valid then
				local inventory = player.get_main_inventory()
				if character.valid and not inventory.is_empty() then
					for _, item_name in pairs(radioactive_items) do
						if character.valid and inventory.get_item_count(item_name) > 0 then
							doRadioactiveDamage(player)
						end
					end
				end
			end
		end
	end
end

return
{
	{ radioactivity, "on_nth_tick", 20 }   
}