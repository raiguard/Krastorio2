local create_roboport_states = {}

function create_roboport_states.createRoboportVariations(roboport_name)
  local roboport = krastorio.entities.getEntity("roboport", roboport_name)
  if roboport then
    -- Fast replaceable group (for ease of variation switching)
    local fr_group = roboport.fast_replaceable_group or roboport_name
    roboport.fast_replaceable_group = fr_group

    -- Logistic
    local logistic_roboport = util.table.deepcopy(roboport)
    logistic_roboport.name = logistic_roboport.name .. "-logistic-mode"
    logistic_roboport.localised_name = { "entity-name.kr-logistic-roboport", { "entity-name." .. roboport.name } }
    logistic_roboport.has_backer_name = false
    logistic_roboport.localised_description = { "entity-description." .. roboport.name }
    logistic_roboport.placeable_by = { item = roboport.name, count = 1 }
    logistic_roboport.logistics_radius = logistic_roboport.logistics_radius + logistic_roboport.logistics_radius * 0.25
    logistic_roboport.construction_radius = 0
    logistic_roboport.fast_replaceable_group = fr_group

    -- Construction
    local construction_roboport = util.table.deepcopy(roboport)
    construction_roboport.name = construction_roboport.name .. "-construction-mode"
    construction_roboport.localised_name = {
      "entity-name.kr-construction-roboport",
      { "entity-name." .. roboport.name },
    }
    construction_roboport.has_backer_name = false
    construction_roboport.localised_description = { "entity-description." .. roboport.name }
    construction_roboport.placeable_by = { item = roboport.name, count = 1 }
    construction_roboport.construction_radius = construction_roboport.construction_radius
      + construction_roboport.construction_radius * 0.25
    construction_roboport.logistics_radius = 0
    construction_roboport.fast_replaceable_group = fr_group

    data:extend({ logistic_roboport, construction_roboport })
  end
end

return create_roboport_states
