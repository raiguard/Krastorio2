data:extend(
{   
	{
		type = "electric-energy-interface",
		name = "kr-wind-turbine",
		icon =  kr_entities_icons_path .. "wind-turbine.png",
		icon_size = 64,
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 1, result = "kr-wind-turbine"},
		max_health = 200,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 30
			},
			{
				type = "physical",
				percent = 60
			},
			{
				type = "impact",
				percent = 30
			}
		},
		fast_replaceable_group = "kr-wind-turbine",
		collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
		selection_box = {{-0.95, -0.95}, {0.95, 0.95}},
		drawing_box = {{-0.5, -2}, {0.5, 1}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "0kJ",
			usage_priority = "solar",
			input_flow_limit = "0kW",
			output_flow_limit = "20kW",
			render_no_power_icon = false
		},
		energy_production = "20kW",
		energy_usage = "0kW",
		animation =
		{
			layers =
			{
				{
					filename = kr_entities_path .. "wind-turbine/wind-turbine.png",
					priority = "high",
					width = 75,
					height = 110,
					frame_count = 30,
					line_length = 6,
					animation_speed = 0.8,
					shift = {0, -0.9},
					hr_version =
					{
						filename = kr_entities_path .. "wind-turbine/hr-wind-turbine.png",
						priority = "medium",
						width = 150,
						height = 220,
						scale = 0.5,
						frame_count = 30,
						line_length = 6,
						animation_speed = 0.8,
						shift = {0, -0.9}
					}
				},
				{
					filename = kr_entities_path .. "wind-turbine/wind-turbine-shadow.png",
					priority = "high",
					width = 121,
					height = 50,
					frame_count = 30,
					line_length = 6,
					animation_speed = 0.5,
					draw_as_shadow = true,
					shift = {0.95, 0.1},
					hr_version =
					{
						filename = kr_entities_path .. "wind-turbine/hr-wind-turbine-shadow.png",
						priority = "medium",
						width = 242,
						height = 100,
						scale = 0.5,
						frame_count = 30,
						line_length = 6,
						animation_speed = 0.5,
						draw_as_shadow = true,
						shift = {0.95, 0.1}
					}
				},
			},
		},
		continuous_animation = true,
		working_sound =
		{
			sound =
			{
				filename = kr_buildings_sounds_path .. "wind-turbine-rotating.ogg",
				volume = 0.75
			},
			idle_sound =
			{
				filename = kr_buildings_sounds_path .. "wind-turbine-rotating.ogg",
				volume = 0.75
			},
			max_sounds_per_type = 5,
			apparent_volume = 1,
			audible_distance_modifier = 1,
			persistent = true
		}
	}
})

