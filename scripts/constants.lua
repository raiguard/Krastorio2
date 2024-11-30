local constants = {}

constants.bonus_items = {
  { name = "construction-robot", count = 50 },
  { name = "modular-armor", count = 1 },
  { name = "car", count = 1 },
  { name = "fuel", count = 200 },
  { name = "big-battery-equipment", count = 1 },
  { name = "personal-roboport-equipment", count = 1 },
  { name = "small-portable-generator-equipment", count = 2 },
  { name = "cliff-explosives", count = 50 },
  { name = "landfill", count = 50 },
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

constants.transport_belt_connectable_types = {
  ["transport-belt"] = true,
  ["underground-belt"] = true,
  ["splitter"] = true,
  ["loader"] = true,
  ["loader-1x1"] = true,
  ["linked-belt"] = true,
}

return constants
