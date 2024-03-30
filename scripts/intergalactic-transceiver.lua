local gui = require("__flib__.gui")
local math = require("__flib__.math")
local on_tick_n = require("__flib__.on-tick-n")
local reverse_defines = require("__flib__.reverse-defines")
local position = require("__flib__.position")

local constants = require("scripts.constants")
local util = require("scripts.util")

local intergalactic_transceiver = {}

local statuses = constants.intergalactic_transceiver.statuses
local cutscene_const = constants.intergalactic_transceiver.cutscene

function intergalactic_transceiver.init()
  if not global.intergalactic_transceiver then -- Can be already initialised through remote interface
    global.intergalactic_transceiver = {
      --- @type table<uint, IntergalacticTransceiverForceData>
      forces = {},
      --- @type table<uint, IntergalacticTransceiverGuiData>
      guis = {},
      --- @type table<uint, LuaEntity>
      inactive = {},
      is_victory = true,
    }
  end
end

function intergalactic_transceiver.get_max_energy()
  local buffer_capacity =
    game.entity_prototypes["kr-intergalactic-transceiver"].electric_energy_source_prototype.buffer_capacity

  global.intergalactic_transceiver.max_energy = buffer_capacity - constants.intergalactic_transceiver.max_delta
end

--- @param entity LuaEntity
function intergalactic_transceiver.build(entity)
  local existing = global.intergalactic_transceiver.forces[entity.force.index]
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
      global.intergalactic_transceiver.inactive[new_entity.unit_number] = new_entity
    end

    return
  end

  --- @class IntergalacticTransceiverForceData
  global.intergalactic_transceiver.forces[entity.force.index] = {
    activating = false,
    entity = entity,
    last_alert_tick = game.tick,
    last_energy = entity.energy,
    status = "empty",
    tick_built = game.tick,
    tick_ready = nil,
    charge_time = nil, -- Total time charged. Calculated during activation
  }
end

--- @param entity LuaEntity
function intergalactic_transceiver.build_activated(entity)
  local existing = global.intergalactic_transceiver.forces[entity.force.index]
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
      intergalactic_transceiver.build(new_entity)
    end
  end
end

--- @param entity LuaEntity
function intergalactic_transceiver.destroy(entity)
  local force_index = entity.force.index
  global.intergalactic_transceiver.forces[force_index] = nil

  -- Close any open GUIs
  for player_index, gui_data in pairs(global.intergalactic_transceiver.guis) do
    local gui_entity = gui_data.state.entity
    if gui_entity and gui_entity.valid and gui_entity == entity then
      local player = game.get_player(player_index) --[[@as LuaPlayer]]
      intergalactic_transceiver.destroy_gui(player)
    end
  end
end

--- @param entity LuaEntity
function intergalactic_transceiver.destroy_inactive(entity)
  global.intergalactic_transceiver.inactive[entity.unit_number] = nil
end

function intergalactic_transceiver.iterate()
  -- Process transceiver logic and update statuses
  local transceivers = global.intergalactic_transceiver.forces
  for force_index, data in pairs(transceivers) do
    local entity = data.entity
    if entity and entity.valid then
      if entity.name == "kr-intergalactic-transceiver" then
        local current_energy = entity.energy
        local new_energy = current_energy
        local difference = current_energy - data.last_energy
        local status = "charging"
        -- If we're not receiving enough power
        if difference < constants.intergalactic_transceiver.delta and current_energy > 0 then
          -- Drain the transceiver at 3 TJ / sec
          new_energy = math.max(0, current_energy - constants.intergalactic_transceiver.drain)
          -- Update status
          if new_energy > 0 then
            status = "discharging"
          else
            status = "not_enough_input"
          end

          data.tick_ready = nil   -- If it was ready before, we lost power again, so reset.
        else
          -- The max that we allow, for graphical reasons
          -- If we allow the transceiver to fully charge, the animation stops, which we don't want, so we cap the energy
          -- just below the max
          local max_energy = global.intergalactic_transceiver.max_energy
          -- If we're above the allowed max
          if current_energy > max_energy then
            -- Reset the energy to the allowed max
            -- If the energy stays constant, the entity will switch to "normal" mode. To combat this, we give it a random
            -- offset of 0 - 20 MJ above the max every tick.
            new_energy = max_energy + math.random(0, 20) * 1000000
            status = "ready"

            if not data.tick_ready then
              data.tick_ready = game.tick
            end
          else
            local entity_status = reverse_defines.entity_status[entity.status]
            local status_data = statuses[entity_status]
            if status_data then
              status = entity_status
            end
          end
        end

        -- If we are updating the amount of energy in the transceiver
        if new_energy ~= current_energy then
          entity.energy = new_energy
        end
        local last_status = data.status
        -- Save data
        data.last_energy = new_energy
        data.status = status

        -- If we wish to show an alert and it's been more than a second since the last one
        local status_data = constants.intergalactic_transceiver.statuses[status]
        if status_data and status_data.alert_label and game.tick - data.last_alert_tick >= 60 then
          data.last_alert_tick = game.tick
          for _, player in pairs(entity.force.players) do
            player.add_custom_alert(
              entity,
              { type = "item", name = "kr-intergalactic-transceiver" },
              status_data.alert_label,
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
    else
      transceivers[force_index] = nil
    end
  end

  -- Update GUIs
  for _, gui_data in pairs(global.intergalactic_transceiver.guis) do
    intergalactic_transceiver.update_gui(gui_data)
  end
end

function intergalactic_transceiver.spawn_flying_texts()
  for unit_number, entity in pairs(global.intergalactic_transceiver.inactive) do
    if entity.valid then
      util.entity_flying_text(entity, { "message.kr-transceiver-is-inactive" }, { r = 1 })
    else
      global.intergalactic_transceiver.inactive[unit_number] = nil
    end
  end
end

--- @param entity LuaEntity
function intergalactic_transceiver.activate(entity)
  local entity_data = global.intergalactic_transceiver.forces[entity.force.index]
  if not entity_data then
    return
  end

  -- Make the entity indestructible, just in case
  entity.destructible = false
  entity.operable = false

  -- Close any open GUIs
  for player_index, gui_data in pairs(global.intergalactic_transceiver.guis) do
    local gui_entity = gui_data.state.entity
    if gui_entity and gui_entity.valid and gui_entity == entity then
      local player = game.get_player(player_index) --[[@as LuaPlayer]]
      intergalactic_transceiver.destroy_gui(player)
    end
  end

  -- Start the cutscene in one second
  on_tick_n.add(game.tick + 60, { handler = "it_cutscene", action = "begin", force_index = entity.force.index })
end

-- CUTSCENE

local cutscene = {}

--- @param force_index uint
function cutscene.begin(force_index)
  local entity_data = global.intergalactic_transceiver.forces[force_index]
  if not entity_data then
    return
  end

  local entity = entity_data.entity
  if not entity or not entity.valid then
    return
  end

  local surface = entity.surface
  local pos = entity.position

  for _, player in pairs(game.players) do
    if
      player.controller_type ~= defines.controllers.editor
      and player.surface == surface
      and position.distance(player.position, pos) <= cutscene_const.player_radius
    then
      -- Start cutscene
      -- TODO: Handle the case when the player dies during the cutscene
      player.set_controller({
        type = defines.controllers.cutscene,
        waypoints = {
          {
            position = pos,
            transition_time = 70,
            zoom = 1.2,
            time_to_wait = 30,
          },
          {
            position = pos,
            transition_time = 135,
            zoom = 1,
            time_to_wait = 10,
          },
          {
            position = pos,
            transition_time = 135,
            zoom = 1.2,
            time_to_wait = 10,
          },
          {
            position = pos,
            transition_time = 135,
            zoom = 1,
            time_to_wait = 60,
          },
        },
        start_position = player.position,
        final_transition_time = cutscene_const.final_transition_time,
      })
    end
  end

  on_tick_n.add(game.tick + 100, { handler = "it_cutscene", action = "spawn_wave", force_index = force_index })
end

--- @param force_index uint
function cutscene.spawn_wave(force_index)
  local entity_data = global.intergalactic_transceiver.forces[force_index]
  if not entity_data then
    return
  end

  local entity = entity_data.entity
  if not entity or not entity.valid then
    return
  end

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

  on_tick_n.add(game.tick + 15, { handler = "it_cutscene", action = "replace_entity", force_index = force_index })
end

--- @param force_index uint
function cutscene.replace_entity(force_index)
  local entity_data = global.intergalactic_transceiver.forces[force_index]
  if not entity_data then
    return
  end

  local entity = entity_data.entity
  if not entity or not entity.valid then
    return
  end

  local force = entity.force
  local player = entity.last_user
  local position = entity.position
  local surface = entity.surface

  entity.destroy()

  entity_data.activating = true

  local new_entity = surface.create_entity({
    name = "kr-activated-intergalactic-transceiver",
    position = position,
    force = force,
    player = player,
    create_build_effect_smoke = false,
    raise_built = true,
  })

  entity_data.activating = false

  if new_entity and new_entity.valid then
    local charge_time = (entity_data.tick_ready and entity_data.tick_built) and (entity_data.tick_ready - entity_data.tick_built)
    global.intergalactic_transceiver.forces[force.index] = { entity = new_entity, charge_time = charge_time }

    on_tick_n.add(game.tick + 660, { handler = "it_cutscene", action = "unlock_logo", force_index = force_index })

    if global.intergalactic_transceiver.is_victory and not (game.finished or global.finished) then
      on_tick_n.add(game.tick + 650, { handler = "it_cutscene", action = "win", force_index = force_index })
      on_tick_n.add(
        game.tick + 660,
        { handler = "it_cutscene", action = "play_victory_sound", force_index = force_index }
      )
    end
  end
end

--- @param force_index uint
function cutscene.unlock_logo(force_index)
  game.forces[force_index].technologies["kr-logo"].enabled = true
end

--- @param force_index uint
function cutscene.win(force_index)
  global.finished = true

  if remote.interfaces["better-victory-screen"] and remote.interfaces["better-victory-screen"]["trigger_victory"] then
    remote.call("better-victory-screen", "trigger_victory", game.forces[force_index], true) -- Force it always
  else
    game.set_game_state({
      game_finished = true,
      player_won = true,
      can_continue = true,
      victorious_force = game.forces[force_index],
    })
  end
end

function cutscene.play_victory_sound(force_index)
  game.forces[force_index].play_sound({ path = "kr-win-joke-voice" })
end

intergalactic_transceiver.cutscene = cutscene

-- GUI

--- @param player LuaPlayer
--- @param entity LuaEntity
function intergalactic_transceiver.create_gui(player, entity)
  local refs = gui.build(player.gui.screen, {
    {
      type = "frame",
      direction = "vertical",
      ref = { "window" },
      actions = {
        on_closed = { gui = "intergalactic_transceiver", action = "close" },
      },
      {
        type = "flow",
        style = "flib_titlebar_flow",
        ref = { "titlebar_flow" },
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
          sprite = "utility/close_white",
          hovered_sprite = "utility/close_black",
          clicked_sprite = "utility/close_black",
          tooltip = { "gui.close-instruction" },
          actions = {
            on_click = { gui = "intergalactic_transceiver", action = "close" },
          },
        },
      },
      {
        type = "frame",
        style = "entity_frame",
        direction = "vertical",
        {
          type = "flow",
          style = "status_flow",
          style_mods = { vertical_align = "center" },
          { type = "sprite", style = "flib_indicator", ref = { "status", "sprite" } },
          { type = "label", ref = { "status", "label" } },
        },
        {
          type = "frame",
          style = "deep_frame_in_shallow_frame",
          { type = "entity-preview", style = "wide_entity_button", elem_mods = { entity = entity } },
        },
        {
          type = "flow",
          style_mods = { vertical_align = "center", top_margin = 4 },
          {
            type = "progressbar",
            style = "production_progressbar",
            style_mods = { horizontally_stretchable = true },
            value = 0,
            ref = { "charge_progressbar" },
          },
        },
        { type = "line", direction = "horizontal" },
        {
          type = "button",
          style_mods = { height = 35, horizontally_stretchable = true },
          caption = { "gui.kr-activate" },
          ref = { "activate_button" },
          actions = {
            on_click = { gui = "intergalactic_transceiver", action = "activate" },
          },
        },
      },
    },
  })

  refs.window.force_auto_center()
  refs.titlebar_flow.drag_target = refs.window

  player.opened = refs.window
  -- If in multiplayer, the default GUI will open a few ticks before this, so we rely on that GUI's sound
  if not game.is_multiplayer() then
    player.play_sound({ path = "entity-open/kr-intergalactic-transceiver" })
  end

  --- @class IntergalacticTransceiverGuiData
  global.intergalactic_transceiver.guis[player.index] = {
    refs = refs,
    state = {
      entity = entity,
      previous_stats = "none",
    },
  }
end

--- @param player LuaPlayer
function intergalactic_transceiver.destroy_gui(player)
  local gui_data = global.intergalactic_transceiver.guis[player.index]
  if gui_data then
    global.intergalactic_transceiver.guis[player.index] = nil
    gui_data.refs.window.destroy()
    player.play_sound({ path = "entity-close/kr-intergalactic-transceiver" })
  end
end

--- @param gui_data IntergalacticTransceiverGuiData
function intergalactic_transceiver.update_gui(gui_data)
  local entity = gui_data.state.entity
  if entity and entity.valid then
    local entity_data = global.intergalactic_transceiver.forces[entity.force.index]
    if entity_data then
      local refs = gui_data.refs

      -- Update progressbar
      local progressbar = gui_data.refs.charge_progressbar
      local charge = entity.energy / global.intergalactic_transceiver.max_energy
      progressbar.value = charge
      progressbar.caption = math.round(charge * 100) .. "%"

      -- Update status indicator
      local status = entity_data.status
      local status_data = constants.intergalactic_transceiver.statuses[status]
      refs.status.sprite.sprite = status_data.sprite
      refs.status.label.caption = status_data.label
      refs.status.label.tooltip = status_data.tooltip or ""

      -- Update activate button
      refs.activate_button.enabled = status == "ready"
    end
  end
end

local actions = {}

--- @param e GuiEventData
function actions.close(e)
  local player = game.get_player(e.player_index) --[[@as LuaPlayer]]
  intergalactic_transceiver.destroy_gui(player)
end

--- @param e GuiEventData
function actions.activate(e)
  local gui_data = global.intergalactic_transceiver.guis[e.player_index]
  if not gui_data then
    return
  end

  local entity = gui_data.state.entity
  if not entity or not entity.valid then
    return
  end

  local player = game.get_player(e.player_index) --[[@as LuaPlayer]]
  intergalactic_transceiver.destroy_gui(player)
  intergalactic_transceiver.activate(entity)
end

intergalactic_transceiver.gui_actions = actions

-- REMOTE

intergalactic_transceiver.remote_interface = {
  get_no_victory = function()
    if not global.intergalactic_transceiver then
      intergalactic_transceiver.init()
    end
    return not global.intergalactic_transceiver.is_victory
  end,
  set_no_victory = function(to_state)
    if not to_state or type(to_state) ~= "boolean" then
      error("`to_state` must be a boolean")
    end
    if not global.intergalactic_transceiver then
      intergalactic_transceiver.init()
    end
    global.intergalactic_transceiver.is_victory = not to_state
  end,

  ---@param winning_force LuaForce
  ---@param forces LuaForce[] list of forces that GUI will be show to
  ["better-victory-screen-statistics"] = function(winning_force, forces)
    -- Only add the transceiver charge time to the winning force's victory screen
    local data = global.intergalactic_transceiver.forces[winning_force.index]
    if not data or not data.charge_time then return { } end
    return { by_force = { [winning_force.name] = {
        ["intergalactic-communication"] = { order = "aa", stats = {
          ["charging-intergalactic-transceiver"] = {value = data.charge_time, unit = "time", has_tooltip=true}
        }}
    }}}
  end
}

return intergalactic_transceiver
