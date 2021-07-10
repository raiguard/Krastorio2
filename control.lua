local event = require("__flib__.event")
local migration = require("__flib__.migration")

local migrations = require("scripts.migrations")
local util = require("scripts.util")

event.on_init(function()
  global.players = {}
  util.disable_rocket_victory()
end)

event.on_configuration_changed(function(e)
  if migration.on_config_changed(e, migrations) then
    util.disable_rocket_victory()
    for i, player in pairs(game.players) do
      -- TODO:
    end
  end
end)
