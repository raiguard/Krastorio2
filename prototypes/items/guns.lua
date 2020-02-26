data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------   
	{
		type = "gun",
		name = "impulse-rifle",
		icon = kr_guns_icons_path .. "impulse-rifle.png",
		icon_size = 64,
		subgroup = "gun",
		order = "c2[impulse-rifle]",
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "impulse-rifle",
			cooldown = 60,
			movement_slow_down_factor = 0.6,
			projectile_creation_distance = 0.6,
			range = 60,
			sound =
			{
				{
					filename = kr_weapons_sounds_path .. "impulse-rifle.ogg",
					volume = 0.75
				}
			}
		},
		stack_size = 10
	},
-----------------------------------------------------------------------------------------------------------------
	{
		type = "gun",
		name = "heavy-rocket-launcher",
		icon = kr_guns_icons_path .. "heavy-rocket-launcher.png",
		icon_size = 64,
		subgroup = "gun",
		order = "d[heavy-rocket-launcher]",
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "heavy-rocket",
			movement_slow_down_factor = 0.80,
			cooldown = 180,
			projectile_creation_distance = 0.6,
			range = 300,
			projectile_center = {-0.17, 0},
			sound =
			{
				{
					filename = kr_weapons_sounds_path .. "rocket-launch.ogg",
					volume = 1
				}
			}
		},
		stack_size = 5
	}  
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
