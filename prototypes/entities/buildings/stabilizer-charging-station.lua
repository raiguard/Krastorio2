local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

data:extend(
{
	{
		type = "furnace",
		name = "kr-stabilizer-charging-station",
		icon = kr_entities_icons_path .. "stabilizer-charging-station.png",
		icon_size = 128,		
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "kr-stabilizer-charging-station"},
		max_health = 250,
		damaged_trigger_effect = hit_effects.entity(),
		corpse = "medium-remnants",
		resistances = 
		{
			{type = "physical", percent = 20},
			{type = "fire", percent = 35}
		},
		collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
		selection_box = {{-0.9, -0.9}, {0.9, 0.9}},
		animation =
		{
			layers =
			{
				{
				filename = kr_entities_path .. "stabilizer-charging-station/stabilizer-charging-station.png",
				priority = "high",
				width = 85,
				height = 85,
				frame_count = 80,
				line_length = 10,
				animation_speed = 0.4,
				scale = 0.8,
				hr_version =
				{
					filename = kr_entities_path .. "stabilizer-charging-station/hr-stabilizer-charging-station.png",
					priority = "high",
					width = 170,
					height = 170,
					frame_count = 80,
					line_length = 10,
					animation_speed = 0.4,
					scale = 0.4
				}
				},
				{
				filename = kr_entities_path .. "stabilizer-charging-station/stabilizer-charging-station-sh.png",
				priority = "high",
				width = 85,
				height = 72,
				frame_count = 80,
				line_length = 8,
				animation_speed = 0.4,
				shift = {0.23, 0.262},
				draw_as_shadow = true,
				scale = 0.9,
				hr_version =
				{
					filename = kr_entities_path .. "stabilizer-charging-station/hr-stabilizer-charging-station-sh.png",
					priority = "high",
					width = 170,
					height = 144,
					frame_count = 80,
					line_length = 8,
					animation_speed = 0.4,
					shift = {0.23, 0.262},
					draw_as_shadow = true,
					scale = 0.4
				}
				}
			}
		},		
		working_visualisations =
		{
			{
				light =
				{
					intensity = 1.1,
					size = 6,
					shift = {0.0, 0.3},
					color = {r=0.1, g=0.5, b=1}
				}
			}
		},		
		crafting_categories = {"stabilizer-charging"},
		vehicle_impact_sound = sounds.generic_impact,
		working_sound =
		{
			sound =
			{
				filename = kr_buildings_sounds_path .. "stabilizer-charging-station.ogg",
				volume = 0.75			
			},
			idle_sound = 
			{ 
				filename = "__base__/sound/idle1.ogg"
			},
			apparent_volume = 1.5
		},
		crafting_speed = 2.0,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 1
		},
		energy_usage = "1MW",
		-- ingredient_count = 1,
		result_inventory_size = 1,
		source_inventory_size = 1,
		module_specification = { module_slots = 2 },
		allowed_effects = {"consumption", "speed", "pollution"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})