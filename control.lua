local event = require("__flib__.event")
local gui = require("__flib__.gui")
local migration = require("__flib__.migration")

local migrations = require("scripts.migrations")
local util = require("scripts.util")

local creep = require("scripts.creep")
local energy_absorber = require("scripts.energy-absorber")
local inserter = require("scripts.inserter")
local planetary_teleporter = require("scripts.planetary-teleporter")
local tesla_coil = require("scripts.tesla-coil")
local virus = require("scripts.virus")

-- INTERFACES

remote.add_interface("kr-creep", creep.remote_interface)

-- BOOTSTRAP

event.on_init(function()
  -- Initialize `global` table
  creep.init()
  inserter.init()
  planetary_teleporter.init()
  tesla_coil.init()
  virus.init()

  -- Initialize mod
  util.add_to_crash_site()
  util.disable_rocket_victory()
  util.ensure_turret_force()

  tesla_coil.get_absorber_buffer_capacity()
end)

event.on_configuration_changed(function(e)
  if migration.on_config_changed(e, migrations) then
    util.add_to_crash_site()
    util.disable_rocket_victory()
    util.ensure_turret_force()

    tesla_coil.get_absorber_buffer_capacity()
  end
end)

-- CUSTOM INPUT

if not script.active_mods["bobinserters"] then
  event.register("kr-inserter-change-lane", function(e)
    local player = game.get_player(e.player_index)
    local selected = player.selected
    if selected and selected.valid and selected.type == "inserter" then
      inserter.change_lane(selected)
    end
  end)
end

-- ENTITY

event.register(
  {
    defines.events.on_built_entity,
    defines.events.on_entity_cloned,
    defines.events.on_robot_built_entity,
    defines.events.script_raised_built,
    defines.events.script_raised_revive,
  },
  function(e)
    local entity = e.entity or e.created_entity or e.destination
    if not entity or not entity.valid then return end
    local entity_name = entity.name
    if entity_name == "kr-planetary-teleporter" then
      planetary_teleporter.build(entity, e.tags)
    elseif entity_name == "kr-tesla-coil" then
      tesla_coil.build(entity)
    end
  end
  -- TODO: Filters
)

event.register(
  {
    defines.events.on_player_mined_entity,
    defines.events.on_robot_mined_entity,
    defines.events.on_entity_died,
    defines.events.script_raised_destroy
  },
  function(e)
    local entity = e.entity
    if not entity or not entity.valid then return end
    local entity_name = entity.name
    if entity_name == "kr-planetary-teleporter" then
      planetary_teleporter.destroy(entity)
    elseif entity_name == "kr-tesla-coil" then
      tesla_coil.destroy(entity)
    end
  end
  -- TODO: Filters
)

event.on_entity_destroyed(function(e)
  tesla_coil.remove_target(e.registration_number)
end)

event.on_biter_base_built(function(e)
  creep.on_biter_base_built(e.entity)
end)

event.on_pre_entity_settings_pasted(function(e)
  if e.destination.valid and e.destination.type == "inserter" then
    inserter.save_settings(e.destination)
  end
end)

event.on_entity_settings_pasted(function(e)
  local source = e.source
  local destination = e.destination

  if source.valid and destination.valid and source.type == "inserter" and destination.type == "inserter" then
    inserter.copy_settings(source, destination)
  end
end)

-- EQUIPMENT

event.on_player_placed_equipment(energy_absorber.on_placed)
event.on_equipment_inserted(tesla_coil.on_equipment_inserted)
event.on_equipment_removed(tesla_coil.on_equipment_removed)

-- GUI

local function handle_gui_event(e)
  local msg = gui.read_action(e)
  if msg then
    if msg.gui == "planetary_teleporter" then
      planetary_teleporter.handle_gui_action(msg, e)
      return true
    end
  end
  return false
end

gui.hook_events(handle_gui_event)

event.on_gui_opened(function(e)
  if not handle_gui_event(e) then
    planetary_teleporter.on_gui_opened(e)
  end
end)

event.register("kr-linked-focus-search", planetary_teleporter.on_focus_search)

-- PLAYER

event.on_player_used_capsule(virus.on_player_used_capsule)

event.on_player_created(planetary_teleporter.request_translation)
event.on_player_removed(planetary_teleporter.clean_up_player)

event.on_player_setup_blueprint(planetary_teleporter.on_player_setup_blueprint)

-- SURFACES

event.on_chunk_generated(function(e)
  creep.on_chunk_generated(e.area, e.surface)
end)

-- OTHER

event.on_script_trigger_effect(function(e)
  if e.effect_id == "kr-tesla-coil-trigger" then
    tesla_coil.process_turret_fire(e.source_entity, e.target_entity)
  elseif e.effect_id == "kr-planetary-teleporter-character-trigger" then
    planetary_teleporter.update_players_in_range(e.source_entity, e.target_entity)
  end
end)

event.on_tick(function(e)
  planetary_teleporter.update_gui_statuses()
  planetary_teleporter.update_all_destination_availability()
  virus.iterate()
end)

event.on_string_translated(planetary_teleporter.on_string_translated)
