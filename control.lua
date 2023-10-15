local gui = require("__flib__.gui")
local migration = require("__flib__.migration")
local on_tick_n = require("__flib__.on-tick-n")

local creep_collector = require("scripts.creep-collector")
local creep = require("scripts.creep")
local energy_absorber = require("scripts.energy-absorber")
local inserter = require("scripts.inserter")
local intergalactic_transceiver = require("scripts.intergalactic-transceiver")
local jackhammer = require("scripts.jackhammer")
local migrations = require("scripts.migrations")
local offshore_pump = require("scripts.offshore-pump")
local patreon = require("scripts.patreon")
local planetary_teleporter = require("scripts.planetary-teleporter")
local radioactivity = require("scripts.radioactivity")
local roboport = require("scripts.roboport")
local shelter = require("scripts.shelter")
local snap_loader = require("scripts.snap-loader")
local tesla_coil = require("scripts.tesla-coil")
local util = require("scripts.util")
local virus = require("scripts.virus")

-- COMMANDS

util.add_commands(creep.commands)
util.add_commands(patreon.commands)
util.add_commands(radioactivity.commands)

-- INTERFACES

remote.add_interface("kr-creep", creep.remote_interface)
remote.add_interface("kr-intergalactic-transceiver", intergalactic_transceiver.remote_interface)
remote.add_interface("kr-radioactivity", radioactivity.remote_interface)

-- BOOTSTRAP

script.on_init(function()
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

migration.handle_on_configuration_changed(migrations.versions, migrations.generic)

-- CUSTOM INPUT

if not script.active_mods["bobinserters"] then
  script.on_event("kr-inserter-change-lane", function(e)
    local player = game.get_player(e.player_index)
    if not player then
      return
    end
    local selected = player.selected
    if selected and selected.valid and selected.type == "inserter" then
      inserter.change_lane(selected, player)
    end
  end)
end

script.on_event("kr-change-roboport-state", function(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  local selected = player.selected
  if selected and selected.valid and selected.type == "roboport" then
    roboport.change_mode(selected, player)
  end
end)

-- ENTITY

script.on_event({
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

  -- Clean up cloned internal entities
  if
    e.name == defines.events.on_entity_cloned
    and (
      entity_name == "kr-tesla-coil-turret"
      or entity_name == "kr-tesla-coil-collision"
      or entity_name == "kr-planetary-teleporter-front-layer"
      or entity_name == "kr-planetary-teleporter-turret"
      or string.find(entity_name, "kr-planetary-teleporter-collision", nil, true)
    )
  then
    entity.destroy()
    return
  end

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
  elseif string.match(entity_name, "^kr.*%-loader") then
    snap_loader(entity)
  end
end)

script.on_event({
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
  end
end)

script.on_event(defines.events.on_entity_destroyed, function(e)
  local beam_data = global.tesla_coil.beams[e.registration_number]
  if beam_data then
    tesla_coil.remove_connection(beam_data.target_data, beam_data.tower_data)
  end
end)

script.on_event(defines.events.on_biter_base_built, function(e)
  creep.on_biter_base_built(e.entity)
end)

script.on_event(defines.events.on_pre_entity_settings_pasted, function(e)
  if e.destination.valid and e.destination.type == "inserter" then
    inserter.save_settings(e.destination)
  end
end)

script.on_event(defines.events.on_entity_settings_pasted, function(e)
  local source = e.source
  local destination = e.destination

  if source.valid and destination.valid and source.type == "inserter" and destination.type == "inserter" then
    inserter.copy_settings(source, destination)
  end
end)

-- EQUIPMENT

script.on_event(defines.events.on_player_placed_equipment, energy_absorber.on_placed)
script.on_event(defines.events.on_equipment_inserted, function(e)
  if e.equipment.valid and e.equipment.name == "energy-absorber" then
    tesla_coil.update_target_grid(e.grid)
  end
end)
script.on_event(defines.events.on_equipment_removed, function(e)
  if e.equipment == "energy-absorber" then
    tesla_coil.update_target_grid(e.grid)
  end
end)

-- FORCE

script.on_event(defines.events.on_force_created, function(e)
  shelter.force_init(e.force)
end)

script.on_event(defines.events.on_technology_effects_reset, function(e)
  if game.finished or game.finished_but_continuing then
    e.force.technologies["kr-logo"].enabled = true
  end
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

script.on_event(defines.events.on_gui_opened, function(e)
  if not handle_gui_event(e) then
    local entity = e.entity
    if entity and entity.valid then
      local player = game.get_player(e.player_index)
      if not player then
        return
      end
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

script.on_event("kr-linked-focus-search", planetary_teleporter.on_focus_search)

-- PLAYER

script.on_event(defines.events.on_player_used_capsule, virus.on_player_used_capsule)

script.on_event(defines.events.on_player_created, function(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  inserter.refresh_gui(player)
  patreon.give_items(player, false)
  planetary_teleporter.request_translation(player)
  radioactivity.add_player(player)
  roboport.refresh_gui(player)
end)

script.on_event(defines.events.on_player_removed, function(e)
  inserter.destroy_gui(e.player_index)
  planetary_teleporter.clean_up_player(e.player_index)
  radioactivity.remove_player(e.player_index)
  roboport.destroy_gui(e.player_index)
end)

script.on_event(defines.events.on_player_joined_game, function(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  radioactivity.check_around_player(player)
  radioactivity.check_inventory(player)
end)

script.on_event(defines.events.on_player_setup_blueprint, function(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end

  -- Get blueprint
  local bp = player.blueprint_to_setup
  if not bp or not bp.valid_for_read then
    bp = player.cursor_stack
    if not bp or not bp.valid_for_read then
      return
    end
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

script.on_event(defines.events.on_player_changed_position, function(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  radioactivity.check_around_player(player)
end)

script.on_event(
  { defines.events.on_player_main_inventory_changed, defines.events.on_player_trash_inventory_changed },
  function(e)
    local player = game.get_player(e.player_index)
    if not player then
      return
    end
    radioactivity.check_inventory(player)
  end
)

script.on_event(defines.events.on_player_armor_inventory_changed, tesla_coil.on_player_armor_inventory_changed)

script.on_event(
  { defines.events.on_player_died, defines.events.on_player_respawned, defines.events.on_player_toggled_map_editor },
  function(e)
    local player = game.get_player(e.player_index)
    if not player then
      return
    end
    radioactivity.check_around_player(player)
    radioactivity.check_inventory(player)
  end
)

script.on_event(defines.events.on_cutscene_cancelled, function(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  patreon.give_items(player, false)
end)

script.on_event({
  defines.events.on_player_selected_area,
  defines.events.on_player_alt_selected_area,
}, function(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  if e.item == "kr-creep-collector" then
    creep_collector.collect(e)
  elseif e.item == "kr-jackhammer" then
    jackhammer.collect(player, e.surface, e.tiles, e.area)
  end
end)

script.on_event(defines.events.on_string_translated, planetary_teleporter.on_string_translated)

-- SURFACES

script.on_event(defines.events.on_chunk_generated, function(e)
  creep.on_chunk_generated(e.area, e.surface)
end)

script.on_event(defines.events.on_surface_created, function(e)
  -- Space Exploration: only generate creep on Nauvis
  if not script.active_mods["space-exploration"] then
    creep.add_surface(e.surface_index)
  end
end)

-- TICKS AND TRIGGERS

script.on_event(defines.events.on_script_trigger_effect, function(e)
  if e.effect_id == "kr-tesla-coil-trigger" then
    tesla_coil.process_turret_fire(e.target_entity, e.source_entity)
  elseif e.effect_id == "kr-planetary-teleporter-character-trigger" then
    planetary_teleporter.update_players_in_range(e.source_entity, e.target_entity)
  end
end)

script.on_event(defines.events.on_tick, function()
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

script.on_nth_tick(20, function()
  radioactivity.update_and_damage()
end)

script.on_nth_tick(180, function()
  intergalactic_transceiver.spawn_flying_texts()
  shelter.spawn_flying_texts()
end)
