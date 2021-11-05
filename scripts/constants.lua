local math = require("__flib__.math")

local constants = {}

constants.biter_virus_evolution_multiplier = 0.67

constants.bonus_items = {
  { name = "construction-robot", count = 50 },
  { name = "modular-armor", count = 1 },
  { name = "car", count = 1 },
  { name = "fuel", count = 200 },
  { name = "big-battery-equipment", count = 1 },
  { name = "personal-roboport-equipment", count = 1 },
  { name = "small-portable-generator", count = 2 },
  { name = "cliff-explosives", count = 50 },
  { name = "landfill", count = 50 },
}

constants.creep_collection_rate = {
  min = 30,
  max = 80,
}

constants.creep_max_reach = 10

constants.freeplay_crash_site_parts = {
  {
    name = "kr-crash-site-lab-repaired",
    angle_deviation = 0.05,
    max_distance = 30,
    min_separation = 10,
    fire_count = 3,
    explosion_count = 1,
    force = "player",
  },
  {
    name = "kr-crash-site-assembling-machine-1-repaired",
    repeat_count = 2,
    angle_deviation = 0.3,
    max_distance = 20,
    min_separation = 5,
    fire_count = 1,
    force = "player",
  },
  {
    name = "kr-crash-site-assembling-machine-2-repaired",
    repeat_count = 2,
    angle_deviation = 0.3,
    max_distance = 20,
    min_separation = 5,
    fire_count = 1,
    force = "player",
  },
  {
    name = "kr-crash-site-chest-1",
    repeat_count = 3,
    angle_deviation = 0.1,
    max_distance = 20,
    min_separation = 3,
    fire_count = 1,
  },
  {
    name = "kr-crash-site-chest-2",
    repeat_count = 3,
    angle_deviation = 0.1,
    max_distance = 20,
    min_separation = 2,
    fire_count = 1,
  },
  {
    name = "kr-mineable-wreckage",
    repeat_count = 9,
    angle_deviation = 0.8,
    max_distance = 10,
  },
}

constants.high_patrons = {
  -- Mod Developers
  ["krastor"] = true,
  ["linver"] = true,
  ["raiguard"] = true,
  -- Factorio Developers
  ["bilka"] = true,
  ["glex"] = true,
  ["klonan"] = true,
  ["kovarex"] = true,
  ["oxyd"] = true,
  ["posila"] = true,
  ["rseding"] = true,
  ["slpwnd"] = true,
  ["twinsen"] = true,
  ["v453000"] = true,
  ["wheybags"] = true,
  ["zopa"] = true,
  -- Patreons
  ["andrewskier"] = true,
  ["andromedafallen"] = true,
  ["antt1995"] = true,
  ["aski_raven"] = true,
  ["astazora"] = true,
  ["biusart"] = true,
  ["circk"] = true,
  ["cvamp"] = true,
  ["darkstroker"] = true,
  ["djnaphthalin"] = true,
  ["dmitrii"] = true,
  ["dr.feelgood999"] = true,
  ["dusk88"] = true,
  ["egdod"] = true,
  ["gbs5009"] = true,
  ["generaltank"] = true,
  ["grumblesxl"] = true,
  ["jkkelley86"] = true,
  ["jonasrejman"] = true,
  ["lordfish"] = true,
  ["max.perry"] = true,
  ["melphin"] = true,
  ["mkaito"] = true,
  ["moonded"] = true,
  ["nukeufo"] = true,
  ["pandabeezy"] = true,
  ["quezler"] = true,
  ["reysdad"] = true,
  ["rivsung"] = true,
  ["rougefallout365"] = true,
  ["senard"] = true,
  ["sollevix"] = true,
  ["therightmark"] = true,
  ["tobi"] = true,
  ["tobivollebregt"] = true,
  ["vladhc"] = true,
  ["wassabee"] = true,
  ["zippyit"] = true,
}

constants.inserter_drop_vectors = {
  [true] = { [0] = { 0.01, -0.2 }, [2] = { 0.2, 0.01 }, [4] = { -0.01, 0.2 }, [6] = { -0.2, -0.01 } }, -- Near lane
  [false] = { [0] = { 0.0, 0.2 }, [2] = { -0.2, 0.0 }, [4] = { 0.0, -0.2 }, [6] = { 0.2, 0.0 } }, -- Far lane
}

constants.intergalactic_transceiver = {
  cutscene = {
    player_radius = 100,
    final_transition_time = 60,
  },
  delta = 2.5e8, -- Requires charge rate of 15 GW
  drain = 50e9,
  max_delta = 2e9,
  statuses = {
    charging = {
      label = { "entity-status.charging" },
      sprite = "utility/status_working",
    },
    discharging = {
      alert_label = { "gui.kr-intergalactic-transceiver-alert-discharging" },
      label = { "entity-status.discharging" },
      sprite = "utility/status_not_working",
    },
    not_enough_input = {
      alert_label = { "gui.kr-intergalactic-transceiver-alert-not-enough-input" },
      label = { "entity-status.kr-not-enough-input" },
      sprite = "utility/status_not_working",
      tooltip = { "entity-status-tooltip.kr-not-enough-input" },
    },
    no_power = {
      alert_label = { "gui.kr-intergalactic-transceiver-alert-no-power" },
      label = { "entity-status.no-power" },
      sprite = "utility/status_not_working",
    },
    ready = {
      alert_label = { "gui.kr-intergalactic-transceiver-alert-ready" },
      label = { "entity-status.kr-ready" },
      sprite = "utility/status_working",
    },
  },
}

constants.jackhammer_max_reach = 15

constants.loader_names = {
  ["kr-loader"] = true,
  ["kr-fast-loader"] = true,
  ["kr-express-loader"] = true,
  ["kr-advanced-loader"] = true,
  ["kr-superior-loader"] = true,
  ["kr-se-loader"] = true,
}

constants.mode_change_flying_text_color = { r = 1, g = 0.5, b = 0.25 }

constants.next_roboport_mode = {
  [""] = "construction",
  ["-construction-mode"] = "logistic",
  ["-logistic-mode"] = "normal",
}

constants.patreon_items = {
  { name = "kr-shelter-plus", count = 1 },
  { name = "kr-accelerator", count = 1 },
  { name = "firearm-magazine", count = 190 },
  { name = "potato", count = 6 },
}

constants.radioactivity_defaults = {
  { type = "entity", tbl = "entities", objects = { "uranium-ore" } },
  {
    type = "item",
    tbl = "items",
    objects = {
      "nuclear-fuel",
      "uranium-235",
      "uranium-238",
      "uranium-fuel-cell",
      "uranium-ore",
      "used-up-uranium-fuel-cell",
    },
  },
}

constants.radioactivity_range = 7

constants.roboport_modes = {
  normal = { suffix = "", text = "normal" },
  construction = { color = { r = 0.5, g = 1, b = 0.4 }, suffix = "-construction-mode", text = "construction" },
  logistic = { color = { r = 1, g = 0.5, b = 0.25 }, suffix = "-logistic-mode", text = "logistic" },
}

constants.tesla_coil = {
  charging_rate = 3000000, -- 3 MW
  input_flow_limit = 18000000, -- 8 MW
  loss_multiplier = 1.5,
  required_energy = 10000000, -- 10 MW
  simultaneous_allowed = 4,
}

constants.transport_belt_connectable_types = {
  ["transport-belt"] = true,
  ["underground-belt"] = true,
  ["splitter"] = true,
  ["loader"] = true,
  ["loader-1x1"] = true,
  ["linked-belt"] = true,
}

constants.virus_iteration_counts = {
  [1000] = 20,
  [5000] = 40,
  [10000] = 80,
  [20000] = 160,
  [30000] = 280,
  [40000] = 300,
  [50000] = 400,
  [math.max_int53] = 800,
}

return constants
