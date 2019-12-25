data:extend(
{   


	{
		type = "assembling-machine",
		name = "research-server",
		icon_size = 32,
		icon =  kr_entities_icons_path .. "research-server.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "research-server"},
		max_health = 250,
		corpse = "medium-remnants",
		resistances = 
			{
			{type = "physical",percent = 20},
			{type = "fire",percent = 20}
			},
		collision_box = {{-1.25, -1.25}, {1.25, 1.25}},
		selection_box = {{-1.4, -1.4}, {1.4, 1.4}},
		---drawing_box = {{-1.5, -1.7}, {1.5, 1.5}},
		fast_replaceable_group = "assembling-machine",
		
		animation =
		{
			layers =
			{
				{
					filename = kr_entities_path .. "research-server/research-server.png",
					priority = "high",
					scale = scale,
					width = 128,
					height = 128,
					shift = {0., -0.2},
					frame_count = 60,
					line_length = 15,
					animation_speed = 0.9,
					hr_version =
					  {
						filename = kr_entities_path .. "research-server/hr-research-server.png",
						priority = "high",
						scale = scale,
						width = 256,
						height = 256,
						shift = {0., -0.2},
						frame_count = 60,
						line_length = 15,
						animation_speed = 0.9,
						scale = 0.5,
					  }
				},
				{
					filename = kr_entities_path .. "research-server/research-server-shadow.png",
					priority = "high",
					scale = scale,
					width = 128,
					height = 128,
					draw_as_shadow = true,
					shift = {0., -0.2},
					frame_count = 60,
					line_length = 15,
					animation_speed = 0.9,
					hr_version =
					  {
						filename = kr_entities_path .. "research-server/hr-research-server-shadow.png",
						priority = "high",
						scale = scale,
						width = 256,
						height = 256,
						draw_as_shadow = true,
						shift = {0., -0.2},
						frame_count = 60,
						line_length = 15,
						animation_speed = 0.9,
						scale = 0.5,
					  }
				},
			},
		},
		
		working_visualisations =
		{
			{
				light =
				{
					intensity = 0.5,
					size = 6,
					shift = {0.0, 0.0},
					color = {r=0.1, g=0.5, b=1}
				}
			}
		},
		crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", "research-data"},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
			{
				sound =
				{
					{
						filename = kr_buildings_sounds_path .. "small-research-server.ogg",
						volume = 0.5
					}
				},
				idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 1 },
				apparent_volume = 1.5
			},
		crafting_speed = 1,
		energy_source =
			{
				type = "electric",
				usage_priority = "secondary-input",
				emissions_per_minute = 0.5
			},
		energy_usage = "0.25MW",
		ingredient_count = 6,
		module_specification =
			{
				module_slots = 2
			},
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
	}
})

