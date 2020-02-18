local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

data:extend(
{
	{
		type = "beacon",
		name = "kr-singularity-beacon",
		icon = kr_entities_icons_path .. "singularity-beacon.png",
		icon_size = 64,
		pictures =
		{
			{ size = 64, filename = kr_entities_icons_path .. "singularity-beacon.png", scale = 0.25, mipmap_count = 4 }
		}, 
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "kr-singularity-beacon"},
		max_health = 350,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
		selection_box = {{-0.9, -0.9}, {0.9, 0.9}},		
		damaged_trigger_effect = hit_effects.entity(),
		base_picture =
		{
			filename = kr_entities_path .. "singularity-beacon/singularity-beacon.png",
			width = 90,
			height = 90,
			shift = util.by_pixel(0, -5),
			hr_version =
			{
				filename = kr_entities_path .. "singularity-beacon/hr-singularity-beacon.png",
				width = 360,
				height = 360,
				shift = util.by_pixel(0, -5),
				scale = 0.25
			}
		},
		animation =
		{
			filename = kr_entities_path .. "singularity-beacon/singularity-beacon-w.png",
			width = 48,
			height = 54,
			frame_count = 10,
			line_length = 5,
			shift = util.by_pixel(0, -11.5),
			animation_speed = 0.5,
			hr_version =
			{
				filename = kr_entities_path .. "singularity-beacon/hr-singularity-beacon-w.png",
				width = 190,
				height = 214,
				frame_count = 10,
				line_length = 5,
				shift = util.by_pixel(0, -11.5),
				scale = 0.25,
				animation_speed = 0.5
			}
		},
		animation_shadow =
		{
			filename = kr_entities_path .. "singularity-beacon/singularity-beacon-ws.png",
			width = 10,
			height = 10,
			frame_count = 10,
			line_length = 5,
			scale = scale,
			scale = 0.5,
			animation_speed = 0.5
		},
		radius_visualisation_picture =
		{
			filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
			priority = "extra-high-no-scale",
			width = 10,
			height = 10
		},		
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input"
		},
		energy_usage = "750KW",
		vehicle_impact_sound = sounds.generic_impact,
		allowed_effects = {"consumption", "speed", "pollution"},
		module_specification =
		{
			module_slots = 2,
			module_info_icon_shift = {0, 0.5},
			module_info_multi_row_initial_height_modifier = -0.3
		},
		supply_area_distance = 2.0,
		distribution_effectivity = 0.75,
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.6 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.6 }
    }
})