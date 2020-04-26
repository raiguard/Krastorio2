data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "capsule",
		name = "kr-creep-virus",
		icon = kr_capsules_icons_path .. "creep-virus.png",
		icon_size = 64,
		icon_mipmaps = 4,
		capsule_action =
		{
		  type = "throw",
		  attack_parameters =
		  {
			type = "projectile",
			ammo_category = "capsule",
			cooldown = 60,
			projectile_creation_distance = 0.6,
			range = 25,
			ammo_type =
			{
			  category = "capsule",
			  target_type = "position",
			  action =
			  {
				type = "direct",
				action_delivery =
				{
				  type = "projectile",
				  projectile = "virus-capsule",
				  starting_speed = 0.3
				}
			  }
			}
		  }
		},
		subgroup = "capsule",
		order = "c[poison-capsule]",
		stack_size = 100
	},
	{
		type = "capsule",
		name = "kr-biter-virus",
		icon = kr_capsules_icons_path .. "biter-virus.png",
		icon_size = 64,
		icon_mipmaps = 4,
		capsule_action =
		{
		  type = "throw",
		  attack_parameters =
		  {
			type = "projectile",
			ammo_category = "capsule",
			cooldown = 60,
			projectile_creation_distance = 0.6,
			range = 25,
			ammo_type =
			{
			  category = "capsule",
			  target_type = "position",
			  action =
			  {
				type = "direct",
				action_delivery =
				{
				  type = "projectile",
				  projectile = "virus-capsule",
				  starting_speed = 0.3
				}
			  }
			}
		  }
		},
		subgroup = "capsule",
		order = "c[poison-capsule]",
		stack_size = 100
	},
	{
		type = "capsule",
		name = "spoiled-potato",
		icon = kr_capsules_icons_path .. "spoiled-potato.png",
		rocket_launch_product = {"poop", 1},
		icon_size = 64,
		icon_mipmaps = 4,
		subgroup = "other",
		flags = {"hidden"},
		capsule_action =
		{
			type = "use-on-self",
			attack_parameters =
			{
				type = "projectile",
				ammo_category = "capsule",
				cooldown = 30,
				range = 0,
				ammo_type =
				{
					category = "capsule",
					target_type = "position",
					action =
					{
						type = "direct",
						action_delivery =
						{
							type = "instant",
							target_effects =
							{
								type = "damage",
								damage = {type = "physical", amount = 50}
							}
						}
					}
				}
			}
		},
		stack_size = 50
	},
	{
		type = "capsule",
		name = "poop",
		icon = kr_capsules_icons_path .. "poop.png",
		rocket_launch_product = {"kr-note-1", 1},
		icon_size = 64, icon_mipmaps = 4,
		subgroup = "other",
		flags = {"hidden"},
		capsule_action =
		{
			type = "throw",
			attack_parameters =
		{
			type = "projectile",
			ammo_category = "capsule",
			cooldown = 30,
			projectile_creation_distance = 0.6,
			range = 25,
			ammo_type =
			{
				category = "capsule",
				target_type = "position",
				action =
				{
					type = "direct",
					action_delivery =
					{
						type = "projectile",
						projectile = "poop-projectile",
						starting_speed = 0.3
					}
				}
			}
		}
		},
		stack_size = 50
	},
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})