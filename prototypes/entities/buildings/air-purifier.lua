local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

data:extend(
{  
	{
		type = "furnace",
		name = "kr-air-purifier",		
		icon = kr_entities_icons_path .. "air-purifier.png",
		icon_size = 64,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "kr-air-purifier"},
		result_inventory_size = 1,
		source_inventory_size = 1,
		max_health = 200,
		corpse = "medium-remnants",
		damaged_trigger_effect = hit_effects.entity(),
		dying_explosion = "explosion",
		collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
		selection_box = {{-0.9, -0.9}, {0.9, 0.9}},
		animation =
		{
			filename = kr_entities_path .. "air-purifier/air-purifier.png",
			priority = "high",
			scale = scale,
			width = 85,
			height = 85,
			frame_count = 18,
			line_length = 6,
			animation_speed=0.5,
			hr_version =
			{
				filename = kr_entities_path .. "air-purifier/hr-air-purifier.png",
				priority = "high",
				scale = scale,
				width = 170,
				height = 170,
				frame_count = 18,
				line_length = 6,
				animation_speed=0.5,
				scale = 0.5
			}
		},
		crafting_categories = {"air-purification"},
		vehicle_impact_sound = sounds.generic_impact,
		working_sound =
		{
			sound = { filename = kr_buildings_sounds_path .. "air-purifier.ogg" },		
			idle_sound = { filename = "__base__/sound/idle1.ogg" },
			apparent_volume = 1.5		
		},
		crafting_speed = 1.0,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = -100
		},
		energy_usage = "75kW",
		module_specification =
		{
			module_slots = 1
		},
		allowed_effects = {"speed"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})