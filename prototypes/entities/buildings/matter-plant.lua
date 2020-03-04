local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

data:extend(
{
	{
		type = "assembling-machine",
		name = "kr-matter-plant",		
		icon = kr_entities_icons_path .. "matter-plant.png",
		icon_size = 128,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-matter-plant"},
		max_health = 3000,
		damaged_trigger_effect = hit_effects.entity(),
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
			-- Inputs
			{
				production_type = "input",
				pipe_picture = kr_pipe_path,
				pipe_covers = pipecoverspictures(),	
				base_area = 100,
				base_level = -1,
				pipe_connections = {{ type="input-output", position = {0, -4} }}
			},
			-- Outputs
			{
				production_type = "output",
				pipe_picture = kr_pipe_path,
				pipe_covers = pipecoverspictures(),	
				base_area = 100,
				base_level = 1,
				pipe_connections = {{ type="input-output", position = {-4, 0} }}
			},
			{
				production_type = "output",
				pipe_picture = kr_pipe_path,
				pipe_covers = pipecoverspictures(),	
				base_area = 100,
				base_level = 1,
				pipe_connections = {{ type="input-output", position = {4, 0} }}
			},
			{
				production_type = "output",
				pipe_picture = kr_pipe_path,
				pipe_covers = pipecoverspictures(),	
				base_area = 1000,
				base_level = 1,
				pipe_connections = {{ type="input-output", position = {0, 4} }}
			},
			off_when_no_fluid_recipe = false
		},
		collision_box = {{-3.25, -3.25}, {3.25, 3.25}},
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
						shift = {-0.1, -0.2},
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
						shift = {0.23, 0.24},
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
					animation_speed=0.75,
					hr_version =
					{
						filename = kr_entities_path .. "matter-plant/hr-matter-plant-working.png",
						scale = scale,
						width = 462,
						height = 500,
						frame_count = 30,
						line_length = 6,
						shift = {-0.1, -0.2},
						scale = 0.5,
						animation_speed=0.75
					}
				},
				light =
				{
					intensity = 1.5,
					size = 20,
					shift = {2.0, 0.0},
					color = {r=0.35, g=0.5, b=1}
				}
			},
		},
		crafting_categories = {"matter-conversion"},
		vehicle_impact_sound = sounds.generic_impact,
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
			emissions_per_minute = 20
		},
		energy_usage = "20MW",
		ingredient_count = 6,
		module_specification = { module_slots = 4 },
		allowed_effects = {"consumption", "speed", "pollution"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})