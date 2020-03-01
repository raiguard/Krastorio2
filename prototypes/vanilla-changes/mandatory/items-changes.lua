-----------------------------------------------------------------

-- Satellite
data.raw.item["satellite"].rocket_launch_product = {"space-research-data", 1000}

-----------------------------------------------------------------

-- Fish
data.raw.capsule["raw-fish"].rocket_launch_product = {"dolphin-gun", 1}
data.raw.capsule["raw-fish"].capsule_action.attack_parameters.cooldown = 20
data.raw.capsule["raw-fish"].capsule_action.attack_parameters.ammo_type.action.action_delivery.target_effects =
{
	type = "damage",
	damage = {type = "physical", amount = -50}
}

-----------------------------------------------------------------

