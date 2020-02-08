local variations_util = require(kr_public_lib .. "create-roboport-states")

data:extend(
{
	{
		type = "roboport",
		name = "kr-large-roboport",
		icon = kr_entities_icons_path .. "large-roboport.png",
		icon_size = 64,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-large-roboport"},
		max_health = 3500,
		corpse = "kr-big-random-pipes-remnant",
		collision_box = {{-3.75, -3.75}, {3.75, 3.75}},
		selection_box = {{-4, -4}, {4, 4}},
		resistances = 
		{
			{type = "physical",percent = 60},
			{type = "fire",percent = 80},
			{type = "impact",percent = 80}
		},
		dying_explosion = "big-explosion",
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			input_flow_limit = "100MW",
			buffer_capacity = "1GJ"
		},
		recharge_minimum = "50MJ",
		energy_usage = "1MW",
		-- per one charge slot
		charging_energy = "5MW",
		logistics_radius = 100,
		construction_radius = 200,
		charge_approach_distance = 5,
		robot_slots_count = 20,
		material_slots_count = 10,
		stationing_offset = {0, 0},
		charging_offsets =
		{
			{-0.5, -3.6}, {-1.7, -3.3}, {-2.5, -2.7}, {-3.1, -1.9}, {-3.4, -0.9}, {0.5, -3.6}, {1.7, -3.3}, {2.5, -2.7}, {3.1, -1.9}, {3.4, -0.9},
			{0.5, 2.8}, {1.7, 2.5}, {2.5, 1.9}, {3.1, 1.2}, {3.4, 0.1},           {-0.5, 2.8}, {-1.7, 2.5}, {-2.5, 1.9}, {-3.1, 1.2}, {-3.4, 0.1}
		},
		base =
		{
			filename = kr_entities_path .. "large-roboport/large-roboport.png",
			width = 340,
			height = 340,
			shift = {0, 0.4},
			hr_version =
			{
				filename = kr_entities_path .. "large-roboport/hr-large-roboport.png",
				width = 680,
				height = 680,
				shift = {0, 0.4},
				scale = 0.5
			}
		},
		base_patch =
		{
			filename = kr_entities_path .. "large-roboport/large-roboport-patch.png",
			width = 65,
			height = 50,
			shift = {0, 0.01},
			hr_version =
			{
				filename = kr_entities_path .. "large-roboport/hr-large-roboport-patch.png",
				width = 130,
				height = 100,
				shift = {0, 0.01},
				scale = 0.5
			}
		},
		base_animation =
		{
			filename = kr_entities_path .. "large-roboport/large-roboport-animation.png",
			priority = "medium",
			width = 187,
			height = 137,
			line_length = 6,
			frame_count = 12,
			shift = {0, -0.97},
			animation_speed = 0.1,
			hr_version =
			{
				filename = kr_entities_path .. "large-roboport/hr-large-roboport-animation.png",
				priority = "medium",
				width = 374,
				height = 274,
				scale = 0.5,
				line_length = 6,
				frame_count = 12,
				shift = {0, -0.97},
				animation_speed = 0.1
			}
		},
		door_animation_up =
		{
			filename = kr_entities_path .. "large-roboport/large-roboport-door-up.png",
			priority = "medium",
			width = 52,
			height = 22,
			frame_count = 16,
			shift = {0, -1.06},
			hr_version =
			{
				filename = kr_entities_path .. "large-roboport/hr-large-roboport-door-up.png",
				priority = "medium",
				width = 102,
				height = 43,
				scale = 0.5,
				frame_count = 16,
				shift = {0, -1.06}
			}
		},
		door_animation_down =
		{
			filename = kr_entities_path .. "large-roboport/large-roboport-door-down.png",
			priority = "medium",
			width = 51,
			height = 18,
			frame_count = 16,
			shift = {0, -0.45},
			hr_version =
			{
				filename = kr_entities_path .. "large-roboport/hr-large-roboport-door-down.png",
				priority = "medium",
				width = 102,
				height = 36,
				scale = 0.5,
				frame_count = 16,
				shift = {0, -0.45}
			}
		},
		recharging_animation =
		{
			filename = kr_entities_path .. "large-roboport/large-roboport-recharging.png",
			priority = "high",
			width = 37,
			height = 35,
			frame_count = 16,
			scale = 1.5,
			animation_speed = 0.5
		},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.6 },
			max_sounds_per_type = 3,
			audible_distance_modifier = 0.5,
			probability = 1 / (5 * 60) -- average pause between the sound is 5 seconds
		},
		recharging_light = {intensity = 0.4, size = 6, color = {r = 1.0, g = 1.0, b = 1.0}},
		request_to_open_door_timeout = 15,
		spawn_and_station_height = 0,
		draw_logistic_radius_visualization = true,
		draw_construction_radius_visualization = true,
		open_door_trigger_effect =
		{
			{
				type = "play-sound",
				sound = 
				{ 
					filename = "__base__/sound/roboport-door.ogg",
					volume = 0.5,
					min_speed = 1,
					max_speed = 1.5
				}
			}
		},
		close_door_trigger_effect =
		{
			{
				type = "play-sound",
				sound = 
				{ 
					filename = "__base__/sound/roboport-door-close.ogg",
					volume = 0.5,
					min_speed = 1,
					max_speed = 1.5
				}
			}
		},
		circuit_wire_connection_point = circuit_connector_definitions["roboport"].points,
		circuit_connector_sprites = circuit_connector_definitions["roboport"].sprites,
		circuit_wire_max_distance = 20,
		default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
		default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
		default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
		default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.6 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.6 }
	}
})

variations_util.createRoboportVariations("kr-large-roboport")