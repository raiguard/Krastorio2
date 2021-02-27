local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds      = require("__base__/prototypes/entity/sounds")

local planetary_teleporter_animation = 
{
	layers =
	{
		{
			filename = kr_entities_path .. "planetary-teleporter/planetary-teleporter.png",
			width = 200,
			height = 237,
			frame_count = 12,
			line_length = 4,
			animation_speed = 1.0,
			hr_version =
			{
				filename = kr_entities_path .. "planetary-teleporter/hr-planetary-teleporter.png",
				width = 400,
				height = 475,
				scale = 0.5,
				frame_count = 12,
				line_length = 4,
				animation_speed = 1.0
			}
		},
		{
			filename = kr_entities_path .. "planetary-teleporter/planetary-teleporter-shadow.png",
			priority = "low",
			width = 266,
			height = 146,
			frame_count = 1,
			repeat_count = 12,
			draw_as_shadow = true,
			animation_speed = 1.0,
			hr_version =
			{
				filename = kr_entities_path .. "planetary-teleporter/hr-planetary-teleporter-shadow.png",
				priority = "low",
				width = 531,
				height = 292,
				scale = 0.5,
				frame_count = 1,
				repeat_count = 12,
				draw_as_shadow = true,
				animation_speed = 1.0
			}
		},
		{
			filename = kr_entities_path .. "planetary-teleporter/planetary-teleporter-light.png",
			width = 200,
			height = 237,
			frame_count = 12,
			line_length = 4,
			animation_speed = 1.0,
			hr_version =
			{
				filename = kr_entities_path .. "planetary-teleporter/hr-planetary-teleporter-light.png",
				width = 400,
				height = 475,
				scale = 0.5,
				frame_count = 12,
				line_length = 4,
				animation_speed = 1.0
			}
		}
	}
}

data:extend(
{ 
	{
		type = "accumulator",
		name = "kr-planetary-teleporter",
		icon = kr_entities_icons_path .. "planetary-teleporter.png",
		icon_size = 64,
		flags = {"placeable-neutral","placeable-player", "player-creation", "not-rotatable"},
		map_color = {r=0.337, g=0.011, b=0.184},
		max_health = 20000,
		minable = {mining_time = 10, result = "kr-planetary-teleporter"},
		corpse = "big-remnants",
		dying_explosion = "big-explosion",
		damaged_trigger_effect = hit_effects.entity(),
		collision_box = {{-2.75, -2.75}, {2.75, 2.75}},
		selection_box = {{-3, -3}, {3, 3}},
		drawing_box = {{-3, -3}, {3, 3}},
		resistances = 
		{
			{type = "physical", percent = 75},
			{type = "fire", percent = 75},
			{type = "impact", percent = 75}
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "200MJ",
			input_flow_limit = "300MW",
			usage_priority = "tertiary",
			output_flow_limit = "0W"
		},
		picture = planetary_teleporter_animation,
		charge_animation = planetary_teleporter_animation,
		discharge_animation = planetary_teleporter_animation,
		charge_cooldown = 10,
		discharge_cooldown = 10,
		vehicle_impact_sound = sounds.generic_impact,
		-- working_sound = ,
		audible_distance_modifier = 30,		
		circuit_wire_connection_point = nil, --circuit_connector_definitions["accumulator"].points,
		circuit_connector_sprites = nil, --circuit_connector_definitions["accumulator"].sprites,
		circuit_wire_max_distance = 0, --default_circuit_wire_max_distance,
		default_output_signal = {type = "virtual", name = "signal-P"}
	}
})
