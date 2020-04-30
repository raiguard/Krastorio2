-- list of whilisted user
krastorio_patreons =
{
	["Krastor"] = true,
	["Linver"] = true,
	["mkaito"] = true,
	["Mkaito"] = true,
	["egdod"] = true,
	["Egdod"] = true,
	["cvamp"] = true,
	["Cvamp"] = true,
	["andrewskier"] = true,
	["AndrewSkier"] = true,
	["aski_raven"] = true,
	["Aski_Raven"] = true,
	["wassabee"] = true,
	["Wassabee"] = true,
	["jonasrejman"] = true,
	["Jonasrejman"] = true,
	["JonasRejman"] = true,
	["melphin"] = true,
	["Melphin"] = true,	
	["reysdad"] = true,
	["ReysDad"] = true,
	["Rivsung"] = true,
	["rivsung"] = true,
	["grumblesxl"] = true,
	["Grumblesxl"] = true,
	["pandabeezy"] = true,
	["Pandabeezy"] = true,
	["NukeUFO"] = true,
	["therightmark"] = true,
	["Therightmark"] = true,
	["TheRightMark"] = true,
	["senard"] = true,
	["Senard"] = true,
	["jkkelley86"] = true,
	["Jkkelley86"] = true,
	["rougefallout365"] = true,
	["Rougefallout365"] = true,
	["gbs5009"] = true,
	["Gbs5009"] = true,
	["lordfiSh"] = true,
	["LordfiSh"] = true,
	["zippyit"] = true,
	["Zippyit"] = true
}

-- Patreon Stuff
function givePatreonItems(event)
	if krastorio_patreons[game.players[event.player_index].name] then
		local inventory = game.players[event.player_index].get_main_inventory()
		local patreon_items = 
		{
			{ name="kr-shelter-plus", count=1 },
			{ name="kr-accelerator", count=1 },
			{ name="firearm-magazine", count=190 },
			{ name="potato", count=6 }
		}
		for _, item in pairs(patreon_items) do
			if inventory.can_insert(item) then
				inventory.insert(item)
			end
		end
		global.patreon_item_given[game.players[event.player_index].name] = true
		game.print({"other.kr-patreon-stuff-success"})
	end
end

-- Commands
local function tryToGetPatreonItems(command)
	if krastorio_patreons[game.players[command.player_index].name] then
		if global.patreon_item_given[game.players[command.player_index].name] then
			game.print({"other.kr-patreon-stuff-error"})
		else
			givePatreonItems(command)
		end
	else
		local inventory = game.players[command.player_index].get_main_inventory()
		if inventory.can_insert({ name="spoiled-potato", count=1 }) then
			inventory.insert({ name="spoiled-potato", count=1 })
		end
		game.print({"other.kr-patreon-stuff-fail"})
	end
end
-- Associate command to function
if not commands.commands["kr-patreon-stuff"] then
	commands.add_command("kr-patreon-stuff", {"other.kr-patreon-stuff-help"}, tryToGetPatreonItems)
end

-- Init
local function onInitAndConf()
	if not global.krastorio.script_initialization_status["patreons"] then
		initializePatreonsGlobalVariables()
		global.krastorio.script_initialization_status["patreons"] = true
	end
end
function initializePatreonsGlobalVariables()
	global.patreon_item_given = {}
end

return
{
	-- -- Bootstrap
	-- For setup variables
	{ onInitAndConf, "on_init" },
	{ onInitAndConf, "on_configuration_changed" },
	-- On new game
	{ givePatreonItems, "on_player_created" }
}
	