data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "capsule",
		name = "kr-creep-virus",
		icon = kr_capsules_icons_path .. "kr-creep-virus.png",
		icon_size = 64,
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
				  projectile = "poison-capsule",
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
		icon = kr_capsules_icons_path .. "kr-biter-virus.png",
		icon_size = 64,
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
				  projectile = "poison-capsule",
				  starting_speed = 0.3
				}
			  }
			}
		  }
		},
		subgroup = "capsule",
		order = "c[poison-capsule]",
		stack_size = 100
	}
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})