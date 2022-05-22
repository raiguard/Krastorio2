-----------------------------------------------------------------

-- Satellite
data.raw.item["satellite"].rocket_launch_product = { "space-research-data", 1000 }

-- Space science pack description
data.raw.tool["space-science-pack"].localised_description = { "item-description.optimization-tech-card" }

-----------------------------------------------------------------

-- Fish
data.raw.capsule["raw-fish"].rocket_launch_product = { "dolphin-gun", 1 }
data.raw.capsule["raw-fish"].capsule_action.attack_parameters.cooldown = 30
data.raw.capsule["raw-fish"].capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects = {
  type = "damage",
  damage = { type = "physical", amount = -50 },
}

-----------------------------------------------------------------

-- Make prod modules work in the filtration plant
table.insert(data.raw.module["productivity-module"].limitation, "quartz")
table.insert(data.raw.module["productivity-module-2"].limitation, "quartz")
table.insert(data.raw.module["productivity-module-3"].limitation, "quartz")
