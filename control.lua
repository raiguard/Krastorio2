local event = require("__flib__.event")
local gui = require("__flib__.gui")
local migration = require("__flib__.migration")
local on_tick_n = require("__flib__.on-tick-n")

local constants = require("scripts.constants")
local creep_collector = require("scripts.creep-collector")
local creep = require("scripts.creep")
local energy_absorber = require("scripts.energy-absorber")
local inserter = require("scripts.inserter")
local intergalactic_transceiver = require("scripts.intergalactic-transceiver")
local jackhammer = require("scripts.jackhammer")
local loader_snapping = require("scripts.loader-snapping")
local migrations = require("scripts.migrations")
local offshore_pump = require("scripts.offshore-pump")
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
remote.add_interface("kr-intergalactic-transceiver", intergalactic_transceiver.remote_interface)
remote.add_interface("kr-radioactivity", radioactivity.remote_interface)

-- BOOTSTRAP

event.on_init(function()
  -- Initialize libraries
  on_tick_n.init()

  -- Initialize `global` table
  creep.init()
  inserter.init()
  intergalactic_transceiver.init()
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

event.register({
  defines.events.on_built_entity,
  defines.events.on_entity_cloned,
  defines.events.on_robot_built_entity,
  defines.events.script_raised_built,
  defines.events.script_raised_revive,
}, function(e)
  local entity = e.entity or e.created_entity or e.destination
  if not entity or not entity.valid then
    return
  end
  local entity_name = entity.name
  local entity_type = entity.type

  if entity_name == "kr-intergalactic-transceiver" then
    intergalactic_transceiver.build(entity)
  elseif entity_name == "kr-activated-intergalactic-transceiver" then
    intergalactic_transceiver.build_activated(entity)
  elseif entity_name == "kr-planetary-teleporter" then
    planetary_teleporter.build(entity, e.tags)
  elseif entity_name == "kr-shelter-container" or entity_name == "kr-shelter-plus-container" then
    shelter.build(entity)
  elseif entity_name == "kr-tesla-coil" then
    tesla_coil.build(entity)
  elseif entity_name == "offshore-pump" then
    offshore_pump.build(entity)
  elseif constants.loader_names[entity_name] then
    loader_snapping.snap(entity)
  elseif constants.transport_belt_connectable_types[entity_type] then
    loader_snapping.snap_belt_neighbours(entity)
  end
end)

event.on_player_rotated_entity(function(e)
  local entity = e.entity
  if not entity or not entity.valid then
    return
  end

  if constants.transport_belt_connectable_types[entity.type] then
    loader_snapping.snap_belt_neighbours(entity)
  end
end)

event.register({
  defines.events.on_player_mined_entity,
  defines.events.on_robot_mined_entity,
  defines.events.on_entity_died,
  defines.events.script_raised_destroy,
}, function(e)
  local entity = e.entity
  if not entity or not entity.valid then
    return
  end
  local entity_name = entity.name
  if entity_name == "kr-intergalactic-transceiver" then
    intergalactic_transceiver.destroy(entity)
  elseif entity_name == "kr-inactive-intergalactic-transceiver" then
    intergalactic_transceiver.destroy_inactive(entity)
  elseif entity_name == "kr-shelter-container" or entity_name == "kr-shelter-plus-container" then
    shelter.destroy(entity)
  elseif entity_name == "kr-planetary-teleporter" then
    planetary_teleporter.destroy(entity)
  elseif entity_name == "kr-tesla-coil" then
    tesla_coil.destroy(entity)
  else
    tesla_coil.remove_entity_from_cache(entity)
  end
end)

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
    elseif msg.gui == "intergalactic_transceiver" then
      intergalactic_transceiver.gui_actions[msg.action](e)
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
      if name == "kr-intergalactic-transceiver" then
        intergalactic_transceiver.create_gui(player, entity)
      elseif name == "kr-planetary-teleporter" then
        planetary_teleporter.create_gui(player, entity)
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

event.on_player_setup_blueprint(function(e)
  local player = game.get_player(e.player_index)

  -- Get blueprint
  local bp = player.blueprint_to_setup
  if not bp or not bp.valid_for_read then
    bp = player.cursor_stack
    if bp.type == "blueprint-book" then
      local item_inventory = bp.get_inventory(defines.inventory.item_main)
      if item_inventory then
        bp = item_inventory[bp.active_index]
      else
        return
      end
    end
  end

  -- Get blueprint entities and mapping
  local entities = bp.get_blueprint_entities()
  if not entities then
    return
  end
  local mapping = e.mapping.get()

  -- Iterate each entity
  local changed_entity = false
  for i = 1, #entities do
    local entity = entities[i]
    local entity_name = entity.name
    if entity_name == "kr-electric-offshore-pump" then
      changed_entity = true
      offshore_pump.setup_blueprint(entity)
    elseif entity_name == "kr-planetary-teleporter" then
      changed_entity = true
      planetary_teleporter.setup_blueprint(entity, mapping[i])
    end
  end

  -- Set entities
  if changed_entity then
    bp.set_blueprint_entities(entities)
  end
end)

event.on_player_changed_position(function(e)
  radioactivity.check_around_player(game.get_player(e.player_index))
end)

event.on_player_main_inventory_changed(function(e)
  local player = game.get_player(e.player_index)
  radioactivity.check_inventory(player)
end)

event.on_player_armor_inventory_changed(tesla_coil.on_player_armor_inventory_changed)

event.register(
  { defines.events.on_player_died, defines.events.on_player_respawned, defines.events.on_player_toggled_map_editor },
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

event.register({
  defines.events.on_player_selected_area,
  defines.events.on_player_alt_selected_area,
}, function(e)
  local player = game.get_player(e.player_index)
  if e.item == "kr-creep-collector" then
    creep_collector.collect(player, e.surface, e.tiles, e.area)
  elseif e.item == "kr-jackhammer" then
    jackhammer.collect(player, e.surface, e.tiles, e.area)
  end
end)

event.on_string_translated(planetary_teleporter.on_string_translated)

-- SURFACES

event.on_chunk_generated(function(e)
  creep.on_chunk_generated(e.area, e.surface)
end)

-- TICKS AND TRIGGERS

event.on_script_trigger_effect(function(e)
  if e.effect_id == "kr-tesla-coil-trigger" then
    tesla_coil.process_turret_fire(e.source_entity, e.target_entity)
  elseif e.effect_id == "kr-planetary-teleporter-character-trigger" then
    planetary_teleporter.update_players_in_range(e.source_entity, e.target_entity)
  end
end)

event.on_tick(function()
  intergalactic_transceiver.iterate()
  -- NOTE: These two are out of order on purpose, update_gui_statuses() must run first
  planetary_teleporter.update_gui_statuses()
  planetary_teleporter.update_all_destination_availability()
  radioactivity.update_sounds()
  virus.iterate()

  local tasks = on_tick_n.retrieve(game.tick)
  if tasks then
    for _, task in pairs(tasks) do
      if task.handler == "it_cutscene" then
        intergalactic_transceiver.cutscene[task.action](task.force_index)
      end
    end
  end
end)

event.on_nth_tick(20, function()
  radioactivity.update_and_damage()
end)

event.on_nth_tick(180, function()
  intergalactic_transceiver.spawn_flying_texts()
  shelter.spawn_flying_texts()
end)
