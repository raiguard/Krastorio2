data:extend(
{
	{
		type = "assembling-machine",
		name = "kr-matter-assembler",		
		icon = kr_entities_icons_path .. "matter-assembler.png",
		icon_size = 64,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-matter-assembler"},
		max_health = 750,
		corpse = "kr-medium-random-pipes-remnant",
		dying_explosion = "matter-explosion",
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 70},
			{type = "impact",percent = 70}
		},
		fluid_boxes =
		{
			-- Inputs
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 100,
				base_level = -1,
				pipe_connections = {{ type="input-output", position = {0, -3} }}
			},
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 100,
				base_level = 1,
				pipe_connections = {{ type="input-output", position = {-3, 0} }}
			},
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 100,
				base_level = 1,
				pipe_connections = {{ type="input-output", position = {3, 0} }}
			},
			-- Outputs
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 100,
				base_level = 1,
				pipe_connections = {{ type="output", position = {0, 3} }}
			},
			off_when_no_fluid_recipe = false
		},
		collision_box = {{-2.25, -2.25}, {2.25, 2.25}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		fast_replaceable_group = "assembling-machine",
		animation =
		{
			filename = kr_entities_path .. "matter-assembler/matter-assembler.png",
			priority = "high",
			scale = scale,
			width = 213,
			height = 213,
			frame_count = 12,
			line_length = 6,
			nimation_speed = 0.1,
			hr_version =
			{
				filename = kr_entities_path .. "matter-assembler/hr-matter-assembler.png",
				priority = "high",
				scale = scale,
				width = 426,
				height = 426,
				frame_count = 12,
				line_length = 6,
				scale = 0.5,
				nimation_speed = 0.1
			}
		},		
		working_visualisations =
		{
			{
				light =
				{
					intensity = 0.7,
					size = 15,
					shift = {0.0, 0.0},
					color = {r=0.1, g=0.5, b=1}
				}
			}
		},		
		crafting_categories = {"matter-deconversion", "matter-items"},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound = { filename = kr_buildings_sounds_path .. "matter-assembler.ogg" },
			idle_sound = { filename = "__base__/sound/idle1.ogg" },
			apparent_volume = 1.5
		},
		crafting_speed = 1.0,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 10
		},
		energy_usage = "10MW",
		ingredient_count = 6,
		module_specification = { module_slots = 4 },
		allowed_effects = {"consumption", "productivity", "speed", "pollution"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})