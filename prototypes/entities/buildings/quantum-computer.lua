data:extend(
{
	{
		type = "assembling-machine",
		name = "kr-quantum-computer",
		icon = kr_entities_icons_path .. "quantum-computer.png",
		icon_size = 64,
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-quantum-computer"},
		max_health = 1000,
		corpse = "kr-medium-random-pipes-remnant",
		dying_explosion = "medium-explosion",
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 70},
			{type = "impact",percent = 70}
		},
		collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
		selection_box = {{-2.95, -2.95}, {2.95, 2.95}},
		fast_replaceable_group = "assembling-machine",
		animation =
		{
			filename = kr_entities_path .. "quantum-computer/quantum-computer.png",
			priority = "high",
			width = 250,
			height = 250,
			frame_count = 48,
			line_length = 8,
			animation_speed = 0.05,
			hr_version =
			{
				filename = kr_entities_path .. "quantum-computer/hr-quantum-computer.png",
				priority = "high",
				width = 500,
				height = 500,
				frame_count = 48,
				line_length = 8,
				animation_speed = 0.05,
				scale = 0.5
			}
		},
		crafting_categories = {"research-data", "t2-tech-cards", "t3-tech-cards"},
		crafting_speed = 2,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 10
		},
		energy_usage = "500KW",		
		working_visualisations =
		{
			{
				light =
				{
					intensity = 0.75,
					size = 20,
					shift = {0.0, 0.0},
					color = {r=0.35, g=0.75, b=1}
				}
			}
		},			
		module_specification = { module_slots = 4 },
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound      = { filename = kr_buildings_sounds_path .. "quantum-computer.ogg" },
			idle_sound = { filename = "__base__/sound/idle1.ogg" },
			apparent_volume = 1.5
		}
	}
})
