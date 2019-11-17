data:extend(
{   
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	{
		type = "assembling-machine",
		name = "kr-greenhouse",
		icon_size = 32,
		icon =  kr_entities_icons_path .. "greenhouse.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 1, mining_time = 1, result = "kr-greenhouse"},
		max_health = 500,
		corpse = "big-remnants",
		dying_explosion = "big-explosion",
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 70}
		},
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 100,
				base_level = -1,
				pipe_connections = {{ type="input", position = {0, -4} }}
			},						
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 100,
				base_level = 1,
				pipe_connections = {{ type="input", position = {-4, 0} }}
			},
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 100,
				base_level = 1,
				pipe_connections = {{ type="input", position = {4, 0} }}
			},
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 100,
				base_level = 1,
				pipe_connections = {{ type="input", position = {0, 4} }}
			},
			off_when_no_fluid_recipe = false
		},
		collision_box = {{-3.25, -3.25}, {3.25, 3.25}},
		selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
		fast_replaceable_group = "kr-greenhouse",
		animation =
		{
			layers =
			{
				{
					filename = kr_entities_path .. "greenhouse/greenhouse.png",
					priority = "high",
					scale = scale,
					width = 256,
					height = 256,
					frame_count = 1,
					hr_version =
					{
						filename = kr_entities_path .. "greenhouse/hr-greenhouse.png",
						priority = "high",
						scale = scale,
						width = 512,
						height = 512,
						frame_count = 1,
						scale = 0.5
					}
				},
				{
					filename = kr_entities_path .. "greenhouse/greenhouse-shadow.png",
					priority = "high",
					scale = scale,
					width = 256,
					height = 256,
					shift = {0.36, 0},
					frame_count = 1,
					draw_as_shadow = true,
					hr_version =
					{
						filename = kr_entities_path .. "greenhouse/hr-greenhouse-shadow.png",
						priority = "high",
						scale = scale,
						width = 512,
						height = 512,
						shift = {0.36, 0},
						frame_count = 1,
						draw_as_shadow = true,
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
					filename = kr_entities_path .. "greenhouse/greenhouse-working.png",
					scale = scale,
					width = 256,
					height = 256,
					frame_count = 10,
					line_length = 5,
					animation_speed=0.35,
					hr_version =
					{
						filename = kr_entities_path .. "greenhouse/hr-greenhouse-working.png",
						scale = scale,
						width = 512,
						height = 512,
						frame_count = 10,
						line_length = 5,
						scale = 0.5,
						animation_speed=0.35,
					}
				},
				light =
				{
					intensity = 0.5,
					size = 15,
					shift = {0.0, 0.0},
					color = {r=0.7, g=1, b=0.7}
				}
			}
		},
		crafting_categories = {"greenhouse"},
		vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
        --working_sound =
        --{
        --sound =
        --{
        --{
        --    filename = "__Krastorio__/sound/matter-assembler.ogg",
        --    volume = 1
        --}
        --},
        --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 1 },
        --apparent_volume = 1.5
        --},
		crafting_speed = 1,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = -10
		},
		energy_usage = "100KW",
		ingredient_count = 6,
		--module_specification =
		--{
		--	module_slots = 4
		--},
		allowed_effects = nil, --{"consumption", "speed", "productivity", "pollution"},
		--open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		--close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	},	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
