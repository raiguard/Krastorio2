local constants = {}

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

constants.transport_belt_connectable_types = {
  ["transport-belt"] = true,
  ["underground-belt"] = true,
  ["splitter"] = true,
  ["loader"] = true,
  ["loader-1x1"] = true,
  ["linked-belt"] = true,
}

return constants
