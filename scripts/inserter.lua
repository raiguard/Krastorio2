local gui = require("__flib__.gui")
local math = require("__flib__.math")

local constants = require("scripts.constants")
local util = require("scripts.util")

local inserter = {}

--- @param entity LuaEntity
local function get_is_far(entity)
  local drop_pos_vector = {
    x = entity.drop_position.x - entity.position.x,
    y = entity.drop_position.y - entity.position.y,
  }
  local vector_length = math.sqrt(drop_pos_vector.x * drop_pos_vector.x + drop_pos_vector.y * drop_pos_vector.y)
  return vector_length % 1 < 0.5, drop_pos_vector
end

--- @param player LuaPlayer
function inserter.refresh_gui(player)
  inserter.destroy_gui(player.index)

  global.inserter_guis[player.index] = gui.add(player.gui.relative, {
    type = "frame",
    caption = { "gui.kr-change-drop-lane" },
    anchor = {
      gui = defines.relative_gui_type.inserter_gui,
      position = defines.relative_gui_position.right,
      names = global.inserter_supports_droplanes_anchor,
    },
    {
      type = "frame",
      name = "inner_frame",
      style = "inside_shallow_frame_with_padding",
      direction = "vertical",
      {
        type = "switch",
        name = "switch",
        switch_state = "left",
        left_label_caption = { "gui.kr-near" },
        right_label_caption = { "gui.kr-far" },
        actions = {
          on_switch_state_changed = { gui = "inserter", action = "change_belt_lane" },
        },
      },
    },
  })
end

--- @param player_index uint
function inserter.destroy_gui(player_index)
  local player_gui = global.inserter_guis[player_index]
  if player_gui then
    if player_gui.valid then
      player_gui.destroy()
    end
    global.inserter_guis[player_index] = nil
  end
end

--- @param player LuaPlayer
--- @param entity LuaEntity
function inserter.update_gui(player, entity)
  local player_gui = global.inserter_guis[player.index]
  if player_gui and player_gui.valid then
    local is_far = get_is_far(entity)
    player_gui.inner_frame.switch.switch_state = is_far and "right" or "left"
  end
end

--- @param msg table
--- @param e GuiEventData
function inserter.handle_gui_action(msg, e)
  if msg.action == "change_belt_lane" then
    local player = game.get_player(e.player_index) --[[@as LuaPlayer]]
    if not player.opened_gui_type == defines.gui_type.entity then
      return
    end

    local entity = player.opened --[[@as LuaEntity?]]
    if not entity or not entity.valid or entity.type ~= "inserter" then
      return
    end

    inserter.change_lane(entity, player)
  end
end

-- GENERAL

function inserter.init()
  --- @type table<uint, LuaGuiElement>
  global.inserter_guis = {}
  global.temp_inserter_settings = {}
end

function inserter.find_droplanes()
  -- Find all compatible inserters
  local has_droplane_gui = {}
  for _, entity in pairs(game.get_filtered_entity_prototypes({ { filter = "type", type = "inserter" } })) do
    if entity.allow_custom_vectors and not string.find(entity.name, "%-?miniloader%-inserter") then
      has_droplane_gui[entity.name] = true
    end
  end

  -- Convert to a format usable by GuiAnchor
  local anchor = {}
  local i = 0
  for entity in pairs(has_droplane_gui) do
    i = i + 1
    anchor[i] = entity
  end

  global.inserter_supports_droplanes_anchor = anchor
  global.inserter_supports_droplanes = has_droplane_gui
end

--- @param entity LuaEntity
--- @param player LuaPlayer
function inserter.change_lane(entity, player)
  if not global.inserter_supports_droplanes[entity.name] then
    util.flying_text_with_sound(player, { "message.kr-cannot-change-inserter-drop-lane" })
    return
  end
  local is_far, drop_pos_vector = get_is_far(entity)

  -- Change lane
  local dpf = constants.inserter_drop_vectors[is_far][entity.direction]
  entity.drop_position = {
    entity.position.x + math.round(drop_pos_vector.x) + dpf[1],
    entity.position.y + math.round(drop_pos_vector.y) + dpf[2],
  }

  -- Special effects
  util.change_mode_fx(
    entity,
    is_far and { "message.kr-drop-near" } or { "message.kr-drop-far" },
    constants.mode_change_flying_text_color
  )

  -- Update all player GUIs that have this open
  for player_index in pairs(global.inserter_guis) do
    local player = game.get_player(player_index) --[[@as LuaPlayer]]
    if player.opened_gui_type == defines.gui_type.entity then
      local opened = player.opened
      if opened and opened == entity then
        inserter.update_gui(player, entity)
      end
    end
  end
end

--- @param entity LuaEntity
function inserter.save_settings(entity)
  global.temp_inserter_settings[entity.unit_number] = {
    drop_position = entity.drop_position,
    pickup_position = entity.pickup_position,
  }
end

--- @param source LuaEntity
--- @param destination LuaEntity
function inserter.copy_settings(source, destination)
  local temp_settings = global.temp_inserter_settings[destination.unit_number]
  if not temp_settings then
    return
  end
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

return inserter
