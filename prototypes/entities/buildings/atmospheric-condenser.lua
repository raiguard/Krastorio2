local hit_effects = require ("__base__.prototypes.entity.demo-hit-effects")
local sounds = require("__base__.prototypes.entity.demo-sounds")

data:extend(
{  
	{
		type = "assembling-machine",
		name = "kr-atmospheric-condenser",		
		icon = kr_entities_icons_path .. "atmospheric-condenser.png",
		icon_size = 64,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-atmospheric-condenser"},
		max_health = 500,
		corpse = "kr-big-random-pipes-remnant",
		dying_explosion = "big-explosion",
		resistances = 
		{
			{type = "physical", percent = 50},
			{type = "fire", percent = 50},
			{type = "impact", percent = 50}
		},
		fluid_boxes =
		{
			-- Input
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {-3, -1} }}
			},						
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {-3, 1} }}
			},
			-- Output
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 10,
				base_level = 1,
				pipe_connections = {{ type="output", position = {3, -1} }}
			},
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				pipe_picture = kr_pipe_path,
				base_area = 10,
				base_level = 1,
				pipe_connections = {{ type="output", position = {3, 1} }}
			},
			off_when_no_fluid_recipe = false
		},
		collision_box = {{-2.3, -2.3}, {2.3, 2.3}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		damaged_trigger_effect = hit_effects.entity(),
		fast_replaceable_group = "assembling-machine",
		animation =
		{
			layers =
			{
				{
					filename = kr_entities_path .. "atmospheric-condenser/atmospheric-condenser.png",
					width = 190,
					height = 190,
					frame_count = 20,
					line_length = 5,
					shift = {0, 0},
					hr_version =
					{
						filename = kr_entities_path .. "atmospheric-condenser/hr-atmospheric-condenser.png",
						width = 380,
						height = 380,
						scale = 0.5,
						frame_count = 20,
						line_length = 5,
						shift = {0, 0}
					}
				},
				{
					filename = kr_entities_path .. "atmospheric-condenser/atmospheric-condenser-sh.png",
					width = 190,
					height = 190,
					frame_count = 1,
					repeat_count = 20,
					draw_as_shadow = true,
					shift = {0, 0},
					hr_version =
					{
						filename = kr_entities_path .. "atmospheric-condenser/hr-atmospheric-condenser-sh.png",
						width = 380,
						height = 380,
						scale = 0.5,
						frame_count = 1,
						repeat_count = 20,
						draw_as_shadow = true,
						shift = {0, 0}
					}
				},
			}
		},
		crafting_categories = {"atmosphere-condensation"},
		vehicle_impact_sound = sounds.generic_impact,
		working_sound =
		{
			sound = 
			{
				filename = kr_buildings_sounds_path .. "atmospheric-condenser.ogg",
				volume = 1.5
			},
			idle_sound =
			{
				filename = "__base__/sound/idle1.ogg",
				volume = 0.5
			},
			apparent_volume = 1.5
		},
		crafting_speed = 1.5,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_second_per_watt = 2 / 10000000
		},
		energy_usage = "0.5MW",
		ingredient_count = 1,
		module_specification = { module_slots = 2 },
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})