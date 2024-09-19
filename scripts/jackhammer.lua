local flib_bounding_box = require("__flib__.bounding-box")
local flib_position = require("__flib__.position")

local util = require("scripts.util")

local max_reach = 15

--- @param e EventData.on_player_selected_area
local function on_player_selected_area(e)
  if e.item ~= "kr-jackhammer" then
    return
  end

  local player = game.get_player(e.player_index)
  if not player then
    return
  end

  local player_pos = player.position

  local items_to_give = {}
  local tiles_to_set = {}
  local i = 0
  for _, tile in pairs(e.tiles) do
    if flib_position.distance(tile.position, player_pos) > max_reach then
      goto continue
    end

    local mineable = tile.prototype.mineable_properties
    local products = mineable.products
    if not mineable or not products or not mineable.minable then
      goto continue
    end

    i = i + 1
    tiles_to_set[i] = { name = tile.hidden_tile or "landfill", position = tile.position }
    for _, product_ident in pairs(products) do
      local probability = product_ident.probability
      if product_ident.type == "item" and not probability or math.random() <= probability then
        local amount = product_ident.amount
        if not amount then
          amount = math.random(product_ident.amount_min, product_ident.amount_max)
        end
        local name = product_ident.name
        items_to_give[name] = (items_to_give[name] or 0) + amount
      end
    end

    ::continue::
  end

  if i > 0 then
    -- Check if we can insert all of the items
    local inventory = player.get_main_inventory()
    if not inventory then
      return
    end
    for name, count in pairs(items_to_give) do
      -- If we can't fit all of the items, print a message and don't take any tiles
      if not inventory.can_insert({ name = name, count = count }) then
        util.flying_text_with_sound(
          player,
          { "message.kr-inventory-is-full" },
          { position = flib_bounding_box.center(e.area) }
        )
        return
      end
    end

    -- Insert all of the items
    local inserted_count = 0
    for name, count in pairs(items_to_give) do
      inventory.insert({ name = name, count = count })
      inserted_count = inserted_count + count
    end

    -- Set the tiles
    e.surface.set_tiles(tiles_to_set)

    -- FX
    player.play_sound({ path = "kr-jackhammer", volume_modifier = 1 })
  else
    util.flying_text_with_sound(
      player,
      { "message.kr-no-tiles-in-selection" },
      { position = flib_bounding_box.center(e.area) }
    )
  end
end

local jackhammer = {}

jackhammer.events = {
  [defines.events.on_player_selected_area] = on_player_selected_area,
  [defines.events.on_player_alt_selected_area] = on_player_selected_area,
}

return jackhammer
