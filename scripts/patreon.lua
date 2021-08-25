local constants = require("scripts.constants")

local patreon = {}

function patreon.init()
  global.patreon_items_given = {}
end

function patreon.give_items(player)
  if constants.high_patrons[string.lower(player.name)] then
    -- Check if we've already given them the items
    if global.patreon_items_given[player.index] then
      player.print{"message.kr-already-got-patreon-items"}
    end
    global.patreon_items_given[player.index] = true

    local inventory = player.get_main_inventory()
    if not inventory or not inventory.valid then return end
    -- Give items
    for _, item in pairs(constants.patreon_items) do
      inventory.insert(item)
    end
    player.print{"message.kr-received-patreon-items"}
  else
    player.print{"message.kr-not-a-patron"}
  end
end

patreon.commands = {
  ["kr-give-patreon-items"] = function(e)
    local player = game.get_player(e.player_index)
    patreon.give_items(player)
  end
}

return patreon
