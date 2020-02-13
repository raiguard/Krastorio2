local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

data:extend(
{ 
	{
		type = "accumulator",
		name = "kr-intergalactic-transceiver",
		icon = kr_entities_icons_path .. "intergalactic-transceiver.png",
		icon_size = 64,
		flags = {"placeable-neutral","placeable-player", "player-creation", "not-rotatable"},
		--minable = {mining_time = 5, result = "kr-intergalactic-transceiver"},
		max_health = 10000,
		corpse = "kr-big-random-pipes-remnant",
		dying_explosion = "nuclear-reactor-explosion",
		damaged_trigger_effect = hit_effects.entity(),
		collision_box = {{-5.75, -5.25}, {5.75, 5.25}},
		selection_box = {{-6, -5.5}, {6, 5.5}},
		drawing_box = {{-5.75, -5.25}, {5.75, 5.25}},
		resistances = 
		{
			{type = "physical", percent = 75},
			{type = "fire", percent = 75},
			{type = "impact", percent = 75}
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "20TJ",
			usage_priority = "tertiary",
			input_flow_limit = "50GW",
			output_flow_limit = "0W"
		},
		picture = 
		{
			layers=
			{
				{
					filename = kr_entities_path .. "intergalactic-transceiver/intergalactic-transceiver.png",
					width = 400,
					height = 400,
					frame_count = 1,
					shift = {0, -0.8},
					hr_version =
					{
						filename = kr_entities_path .. "intergalactic-transceiver/hr-intergalactic-transceiver.png",
						width = 800,
						height = 800,
						scale = 0.5,
						frame_count = 1,
						shift = {0, -0.8}
					}
				},
				{
					filename = kr_entities_path .. "intergalactic-transceiver/intergalactic-transceiver-sh.png",
					width = 434,
					height = 313,
					frame_count = 1,
					draw_as_shadow = true,
					shift = {0.52, 0.5},
					hr_version =
					{
						filename = kr_entities_path .. "intergalactic-transceiver/hr-intergalactic-transceiver-sh.png",
						width = 867,
						height = 626,
						scale = 0.5,
						frame_count = 1,
						draw_as_shadow = true,
						shift = {0.52, 0.5}
					}
				},
			
			},
		},
		charge_animation = 
		{
			layers=
			{
				{
					filename = kr_entities_path .. "intergalactic-transceiver/intergalactic-transceiver.png",
					width = 400,
					height = 400,
					frame_count = 1,
					repeat_count = 60,
					shift = {0, -0.8},
					animation_speed=0.3445,
					hr_version =
					{
						filename = kr_entities_path .. "intergalactic-transceiver/hr-intergalactic-transceiver.png",
						width = 800,
						height = 800,
						scale = 0.5,
						frame_count = 1,
						repeat_count = 60,
						animation_speed=0.3445,
						shift = {0, -0.8}
					}
				},
				{
					filename = kr_entities_path .. "intergalactic-transceiver/intergalactic-transceiver-sh.png",
					width = 434,
					height = 313,
					frame_count = 1,
					repeat_count = 60,
					draw_as_shadow = true,
					animation_speed=0.3445,
					shift = {0.52, 0.5},
					hr_version =
					{
						filename = kr_entities_path .. "intergalactic-transceiver/hr-intergalactic-transceiver-sh.png",
						width = 867,
						height = 626,
						scale = 0.5,
						frame_count = 1,
						repeat_count = 60,
						draw_as_shadow = true,
						animation_speed=0.3445,
						shift = {0.52, 0.5}
					}
				},
				{
					filename = kr_entities_path .. "intergalactic-transceiver/intergalactic-transceiver-charge.png",
					width = 400,
					height = 400,
					frame_count = 60,
					line_length = 10,
					animation_speed=0.3445,
					shift = {0, -0.8},
					hr_version =
					{
						filename = kr_entities_path .. "intergalactic-transceiver/hr-intergalactic-transceiver-charge.png",
						width = 800,
						height = 800,
						scale = 0.5,
						frame_count = 60,
						line_length = 10,
						animation_speed=0.3445,
						shift = {0, -0.8}
					}
				}
			}
		},
		charge_cooldown = 300,
		discharge_cooldown = 300,
		charge_light =
		{
			intensity = 1.5,
			size = 50,
			shift = {0, 0},
			color = {r=1, g=0.5, b=0.75}
		},
		vehicle_impact_sound = sounds.generic_impact,
		working_sound =
		{
			sound =
			{
				variations =
				{
					{
						filename = kr_buildings_sounds_path .. "intergalactic-transceiver-charge.ogg",
						volume = 1.5
					},
					{
						filename = kr_buildings_sounds_path .. "intergalactic-transceiver-charge.ogg",
						volume = 1.5
					},
					{
						filename = kr_buildings_sounds_path .. "intergalactic-transceiver-charge-morse.ogg",
						volume = 1.5
					},
				}
			},
			idle_sound =
			{
				filename = kr_buildings_sounds_path .. "intergalactic-transceiver.ogg",
				volume = 1
			},
			max_sounds_per_type = 3,
			fade_in_ticks = 10,
			fade_out_ticks = 30
		},
		audible_distance_modifier = 30,		
		circuit_wire_connection_point = nil, --circuit_connector_definitions["accumulator"].points,
		circuit_connector_sprites = nil, --circuit_connector_definitions["accumulator"].sprites,
		circuit_wire_max_distance = 0, --default_circuit_wire_max_distance,
		default_output_signal = {type = "virtual", name = "signal-I"}
	}
})
