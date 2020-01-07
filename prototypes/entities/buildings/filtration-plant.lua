data:extend(
{  
	{
		type = "assembling-machine",
		name = "kr-filtration-plant",		
		icon = kr_entities_icons_path .. "filtration-plant.png",
		icon_size = 64,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-filtration-plant"},
		max_health = 2000,
		corpse = "kr-big-random-pipes-remnant",
		dying_explosion = "big-explosion",
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 50},
			{type = "impact",percent = 50}
		},
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {0, -4} }}
			},						
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 10,
				base_level = 1,
				pipe_connections = {{ type="output", position = {0, 4} }}
			},
			off_when_no_fluid_recipe = false
		},
		collision_box = {{-3.25, -3.25}, {3.25, 3.25}},
		selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
		fast_replaceable_group = "assembling-machine",
		animation =
		{
			filename = kr_entities_path .. "filtration-plant/filtration-plant.png",
			priority = "high",
			scale = scale,
			width = 300,
			height = 300,
			frame_count = 1,
			hr_version =
			{
				filename = kr_entities_path .. "filtration-plant/hr-filtration-plant.png",
				priority = "high",
				scale = scale,
				width = 600,
				height = 600,
				frame_count = 1,
				scale = 0.5
			}
		},
		working_visualisations =
		{
			{
				animation =
				{
					filename = kr_entities_path .. "filtration-plant/filtration-plant-animation.png",
					priority = "high",
					scale = scale,
					width = 200,
					height = 220,
					frame_count = 24,
					line_length = 5,
					animation_speed=0.5,
					hr_version =
					{
						filename = kr_entities_path .. "filtration-plant/hr-filtration-plant-animation.png",
						priority = "high",
						scale = scale,
						width = 400,
						height = 440,
						frame_count = 24,
						line_length = 5,
						animation_speed=0.5,
						scale = 0.5
					}
				},
				light =
				{
					intensity = 0.1,
					size = 15,
					shift = {2.0, 0.0},
					color = {r=0.1, g=0.5, b=1}
				}
			},
		},		
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound = { filename = kr_buildings_sounds_path .. "filtration-plant.ogg" },
			idle_sound = { filename = "__base__/sound/idle1.ogg" },
			apparent_volume = 1.5
		},
		crafting_speed = 1.0,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 5
		},
		crafting_categories = { "fluid-filtration" },
		energy_usage = "500kW",
		ingredient_count = 6,
		module_specification = { module_slots = 2 },
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})