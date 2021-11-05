local area = require("__flib__.area")
local math = require("__flib__.math")
local misc = require("__flib__.misc")

local constants = require("scripts.constants")
local util = require("scripts.util")

local jackhammer = {}

function jackhammer.collect(player, surface, tiles, sel_area)
  local player_pos = player.position

  local items_to_give = {}
  local tiles_to_set = {}
  local i = 0
  for _, tile in pairs(tiles) do
    if misc.get_distance(tile.position, player_pos) <= constants.jackhammer_max_reach then
      i = i + 1
      tiles_to_set[i] = { name = tile.hidden_tile or "landfill", position = tile.position }
      local mineable = tile.prototype.mineable_properties
      local products = mineable.products
      if mineable and mineable.minable and products then
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
      end
    end
  end

  if i > 0 then
    -- Check if we can insert all of the items
    local inventory = player.get_main_inventory()
    for name, count in pairs(items_to_give) do
      -- If we can't fit all of the items, print a message and don't take any tiles
      if not inventory.can_insert({ name = name, count = count }) then
        util.flying_text_with_sound(player, { "message.kr-inventory-is-full" }, { position = area.center(sel_area) })
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
    surface.set_tiles(tiles_to_set)

    -- FX
    player.play_sound({ path = "kr-jackhammer", volume_modifier = 1 })
  else
    util.flying_text_with_sound(player, { "message.kr-no-tiles-in-selection" }, { position = area.center(sel_area) })
  end
end

return jackhammer
