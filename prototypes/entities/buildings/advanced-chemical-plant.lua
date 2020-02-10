data:extend(
{  
	{
		type = "assembling-machine",
		name = "kr-advanced-chemical-plant",		
		icon = kr_entities_icons_path .. "advanced-chemical-plant.png",
		icon_size = 64,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-advanced-chemical-plant"},
		max_health = 2000,
		corpse = "kr-big-random-pipes-remnant",
		dying_explosion = "big-explosion",
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 70},
			{type = "impact",percent = 70}
		},
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 100,
				base_level = -1,
				pipe_connections = {{ type="input", position = {1, -4} }}
			},		
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 100,
				base_level = -1,
				pipe_connections = {{ type="input", position = {0, -4} }}
			},	
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 100,
				base_level = -1,
				pipe_connections = {{ type="input", position = {-1, -4} }}
			},				
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 10,
				base_level = 1,
				pipe_connections = {{ type="output", position = {1, 4} }}
			},
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 10,
				base_level = 1,
				pipe_connections = {{ type="output", position = {0, 4} }}
			},
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 10,
				base_level = 1,
				pipe_connections = {{ type="output", position = {-1, 4} }}
			},
			
			off_when_no_fluid_recipe = false
		},
		collision_box = {{-3.25, -3.25}, {3.25, 3.25}},
		selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
		fast_replaceable_group = "assembling-machine",
		animation =
		{
			filename = kr_entities_path .. "advanced-chemical-plant/advanced-chemical-plant.png",
			priority = "high",
			scale = scale,
			width = 300,
			height = 300,
			frame_count = 1,
			hr_version =
			{
				filename = kr_entities_path .. "advanced-chemical-plant/hr-advanced-chemical-plant.png",
				priority = "high",
				scale = scale,
				width = 600,
				height = 600,
				frame_count = 1,
				scale = 0.5,
			}
		},
		working_visualisations =
		{
			{
				animation =
				{
					filename = kr_entities_path .. "advanced-chemical-plant/advanced-chemical-plant-animation.png",
					priority = "high",
					scale = scale,
					width = 200,
					height = 220,
					frame_count = 12,
					line_length = 4,
					animation_speed = 0.05,
					hr_version =
					{
						filename = kr_entities_path .. "advanced-chemical-plant/hr-advanced-chemical-plant-animation.png",
						priority = "high",
						scale = scale,
						width = 400,
						height = 440,
						frame_count = 12,
						line_length = 4,
						animation_speed = 0.05,
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
			}
		},	  
		crafting_categories = {"chemistry"},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound = { filename = kr_buildings_sounds_path .. "advanced-chemical-plant.ogg" },
			idle_sound = { filename = "__base__/sound/idle1.ogg" },
			apparent_volume = 1.5
		},
		crafting_speed = 10,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 10
		},
		energy_usage = "2MW",
		ingredient_count = 6,
		module_specification =
		{
			module_slots = 4
		},
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})