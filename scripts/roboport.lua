local gui = require("__flib__.gui")

local constants = require("scripts.constants")
local util = require("scripts.util")

local roboport = {}

-- GUI

local function radio_button(name, caption, gui_name, mode)
  return {
    type = "radiobutton",
    name = name,
    caption = caption,
    state = false,
    actions = {
      on_checked_state_changed = { gui = gui_name, action = "change_mode", mode = mode },
    },
  }
end

function roboport.refresh_gui(player)
  roboport.destroy_gui(player.index)

  global.roboport_guis[player.index] = gui.add(player.gui.relative, {
    type = "frame",
    caption = { "gui.kr-change-mode" },
    anchor = {
      gui = defines.relative_gui_type.roboport_gui,
      position = defines.relative_gui_position.right,
      names = global.roboport_has_variants_gui,
    },
    {
      type = "frame",
      name = "inner_frame",
      style = "inside_shallow_frame_with_padding",
      direction = "vertical",
      radio_button("normal", { "message.kr-normal-mode" }, "roboport", "normal"),
      radio_button("construction", { "message.kr-construction-mode" }, "roboport", "construction"),
      radio_button("logistic", { "message.kr-logistic-mode" }, "roboport", "logistic"),
    },
  })
end

function roboport.destroy_gui(player_index)
  local player_gui = global.roboport_guis[player_index]
  if player_gui and player_gui.valid then
    player_gui.destroy()
  end
end

function roboport.update_gui(player, entity)
  local player_gui = global.roboport_guis[player.index]
  if player_gui and player_gui.valid then
    local _, _, mode = string.find(entity.name, "^.*%-(%w*)%-mode")
    mode = mode or "normal"

    for _, button in pairs(player_gui.inner_frame.children) do
      if button.name == mode then
        button.state = true
      else
        button.state = false
      end
    end
  end
end

function roboport.handle_gui_action(msg, e)
  if msg.action == "change_mode" then
    local player = game.get_player(e.player_index)
    if not player.opened_gui_type == defines.gui_type.entity then
      return
    end

    local entity = player.opened
    if not entity.valid or entity.type ~= "roboport" then
      return
    end

    roboport.change_mode(entity, player, msg.mode)
  end
end

-- GENERAL

function roboport.init()
  global.roboport_guis = {}
end

function roboport.find_variants()
  -- Find all compatible roboports
  local has_variants_gui = {}
  for _, entity in pairs(game.get_filtered_entity_prototypes({ { filter = "type", type = "roboport" } })) do
    local matched, _, base_name = string.find(entity.name, "^(.-)%-%w*%-mode")
    if matched then
      has_variants_gui[base_name] = true
      has_variants_gui[entity.name] = true
    end
  end

  -- Convert to a format usable by GuiAnchor
  local output = {}
  local i = 0
  for entity in pairs(has_variants_gui) do
    i = i + 1
    output[i] = entity
  end

  global.roboport_has_variants_gui = output
end

function roboport.change_mode(entity, player, to_mode)
  local matched, _, base_name, suffix = string.find(entity.name, "^(.-)(%-%w-%-mode)$")
  if not matched then
    base_name = entity.name
    suffix = ""
  end

  local new_mode_data
  if to_mode then
    new_mode_data = constants.roboport_modes[to_mode]
  else
    new_mode_data = constants.roboport_modes[constants.next_roboport_mode[suffix]]
  end

  local new_name = base_name .. new_mode_data.suffix

  if not game.entity_prototypes[new_name] then
    util.flying_text_with_sound(player, { "message.kr-roboport-modes-not-supported" }, { position = entity.position })
    return
  end

  local energy = entity.energy
  local health = entity.health

  -- Find all players that have this roboport open
  -- This must be done before the roboport is swapped
  local guis_to_update = {}
  for player_index in pairs(global.roboport_guis) do
    local player = game.get_player(player_index)
    if player.opened_gui_type == defines.gui_type.entity then
      local opened = player.opened
      if opened and opened == entity then
        table.insert(guis_to_update, player)
      end
    end
  end

  local new_entity = entity.surface.create_entity({
    name = new_name,
    position = entity.position,
    force = entity.force,
    direction = entity.direction,
    fast_replace = true,
    raise_built = true,
    spill = false,
    create_build_effect_smoke = false,
  })

  if new_entity then
    new_entity.energy = energy
    new_entity.health = health
    new_entity.last_user = player

    util.change_mode_fx(new_entity, { "message.kr-" .. new_mode_data.text .. "-mode" }, new_mode_data.color)

    -- Re-open GUI for all players who had it open and update the radio buttons
    for _, player in pairs(guis_to_update) do
      player.opened = new_entity
      roboport.update_gui(player, new_entity)
    end
  end
end

return roboport
