-----------------------------------------------------------------

-- Satellite
data.raw.item["satellite"].rocket_launch_product = { "space-research-data", 1000 }

-- Space science pack description
data.raw.tool[krastorio.optimization_tech_card_name].localised_description =
  { "item-description.optimization-tech-card" }

-----------------------------------------------------------------

-- Fish
data.raw.capsule["raw-fish"].rocket_launch_product = { "dolphin-gun", 1 }
data.raw.capsule["raw-fish"].capsule_action.attack_parameters.cooldown = 30
data.raw.capsule["raw-fish"].capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects = {
  type = "damage",
  damage = { type = "physical", amount = -50 },
}

-----------------------------------------------------------------

--- @param limitation string[]
--- @param key string
local function insert_if_present(limitation, key)
  if limitation then
    table.insert(limitation, key)
  end
end
-- Make prod modules work in the filtration plant
insert_if_present(data.raw.module["productivity-module"].limitation, "quartz")
insert_if_present(data.raw.module["productivity-module-2"].limitation, "quartz")
insert_if_present(data.raw.module["productivity-module-3"].limitation, "quartz")
