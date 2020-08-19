local patreons_list = require("__Krastorio2__/lib/private/control-scripts/control-lib/patreon-names")

local function createThanksList()
	list = ""
	for i, supporter in pairs(patreons_list.getHighSupportersList()) do
		list = list .. "[font=heading-2]" .. 
		       supporter ..  
			   " [/font], "
	end
	return list
end

local function thanksOnPlayerJoin(event)	
	if 
		(event.name == defines.events["on_cutscene_cancelled"] and event.player_index <= 1) or
		(event.name == defines.events["on_player_joined_game"] and event.player_index > 1)
	then
		local player = game.players[event.player_index]
		if not global.thanks_printed then
			global.thanks_printed = {}
		end		
		if not (global.thanks_printed[player.name] == true) then
			global.thanks_printed[player.name] = true
			player.print
			(
				"[font=default-large-bold]Welcome back to Krastorio![/font] [img=virtual-signal/kr-krastorio]\n" ..
				"[font=heading-1]This mod was created thanks to the support and kind words of many people from all over the world! Thank you! We also want to give special thanks to the Factorio developers and people who have been very active in supporting us:[/font]\n\n[font=heading-2]AstaZora[/font], [font=heading-2]Bilka[/font], [font=heading-2]BiusArt[/font], [font=heading-2]Xon[/font], " ..
				createThanksList() .. 
				"\n\n[font=heading-1]...and thanks to everyone who has supported us, especially the translators who helped us to translate K2 into many languages. You are all awesome! Thank you all![img=virtual-signal/kr-heart] [/font]\n\n",
				{1.0, 1.0, 0.2, 1.0}
			)
			player.print
			(
				{"other.wiki-info"},
				{1.0, 1.0, 0.2, 1.0}
			)
		end
	end
end

-- With control-callbacks-merger
return
{
	-- -- Bootstrap
	{ thanksOnPlayerJoin, "on_cutscene_cancelled" },
    { thanksOnPlayerJoin, "on_player_joined_game" }
}
