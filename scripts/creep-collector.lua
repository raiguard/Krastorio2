local area = require("__flib__.area")
local math = require("__flib__.math")
local misc = require("__flib__.misc")

local constants = require("scripts.constants")
local util = require("scripts.util")

local creep_collector = {}

--- @param e on_player_selected_area|on_player_alt_selected_area
function creep_collector.collect(e)
  local player = game.get_player(e.player_index) --[[@as LuaPlayer]]
  local player_pos = player.position

  if #e.entities > 0 then
    util.flying_text_with_sound(player, { "message.kr-enemy-entities-nearby" }, { position = area.center(e.area) })
    return
  end

  local tiles_to_set = {}
  local i = 0
  for _, tile in pairs(e.tiles) do
    if
      misc.get_distance(tile.position --[[@as MapPosition]], player_pos) <= player.reach_distance
    then
      i = i + 1
      tiles_to_set[i] = { name = tile.hidden_tile or "landfill", position = tile.position }
    end
  end

  if i > 0 then
    local percentage = math.random(constants.creep_collection_rate.min, constants.creep_collection_rate.max)
    local collected_amount = math.ceil(i * (percentage / 100)) --[[@as uint]]
    local inventory = player.get_main_inventory()
    if not inventory then
      return
    end
    if inventory.can_insert({ name = "biomass", count = collected_amount }) then
      inventory.insert({ name = "biomass", count = collected_amount })
      e.surface.set_tiles(tiles_to_set)

      util.flying_text_with_sound(player, { "message.kr-collected-amount", collected_amount, { "item-name.biomass" } }, {
        position = area.center(e.area),
        sound = { path = "kr-collect-creep", volume_modifier = 1 },
      })
    else
      util.flying_text_with_sound(player, { "message.kr-inventory-is-full" }, { position = area.center(e.area) })
    end
  else
    util.flying_text_with_sound(player, { "message.kr-no-creep-in-selection" }, { position = area.center(e.area) })
  end
end

return creep_collector
