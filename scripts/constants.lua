local math = require("__flib__.math")

local constants = {}

constants.biter_virus_evolution_multiplier = 0.67

constants.freeplay_crash_site_parts = {
  {
    name = "kr-crash-site-lab-repaired",
    angle_deviation = 0.05,
    max_distance = 30,
    min_separation = 10,
    fire_count = 3,
    explosion_count = 1,
  },
  {
    name = "kr-crash-site-assembling-machine-1-repaired",
    repeat_count = 2,
    angle_deviation = 0.3,
    max_distance = 20,
    min_separation = 5,
    fire_count = 1,
  },
  {
    name = "kr-crash-site-assembling-machine-2-repaired",
    repeat_count = 2,
    angle_deviation = 0.3,
    max_distance = 20,
    min_separation = 5,
    fire_count = 1,
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
  ["kovarex"] = true,
  ["slpwnd"] = true,
  ["glex"] = true,
  ["twinsen"] = true,
  ["posila"] = true,
  ["oxyd"] = true,
  ["rseding"] = true,
  ["v453000"] = true,
  ["klonan"] = true,
  ["wheybags"] = true,
  ["zopa"] = true,
  -- Patreons
  ["astazora"] = true,
  ["biusart"] = true,
  ["mkaito"] = true,
  ["dmitrii"] = true,
  ["egdod"] = true,
  ["cvamp"] = true,
  ["dr.feelgood999"] = true,
  ["darkstroker"] = true,
  ["andromedafallen"] = true,
  ["andrewskier"] = true,
  ["aski_raven"] = true,
  ["wassabee"] = true,
  ["jonasrejman"] = true,
  ["melphin"] = true,
  ["moonded"] = true,
  ["reysdad"] = true,
  ["rivsung"] = true,
  ["grumblesxl"] = true,
  ["pandabeezy"] = true,
  ["nukeufo"] = true,
  ["therightmark"] = true,
  ["senard"] = true,
  ["jkkelley86"] = true,
  ["rougefallout365"] = true,
  ["gbs5009"] = true,
  ["vladhc"] = true,
  ["tobi"] = true,
  ["tobivollebregt"] = true,
  ["max.perry"] = true,
  ["djnaphthalin"] = true,
  ["circk"] = true,
  ["dusk88"] = true,
  ["generaltank"] = true,
  ["lordfish"] = true,
  ["zippyit"] = true,
  ["sollevix"] = true,
  ["tobi"] = true,
  ["quezler"] = true,
  ["antt1995"] = true,
}

constants.inserter_drop_vectors = {
  [true] = {[0] = {0.01, -0.2}, [2] = {0.2, 0.01}, [4] = {-0.01, 0.2}, [6] = {-0.2, -0.01}}, -- Near lane
  [false] = { [0] = {0.0, 0.2}, [2] = {-0.2, 0.0}, [4] = {0.0, -0.2}, [6] = {0.2, 0.0}},  -- Far lane
}

constants.loader_names = {
  ["kr-loader"] = true,
  ["kr-fast-loader"] = true,
  ["kr-express-loader"] = true,
  ["kr-advanced-loader"] = true,
  ["kr-superior-loader"] = true,
  ["kr-se-loader"] = true,
}

constants.mode_change_flying_text_color = {r = 1, g = 0.5, b = 0.25}

constants.next_roboport_mode = {
  [""] = "construction",
  ["-construction-mode"] = "logistic",
  ["-logistic-mode"] = "normal",
}

constants.patreon_items = {
  {name = "kr-shelter-plus", count = 1},
  {name = "kr-accelerator", count = 1},
  {name = "firearm-magazine", count = 190},
  {name = "potato", count = 6},
}

constants.radioactivity_defaults = {
  {type = "entity", tbl = "entities", objects = {"uranium-ore"}},
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
  normal = {suffix = "", text = "normal"},
  construction = {color = {r = 0.5, g = 1, b = 0.4}, suffix = "-construction-mode", text = "construction"},
  logistic = {color = {r = 1, g = 0.5, b = 0.25}, suffix = "-logistic-mode", text = "logistic"},
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
