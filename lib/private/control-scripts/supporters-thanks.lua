local patreons_list = require("__Krastorio2__/lib/private/control-scripts/control-lib/patreon-names")

local function createThanksList()
	list = ""
	for i, supporter in pairs(patreons_list.getHighSupportersList()) do
		list = list .. "[font=heading-2]" .. 
		       supporter[1] ..  
			   " [/font], "
	end
	return list
end

local function thanksOnPlayerJoin(event)	
	game.players[event.player_index].print
	(
		"[font=default-large-bold]Welcome back to Krastorio![/font] [img=virtual-signal/kr-krastorio]\n" ..
		"[font=heading-1]This mod is developing thanks to our community!\nAll this thanks to the support and kind words of many people from all over the world! Thank you! We also want to give special thanks to Factorio devs and people who have been especially active in supporting us:[/font]\n\n" ..
		createThanksList() .. 
		"\n\n[font=heading-1]and thanks to all others that support us, thank you all![/font]\n\n",
		{1.0, 1.0, 0.2, 1.0}
	)
	game.players[event.player_index].print
	(
		{"other.wiki-info"},
		{1.0, 1.0, 0.2, 1.0}
	)
end

-- With control-callbacks-merger
if #patreons_list.getHighSupportersList() > 0 then
	return
	{
		-- -- Bootstrap
		{ thanksOnPlayerJoin, "on_player_created" }    
	}
else
	return {}
end