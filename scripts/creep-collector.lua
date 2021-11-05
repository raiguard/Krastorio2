local area = require("__flib__.area")
local math = require("__flib__.math")
local misc = require("__flib__.misc")

local constants = require("scripts.constants")
local util = require("scripts.util")

local creep_collector = {}

function creep_collector.collect(player, surface, tiles, sel_area)
  local player_pos = player.position

  local tiles_to_set = {}
  local i = 0
  for _, tile in pairs(tiles) do
    if misc.get_distance(tile.position, player_pos) <= constants.creep_max_reach then
      i = i + 1
      tiles_to_set[i] = { name = tile.hidden_tile or "landfill", position = tile.position }
    end
  end

  if i > 0 then
    local percentage = math.random(constants.creep_collection_rate.min, constants.creep_collection_rate.max)
    local collected_amount = math.ceil(i * (percentage / 100))
    local inventory = player.get_main_inventory()
    if inventory.can_insert({ name = "biomass", count = collected_amount }) then
      inventory.insert({ name = "biomass", count = collected_amount })
      surface.set_tiles(tiles_to_set)

      util.flying_text_with_sound(player, { "message.kr-collected-amount", collected_amount, { "item-name.biomass" } }, {
        position = area.center(sel_area),
        sound = { path = "kr-collect-creep", volume_modifier = 1 },
      })
    else
      util.flying_text_with_sound(player, { "message.kr-inventory-is-full" }, { position = area.center(sel_area) })
    end
  else
    util.flying_text_with_sound(player, { "message.kr-no-creep-in-selection" }, { position = area.center(sel_area) })
  end
end

return creep_collector
