local gui = require("__flib__.gui")
local math = require("__flib__.math")
local reverse_defines = require("__flib__.reverse-defines")
local table = require("__flib__.table")

local constants = require("scripts.constants")
local util = require("scripts.util")

local intergalactic_transceiver = {}

local statuses = constants.intergalactic_transceiver.statuses

--[[
  BEHAVIORS:
    - If the transceiver loses power, drain it rapidly
    - Once 100% is reached, notify the players and add an activate button
    - Once activated, play the cutscene and win the game
    - Update stats GUI with the charge progress

    - Normal / no power: if charged, drain and warn. If not charged, do nothing
  STATUSES:
    - Charging: Update charge status
    - Fully charged: notify of status
]]

function intergalactic_transceiver.init()
  global.intergalactic_transceiver = {
    forces = {},
    guis = {},
    inactive = {},
  }
end

function intergalactic_transceiver.get_max_energy()
  local buffer_capacity =
    game.entity_prototypes["kr-intergalactic-transceiver"].electric_energy_source_prototype.buffer_capacity

  global.intergalactic_transceiver.max_energy = buffer_capacity - constants.intergalactic_transceiver.max_delta
end

function intergalactic_transceiver.build(entity)
  local existing = global.intergalactic_transceiver.forces[entity.force.index]
  if existing then
    local position = entity.position
    local force = entity.force
    local player = entity.last_user
    local surface = entity.surface
    entity.destroy()

    local new_entity = surface.create_entity{
      name = "kr-inactive-intergalactic-transceiver",
      position = position,
      force = force,
      player = player,
      create_build_effect_smoke = false,
    }
    if new_entity and new_entity.valid then
      global.intergalactic_transceiver.inactive[new_entity.unit_number] = new_entity
    end

    return
  end

  global.intergalactic_transceiver.forces[entity.force.index] = {
    entity = entity,
    last_alert_tick = game.tick,
    last_energy = entity.energy,
    status = "empty",
  }
end

function intergalactic_transceiver.destroy(entity)
  local force_index = entity.force.index
  global.intergalactic_transceiver.forces[force_index] = nil
end

function intergalactic_transceiver.destroy_inactive(entity)
  global.intergalactic_transceiver.inactive[entity.unit_number] = nil
end

function intergalactic_transceiver.iterate()
  -- Process transceiver logic and update statuses
  local transceivers = global.intergalactic_transceiver.forces
  for force_index, data in pairs(transceivers) do
    local entity = data.entity
    if entity and entity.valid and entity.name == "kr-intergalactic-transceiver" then
      local current_energy = entity.energy
      local new_energy = current_energy
      local difference = current_energy - data.last_energy
      local status = "charging"
      -- If we're not receiving enough power
      if difference < constants.intergalactic_transceiver.delta and current_energy > 0 then
        -- Drain the transceiver at 3 TJ / sec
        new_energy = math.max(0, current_energy - constants.intergalactic_transceiver.drain)
        -- Update status
        status = "not_enough_input"
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
      -- Save data
      data.last_energy = new_energy
      data.status = status

      -- If we wish to show an alert and it's been more than a second since the last one
      if status ~= "charging" and game.tick - data.last_alert_tick >= 60 then
        data.last_alert_tick = game.tick
        for _, player in pairs(entity.force.players) do
          player.add_custom_alert(
            entity,
            {type = "item", name = "kr-intergalactic-transceiver"},
            status,
            true
          )
        end
      end
    else
      transceivers[force_index] = nil
    end
  end

  -- Update GUIs
  for player_index, gui_data in pairs(global.intergalactic_transceiver.guis) do
    intergalactic_transceiver.update_gui(gui_data)
  end
end

function intergalactic_transceiver.spawn_flying_texts()
  for unit_number, entity in pairs(global.intergalactic_transceiver.inactive) do
    if entity.valid then
      util.entity_flying_text(entity, {"message.kr-transceiver-is-inactive"}, {r = 1})
    else
      global.shelter.inactive[unit_number] = nil
    end
  end
end

function intergalactic_transceiver.activate(entity)
  local entity_data = global.intergalactic_transceiver.forces[entity.force.index]
  if not entity_data then return end

  local force = entity.force
  local player = entity.last_user
  local position = entity.position
  local surface = entity.surface

  entity.destroy()

  -- TODO: Cutscene

  local new_entity = surface.create_entity{
    name = "kr-activated-intergalactic-transceiver",
    position = position,
    force = force,
    player = player,
    create_build_effect_smoke = false,
  }

  if new_entity and new_entity.valid then
    global.intergalactic_transceiver.forces[force.index] = {entity = new_entity}
  end
end

-- GUI

function intergalactic_transceiver.create_gui(player, entity)
  local refs = gui.build(player.gui.screen, {
    {
      type = "frame",
      direction = "vertical",
      ref = {"window"},
      actions = {
        on_closed = {gui = "intergalactic_transceiver", action = "close"},
      },
      {type = "flow", style = "flib_titlebar_flow", ref = {"titlebar_flow"},
        {
          type = "label",
          style = "frame_title",
          caption = {"entity-name.kr-intergalactic-transceiver"},
          ignored_by_interaction = true
        },
        {type = "empty-widget", style = "flib_titlebar_drag_handle", ignored_by_interaction = true},
        {
          type = "sprite-button",
          style = "frame_action_button",
          sprite = "utility/close_white",
          hovered_sprite = "utility/close_black",
          clicked_sprite = "utility/close_black",
          tooltip = {"gui.close-instruction"},
          actions = {
            on_click = {gui = "intergalactic_transceiver", action = "close"},
          },
        }
      },
      {type = "frame", style = "entity_frame", direction = "vertical",
        {type = "flow", style = "status_flow", style_mods = {vertical_align = "center"},
          {type = "sprite", style = "flib_indicator", ref = {"status", "sprite"}},
          {type = "label", ref = {"status", "label"}},
        },
        {type = "frame", style = "deep_frame_in_shallow_frame",
          {type = "entity-preview", style = "wide_entity_button", elem_mods = {entity = entity}},
        },
        {type = "flow", style_mods = {vertical_align = "center", top_margin = 4},
          {
            type = "progressbar",
            style = "production_progressbar",
            style_mods = {horizontally_stretchable = true},
            value = 0,
            ref = {"charge_progressbar"},
          }
        },
        {type = "line", direction = "horizontal"},
        {
          type = "button",
          style_mods = {height = 35, horizontally_stretchable = true},
          caption = {"gui.kr-activate"},
          ref = {"activate_button"},
          actions = {
            on_click = {gui = "intergalactic_transceiver", action = "activate"}
          },
        },
      }
    }
  })

  refs.window.force_auto_center()
  refs.titlebar_flow.drag_target = refs.window

  player.opened = refs.window
  if not game.is_multiplayer() then
    -- FIXME: Add sounds to the prototype
    -- player.play_sound{path = "entity-open/kr-intergalactic-transceiver"}
    player.play_sound{path = "entity-open/accumulator"}
  end

  global.intergalactic_transceiver.guis[player.index] = {
    refs = refs,
    state = {
      entity = entity,
      previous_stats = "none",
    }
  }
end

function intergalactic_transceiver.destroy_gui(player)
  local gui_data = table.retrieve(global.intergalactic_transceiver.guis, player.index)
  if gui_data then
    gui_data.refs.window.destroy()
    -- FIXME: Add sounds to the prototype
    -- player.play_sound{path = "entity-close/kr-intergalactic-transceiver"}
    player.play_sound{path = "entity-close/accumulator"}
  end
end

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
      progressbar.caption = math.round(charge * 100).."%"

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

function actions.close(e)
  intergalactic_transceiver.destroy_gui(game.get_player(e.player_index))
end

function actions.activate(e)
  local gui_data = global.intergalactic_transceiver.guis[e.player_index]
  if not gui_data then return end

  local entity = gui_data.state.entity
  if not entity or not entity.valid then return end

  intergalactic_transceiver.destroy_gui(game.get_player(e.player_index))
  intergalactic_transceiver.activate(entity)
end

intergalactic_transceiver.gui_actions = actions

return intergalactic_transceiver
