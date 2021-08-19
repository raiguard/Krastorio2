local event = require("__flib__.event")
local migration = require("__flib__.migration")

local migrations = require("scripts.migrations")
local util = require("scripts.util")

local creep = require("scripts.creep")
local energy_absorber = require("scripts.energy-absorber")
local tesla_coil = require("scripts.entity.tesla-coil")
local virus = require("scripts.virus")

-- INTERFACES

remote.add_interface("kr-creep", creep.remote_interface)

-- BOOTSTRAP

event.on_init(function()
  -- Initialize `global` table
  creep.init()
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

-- EQUIPMENT

event.on_player_placed_equipment(energy_absorber.on_placed)
event.on_equipment_inserted(tesla_coil.on_equipment_inserted)
event.on_equipment_removed(tesla_coil.on_equipment_removed)

-- PLAYER

-- TODO: Add validity checks feature to the flib event module
event.on_player_used_capsule(virus.on_player_used_capsule)

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

event.on_tick(function(e)
  virus.iterate()
end)
