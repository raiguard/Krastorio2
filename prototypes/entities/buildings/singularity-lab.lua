data:extend({

	{
	type = "lab",
	name = "singularity-lab",
	icon = kr_entities_icons_path .. "singularity-lab.png",
	icon_size = 64,
	flags = {"placeable-player", "player-creation"},
	minable = {mining_time = 2, result = "singularity-lab"},
	max_health = 3000,
    dying_explosion = "big-explosion",
    corpse = "lab-remnants",
	resistances = 
	{
	{type = "physical",percent = 60},
	{type = "fire",percent = 90},
	{type = "impact",percent = 90}
	},
	collision_box = {{-3.75, -3.75}, {3.75, 3.75}},
	selection_box = {{-3.9, -3.9}, {3.9, 3.9}},
	fast_replaceable_group = "assembling-machine",
	off_animation =
		{
		layers =
		{
		{
			filename = kr_entities_path .. "singularity-lab/singularity-lab.png",
			priority = "high",
			scale = scale,
			width = 300,
			height = 300,
			frame_count = 1,
			hr_version =
				{
				filename = kr_entities_path .. "singularity-lab/hr-singularity-lab.png",
				priority = "high",
				scale = scale,
				width = 600,
				height = 600,
				frame_count = 1,
				scale = 0.5,
				}
		},
		{
			filename = kr_entities_path .. "singularity-lab/singularity-lab-sh.png",
			priority = "high",
			scale = scale,
			width = 300,
			height = 300,
			frame_count = 1,
			draw_as_shadow = true,
			hr_version =
				{
				filename = kr_entities_path .. "singularity-lab/hr-singularity-lab-sh.png",
				priority = "high",
				scale = scale,
				width = 600,
				height = 600,
				frame_count = 1,
				draw_as_shadow = true,
				scale = 0.5,
				}
		}
		}
		},
	on_animation =
		{
		layers =
			{
				{
				  filename = kr_entities_path .. "singularity-lab/singularity-lab-working.png",
				  scale = scale,
				  width = 300,
				  height = 300,
				  frame_count = 60,
				  line_length = 10,
				  animation_speed=0.85,
				  hr_version =
					  {
					  filename = kr_entities_path .. "singularity-lab/hr-singularity-lab-working.png",
					  scale = 0.5,
					  width = 600,
					  height = 600,
					  frame_count = 60,
					  line_length = 10,
					  scale = 0.5,
					  animation_speed=0.85,
					  }
				},
				{
				  filename = kr_entities_path .. "singularity-lab/singularity-lab-glow.png",
				  scale = scale,
				  width = 77,
				  height = 59,
				  shift = {0,-0.67},
				  frame_count = 60,
				  line_length = 6,
				  animation_speed=0.85,
				  blend_mode = "additive-soft",
				  hr_version =
					  {
					  filename = kr_entities_path .. "singularity-lab/hr-singularity-lab-glow.png",
					  scale = 0.5,
					  width = 153,
					  height = 117,
					  shift = {0,-0.67},
					  frame_count = 60,
					  line_length = 6,
					  scale = 0.5,
					  animation_speed=0.85,
					  blend_mode = "additive-soft",
					  }
				},
			},
		},
	light =
		{
		{
		intensity = 1,
		size = 25,
		shift = {0.0, 0.0},
		color = {r=0.35, g=0.75, b=1}
		},
		{
		intensity = 1.5,
		size = 10,
		shift = {0.0, 0.0},
		color = {r=0.35, g=0.75, b=1}
		},
		},
	researching_speed = 1,
	inputs = 
			{
			"basic-tech-card",
			"automation-science-pack",
			"logistic-science-pack",
			},
	vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
	working_sound =
	{
		sound =
		{
			filename = kr_buildings_sounds_path .. "singularity-lab.ogg",
			volume = 1.5
		},
		idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 1 },
		max_sounds_per_type = 6,
		apparent_volume = 1.5,
	},
	audible_distance_modifier = 25,
	energy_source =
	{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 20
	},
	energy_usage = "10MW",
	module_specification =
		{
			module_slots = 4,
			module_info_icon_shift = {0, 0.9}
		},
	open_sound = { filename = kr_buildings_sounds_path .. "open.ogg", volume = 1 },
    close_sound = { filename = kr_buildings_sounds_path .. "close.ogg", volume = 0.85 },
	},
})
