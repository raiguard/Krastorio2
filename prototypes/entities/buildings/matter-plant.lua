data:extend(
{
	{
		type = "furnace",
		name = "kr-matter-plant",		
		icon = kr_entities_icons_path .. "matter-plant.png",
		icon_size = 64,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-matter-plant"},
		max_health = 3000,
		result_inventory_size = 1,
		source_inventory_size = 1,
		corpse = "matter-plant-remnant",
		dying_explosion = "big-matter-explosion",
		resistances = 
		{
			{type = "physical",percent = 60},
			{type = "fire",percent = 70},
			{type = "impact",percent = 70}
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
		collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
		selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
		fast_replaceable_group = "assembling-machine",
		animation =
		{
			layers =
			{
				{
					filename = kr_entities_path .. "matter-plant/matter-plant.png",
					priority = "high",
					scale = scale,
					width = 231,
					height = 250,
					frame_count = 1,
					shift = {0, 0},
					hr_version =
					{
						filename = kr_entities_path .. "matter-plant/hr-matter-plant.png",
						priority = "high",
						scale = scale,
						width = 462,
						height = 500,
						frame_count = 1,
						shift = {0, 0},
						scale = 0.5
					}
				},
				{
					filename = kr_entities_path .. "matter-plant/matter-plant-sh.png",
					priority = "high",
					scale = scale,
					width = 252,
					height = 222,
					frame_count = 1,
					draw_as_shadow = true,
					shift = {0, 0},
					hr_version =
					{
						filename = kr_entities_path .. "matter-plant/hr-matter-plant-sh.png",
						priority = "high",
						scale = scale,
						width = 504,
						height = 444,
						frame_count = 1,
						draw_as_shadow = true,
						shift = {0, 0},
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
					filename = kr_entities_path .. "matter-plant/matter-plant-working.png",
					scale = scale,
					width = 231,
					height = 250,
					frame_count = 30,
					line_length = 6,
					shift = {0, 0},
					animation_speed=0.5,
					hr_version =
					{
						filename = kr_entities_path .. "matter-plant/hr-matter-plant-working.png",
						scale = scale,
						width = 462,
						height = 500,
						frame_count = 30,
						line_length = 6,
						shift = {0, 0},
						scale = 0.5,
						animation_speed=0.5
					}
				},
				light =
				{
					intensity = 0.7,
					size = 20,
					shift = {2.0, 0.0},
					color = {r=0.1, g=0.5, b=1}
				}
			},
		},
		crafting_categories = {"matter-conversion"},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound = { filename = kr_buildings_sounds_path .. "matter-plant.ogg" },
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
		energy_usage = "20MW",
		ingredient_count = 6,
		module_specification = { module_slots = 4 },
		allowed_effects = {"consumption", "speed", "pollution"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})