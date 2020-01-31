local hit_effects = require ("__base__.prototypes.entity.demo-hit-effects")
local sounds = require("__base__.prototypes.entity.demo-sounds")

data:extend(
{  
	{
		type = "burner-generator",
		name = "kr-gas-turbine-power-station",
		icon = kr_entities_icons_path .. "gas-turbine-power-station.png",
		icon_size = 64,
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 1, result = "kr-gas-turbine-power-station"},
		max_health = 750,
		corpse = "kr-medium-random-pipes-remnant",
		dying_explosion = "medium-explosion",
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
					{ type="input-output", position = {3, 0} },
					{ type="input-output", position = {-3, 0} },
					{ type="input-output", position = {0, 3} },
					{ type="input-output", position = {0, -3} },
				},
				production_type = "input-output",
				filter = "petroleum-gas",
				minimum_temperature = 0
		},
		energy_source =
		{
			type = "electric",
			render_no_power_icon = false,
			usage_priority = "primary-output"
		},
		burner =
		{
			type = "burner",
			fuel_category = "chemical",
			fuel_inventory_size = 1,
			effectivity = 1,
			effectivity = 5,
			emissions_per_minute = 200,
			--light_flicker = {intensity = 1.5, minimum_light_size = 3, color = {r=0.35, g=0.75, b=1}},
			smoke =
			{
				{
					name = "smoke",
					north_position = util.by_pixel(47, -88),
					south_position = util.by_pixel(47, -88),
					east_position = util.by_pixel(47, -88),
					west_position = util.by_pixel(47, -88),
					frequency = 120,
					starting_vertical_speed = 0.05,
					starting_frame_deviation = 60
				}
			}
		},
		animation =
		{
			layers =
			{
				{
					filename = kr_entities_path .. "gas-turbine-power-station/gas-turbine-power-station.png",
					width = 190,
					height = 190,
					frame_count = 32,
					line_length = 8,
					animation_speed=1.5,
					shift = {0, 0},
					hr_version =
					{
						filename = kr_entities_path .. "gas-turbine-power-station/hr-gas-turbine-power-station.png",
						width = 380,
						height = 380,
						scale = 0.5,
						frame_count = 32,
						line_length = 8,
						animation_speed=1.5,
						shift = {0, 0}
					}
				},
				{
					filename = kr_entities_path .. "gas-turbine-power-station/gas-turbine-power-station-sh.png",
					width = 190,
					height = 190,
					frame_count = 1,
					repeat_count = 32,
					animation_speed=1.5,
					draw_as_shadow = true,
					shift = {0, 0},
					hr_version =
					{
						filename = kr_entities_path .. "gas-turbine-power-station/hr-gas-turbine-power-station-sh.png",
						width = 380,
						height = 380,
						scale = 0.5,
						frame_count = 1,
						repeat_count = 32,
						animation_speed=1.5,
						draw_as_shadow = true,
						shift = {0, 0}
					}
				},
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
				filename = kr_buildings_sounds_path .. "gas-turbine-power-station.ogg",
				volume = 0.9
			},
			match_speed_to_activity = true,
			max_sounds_per_type = 3,
			fade_in_ticks = 10,
			fade_out_ticks = 30
		},
		audible_distance_modifier = 5,
		min_perceived_performance = 0.25,
		performance_to_sound_speedup = 0.5,
		max_power_output = "5MW"
	}
})