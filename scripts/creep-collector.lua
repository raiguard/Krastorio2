local flib_bounding_box = require("__flib__.bounding-box")
local flib_position = require("__flib__.position")

local util = require("scripts.util")

local min_collection_rate = 30
local max_collection_rate = 80

--- @param e EventData.on_player_selected_area
local function on_player_selected_area(e)
  if e.item ~= "kr-creep-collector" then
    return
  end

  local player = game.get_player(e.player_index)
  if not player then
    return
  end

  local player_pos = player.position

  if #e.entities > 0 then
    util.flying_text_with_sound(
      player,
      { "message.kr-enemy-entities-nearby" },
      { position = flib_bounding_box.center(e.area) }
    )
    return
  end

  local tiles_to_set = {}
  local i = 0
  for _, tile in pairs(e.tiles) do
    if flib_position.distance(tile.position, player_pos) <= player.reach_distance then
      i = i + 1
      tiles_to_set[i] = { name = tile.hidden_tile or "landfill", position = tile.position }
    end
  end

  if i > 0 then
    local percentage = math.random(min_collection_rate, max_collection_rate)
    local collected_amount = math.ceil(i * (percentage / 100)) --[[@as uint]]
    local inventory = player.get_main_inventory()
    if not inventory then
      return
    end
    if inventory.can_insert({ name = "biomass", count = collected_amount }) then
      inventory.insert({ name = "biomass", count = collected_amount })
      e.surface.set_tiles(tiles_to_set)

      util.flying_text_with_sound(player, { "message.kr-collected-amount", collected_amount, { "item-name.biomass" } }, {
        position = flib_bounding_box.center(e.area),
        sound = { path = "kr-collect-creep", volume_modifier = 1 },
      })
    else
      util.flying_text_with_sound(
        player,
        { "message.kr-inventory-is-full" },
        { position = flib_bounding_box.center(e.area) }
      )
    end
  else
    util.flying_text_with_sound(
      player,
      { "message.kr-no-creep-in-selection" },
      { position = flib_bounding_box.center(e.area) }
    )
  end
end

local creep_collector = {}

creep_collector.events = {
  [defines.events.on_player_selected_area] = on_player_selected_area,
  [defines.events.on_player_alt_selected_area] = on_player_selected_area,
}

return creep_collector
