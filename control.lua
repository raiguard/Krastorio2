local handler = require("__core__.lualib.event_handler")

handler.add_libraries({
  require("__flib__.gui"),

  require("scripts.creep-collector"),
  require("scripts.energy-absorber"),
  require("scripts.freeplay"),
  require("scripts.intergalactic-transceiver"),
  require("scripts.jackhammer"),
  require("scripts.loader-snapping"),
  require("scripts.offshore-pump"),
  require("scripts.patreon"),
  require("scripts.planetary-teleporter"),
  require("scripts.planetary-teleporter-gui"),
  require("scripts.radioactivity"),
  require("scripts.roboport"),
  require("scripts.shelter"),
  require("scripts.tesla-coil"),
  require("scripts.virus"),
})

local function ensure_turret_force()
  if not game.forces["kr-internal-turrets"] then
    game.create_force("kr-internal-turrets")
  end
end

local legacy_lib = {}

legacy_lib.on_init = ensure_turret_force
legacy_lib.on_configuration_changed = ensure_turret_force

legacy_lib.events = {
  [defines.events.on_technology_effects_reset] = function(e)
    if game.finished or game.finished_but_continuing then
      e.force.technologies["kr-logo"].enabled = true
    end
  end,
}

handler.add_lib(legacy_lib)
