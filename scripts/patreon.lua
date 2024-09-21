local util = require("scripts.util")

local patreon_items = {
  { name = "kr-shelter-plus", count = 1 },
  { name = "kr-accelerator", count = 1 },
  { name = "firearm-magazine", count = 190 },
  { name = "potato", count = 6 },
}

local high_patrons = {
  -- Mod Developers
  ["krastor"] = true,
  ["linver"] = true,
  ["raiguard"] = true,
  -- Factorio Developers
  ["bilka"] = true,
  ["glex"] = true,
  ["klonan"] = true,
  ["kovarex"] = true,
  ["oxyd"] = true,
  ["posila"] = true,
  ["rseding"] = true,
  ["slpwnd"] = true,
  ["twinsen"] = true,
  ["v453000"] = true,
  ["wheybags"] = true,
  ["zopa"] = true,
  -- High patrons
  ["andrewskier"] = true,
  ["andromedafallen"] = true,
  ["antt1995"] = true,
  ["aski_raven"] = true,
  ["astazora"] = true,
  ["biusart"] = true,
  ["circk"] = true,
  ["cvamp"] = true,
  ["darkstroker"] = true,
  ["djnaphthalin"] = true,
  ["dmitrii"] = true,
  ["dr.feelgood999"] = true,
  ["dusk88"] = true,
  ["egdod"] = true,
  ["gbs5009"] = true,
  ["generaltank"] = true,
  ["grumblesxl"] = true,
  ["jkkelley86"] = true,
  ["jonasrejman"] = true,
  ["lordfish"] = true,
  ["max.perry"] = true,
  ["melphin"] = true,
  ["mkaito"] = true,
  ["moonded"] = true,
  ["nukeufo"] = true,
  ["pandabeezy"] = true,
  ["quezler"] = true,
  ["reysdad"] = true,
  ["rivsung"] = true,
  ["rougefallout365"] = true,
  ["senard"] = true,
  ["sollevix"] = true,
  ["therightmark"] = true,
  ["tobi"] = true,
  ["tobivollebregt"] = true,
  ["vladhc"] = true,
  ["wassabee"] = true,
  ["zippyit"] = true,
  -- High supporters
  ["alright"] = true,
  ["andrew deren"] = true,
  ["andromeda fallen"] = true,
  ["arun bhat"] = true,
  ["aski raven"] = true,
  ["austin"] = true,
  ["bob"] = true,
  ["brayden mclean"] = true,
  ["chris hazen"] = true,
  ["donut7163"] = true,
  ["george elliott-hunter"] = true,
  ["george simpson"] = true,
  ["ivan devyatko"] = true,
  ["james kelley"] = true,
  ["jan dragsbæk"] = true,
  ["jan šipr"] = true,
  ["john wrangle"] = true,
  ["jonas rejman"] = true,
  ["josh strunk"] = true,
  ["konstantin popichev"] = true,
  ["koshirun treebone"] = true,
  ["mark harrison"] = true,
  ["matt tyler"] = true,
  ["maximilian bork"] = true,
  ["rcobbe"] = true,
  ["russell obets"] = true,
  ["saulius zilis"] = true,
  ["vladimir kravtsov"] = true,
  ["windsinger"] = true,
  ["zoey oliva"] = true,
  ["сергій руденко"] = true,
  -- Low supporters (< 9 dollars)
  -- These don't get perks, but are here for posterity
  -- ["adrian leonhard"] = true,
  -- ["andrew spade"] = true,
  -- ["billbo99"] = true,
  -- ["chanz"] = true,
  -- ["charles paquin"] = true,
  -- ["chosen"] = true,
  -- ["craig a"] = true,
  -- ["dang quang"] = true,
  -- ["daniel vollmer"] = true,
  -- ["deterlo"] = true,
  -- ["dirk m"] = true,
  -- ["donny"] = true,
  -- ["gareth knowles"] = true,
  -- ["hackerman"] = true,
  -- ["igor borisov"] = true,
  -- ["jmsantos94"] = true,
  -- ["justsoul"] = true,
  -- ["kai-chi huang"] = true,
  -- ["kartikay bagla"] = true,
  -- ["loïc gremaud"] = true,
  -- ["marco montemarani"] = true,
  -- ["mopolo"] = true,
  -- ["niv"] = true,
  -- ["nozoki"] = true,
  -- ["pavlo bulanchuk"] = true,
  -- ["paweł g."] = true,
  -- ["peter50216"] = true,
  -- ["peter zelenay"] = true,
  -- ["raymond"] = true,
  -- ["raymond lau"] = true,
  -- ["ryan"] = true,
  -- ["ryan barker"] = true,
  -- ["seleck"] = true,
  -- ["shafnir"] = true,
  -- ["showwin"] = true,
  -- ["simon harvey"] = true,
  -- ["srdis"] = true,
  -- ["webchip"] = true,
  -- ["wolfgang weber"] = true,
  -- ["влад"] = true,
  -- ["сергей ложкин"] = true,
}

--- @param player LuaPlayer
--- @param used_console boolean
local function give_items(player, used_console)
  local inventory = player.get_main_inventory()
  if not inventory or not inventory.valid then
    return
  end

  if high_patrons[string.lower(player.name)] then
    -- Check if we've already given them the items
    if storage.patreon_items_given[player.index] then
      player.print({ "message.kr-already-got-patreon-items" })
      return
    end

    -- Give items
    for _, item in pairs(patreon_items) do
      if prototypes.item[item.name] then
        inventory.insert(item)
      end
    end

    storage.patreon_items_given[player.index] = true
    player.print({ "message.kr-received-patreon-items" })
  elseif used_console then
    player.print({ "message.kr-not-a-patron" })
    if prototypes.item["spoiled-potato"] then
      inventory.insert({ name = "spoiled-potato", count = 1 })
    end
  end
end

--- @param e EventData.on_player_created|EventData.on_cutscene_cancelled
local function on_give_items(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  give_items(player, false)
end

local patreon = {}

function patreon.on_init()
  --- @type table<uint, boolean>
  storage.patreon_items_given = {}
end

patreon.events = {
  [defines.events.on_cutscene_cancelled] = on_give_items,
  [defines.events.on_player_created] = on_give_items,
}

util.add_commands({
  ["kr-give-patreon-items"] = function(e)
    local player = game.get_player(e.player_index) --[[@as LuaPlayer]]
    patreon.give_items(player, true)
  end,
})

return patreon
