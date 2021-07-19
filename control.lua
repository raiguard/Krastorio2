local event = require("__flib__.event")
local migration = require("__flib__.migration")

local migrations = require("scripts.migrations")
local util = require("scripts.util")

local tesla_coil = require("scripts.entity.tesla-coil")

event.on_init(function()
  -- Initialize `global` table
  global.players = {}
  global.tesla_coils = tesla_coil.init()

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
    -- for i, player in pairs(game.players) do
    --   -- TODO:
    -- end
  end
end)

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
    end
  end
)

event.on_script_trigger_effect(function(e)
  if e.effect_id == "kr-tesla-coil-trigger" then
    global.tick_print = game.ticks_played
    game.print("trigger "..game.ticks_played.." "..e.target_entity.name)
  end
end)
