local event = require("__flib__.event")
local migration = require("__flib__.migration")

local migrations = require("scripts.migrations")
local util = require("scripts.util")

local creep = require("scripts.creep")
local tesla_coil = require("scripts.entity.tesla-coil")

-- INTERFACES

remote.add_interface("kr-creep", creep.remote_interface)

-- BOOTSTRAP

event.on_init(function()
  -- Initialize `global` table
  tesla_coil.init()

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
    local entity_name = entity.name
    if entity_name == "kr-tesla-coil" then
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
    local entity_name = entity.name
    if entity_name == "kr-tesla-coil" then
      tesla_coil.destroy(entity)
    elseif entity_name == "kr-tesla-coil-electric-beam" then
      game.print("beam gone!")
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

-- PLAYER

event.on_player_placed_equipment(function(e)
  local equipment = e.equipment
  if not equipment.valid or equipment.name ~= "energy-absorber" then return end
  local grid = e.grid
  if not grid.valid then return end
  local player = game.get_player(e.player_index)

  tesla_coil.on_energy_absorber_placed(player, equipment, grid)
end)

event.on_player_removed_equipment(function(e)
  if e.equipment ~= "energy-absorber" then return end
  local grid = e.grid
  if not grid.valid then return end

  tesla_coil.on_energy_absorber_removed(grid)
end)

-- TODO: Hook equipment gantry's custom event

-- SURFACES

event.on_chunk_generated(function(e)
  creep.on_chunk_generated(e.area, e.surface)
end)

-- TICKS AND TRIGGERS

event.on_script_trigger_effect(function(e)
  if e.effect_id == "kr-tesla-coil-trigger" then
    tesla_coil.process_turret_fire(e.source_entity, e.target_entity)
  end
end)
