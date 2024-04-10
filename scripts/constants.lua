local math = require("__flib__.math")

local constants = {}

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

constants.freeplay_crash_site_parts = {
  {
    name = "kr-crash-site-generator",
    angle_deviation = 0.2,
    max_distance = 25,
    min_separation = 10,
    fire_count = 3,
    explosion_count = 1,
    force = "player",
  },
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

constants.inserter_drop_vectors = {
  [true] = { [0] = { 0.01, -0.2 }, [2] = { 0.2, 0.01 }, [4] = { -0.01, 0.2 }, [6] = { -0.2, -0.01 } }, -- Near lane
  [false] = { [0] = { 0.0, 0.2 }, [2] = { -0.2, 0.0 }, [4] = { 0.0, -0.2 }, [6] = { 0.2, 0.0 } }, -- Far lane
}

constants.mode_change_flying_text_color = { r = 1, g = 0.5, b = 0.25 }

constants.next_roboport_mode = {
  [""] = "construction",
  ["-construction-mode"] = "logistic",
  ["-logistic-mode"] = "normal",
}

constants.roboport_modes = {
  normal = { suffix = "", text = "normal" },
  construction = { color = { r = 0.5, g = 1, b = 0.4 }, suffix = "-construction-mode", text = "construction" },
  logistic = { color = { r = 1, g = 0.5, b = 0.25 }, suffix = "-logistic-mode", text = "logistic" },
}

constants.tesla_coil = {
  charging_rate = 3000000, -- 3 MW
  cooldown = 10,
  input_flow_limit = 18000000, -- 8 MW
  loss_multiplier = 1.8,
  range = 20,
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

return constants
