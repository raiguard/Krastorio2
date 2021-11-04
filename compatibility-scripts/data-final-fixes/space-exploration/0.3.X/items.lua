if mods["space-exploration"] and krastorio.general.isVersionGreaterEqualThan(mods["space-exploration"], "0.3.0") then
  -- Chaning the name of the antimatter reactor fuel for not be the same of the antimatter reactor of SE
  data.raw.item["empty-antimatter-fuel-cell"].localised_name = { "item-name.empty-singularity-fuel-cell" }
  data.raw.item["charged-antimatter-fuel-cell"].localised_name = { "item-name.charged-singularity-fuel-cell" }

  -- Removed as per issue #63
  -- Rebalancing the se-liquid-rocket-fuel value to be used from the gas power station
  -- data.raw.fluid["se-liquid-rocket-fuel"].fuel_value = "1000KJ"
  -- data.raw.fluid["se-liquid-rocket-fuel"].fuel_category = "burnable-fluid-fuel"
  -- data.raw.fluid["se-liquid-rocket-fuel"].fuel_emissions_multiplier = 1.5
  -- data.raw.fluid["se-liquid-rocket-fuel"].default_temperature = 25
  -- data.raw.fluid["se-liquid-rocket-fuel"].max_temperature = 100
  -- data.raw.fluid["se-liquid-rocket-fuel"].auto_barrel = true

  -- Belts items re-ordering
  data.raw.item["kr-advanced-splitter"].subgroup = "splitter"
  data.raw.item["kr-advanced-transport-belt"].subgroup = "transport-belt"
  data.raw.item["kr-advanced-underground-belt"].subgroup = "underground-belt"

  data.raw.item["kr-superior-splitter"].subgroup = "splitter"
  data.raw.item["kr-superior-transport-belt"].subgroup = "transport-belt"
  data.raw.item["kr-superior-underground-belt"].subgroup = "underground-belt"

  -- Labs ordering
  data.raw.item["biusart-lab"].subgroup = "lab"
  data.raw.item["kr-singularity-lab"].subgroup = "lab"

  data.raw.item["se-space-science-lab"].order = "g[lab]-g3[kr-singularity-lab]"
  data.raw.item["kr-singularity-lab"].order = "g[lab]-g4[kr-singularity-lab]"

  if data.raw.capsule["first-aid-kit"] then
    data.raw.capsule["first-aid-kit"].capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects.damage =
      {
        type = "physical",
        amount = -50,
      }
  end
end
