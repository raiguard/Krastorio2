local roboports = {}

for _, roboport in pairs(data.raw.roboport) do
  -- Fast replaceable group (for ease of variation switching)
  local fr_group = roboport.fast_replaceable_group or roboport.name
  roboport.fast_replaceable_group = fr_group

  -- Logistic
  local logistic_roboport = table.deepcopy(roboport)
  logistic_roboport.name = logistic_roboport.name .. "-logistic-mode"
  logistic_roboport.localised_name = { "entity-name.kr-logistic-roboport", { "entity-name." .. roboport.name } }
  logistic_roboport.localised_description = { "entity-description." .. roboport.name }
  logistic_roboport.placeable_by = { item = roboport.name, count = 1 }
  logistic_roboport.logistics_radius =
    math.ceil(logistic_roboport.logistics_radius + logistic_roboport.logistics_radius * 0.275) -- Standard roboport has 64x64 radius
  logistic_roboport.construction_radius = 0
  logistic_roboport.fast_replaceable_group = fr_group

  -- Construction
  local construction_roboport = table.deepcopy(roboport)
  construction_roboport.name = construction_roboport.name .. "-construction-mode"
  construction_roboport.localised_name = {
    "entity-name.kr-construction-roboport",
    { "entity-name." .. roboport.name },
  }
  construction_roboport.localised_description = { "entity-description." .. roboport.name }
  construction_roboport.placeable_by = { item = roboport.name, count = 1 }
  construction_roboport.construction_radius =
    math.ceil(construction_roboport.construction_radius + construction_roboport.construction_radius * 0.25)
  construction_roboport.logistics_connection_distance =
    math.ceil(math.min(construction_roboport.logistics_radius * 1.5, construction_roboport.construction_radius))
  construction_roboport.logistics_radius = 0
  construction_roboport.fast_replaceable_group = fr_group

  roboports[#roboports + 1] = logistic_roboport
  roboports[#roboports + 1] = construction_roboport
end

for _, roboport in pairs(roboports) do
  data:extend({ roboport })
end
