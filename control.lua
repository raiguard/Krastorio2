local event = require("__flib__.event")
local migration = require("__flib__.migration")
local on_tick_n = require("__flib__.on-tick-n")

local migrations = require("scripts.migrations")
local util = require("scripts.util")

local tesla_coil = require("scripts.entity.tesla-coil")

-- BOOTSTRAP

event.on_init(function()
  -- Initialize libraries
  on_tick_n.init()

  -- Initialize `global` table
  tesla_coil.init()

  -- Initialize mod
  util.add_to_crash_site()
  util.disable_rocket_victory()
  util.ensure_turret_force()
end)

event.on_configuration_changed(function(e)
  if migration.on_config_changed(e, migrations) then
    util.add_to_crash_site()
    util.disable_rocket_victory()
    util.ensure_turret_force()
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

-- TICKS AND TRIGGERS

event.on_tick(function(e)
  local actions = on_tick_n.get(e.tick)
  if actions then
    for _, action in pairs(actions) do
      if action.name == "update_tesla_coil" then
        tesla_coil.update(action.turret_unit_number)
      end
    end
  end
end)

event.on_script_trigger_effect(function(e)
  if e.effect_id == "kr-tesla-coil-trigger" then
    tesla_coil.process_turret_fire(e.source_entity, e.target_entity)
  end
end)
