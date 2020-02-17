local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

data:extend(
{   
	{
		type = "assembling-machine",
		name = "kr-greenhouse",
		icon_size = 64,
		icon =  kr_entities_icons_path .. "greenhouse.png",
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {hardness = 1, mining_time = 1, result = "kr-greenhouse"},
		max_health = 500,
		corpse = "kr-big-random-pipes-remnant",
		dying_explosion = "big-explosion",
		damaged_trigger_effect = hit_effects.entity(),
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 70}
		},
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_picture = kr_pipe_path,
				pipe_covers = pipecoverspictures(),				
				base_area = 100,
				base_level = -1,
				pipe_connections = 
				{
					{ type="input-output", position = {0, -4} },
					{ type="input-output", position = {-4, 0} },
					{ type="input-output", position = {4, 0} },
					{ type="input-output", position = {0, 4} }
				}
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
					filename = kr_entities_path .. "greenhouse/greenhouse-sh.png",
					priority = "high",
					scale = scale,
					width = 256,
					height = 256,
					shift = {0.32, 0},
					frame_count = 1,
					draw_as_shadow = true,
					hr_version =
					{
						filename = kr_entities_path .. "greenhouse/hr-greenhouse-sh.png",
						priority = "high",
						scale = scale,
						width = 512,
						height = 512,
						shift = {0.32, 0},
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
					intensity = 0.75,
					size = 15,
					shift = {0.0, 0.0},
					color = {r=0.7, g=1, b=0.7}
				}
			}
		},
		crafting_categories = {"growing"},
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
		return_ingredients_on_change = true,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = -10
		},
		energy_usage = "100KW",
		ingredient_count = 4,
		allowed_effects = nil
	}
})
