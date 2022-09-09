local constants = require("scripts.constants")

local freeplay = {}

function freeplay.add_bonus_items()
  if settings.startup["kr-bonus-items"].value and remote.interfaces["freeplay"] then
    local items = remote.call("freeplay", "get_created_items")
    for _, item in pairs(constants.bonus_items) do
      if game.item_prototypes[item.name] then
        items[item.name] = item.count
      end
    end
    remote.call("freeplay", "set_created_items", items)
  end
end

function freeplay.add_starting_items()
  if remote.interfaces["freeplay"] then
    local items = remote.call("freeplay", "get_created_items")

    -- Shelter
    items["kr-shelter"] = 1

    -- Electric poles
    if
      (game.active_mods["IndustrialRevolution"] or game.active_mods["aai-industry"])
      and game.item_prototypes["medium-electric-pole"]
    then
      items["medium-electric-pole"] = 10
    end

    remote.call("freeplay", "set_created_items", items)
  end
end

function freeplay.add_to_crash_site()
  if
    remote.interfaces["freeplay"]
    and remote.interfaces["freeplay"].get_disable_crashsite
    and not remote.call("freeplay", "get_disable_crashsite")
    and not remote.call("freeplay", "get_init_ran")
  then
    -- Add new entities
    local ship_parts = remote.call("freeplay", "get_ship_parts")
    for _, part in pairs(constants.freeplay_crash_site_parts) do
      ship_parts[#ship_parts + 1] = part
    end
    remote.call("freeplay", "set_ship_parts", ship_parts)
    -- If playing a treeless game, add wood to the spaceship
    local nauvis = game.get_surface("nauvis")
    if nauvis then
      local tree_setting = nauvis.map_gen_settings.autoplace_controls.trees
      if not tree_setting or tree_setting.size == 0 then
        -- Add wood to the ship inventory
        local items = remote.call("freeplay", "get_ship_items")
        -- This is overkill for base K2, but should provide for plenty of margin of error
        items["wood"] = 400
        remote.call("freeplay", "set_ship_items", items)
      end
    end
  end
end

function freeplay.disable_intro()
  if remote.interfaces["freeplay"] and not script.active_mods["space-exploration"] then
    remote.call("freeplay", "set_skip_intro", true)
  end
end

function freeplay.disable_rocket_victory()
  if remote.interfaces["silo_script"] then
    remote.call("silo_script", "set_no_victory", true)
  end
end

--- @param player LuaPlayer
function freeplay.show_intro(player)
  if remote.interfaces["freeplay"] and not script.active_mods["space-exploration"] then
    if game.is_multiplayer() then
      player.print({ "message.kr-intro" })
    else
      game.show_message_dialog({ text = { "message.kr-intro" } })
    end
  end
end

return freeplay
