data:extend(
{
	{
		type = "car",
		name = "kr-advanced-tank",
		icon = kr_vehicles_icons_path .. "advanced-tank.png",
		icon_size = 64,
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-flammable"},
		minable = {mining_time = 10, result = "kr-advanced-tank"},
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 5000,
		equipment_grid = "kr-tank-grid-2",
		corpse = "kr-advanced-tank-remnant",
		dying_explosion = "big-explosion",
		alert_icon_shift = util.by_pixel(-4, -13),
		immune_to_tree_impacts = true,
		immune_to_rock_impacts = true,
		energy_per_hit_point = 0.5,
		resistances =
		{
			{
				type = "fire",
				decrease = 30,
				percent = 80
			},
			{
				type = "physical",
				decrease = 30,
				percent = 70
			},
			{
				type = "impact",
				decrease = 100,
				percent = 90
			},
			{
				type = "explosion",
				decrease = 100,
				percent = 90
			},
			{
				type = "laser",
				decrease = 30,
				percent = 50
			},
			{
				type = "acid",
				decrease = 50,
				percent = 95
			}
		},
		collision_box = {{-1.45, -2.35}, {1.45, 2.35}},
		selection_box = {{-1.45, -2.35}, {1.45, 2.35}},
		drawing_box = {{-2, -2}, {2, 2}},
		effectivity = 1,
		braking_power = "12MW",
		burner =
		{
			fuel_category = "chemical",
			emissions_per_minute = 25,
			effectivity = 1,
			fuel_inventory_size = 3,
			smoke =
			{
				{
					name = "turbine-smoke",
					deviation = {0.25, 0.25},
					frequency = 30,
					position = {0, 2},
					starting_frame = 0,
					starting_vertical_speed = 0.1,
					slow_down_factor = 1,
					starting_frame_deviation = 60
				}
			}
		},
		consumption = "5MW",
		terrain_friction_modifier = 0.2,
		friction = 0.002,
		light =
		{
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-0.8, -21},
				size = 3,
				intensity = 0.75,
				color = {r = 0.75, g = 0.75, b = 1.0}
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "extra-high",
					flags = { "light" },
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.8, -21},
				size = 3,
				intensity = 0.75,
				color = {r = 0.75, g = 0.75, b = 1.0}
			}
		},
		animation =
		{
			layers =
			{
				{
					width = 208,
					height = 208,
					frame_count = 2,
					direction_count = 64,
					shift = {0, 0.25},
					animation_speed = 6,
					max_advance = 0.2,
					line_length = 8,
					scale = 1.05,
					stripes =
					{
						{
							filename = kr_entities_path .. "advanced-tank/advanced-tank-base.png",
							width_in_frames = 16,
							height_in_frames = 8
						}
					},
					hr_version =
					{
						width = 416,
						height = 416,
						frame_count = 2,
						direction_count = 64,
						shift = {0, 0.25},
						animation_speed = 6,
						max_advance = 0.2,
						line_length = 8,
						scale = 0.525,
						stripes =
						{
							{
								filename = kr_entities_path .. "advanced-tank/hr-advanced-tank-base.png",
								width_in_frames = 16,
								height_in_frames = 8
							}
						}
					}
				},
				{
					width = 208,
					height = 208,
					frame_count = 2,
					apply_runtime_tint = true,
					direction_count = 64,
					animation_speed = 6,
					max_advance = 0.2,
					line_length = 8,
					shift = {0, 0.25},
					scale = 1.05,
					stripes =
					{
						{
							filename = kr_entities_path .. "advanced-tank/advanced-tank-base-mask.png",
							width_in_frames = 16,
							height_in_frames = 8
						}
					},
					hr_version =
					{
						width = 416,
						height = 416,
						frame_count = 2,
						apply_runtime_tint = true,
						direction_count = 64,
						animation_speed = 6,
						max_advance = 0.2,
						line_length = 8,
						shift = {0, 0.25},
						scale = 0.525,
						stripes = 
						{
							{
								filename = kr_entities_path .. "advanced-tank/hr-advanced-tank-base-mask.png",
								width_in_frames = 16,
								height_in_frames = 8
							}
						}
					}
				},
				{
					width = 208,
					height = 208,
					frame_count = 2,
					draw_as_shadow = true,
					direction_count = 64,
					shift = {0.75, 0.25},
					scale = 1.05,
					animation_speed = 8,
					max_advance = 0.2,
					stripes =
					{
						{
							filename = kr_entities_path .. "advanced-tank/advanced-tank-base-shadow.png",
							width_in_frames = 16,
							height_in_frames = 8
						}
					},
					hr_version =
					{
						width = 416,
						height = 416,
						frame_count = 2,
						draw_as_shadow = true,
						direction_count = 64,
						shift = {0.75, 0.25},
						scale = 0.525,
						animation_speed = 8,
						max_advance = 0.2,
						stripes =
						{
							{
								filename = kr_entities_path .. "advanced-tank/hr-advanced-tank-base-shadow.png",
								width_in_frames = 16,
								height_in_frames = 8
							}
						}
					}
				}
			}
		},
		turret_animation =
		{
			layers =
			{
				{
					width = 250,
					height = 250,
					frame_count = 1,
					direction_count = 64,
					shift = {0, 0.25},
					scale = 1.05,
					animation_speed = 6,
					max_advance = 0.2,
					line_length = 16,
					stripes =
					{
						{
							filename = kr_entities_path .. "advanced-tank/advanced-tank-turret.png",
							width_in_frames = 8,
							height_in_frames = 8
						}
					},
					hr_version =
					{
						width = 500,
						height = 500,
						frame_count = 1,
						direction_count = 64,
						shift = {0, 0.25},
						scale = 0.525,
						animation_speed = 6,
						max_advance = 0.2,
						line_length = 16,
						stripes =
						{
							{
								filename = kr_entities_path .. "advanced-tank/hr-advanced-tank-turret.png",
								width_in_frames = 8,
								height_in_frames = 8
							}
						}
					}
				},
				{
					width = 250,
					height = 250,
					frame_count = 1,
					apply_runtime_tint = true,
					direction_count = 64,
					animation_speed = 6,
					max_advance = 0.2,
					line_length = 16,
					shift = {0, 0.25},
					scale = 1.05,
					stripes = 
					{
						{
							filename = kr_entities_path .. "advanced-tank/advanced-tank-turret-mask.png",
							width_in_frames = 8,
							height_in_frames = 8
						}
					},
					hr_version =
					{
						width = 500,
						height = 500,
						frame_count = 1,
						apply_runtime_tint = true,
						direction_count = 64,
						animation_speed = 6,
						max_advance = 0.2,
						line_length = 16,
						shift = {0, 0.25},
						scale = 0.525,
						stripes = 
						{
							{
								filename = kr_entities_path .. "advanced-tank/hr-advanced-tank-turret-mask.png",
								width_in_frames = 8,
								height_in_frames = 8
							}
						}
					}
				},
				{
					width = 258,
					height = 258,
					frame_count = 1,
					draw_as_shadow = true,
					direction_count = 64,
					animation_speed = 6,
					max_advance = 0.2,
					line_length = 16,
					shift = {0.75, 0.25},
					scale = 1.05,
					stripes = 
					{
						{
							filename = kr_entities_path .. "advanced-tank/advanced-tank-turret-shadow.png",
							width_in_frames = 8,
							height_in_frames = 8
						}
					},
					hr_version =
					{
						width = 516,
						height = 516,
						frame_count = 1,
						draw_as_shadow = true,
						direction_count = 64,
						animation_speed = 6,
						max_advance = 0.2,
						line_length = 16,
						shift = {0.75, 0.25},
						scale = 0.525,
						stripes = 
						{
							{
								filename = kr_entities_path .. "advanced-tank/hr-advanced-tank-turret-shadow.png",
								width_in_frames = 8,
								height_in_frames = 8
							}
						}
					}
				}
			}
		},
		turret_rotation_speed = 0.3 / 60,
		turret_return_timeout = 300,
		sound_no_fuel =
		{
			{
				filename = "__base__/sound/fight/tank-no-fuel-1.ogg",
				volume = 0.8
			}
		},
		sound_minimum_speed = 0.15;
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound =
			{
				filename = kr_vehicles_sounds_path .. "advanced-tank-engine.ogg",
				volume = 1
			},
			activate_sound =
			{
				filename = kr_vehicles_sounds_path .. "advanced-tank-engine-start.ogg",
				volume = 1
			},
			deactivate_sound =
			{
				filename = "__base__/sound/fight/tank-engine-stop.ogg",
				volume = 0.8
			},
			match_speed_to_activity = true
		},
		open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
		close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
		rotation_speed = 0.0035,
		tank_driving = true,
		weight = 150000,
		inventory_size = 130,
		guns = 
		{
			"advanced-tank-machine-gun",
			"advanced-tank-laser-cannon",
			"advanced-tank-tank-cannon-a",
			"advanced-tank-cannon-b",
			"advanced-tank-cannon-c"
		}
	}
})