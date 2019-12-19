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
	"used-up-uranium-fuel-cell"
}
local radioactive_area_offset = 5

function doRadioactiveDamage(player, position)
	player.surface.create_entity
	{
		["name"]            = "radioactive-damage", 
		["target"]          = player.character, 
		["source_position"] = position, 
		["position"]        = position, 
		["duration"]        = 5
	}
end

local function radioactivity()
	for i, player in pairs(game.connected_players) do
		if player.character then 
			local position = player.character.position
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
				doRadioactiveDamage(player, position)
			end
			-- Items damages
			local inventory = player.get_main_inventory()
			if not inventory.is_empty() then
				for _, item_name in pairs(radioactive_items) do
					if inventory.get_item_count(item_name) > 0 then
						doRadioactiveDamage(player, position)
					end
				end
			end
		end
	end
end

return
{
	{ radioactivity, "on_nth_tick", 10 }   
}