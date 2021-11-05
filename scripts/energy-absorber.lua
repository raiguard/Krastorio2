local util = require("scripts.util")

local energy_absorber = {}

-- Limit each grid to a single absorber
function energy_absorber.on_placed(e)
  local equipment = e.equipment
  if not equipment.valid or equipment.name ~= "energy-absorber" then
    return
  end
  local grid = e.grid
  if not grid.valid then
    return
  end

  local player = game.get_player(e.player_index)

  if grid.get_contents()["energy-absorber"] > 1 then
    -- Retrieve the equipment
    grid.take({ equipment = equipment, by_player = player })

    -- Return the item
    local cursor_stack = player.cursor_stack
    -- If we're holding another absorber
    if cursor_stack and cursor_stack.valid_for_read and cursor_stack.name == "energy-absorber" then
      cursor_stack.count = cursor_stack.count + 1
      -- If we're holding something else or the stack is empty
    elseif player.clear_cursor() then
      cursor_stack.set_stack({ name = "energy-absorber", count = 1 })
    end

    -- Show the error
    util.flying_text_with_sound(player, { "message.kr-already-one-energy-absorber" })
  end
end

return energy_absorber
