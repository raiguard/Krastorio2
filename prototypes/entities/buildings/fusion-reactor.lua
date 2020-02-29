data:extend(
{  
	{
		type = "furnace",
		name = "kr-fusion-reactor",
		icon = kr_entities_icons_path .. "fusion-reactor.png",
		icon_size = 64,
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {hardness = 1, mining_time = 3, result = "kr-fusion-reactor"},
		max_health = 20000,
		corpse = "kr-fusion-reactor-remnant",
		dying_explosion = "medium-explosion",
		resistances = 
		{
			{type = "physical",percent = 60},
			{type = "fire",percent = 95},
			{type = "impact",percent = 95}
		},
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {0, 8} }}
			},
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 1000,
				base_level = 1,
				pipe_connections = {{ type="output", position = {0, -8} }}
			},
			off_when_no_fluid_recipe = false
		},
		collision_box = {{-7.25, -7.25}, {7.25, 7.25}},
		selection_box = {{-7.5, -7.5}, {7.5, 7.5}},
		animation =
		{
			layers =
			{
				{
					filename = kr_entities_path .. "fusion-reactor/fusion-reactor.png",
					width = 550,
					height = 550,
					frame_count = 1,
					shift = {1.01, 0},
					hr_version =
					{
						filename = kr_entities_path .. "fusion-reactor/hr-fusion-reactor.png",
						width = 1100,
						height = 1100,
						scale = 0.5,
						frame_count = 1,
						shift = {1.01, 0}
					}
				},
				{
					filename = kr_entities_path .. "fusion-reactor/fusion-reactor-shadow.png",
					priority = "high",
					scale = scale,
					width = 550,
					height = 550,
					shift = {1.01, 0},
					frame_count = 1,
					draw_as_shadow = true,
					hr_version =
					{
						filename = kr_entities_path .. "fusion-reactor/hr-fusion-reactor-shadow.png",
						priority = "high",
						scale = scale,
						width = 1100,
						height = 1100,
						shift = {1.01, 0},
						frame_count = 1,
						draw_as_shadow = true,
						scale = 0.5
					}
				}
			}
		},
		working_visualisations =
		{
			{
				animation =
				{
					filename = kr_entities_path .. "fusion-reactor/fusion-reactor-animation.png",
					line_length = 6,
					width = 313,
					height = 344,
					frame_count = 12,
					animation_speed = 0.75,
					shift = {2.18, -2.358},
					hr_version =
					{
						filename = kr_entities_path .. "fusion-reactor/hr-fusion-reactor-animation.png",
						line_length = 6,
						width = 626,
						height = 688,
						frame_count = 12,
						animation_speed = 0.75,
						scale = 0.5,
						shift = {2.18, -2.358}
					}
				}
			},
			{
				animation =
				{
					filename = kr_entities_path .. "fusion-reactor/fusion-reactor-steam.png",
					line_length = 10,
					width = 40,
					height = 81,
					frame_count = 60,
					animation_speed = 0.5,
					scale = 0.75,
					shift = {-4.25, -5.35}
				}
			},
			{
				animation =
				{
					filename = kr_entities_path .. "fusion-reactor/fusion-reactor-steam.png",
					line_length = 10,
					width = 40,
					height = 81,
					frame_count = 60,
					animation_speed = 0.5,
					scale = 0.5,
					shift = {-5.25, -1.35}
				}
			},
			{
				light =
				{
					intensity = 0.35,
					size = 30,
					shift = {0, 0},
					color = {r=0.95, g=0.75, b=0.5}
				}
			}

		},
		crafting_categories = {"nuclear-fusion"},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound =
			{
				filename = kr_buildings_sounds_path .. "fusion-reactor.ogg",
				volume = 1.5,	
				audible_distance_modifier = 10
			},
			idle_sound = { filename = "__base__/sound/idle1.ogg" },
			apparent_volume = 1.5
		},
		audible_distance_modifier = 25,
		crafting_speed = 1,
		energy_source =
		{
			type = "burner",
			fuel_categories = {"fusion-fuel"},
			fuel_inventory_size = 1,
			burnt_inventory_size = 1,
			emissions_per_minute = 2,
			effectivity = 1,
			emissions_per_minute = nil,
			light_flicker = {intensity = 2, minimum_light_size = 3, color = {r=0.35, g=0.75, b=1}},
			smoke =
			{
				{
					name = "turbine-smoke",
					north_position = {6.35, -3.75},
					east_position = {6.35, -3.75},
					west_position = {6.35, -3.75},
					south_position = {6.35, -3.75},
					frequency = 10,
					starting_vertical_speed = 0.05,
					slow_down_factor = 1,
					starting_frame_deviation = 60
				},
				{
					name = "turbine-smoke",
					north_position = {6.5, -2.7},
					east_position = {6.5, -2.7},
					west_position = {6.5, -2.7},
					south_position = {6.5, -2.7},
					frequency = 10,
					starting_vertical_speed = 0.05,
					slow_down_factor = 1,
					starting_frame_deviation = 60
				},
				{
					name = "turbine-smoke",
					north_position = {0, -6.35},
					east_position = {0, -6.35},
					west_position = {0, -6.35},
					south_position = {0, -6.35},
					frequency = 10,
					starting_vertical_speed = 0.05,
					slow_down_factor = 1,
					starting_frame_deviation = 60
				}
			}
		},	
		energy_usage = "2000MW",
		source_inventory_size = 1,
		result_inventory_size = 1,
		open_sound = { filename = kr_buildings_sounds_path .. "open.ogg", volume = 1 },
		close_sound = { filename = kr_buildings_sounds_path .. "close.ogg", volume = 0.85 }
	}
})