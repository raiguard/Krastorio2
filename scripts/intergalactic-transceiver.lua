local flib_gui = require("__flib__.gui")
local flib_math = require("__flib__.math")
local flib_position = require("__flib__.position")

local util = require("scripts.util")

--- @alias IntergalacticTransceiverStatus
--- | "charging"
--- | "discharging"
--- | "not_enough_input"
--- | "ready"

local defines_to_status = {
  [defines.entity_status.charging] = "charging",
  [defines.entity_status.discharging] = "discharging",
}

--- @type table<IntergalacticTransceiverStatus, { label: LocalisedString, sprite: SpritePath }>
local status_properties = {
  charging = {
    label = { "entity-status.charging" },
    icon = "utility/status_working",
  },
  discharging = {
    alert_label = { "gui.kr-intergalactic-transceiver-alert-discharging" },
    label = { "entity-status.discharging" },
    icon = "utility/status_not_working",
  },
  not_enough_input = {
    alert_label = { "gui.kr-intergalactic-transceiver-alert-not-enough-input" },
    label = { "entity-status.kr-not-enough-input" },
    icon = "utility/status_not_working",
    tooltip = { "entity-status-tooltip.kr-not-enough-input" },
  },
  no_power = {
    alert_label = { "gui.kr-intergalactic-transceiver-alert-no-power" },
    label = { "entity-status.no-power" },
    icon = "utility/status_not_working",
  },
  ready = {
    alert_label = { "gui.kr-intergalactic-transceiver-alert-ready" },
    label = { "entity-status.kr-ready" },
    icon = "utility/status_working",
  },
}

local min_charge_delta = 2.5e8 -- Requires charge rate of 15 GW
local max_charge_delta = 2e9
local max_energy = prototypes.entity["kr-intergalactic-transceiver"].electric_energy_source_prototype.buffer_capacity
  - max_charge_delta
local energy_drain = 50e9

--- @param transceiver_data IntergalacticTransceiverForceData
local function activate_transceiver(transceiver_data)
  local entity = transceiver_data.entity
  local entity_surface = entity.surface
  local entity_position = entity.position
  for _, player in pairs(entity.force.connected_players) do
    if player.surface == entity_surface and flib_position.distance(entity_position, player.position) <= 100 then
      if player.controller_type == defines.controllers.character then
        player.character.destructible = false
      end
      player.set_controller({
        type = defines.controllers.cutscene,
        waypoints = {
          {
            position = entity.position,
            zoom = 1.2,
            transition_time = 70,
            time_to_wait = 30,
          },
          {
            position = entity.position,
            zoom = 1.2,
            transition_time = 0,
            time_to_wait = 15,
          },
          {
            position = entity.position,
            zoom = 0.8,
            transition_time = 130,
            time_to_wait = 10,
          },
          {
            position = entity.position,
            zoom = 1.2,
            transition_time = 200,
            time_to_wait = 60,
          },
        },
        final_transition_time = 60,
      })
    end
  end
  storage.intergalactic_transceiver.in_cutscene[entity.force_index] = true
end

--- @param e EventData.on_cutscene_finished
local function on_cutscene_finished(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  if not storage.intergalactic_transceiver or not storage.intergalactic_transceiver.in_cutscene[player.force_index] then
    return
  end
  storage.intergalactic_transceiver.in_cutscene[player.force_index] = nil
  player.force.technologies["kr-logo"].enabled = true
  if player.character then
    player.character.destructible = true
  end
  if not storage.intergalactic_transceiver.is_victory then
    return
  end
  game.set_game_state({
    can_continue = true,
    game_finished = true,
    victorious_force = player.force,
    player_won = true,
  })
  player.force.play_sound({ path = "kr-win-joke-voice" })
end

--- @param e EventData.on_cutscene_waypoint_reached
local function on_cutscene_waypoint_reached(e)
  if not storage.intergalactic_transceiver then
    return
  end
  local player = game.get_player(e.player_index)
  if not player or not storage.intergalactic_transceiver.in_cutscene[player.force_index] then
    return
  end

  local transceiver_data = storage.intergalactic_transceiver.forces[player.force_index]
  if not transceiver_data then
    return
  end
  local entity = transceiver_data.entity
  if not entity.valid then
    return
  end

  if e.waypoint_index == 1 then
    entity.surface.create_entity({
      type = "projectile",
      name = "intergalactic-transceiver-wave",
      force = entity.force,
      position = entity.position,
      speed = 0,
      max_range = 100,
      target = entity,
      create_build_effect_smoke = false,
      raise_built = true,
    })
  elseif e.waypoint_index == 2 then
    local force = entity.force
    local player = entity.last_user
    local position = entity.position
    local surface = entity.surface
    entity.destroy()
    transceiver_data.activating = true
    local new_entity = surface.create_entity({
      name = "kr-activated-intergalactic-transceiver",
      position = position,
      force = force,
      player = player,
      create_build_effect_smoke = false,
      raise_built = true,
    })
    transceiver_data.activating = false
    if not new_entity or not new_entity.valid then
      return
    end
    storage.intergalactic_transceiver.forces[force.index] = { entity = new_entity }
  end
end

--- @param e EventData.on_gui_click
local function on_gui_window_closed(e)
  local self = storage.intergalactic_transceiver.guis[e.player_index]
  if not self then
    return
  end
  self.elems.kr_intergalactic_transceiver_window.destroy()
  self.player.opened = nil
  self.player.play_sound({ path = "entity-close/kr-intergalactic-transceiver" })
  storage.intergalactic_transceiver.guis[e.player_index] = nil
end

--- @param entity LuaEntity
local function close_open_guis(entity)
  for player_index, self in pairs(storage.intergalactic_transceiver.guis) do
    if self.entity == entity or not self.entity.valid then
      on_gui_window_closed({ player_index = player_index })
    end
  end
end

--- @param e EventData.on_gui_click
local function on_gui_activate_button_clicked(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  local transceiver_data = storage.intergalactic_transceiver.forces[player.force_index]
  close_open_guis(transceiver_data.entity)
  activate_transceiver(transceiver_data)
end

--- @param self IntergalacticTransceiverGuiData
local function update_gui(self)
  local charged = flib_math.round(self.entity.energy / max_energy, 0.01)
  local transceiver_data = storage.intergalactic_transceiver.forces[self.player.force_index]
  local status_properties = status_properties[transceiver_data.status]
  self.elems.status_icon.sprite = status_properties.icon
  self.elems.status_label.caption = status_properties.label
  self.elems.charge_progressbar.value = charged
  self.elems.charge_progressbar.caption = math.floor(charged * 100) .. " %"
  self.elems.activate_button.enabled = charged == 1
end

--- @param player LuaPlayer
--- @param entity LuaEntity
local function create_gui(player, entity)
  local elems = flib_gui.add(player.gui.screen, {
    type = "frame",
    name = "kr_intergalactic_transceiver_window",
    direction = "vertical",
    elem_mods = { auto_center = true },
    handler = { [defines.events.on_gui_closed] = on_gui_window_closed },
    {
      type = "flow",
      style = "flib_titlebar_flow",
      {
        type = "label",
        style = "frame_title",
        caption = { "entity-name.kr-intergalactic-transceiver" },
        ignored_by_interaction = true,
      },
      { type = "empty-widget", style = "flib_titlebar_drag_handle", ignored_by_interaction = true },
      {
        type = "sprite-button",
        style = "frame_action_button",
        sprite = "utility/close",
        mouse_button_filter = { "left" },
        handler = { [defines.events.on_gui_click] = on_gui_window_closed },
      },
    },
    {
      type = "frame",
      style = "entity_frame",
      direction = "vertical",
      {
        type = "flow",
        style_mods = { vertical_align = "center" },
        { type = "sprite", name = "status_icon", style = "flib_indicator" },
        { type = "label", name = "status_label" },
      },
      {
        type = "frame",
        style = "deep_frame_in_shallow_frame",
        { type = "entity-preview", style = "wide_entity_button", elem_mods = { entity = entity } },
      },
      {
        type = "progressbar",
        name = "charge_progressbar",
        style = "production_progressbar",
        style_mods = { horizontally_stretchable = true },
        value = 0,
      },
      {
        type = "button",
        name = "activate_button",
        style_mods = { horizontally_stretchable = true },
        caption = { "gui.kr-intergalactic-transceiver-activate" },
        enabled = false,
        handler = { [defines.events.on_gui_click] = on_gui_activate_button_clicked },
      },
    },
  })

  --- @class IntergalacticTransceiverGuiData
  storage.intergalactic_transceiver.guis[player.index] = {
    elems = elems,
    entity = entity,
    player = player,
  }

  player.opened = elems.kr_intergalactic_transceiver_window
  if not game.is_multiplayer() then
    player.play_sound({ path = "entity-open/kr-intergalactic-transceiver" })
  end
end

--- @param entity LuaEntity
local function on_transceiver_destroyed(entity)
  local force_index = entity.force.index
  storage.intergalactic_transceiver.forces[force_index] = nil
  close_open_guis(entity)
end

--- @param entity LuaEntity
local function on_inactive_transceiver_destroyed(entity)
  storage.intergalactic_transceiver.inactive[entity.unit_number] = nil
end

--- @param e EntityDestroyedEvent
local function on_entity_destroyed(e)
  local entity = e.entity
  if not entity or not entity.valid then
    return
  end

  if entity.name == "kr-intergalactic-transceiver" then
    on_transceiver_destroyed(entity)
  elseif entity.name == "kr-inactive-intergalactic-transceiver" then
    on_inactive_transceiver_destroyed(entity)
  end
end

--- @param entity LuaEntity
local function on_transceiver_built(entity)
  local existing = storage.intergalactic_transceiver.forces[entity.force.index]
  if existing then
    local position = entity.position
    local force = entity.force
    local player = entity.last_user
    local surface = entity.surface
    entity.destroy()

    local new_entity = surface.create_entity({
      name = "kr-inactive-intergalactic-transceiver",
      position = position,
      force = force,
      player = player,
      create_build_effect_smoke = false,
      raise_built = true,
    })
    if new_entity and new_entity.valid then
      storage.intergalactic_transceiver.inactive[new_entity.unit_number] = new_entity
    end

    return
  end

  --- @class IntergalacticTransceiverForceData
  storage.intergalactic_transceiver.forces[entity.force.index] = {
    activating = false,
    entity = entity,
    last_alert_tick = game.tick,
    last_energy = entity.energy,
    status = "empty",
  }
end

--- @param entity LuaEntity
local function on_active_transceiver_built(entity)
  local existing = storage.intergalactic_transceiver.forces[entity.force.index]
  if not existing or not existing.activating then
    local position = entity.position
    local force = entity.force
    local player = entity.last_user
    local surface = entity.surface
    entity.destroy()

    local new_entity = surface.create_entity({
      name = "kr-intergalactic-transceiver",
      position = position,
      force = force,
      player = player,
      create_build_effect_smoke = false,
      raise_built = true,
    })

    if new_entity and new_entity.valid then
      on_transceiver_built(new_entity)
    end
  end
end

--- @param e EntityBuiltEvent
local function on_entity_built(e)
  local entity = e.entity or e.destination
  if not entity or not entity.valid then
    return
  end

  if entity.name == "kr-intergalactic-transceiver" then
    on_transceiver_built(entity)
  elseif entity.name == "kr-activated-intergalactic-transceiver" then
    on_active_transceiver_built(entity)
  end
end

--- @param data IntergalacticTransceiverForceData
--- @param entity LuaEntity
local function update_transceiver(data, entity)
  if not data.last_energy then
    return
  end
  local current_energy = entity.energy
  local new_energy = current_energy
  local difference = current_energy - data.last_energy
  --- @type IntergalacticTransceiverStatus
  local status = "charging"
  -- If we're not receiving enough power
  if difference < min_charge_delta and current_energy > 0 then
    -- Drain the transceiver at 3 TJ / sec
    new_energy = math.max(0, current_energy - energy_drain)
    -- Update status
    if new_energy > 0 then
      status = "discharging"
    else
      status = "not_enough_input"
    end
  else
    if current_energy > max_energy then
      -- XXX: If the energy remains constant, the entity status will change to "normal", so give it a random offset.
      new_energy = max_energy + math.random(0, 20) * 1000000
      status = "ready"
    else
      local current_status = defines_to_status[entity.status]
      if status_properties[current_status] then
        status = current_status
      end
    end
  end

  if new_energy ~= current_energy then
    entity.energy = new_energy
  end
  local last_status = data.status
  data.last_energy = new_energy
  data.status = status

  local status_properties = status_properties[status]
  if status_properties and status_properties.alert_label and game.tick - data.last_alert_tick >= 60 then
    data.last_alert_tick = game.tick
    for _, player in pairs(entity.force.players) do
      player.add_custom_alert(
        entity,
        { type = "item", name = "kr-intergalactic-transceiver" },
        status_properties.alert_label,
        true
      )
      if status == "discharging" and last_status ~= status then
        player.play_sound({
          path = "kr-intergalactic-transceiver-discharging-warning",
        })
      end
    end
  end
end

--- @param e EventData.on_gui_opened
local function on_gui_opened(e)
  if storage.intergalactic_transceiver.guis[e.player_index] then
    return
  end
  if e.gui_type ~= defines.gui_type.entity then
    return
  end
  local entity = e.entity
  if not entity or entity.name ~= "kr-intergalactic-transceiver" then
    return
  end
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  create_gui(player, entity)
end

local function on_tick()
  if not storage.intergalactic_transceiver then
    return
  end

  local transceivers = storage.intergalactic_transceiver.forces
  for force_index, data in pairs(transceivers) do
    local entity = data.entity
    if entity and entity.valid then
      update_transceiver(data, entity)
    else
      transceivers[force_index] = nil
    end
  end

  for _, self in pairs(storage.intergalactic_transceiver.guis) do
    update_gui(self)
  end
end

local function on_180th_tick()
  if not storage.intergalactic_transceiver then
    return
  end
  for unit_number, entity in pairs(storage.intergalactic_transceiver.inactive) do
    if entity.valid then
      util.entity_flying_text(entity, { "message.kr-transceiver-is-inactive" }, { r = 1 })
    else
      storage.intergalactic_transceiver.inactive[unit_number] = nil
    end
  end
end

--- @class intergalactic_transceiver
local intergalactic_transceiver = {}

function intergalactic_transceiver.on_init()
  -- Can be already initialised through remote interface
  if storage.intergalactic_transceiver then
    return
  end
  storage.intergalactic_transceiver = {
    --- @type table<uint, IntergalacticTransceiverForceData>
    forces = {},
    --- @type table<uint, IntergalacticTransceiverGuiData>
    guis = {},
    --- @type table<uint, boolean>
    in_cutscene = {},
    --- @type table<uint, LuaEntity>
    inactive = {},
    is_victory = true,
  }
end

intergalactic_transceiver.events = {
  [defines.events.on_built_entity] = on_entity_built,
  [defines.events.on_cutscene_cancelled] = on_cutscene_finished,
  [defines.events.on_cutscene_finished] = on_cutscene_finished,
  [defines.events.on_cutscene_waypoint_reached] = on_cutscene_waypoint_reached,
  [defines.events.on_entity_cloned] = on_entity_built,
  [defines.events.on_entity_died] = on_entity_destroyed,
  [defines.events.on_gui_opened] = on_gui_opened,
  [defines.events.on_player_mined_entity] = on_entity_destroyed,
  [defines.events.on_robot_built_entity] = on_entity_built,
  [defines.events.on_robot_mined_entity] = on_entity_destroyed,
  [defines.events.on_tick] = on_tick,
  [defines.events.script_raised_built] = on_entity_built,
  [defines.events.script_raised_destroy] = on_entity_destroyed,
  [defines.events.script_raised_revive] = on_entity_built,
  [defines.events.on_space_platform_built_entity] = on_entity_built,
  [defines.events.on_space_platform_mined_entity] = on_entity_destroyed,
}

intergalactic_transceiver.on_nth_tick = {
  [180] = on_180th_tick,
}

-- REMOTE

remote.add_interface("kr-intergalactic-transceiver", {
  get_is_victory = function()
    if storage.intergalactic_transceiver then
      intergalactic_transceiver.on_init()
    end
    return storage.intergalactic_transceiver.is_victory
  end,
  set_is_victory = function(to_state)
    if to_state == nil or type(to_state) ~= "boolean" then
      error("`to_state` must be a boolean")
    end
    if not storage.intergalactic_transceiver then
      intergalactic_transceiver.on_init()
    end
    storage.intergalactic_transceiver.is_victory = to_state
  end,
})

flib_gui.add_handlers({
  transceiver_on_window_closed = on_gui_window_closed,
  transceiver_on_activate_button_clicked = on_gui_activate_button_clicked,
})

return intergalactic_transceiver
