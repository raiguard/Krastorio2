local hit_effects = require ("__base__.prototypes.entity.demo-hit-effects")
local animation = 
{
	layers =
	{
		{
			filename = kr_entities_path .. "gas-power-station/gas-power-station.png",
			width = 190,
			height = 190,
			frame_count = 32,
			line_length = 8,
			animation_speed=1.2,
			shift = {0, 0},
			hr_version =
			{
				filename = kr_entities_path .. "gas-power-station/hr-gas-power-station.png",
				width = 380,
				height = 380,
				scale = 0.5,
				frame_count = 32,
				line_length = 8,
				animation_speed=1.2,
				shift = {0, 0}
			}
		},
		{
			filename = kr_entities_path .. "gas-power-station/gas-power-station-sh.png",
			width = 190,
			height = 190,
			frame_count = 1,
			repeat_count = 32,
			animation_speed=1.2,
			draw_as_shadow = true,
			shift = {0, 0},
			hr_version =
			{
				filename = kr_entities_path .. "gas-power-station/hr-gas-power-station-sh.png",
				width = 380,
				height = 380,
				scale = 0.5,
				frame_count = 1,
				repeat_count = 32,
				animation_speed=1.2,
				draw_as_shadow = true,
				shift = {0, 0}
			}
		},
	}
}

data:extend(
{  
	{
		type = "trivial-smoke",
		name = "gas-power-station-smoke",
		duration = 250,
		fade_in_duration = 0,
		fade_away_duration = 150,
		spread_duration = 400,
		start_scale = 0.4,
		end_scale = 1.5,
		color = {r = 0.25, g = 0.25, b = 0.25, a = 0.75},
		cyclic = true,
		affected_by_wind = true,
		animation =
		{
			width = 152,
			height = 120,
			line_length = 5,
			frame_count = 60,
			shift = {-0.53125, -0.4375},
			priority = "high",
			animation_speed = 0.25,
			filename = "__base__/graphics/entity/smoke/smoke.png", --kr_entities_path .. "gas-power-station/gas-power-station-smoke.png",
			flags = { "smoke" }
		}
	},
	{
		type = "generator",
		name = "kr-gas-power-station",
		icon = kr_entities_icons_path .. "gas-power-station.png",
		icon_size = 64,
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 1, result = "kr-gas-power-station"},
		max_health = 750,
		corpse = "kr-medium-random-pipes-remnant",
		dying_explosion = "medium-explosion",
		fluid_usage_per_tick = 1,
		maximum_temperature = 25,
		burns_fluid = true,
		scale_fluid_usage = true,
		effectivity = 1,
		resistances = 
		{
			{type = "physical",percent = 25},
			{type = "fire",percent = 75},
			{type = "impact",percent = 50}
		},
		collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		damaged_trigger_effect = hit_effects.entity(),
		fluid_box =
		{
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 1,
				height = 2,
				base_level = -1,
				pipe_connections = 
				{
					{ type = "input-output", position = {3, 0} },
					{ type = "input-output", position = {-3, 0} },
					{ type = "input-output", position = {0, 3} },
					{ type = "input-output", position = {0, -3} }
				},
				production_type = "input-output",
				minimum_temperature = 25.0
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "primary-output"
		},
		horizontal_animation = animation,
		vertical_animation = animation,
		smoke =
		{
			{
				name = "gas-power-station-smoke",
				north_position = util.by_pixel(47, -88),
				south_position = util.by_pixel(47, -88),
				east_position = util.by_pixel(47, -88),
				west_position = util.by_pixel(47, -88),
				frequency = 0.625,
				starting_vertical_speed = 0.05,
				slow_down_factor = 1,
				starting_frame_deviation = 60
			}
		},
		vehicle_impact_sound = 
		{ 
			filename = "__base__/sound/car-metal-impact.ogg", 
			volume = 0.65 
		},
		working_sound =
		{
			sound =
			{
				variations =
				{
					{
						filename = kr_buildings_sounds_path .. "gas-power-station-1.ogg",
						volume = 0.9
					},
					{
						filename = kr_buildings_sounds_path .. "gas-power-station-2.ogg",
						volume = 0.8
					}
				},
				aggregation =
				{
					max_count = 3,
					remove = false,
					count_already_playing = true
				}
			},
			match_speed_to_activity = true,
			max_sounds_per_type = 3,
			fade_in_ticks = 10,
			fade_out_ticks = 30
		},
		audible_distance_modifier = 5,
		min_perceived_performance = 0.25,
		performance_to_sound_speedup = 0.5,
		max_power_output = "3600KW"
	}
})