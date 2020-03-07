-- Cheat Stuff
function giveBonusItems(event)
	local inventory = game.players[event.player_index].get_main_inventory()
	local bonus_items = 
	{
		{name="construction-robot", count=50},
		{name="modular-armor", count=1},
		{name="car", count=1},
		{name="big-battery-equipment", count=1},
		{name="personal-roboport-equipment", count=1},
		{name="small-portable-generator", count=2},
		{name="cliff-explosives", count=50},
		{name="landfill", count=50}
	}
	for _, item in pairs(bonus_items) do
		if inventory.can_insert(item) then
			inventory.insert(item)
		end
	end
end


if settings.startup["kr-bonus-items"] and settings.startup["kr-bonus-items"].value then
	return
	{
		{ giveBonusItems, "on_player_created" }
	}
else
	return {}
end
