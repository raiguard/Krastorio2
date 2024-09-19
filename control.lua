local handler = require("__core__.lualib.event_handler")

handler.add_libraries({
  require("__flib__.gui"),

  require("scripts.creep-collector"),
  require("scripts.energy-absorber"),
  require("scripts.intergalactic-transceiver"),
  require("scripts.jackhammer"),
  require("scripts.loader-snapping"),
  require("scripts.offshore-pump"),
  require("scripts.patreon"),
  require("scripts.radioactivity"),
  require("scripts.roboport"),
  require("scripts.shelter"),
  require("scripts.virus"),
})

local gui = require("__flib__.gui")
local migration = require("__flib__.migration")

-- local creep = require("scripts.creep")
local migrations = require("scripts.migrations")
local planetary_teleporter = require("scripts.planetary-teleporter")
local tesla_coil = require("scripts.tesla-coil")

-- COMMANDS

-- util.add_commands(creep.commands)

-- INTERFACES

-- remote.add_interface("kr-creep", creep.remote_interface)
-- remote.add_interface("kr-intergalactic-transceiver", intergalactic_transceiver.remote_interface)
-- remote.add_interface("kr-radioactivity", radioactivity.remote_interface)

-- BOOTSTRAP

local legacy_lib = {}

function legacy_lib.on_init()
  -- Initialize `global` table
  -- creep.init()
  planetary_teleporter.init()
  tesla_coil.init()

  -- Initialize mod
  migrations.generic()
end

--- @param e ConfigurationChangedData
function legacy_lib.on_configuration_changed(e)
  if migration.on_config_changed(e, migrations.versions) then
    migrations.generic()
  end
end

legacy_lib.events = {}

-- CUSTOM INPUT

-- ENTITY

local function on_entity_created(e)
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

  if entity_name == "kr-planetary-teleporter" then
    planetary_teleporter.build(entity, e.tags)
  elseif entity_name == "kr-tesla-coil" then
    tesla_coil.build(entity)
  end
end

legacy_lib.events[defines.events.on_built_entity] = on_entity_created
legacy_lib.events[defines.events.on_entity_cloned] = on_entity_created
legacy_lib.events[defines.events.on_robot_built_entity] = on_entity_created
legacy_lib.events[defines.events.script_raised_built] = on_entity_created
legacy_lib.events[defines.events.script_raised_revive] = on_entity_created

local function on_entity_destroyed(e)
  local entity = e.entity
  if not entity or not entity.valid then
    return
  end
  local entity_name = entity.name
  if entity_name == "kr-planetary-teleporter" then
    planetary_teleporter.destroy(entity)
  elseif entity_name == "kr-tesla-coil" then
    tesla_coil.destroy(entity)
  end
end

legacy_lib.events[defines.events.on_player_mined_entity] = on_entity_destroyed
legacy_lib.events[defines.events.on_robot_mined_entity] = on_entity_destroyed
legacy_lib.events[defines.events.on_entity_died] = on_entity_destroyed
legacy_lib.events[defines.events.script_raised_destroy] = on_entity_destroyed

legacy_lib.events[defines.events.on_entity_destroyed] = function(e)
  local beam_data = global.tesla_coil.beams[e.registration_number]
  if beam_data then
    tesla_coil.remove_connection(beam_data.target_data, beam_data.tower_data)
  end
end

-- legacy_lib.events[defines.events.on_biter_base_built] = function(e)
--   creep.on_biter_base_built(e.entity)
-- end

-- EQUIPMENT

legacy_lib.events[defines.events.on_equipment_inserted] = function(e)
  if e.equipment.valid and e.equipment.name == "energy-absorber" then
    tesla_coil.update_target_grid(e.grid)
  end
end
legacy_lib.events[defines.events.on_equipment_removed] = function(e)
  if e.equipment == "energy-absorber" then
    tesla_coil.update_target_grid(e.grid)
  end
end

-- FORCE

legacy_lib.events[defines.events.on_technology_effects_reset] = function(e)
  if game.finished or game.finished_but_continuing then
    e.force.technologies["kr-logo"].enabled = true
  end
end

-- GUI

local function handle_gui_event(e)
  local msg = gui.read_action(e)
  if msg then
    if msg.gui == "planetary_teleporter" then
      planetary_teleporter.handle_gui_action(msg, e)
    end
    return true
  end
  return false
end

gui.hook_events(handle_gui_event) -- FIXME:

legacy_lib.events[defines.events.on_gui_opened] = function(e)
  if not handle_gui_event(e) then
    local entity = e.entity
    if entity and entity.valid then
      local player = game.get_player(e.player_index)
      if not player then
        return
      end
      local name = entity.name
      if name == "kr-planetary-teleporter" then
        planetary_teleporter.create_gui(player, entity)
      end
    end
  end
end

legacy_lib.events["kr-linked-focus-search"] = planetary_teleporter.on_focus_search

-- PLAYER

legacy_lib.events[defines.events.on_player_created] = function(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end
  planetary_teleporter.request_translation(player)
end

legacy_lib.events[defines.events.on_player_removed] = function(e)
  planetary_teleporter.clean_up_player(e.player_index)
end

legacy_lib.events[defines.events.on_player_setup_blueprint] = function(e)
  local player = game.get_player(e.player_index)
  if not player then
    return
  end

  -- Get blueprint
  local bp = player.blueprint_to_setup
  if not bp or not bp.valid_for_read then
    bp = player.cursor_stack
    if not bp then
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
    if entity_name == "kr-planetary-teleporter" then
      changed_entity = true
      planetary_teleporter.setup_blueprint(entity, mapping[i])
    end
  end

  -- Set entities
  if changed_entity then
    bp.set_blueprint_entities(entities)
  end
end

legacy_lib.events[defines.events.on_player_armor_inventory_changed] = tesla_coil.on_player_armor_inventory_changed

legacy_lib.events[defines.events.on_string_translated] = planetary_teleporter.on_string_translated

-- SURFACES

-- legacy_lib.events[defines.events.on_chunk_generated] = function(e)
--   creep.on_chunk_generated(e.area, e.surface)
-- end

-- legacy_lib.events[defines.events.on_surface_created] = function(e)
--   -- Space Exploration: only generate creep on Nauvis
--   if not script.active_mods["space-exploration"] then
--     creep.add_surface(e.surface_index)
--   end
-- end

-- TICKS AND TRIGGERS

legacy_lib.events[defines.events.on_script_trigger_effect] = function(e)
  if e.effect_id == "kr-tesla-coil-trigger" then
    tesla_coil.process_turret_fire(e.target_entity, e.source_entity)
  elseif e.effect_id == "kr-planetary-teleporter-character-trigger" then
    planetary_teleporter.update_players_in_range(e.source_entity, e.target_entity)
  end
end

legacy_lib.events[defines.events.on_tick] = function()
  -- NOTE: These two are out of order on purpose, update_gui_statuses() must run first
  planetary_teleporter.update_gui_statuses()
  planetary_teleporter.update_all_destination_availability()
end

handler.add_lib(legacy_lib)
