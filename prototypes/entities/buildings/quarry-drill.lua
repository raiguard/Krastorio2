data:extend(
{
	{
		type = "mining-drill",
		name = "kr-quarry-drill",
		icon = kr_entities_icons_path .. "quarry-drill.png",
		icon_size = 32,
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 1, result = "kr-quarry-drill"},
		fast_replaceable_group = "kr-quarry-drills",
		max_health = 1000,
		resource_categories = {"kr-quarry"},
		corpse = "kr-big-random-pipes-remnant",
		dying_explosion = "big-explosion",
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 70},
			{type = "impact",percent = 70}
		},
		collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
		selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
		module_specification = { module_slots = 2 },
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
		energy_source =
		{
			type = "burner",
			fuel_category = "kr-quarry-drill-fuel",
			effectivity = 0.75,
			fuel_inventory_size = 1,
			emissions_per_second_per_watt = 1 / 100000,
			smoke =
			{
				{
					name = "turbine-smoke",
					north_position = {0, -0.5},
					east_position = {0, -0.5},
					west_position = {0, -0.5},
					south_position = {0, -0.5},
					frequency = 40,
					starting_vertical_speed = 0.1,
					slow_down_factor = 1,
					starting_frame_deviation = 60
				}
			}
		},
		energy_usage = "1MW",
		mining_speed = 10,
		mining_power = 3,
		resource_searching_radius = 0.49,
		vector_to_place_result = {0, -3.65},
		radius_visualisation_picture = 
		{
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
			width = 12,
			height = 12
		},
		animations =
		{
			priority = "high",
			filename = kr_entities_path .. "quarry-drill/quarry-drill.png",
			line_length = 8,
			width = 250,
			height = 250,
			frame_count = 48,
			shift = {0.4, 0},
			animation_speed = 0.25,
			hr_version =
			{
				priority = "high",
				filename = kr_entities_path .. "quarry-drill/hr-quarry-drill.png",
				line_length = 8,
				width = 500,
				height = 500,
				frame_count = 48,
				shift = {0.4, 0},
				animation_speed = 0.25,
				scale = 0.5
			}
		},
		vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
		working_sound =
		{			
			sound = { filename = kr_buildings_sounds_path .. "quarry-drill.ogg" },
			idle_sound = { filename = "__base__/sound/idle1.ogg" },
			max_sounds_per_type = 2
		}
	}
})
