local supporters =
{
	{"Wassabee", 10},
	{"jonasrejman", 10},
	{"Saulius Zilis", 10},
	{"Rivsung", 10},	
	{"rcobbe", 6}
}

local function createThanksList()
	list = ""
	for i, supporter in pairs(supporters) do
		list = list .. "[font=default-large-semibold]" .. 
		       supporter[1] ..  
			   " with " .. "[color=green]$" .. supporter[2] .. "[/color]" .. " for month [/font]\n"
	end
	return list
end

local function thanksOnPlayerJoin(event)	
	game.players[event.player_index].print
	(
		"[font=heading-1]Welcome back to Krastorio![/font] [img=virtual-signal/kr-krastorio]\n" ..
		"[font=heading-2]This mod is developing thanks to our subscribers! And we would like to thank these people who supported us on Patreon more than other:[/font]\n" ..
		"[font=heading-2]We also go to say special thanks to our top Patrons:[/font]\n" ..
		createThanksList() .. 
		"[font=heading-2]and thanks to all others that support us, thank you all![/font]\n\n",
		{1.0, 1.0, 0.2, 1.0}
	)
	game.players[event.player_index].print
	(
		{"other.wiki-info"},
		{1.0, 1.0, 0.2, 1.0}
	)
end

-- With control-callbacks-merger
if #supporters > 0 then
	return
	{
		-- -- Bootstrap
		{ thanksOnPlayerJoin, "on_player_created" }    
	}
else
	return {}
end