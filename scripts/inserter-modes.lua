local math = require("__flib__.math")

local constants = require("scripts.constants")
local util = require("scripts.util")

local inserter_modes = {}

local function change_lane(entity, is_near)
  -- Change lane
  local drop_pos_vector = {
    x = entity.drop_position.x - entity.position.x,
    y = entity.drop_position.y - entity.position.y,
  }
  local vector_length = math.sqrt(drop_pos_vector.x * drop_pos_vector.x + drop_pos_vector.y * drop_pos_vector.y)
  is_near = is_near ~= nil or math.fmod(vector_length, 1.0) < 0.5
  local dpf = constants.inserter_drop_vectors[is_near][entity.direction]
  entity.drop_position = {
    entity.position.x + math.round(drop_pos_vector.x) + dpf[1],
    entity.position.y + math.round(drop_pos_vector.y) + dpf[2],
  }
  -- Special effects
  util.change_mode_fx(
    entity,
    is_near and {"message.kr-drop-near"} or {"message.kr-drop-far"},
    constants.mode_change_flying_text_color
  )
end

function inserter_modes.on_inserter_change_hotkey(e)
  local player = game.get_player(e.player_index)
  local selected = player.selected
  if selected and selected.valid and selected.type == "inserter" then
    change_lane(selected)
  end
end

-- TODO: Add relative GUI

return inserter_modes
