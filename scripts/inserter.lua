local math = require("__flib__.math")

local constants = require("scripts.constants")
local util = require("scripts.util")

local inserter = {}

function inserter.init()
  global.temp_inserter_settings = {}
end

function inserter.change_lane(entity, is_near)
  -- Change lane
  local drop_pos_vector = {
    x = entity.drop_position.x - entity.position.x,
    y = entity.drop_position.y - entity.position.y,
  }
  local vector_length = math.sqrt(drop_pos_vector.x * drop_pos_vector.x + drop_pos_vector.y * drop_pos_vector.y)
  is_near = is_near ~= nil or vector_length % 1 < 0.5
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

function inserter.save_settings(inserter)
  global.temp_inserter_settings[inserter.unit_number] = {
    drop_position = inserter.drop_position,
    pickup_position = inserter.pickup_position,
  }
end

function inserter.copy_settings(source, destination)
  local temp_settings = global.temp_inserter_settings[destination.unit_number]
  if not temp_settings then return end
  global.temp_inserter_settings[destination.unit_number] = nil

  local source_prototype = source.prototype
  local destination_prototype = destination.prototype

  if
    (source_prototype.inserter_pickup_position[1] ~= destination_prototype.inserter_pickup_position[1])
    or (source_prototype.inserter_pickup_position[2] ~= destination_prototype.inserter_pickup_position[2])
    or (source_prototype.inserter_drop_position[1] ~= destination_prototype.inserter_drop_position[1])
    or (source_prototype.inserter_drop_position[2] ~= destination_prototype.inserter_drop_position[2])
  then
    destination.pickup_position = temp_settings.pickup_position
    destination.drop_position = temp_settings.drop_position
  end
end

-- TODO: Add relative GUI

return inserter
