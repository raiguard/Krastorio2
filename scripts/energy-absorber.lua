local util = require("scripts.util")

--- @param e EventData.on_player_placed_equipment
local function on_player_placed_equipment(e)
  local equipment = e.equipment
  if not equipment.valid or equipment.name ~= "energy-absorber" then
    return
  end
  local grid = e.grid
  if not grid.valid then
    return
  end

  local player = game.get_player(e.player_index)
  if not player then
    return
  end

  if grid.get_contents()["energy-absorber"] <= 1 then
    return
  end

  -- Retrieve the equipment
  grid.take({ equipment = equipment, by_player = player })

  -- Return the item
  local cursor_stack = player.cursor_stack
  -- If we're holding another absorber
  if cursor_stack and cursor_stack.valid_for_read and cursor_stack.name == "energy-absorber" then
    cursor_stack.count = cursor_stack.count + 1 --[[@as uint]]
    -- If we're holding something else or the stack is empty
  elseif cursor_stack and player.clear_cursor() then
    cursor_stack.set_stack({ name = "energy-absorber", count = 1 })
  end

  -- Show the error
  if (global.error_message_tick[e.player_index] or 0) + 30 < game.ticks_played then
    util.flying_text_with_sound(player, { "message.kr-already-one-energy-absorber" })
  end
  global.error_message_tick[e.player_index] = game.ticks_played
end

local energy_absorber = {}

function energy_absorber.on_init()
  --- Holds the last tick that an energy absorber error message was displayed for each player
  --- @type table<number, number>
  global.error_message_tick = {}
end

energy_absorber.events = {
  [defines.events.on_player_placed_equipment] = on_player_placed_equipment,
}

return energy_absorber
