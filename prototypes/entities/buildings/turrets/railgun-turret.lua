function railgun_turret_animation(inputs)
	return
	{
		layers = 
		{
			{
				filename = kr_entities_path .. "turrets/railgun-turret-sheet.png",
				priority = "medium",
				width = 175,
				height = 175,
				direction_count = inputs.direction_count and inputs.direction_count or 64,
				frame_count = 1,
				line_length = inputs.line_length and inputs.line_length or 8,
				axially_symmetrical = false,
				run_mode = inputs.run_mode and inputs.run_mode or "forward",
				hr_version =
				{
					filename = kr_entities_path .. "turrets/hr-railgun-turret-sheet.png",
					priority = "medium",
					scale = 0.5,
					width = 350,
					height = 350,
					direction_count = inputs.direction_count and inputs.direction_count or 64,
					frame_count = 1,
					line_length = inputs.line_length and inputs.line_length or 8,
					axially_symmetrical = false,
					run_mode = inputs.run_mode and inputs.run_mode or "forward"
				}
			}
		}
	}
end

function cannon_turret_attack_sheet(inputs)
	return
	{
		layers = 
		{
			{
				filename = kr_entities_path .. "turrets/railgun-turret-attack-sheet.png",
				priority = "medium",
				width = 175,
				height = 175,
				direction_count = 64,
				frame_count = 1,
				line_length = 8,
				axially_symmetrical = false,
				hr_version =
				{
					filename = kr_entities_path .. "turrets/hr-railgun-turret-attack-sheet.png",
					priority = "high",
					scale = 0.5,
					width = 350,
					height = 350,
					direction_count = 64,
					frame_count = 1,
					line_length = 8,
					axially_symmetrical = false
				}		  
			}
		}
	}
end

data:extend(
{  
	{
		type = "ammo-turret",
		name = "kr-railgun-turret",
		icon = kr_entities_icons_path .. "railgun-turret.png",
		icon_size = 64,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-railgun-turret"},
		max_health = 1000,
		corpse = "big-remnants",
		resistances = 
		{
			{type = "physical", percent = 50},
			{type = "fire", percent = 75},
			{type = "impact", percent = 75}
		},
		collision_box = {{-1.75, -1.75 }, {1.75, 1.75}},
		selection_box = {{-2, -2 }, {2, 2}},
		rotation_speed = 0.002,
		preparing_speed = 0.04,
		folding_speed = 0.04,
		dying_explosion = "big-explosion",
		inventory_size = 1,
		automated_ammo_count = 10,
		attacking_speed = 0.5,
		folded_animation = railgun_turret_animation{direction_count = 8, line_length = 1},
		preparing_animation = railgun_turret_animation{direction_count = 8, line_length = 1},
		prepared_animation = railgun_turret_animation{},
		attacking_animation = cannon_turret_attack_sheet{direction_count = 8, line_length = 1},
		folding_animation = railgun_turret_animation{direction_count = 8, line_length = 1, run_mode = "backward"},
		vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "railgun-shell",
			cooldown = 120,
			projectile_creation_distance = 2.65,
			projectile_center = {0, 0.4},
			shell_particle =
			{
				name = "shell-particle",
				direction_deviation = 0.1,
				speed = 0.1,
				speed_deviation = 0.02,
				center = {0, 0},
				creation_distance = -3.5,
				starting_frame_speed = 0.3,
				starting_frame_speed_deviation = 0.1
			},
			range = 50,
			min_range = 20,
			sound =
			{
				{
					filename = kr_weapons_sounds_path .. "railgun.ogg",
					volume = 1.5
				}
			}
		},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		call_for_help_radius = 80
	}
})