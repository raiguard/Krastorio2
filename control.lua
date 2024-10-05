local handler = require("__core__.lualib.event_handler")

handler.add_libraries({
  require("__flib__.gui"),

  require("scripts.migrations"),

  require("scripts.creep-collector"),
  require("scripts.energy-absorber"),
  require("scripts.freeplay"),
  require("scripts.intergalactic-transceiver"),
  require("scripts.jackhammer"),
  require("scripts.loader-snapping"),
  require("scripts.patreon"),
  require("scripts.planetary-teleporter-gui"), -- Must be before planetary-teleporter
  require("scripts.planetary-teleporter"),
  require("scripts.radioactivity"),
  require("scripts.roboport"),
  require("scripts.shelter"),
  require("scripts.tesla-coil"),
  require("scripts.virus"),
})
