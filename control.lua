local event = require("__flib__.event")
local gui = require("__flib__.gui")
local migration = require("__flib__.migration")

local constants = require("scripts.constants")
local creep = require("scripts.creep")
local energy_absorber = require("scripts.energy-absorber")
local inserter = require("scripts.inserter")
local loader_snapping = require("scripts.loader-snapping")
local migrations = require("scripts.migrations")
local patreon = require("scripts.patreon")
local planetary_teleporter = require("scripts.planetary-teleporter")
local radioactivity = require("scripts.radioactivity")
local roboport = require("scripts.roboport")
local shelter = require("scripts.shelter")
local tesla_coil = require("scripts.tesla-coil")
local util = require("scripts.util")
local virus = require("scripts.virus")

-- COMMANDS

util.add_commands(patreon.commands)
util.add_commands(radioactivity.commands)

-- INTERFACES

remote.add_interface("kr-creep", creep.remote_interface)
remote.add_interface("kr-radioactivity", radioactivity.remote_interface)

-- BOOTSTRAP

event.on_init(function()
  -- Initialize `global` table
  creep.init()
  inserter.init()
  patreon.init()
  planetary_teleporter.init()
  radioactivity.init()
  roboport.init()
  shelter.init()
  tesla_coil.init()
  virus.init()

  -- Initialize mod
  migrations.generic()
end)

event.on_configuration_changed(function(e)
  if migration.on_config_changed(e, migrations.versions) then
    migrations.generic()
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

event.register("kr-change-roboport-state", function(e)
  local player = game.get_player(e.player_index)
  local selected = player.selected
  if selected and selected.valid and selected.type == "roboport" then
    roboport.change_mode(selected, player)
  end
end)

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
    local entity_type = entity.type

    if entity_name == "kr-planetary-teleporter" then
      planetary_teleporter.build(entity, e.tags)
    elseif entity_name == "kr-shelter-container" or entity_name == "kr-shelter-plus-container" then
      shelter.build(entity)
    elseif entity_name == "kr-tesla-coil" then
      tesla_coil.build(entity)
    elseif constants.loader_names[entity_name] then
      loader_snapping.snap(entity)
    elseif constants.transport_belt_connectable_types[entity_type] then
      loader_snapping.snap_belt_neighbours(entity)
    end
  end
  -- TODO: Filters
)

event.on_player_rotated_entity(function(e)
  local entity = e.entity
  if not entity or not entity.valid then return end

  if constants.transport_belt_connectable_types[entity.type] then
    loader_snapping.snap_belt_neighbours(entity)
  end
end)

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
    if entity_name == "kr-shelter-container" or entity_name == "kr-shelter-plus-container" then
      shelter.destroy(entity)
    elseif entity_name == "kr-planetary-teleporter" then
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

-- FORCE

event.on_force_created(function(e)
  shelter.force_init(e.force)
end)

-- GUI

local function handle_gui_event(e)
  local msg = gui.read_action(e)
  if msg then
    if msg.gui == "inserter" then
      inserter.handle_gui_action(msg, e)
    elseif msg.gui == "planetary_teleporter" then
      planetary_teleporter.handle_gui_action(msg, e)
    elseif msg.gui == "roboport" then
      roboport.handle_gui_action(msg, e)
    end
    return true
  end
  return false
end

gui.hook_events(handle_gui_event)

event.on_gui_opened(function(e)
  if not handle_gui_event(e) then
    local entity = e.entity
    if entity and entity.valid then
      local player = game.get_player(e.player_index)
      local name = entity.name
      if name == "kr-planetary-teleporter" then
        planetary_teleporter.open_gui(player, entity)
      elseif entity.type == "inserter" then
        inserter.update_gui(player, entity)
      elseif entity.type == "roboport" then
        roboport.update_gui(player, entity)
      end
    end
  end
end)

event.register("kr-linked-focus-search", planetary_teleporter.on_focus_search)

-- PLAYER

event.on_player_used_capsule(virus.on_player_used_capsule)

event.on_player_created(function(e)
  local player = game.get_player(e.player_index)
  inserter.refresh_gui(player)
  patreon.give_items(player)
  planetary_teleporter.request_translation(player)
  radioactivity.add_player(player)
  roboport.refresh_gui(player)
end)

event.on_player_removed(function(e)
  inserter.destroy_gui(e.player_index)
  planetary_teleporter.clean_up_player(e.player_index)
  radioactivity.remove_player(e.player_index)
  roboport.destroy_gui(e.player_index)
end)

event.on_player_joined_game(function(e)
  local player = game.get_player(e.player_index)
  radioactivity.check_around_player(player)
  radioactivity.check_inventory(player)
end)

event.on_player_setup_blueprint(planetary_teleporter.on_player_setup_blueprint)

event.on_player_changed_position(function(e)
  radioactivity.check_around_player(game.get_player(e.player_index))
end)

event.on_player_main_inventory_changed(function(e)
  local player = game.get_player(e.player_index)
  radioactivity.check_inventory(player)
end)

event.register(
  {defines.events.on_player_died, defines.events.on_player_respawned, defines.events.on_player_toggled_map_editor},
  function(e)
    local player = game.get_player(e.player_index)
    radioactivity.check_around_player(player)
    radioactivity.check_inventory(player)
  end
)

event.on_cutscene_cancelled(function(e)
  local player = game.get_player(e.player_index)
  patreon.give_items(player)
end)

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

event.on_tick(function()
  planetary_teleporter.update_all_destination_availability()
  planetary_teleporter.update_gui_statuses()
  radioactivity.update_sounds()
  virus.iterate()
end)

event.on_nth_tick(20, function()
  radioactivity.update_and_damage()
end)

event.on_nth_tick(180, function()
  shelter.spawn_flying_texts()
end)

event.on_string_translated(planetary_teleporter.on_string_translated)
