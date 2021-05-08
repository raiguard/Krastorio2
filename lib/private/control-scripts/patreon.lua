--- list of whilisted user
local krastorio_high_patreons =
{
  -- Mod Developers
  ["krastor"] = true,
  ["linver"] = true,
  ["Raiguard"] = true,
  -- Factorio Developers
  ["bilka"] = true,
  ["kovarex"] = true,
  ["slpwnd"] = true,
  ["glex"] = true,
  ["twinsen"] = true,
  ["posila"] = true,
  ["oxyd"] = true,
  ["rseding"] = true,
  ["v453000"] = true,
  ["klonan"] = true,
  ["wheybags"] = true,
  ["zopa"] = true,
  -- Patreons
  ["astazora"] = true,
  ["biusart"] = true,
  ["mkaito"] = true,
  ["dmitrii"] = true,
  ["egdod"] = true,
  ["cvamp"] = true,
  ["dr.feelgood999"] = true,
  ["darkstroker"] = true,
  ["andromedafallen"] = true,
  ["andrewskier"] = true,
  ["aski_raven"] = true,
  ["wassabee"] = true,
  ["jonasrejman"] = true,
  ["melphin"] = true,
  ["moonded"] = true,
  ["reysdad"] = true,
  ["rivsung"] = true,
  ["grumblesxl"] = true,
  ["pandabeezy"] = true,
  ["nukeufo"] = true,
  ["therightmark"] = true,
  ["senard"] = true,
  ["jkkelley86"] = true,
  ["rougefallout365"] = true,
  ["gbs5009"] = true,
  ["vladhc"] = true,
  ["tobi"] = true,
  ["tobivollebregt"] = true,
  ["max.perry"] = true,
  ["djnaphthalin"] = true,
  ["circk"] = true,
  ["dusk88"] = true,
  ["generaltank"] = true,
  ["lordfish"] = true,
  ["zippyit"] = true,
  ["sollevix"] = true,
  ["tobi"] = true,
  ["quezler"] = true,
  ["antt1995"] = true
}

-- lists of patreons
local patreons_list = require("__Krastorio2__/lib/private/control-scripts/control-lib/patreon-names")

function isHighLevelPatreon(name)
  if krastorio_high_patreons[string.lower(name)] then
    return true
  end
  for i, supporter in pairs(patreons_list.getHighSupportersList()) do
    if string.lower(supporter) == string.lower(name) then
      return true
    end
  end

  return false
end

-- Patreon Stuff
function givePatreonItems(event)
  local player = game.players[event.player_index]
  if player and player.character ~= nil and isHighLevelPatreon(player.name) then
    local inventory = player.get_main_inventory()
    local patreon_items =
    {
      { name="kr-shelter-plus", count=1 },
      { name="kr-accelerator", count=1 },
      { name="firearm-magazine", count=190 },
      { name="potato", count=6 }
    }
    if inventory and inventory.valid then
      for _, item in pairs(patreon_items) do
        if inventory.can_insert(item) then
          inventory.insert(item)
        end
      end
      global.patreon_item_given[player.name] = true
    end
    player.print({"other.kr-patreon-stuff-success"})
  end
end

-- Commands
local function tryToGetPatreonItems(command)
  local player = game.players[command.player_index]
  if player then
    if isHighLevelPatreon(player.name) then
      if global.patreon_item_given[player.name] then
        player.print({"other.kr-patreon-stuff-error"})
      else
        givePatreonItems(command)
      end
    elseif player.character ~= nil then
      local inventory = player.get_main_inventory()
      if inventory.can_insert({ name="spoiled-potato", count=1 }) then
        inventory.insert({ name="spoiled-potato", count=1 })
      end
      local num = math.random(1, 3)
      player.print({"other.kr-patreon-stuff-fail-"..tostring(num)})
    end
  end
end
-- Associate function to command
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
  { givePatreonItems, "on_cutscene_cancelled" },
  { givePatreonItems, "on_player_created" }
}

