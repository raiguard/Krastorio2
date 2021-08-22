local math = require("__flib__.math")

local constants = {}

constants.biter_virus_evolution_multiplier = 0.67

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

constants.mode_change_flying_text_color = {1, 0.615, 0.235}

constants.next_roboport_mode = {
  [""] = "construction",
  ["-construction-mode"] = "logistic",
  ["-logistic-mode"] = "normal",
}

constants.radioactivity_range = 6

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
