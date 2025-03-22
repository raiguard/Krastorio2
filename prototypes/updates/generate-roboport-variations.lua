local flib_prototypes = require("__flib__.prototypes")

--- @type data.RoboportPrototype[]
local roboports = {}

for roboport_name, roboport in pairs(data.raw.roboport) do
  local fast_replaceable_group = roboport.fast_replaceable_group or roboport_name
  roboport.fast_replaceable_group = fast_replaceable_group

  local placeable_by = roboport.placeable_by
  if not placeable_by and flib_prototypes.find("item", roboport_name) then
    placeable_by = { item = roboport_name, count = 1 }
  end

  -- Logistic
  local logistic_roboport = table.deepcopy(roboport)
  logistic_roboport.name = roboport_name .. "-logistic-mode"
  logistic_roboport.localised_name = { "entity-name.kr-logistic-roboport", { "entity-name." .. roboport_name } }
  logistic_roboport.localised_description = { "entity-description." .. roboport_name }
  logistic_roboport.factoriopedia_alternative = roboport_name
  logistic_roboport.placeable_by = placeable_by
  logistic_roboport.logistics_radius =
    math.ceil(logistic_roboport.logistics_radius + logistic_roboport.logistics_radius * 0.275) -- Standard roboport has 64x64 radius
  logistic_roboport.logistics_connection_distance = logistic_roboport.logistics_radius
  logistic_roboport.construction_radius = 0
  logistic_roboport.fast_replaceable_group = fast_replaceable_group

  -- Construction
  local construction_roboport = table.deepcopy(roboport)
  construction_roboport.name = roboport_name .. "-construction-mode"
  construction_roboport.localised_name = {
    "entity-name.kr-construction-roboport",
    { "entity-name." .. roboport_name },
  }
  construction_roboport.localised_description = { "entity-description." .. roboport_name }
  construction_roboport.factoriopedia_alternative = roboport_name
  construction_roboport.placeable_by = placeable_by
  construction_roboport.construction_radius =
    math.ceil(construction_roboport.construction_radius + construction_roboport.construction_radius * 0.25)
  construction_roboport.logistics_connection_distance =
    math.ceil(math.min(construction_roboport.logistics_radius * 1.5, construction_roboport.construction_radius))
  construction_roboport.logistics_radius = 0
  construction_roboport.fast_replaceable_group = fast_replaceable_group

  -- Directly extending data here would cause an infinite loop, so we add to an array before extending the array all at once.
  roboports[#roboports + 1] = logistic_roboport
  roboports[#roboports + 1] = construction_roboport
end

data:extend(roboports)
