local variations_util = require(kr_public_lib .. "create-roboport-states")
local empty_sprite =
{
	filename = kr_entities_path .. "empty.png",
	width = 1,
	height = 1,
	frame_count = 1
}

data:extend(
{
	{
		type = "roboport",
		name = "kr-small-roboport",
		icon = kr_entities_icons_path .. "small-roboport.png",
		icon_size = 64,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "kr-small-roboport"},
		max_health = 350,
		corpse = "big-remnants",
		collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
		selection_box = {{-1, -1}, {1, 1}},
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 75},
			{type = "impact",percent = 75}
		},
		dying_explosion = "medium-explosion",
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			input_flow_limit = "12MW",
			buffer_capacity = "300MJ"
		},
		recharge_minimum = "50MJ",
		energy_usage = "50kW",
		-- per one charge slot
		charging_energy = "3MW",
		logistics_radius = 18,
		construction_radius = 34,
		charge_approach_distance = 3,
		robot_slots_count = 0,
		material_slots_count = 0,
		stationing_offset = {0, 0},
		charging_offsets =
		{
			{-0.5, -1}, {-1, -0.5}, {-1, 0.5}, {-0.5, 1}, {0.5, 1}, {1, 0.5}, {1, -0.5}, {0.5, -1}
		},
		base =
		{
			filename = kr_entities_path .. "small-roboport/small-roboport.png",
			width = 85,
			height = 85,
			shift = {0.15, -0.1},
			scale = scale,
			hr_version =
			{
				filename = kr_entities_path .. "small-roboport/hr-small-roboport.png",
				width = 170,
				height = 170,
				shift = {0.15, -0.1},
				scale = scale,
				scale = 0.5
			}
		},
		base_patch = empty_sprite,
		base_animation =
		{
			filename = kr_entities_path .. "small-roboport/small-roboport-animation.png",
			priority = "medium",
			width = 21,
			height = 15,
			scale = scale,
			frame_count = 10,
			line_length = 5,
			shift = {0.03, -0.88},
			animation_speed = 0.1,
			hr_version =
			{
				filename = kr_entities_path .. "small-roboport/hr-small-roboport-animation.png",
				priority = "medium",
				width = 42,
				height = 30,
				scale = scale,
				scale = 0.5,
				frame_count = 10,
				line_length = 5,
				shift = {0.03, -0.88},
				animation_speed = 0.1
			}
		},
		door_animation_up = empty_sprite,
		door_animation_down = empty_sprite,
		recharging_animation =
		{
			filename = kr_entities_path .. "small-roboport/small-roboport-recharging.png",
			priority = "high",
			width = 37,
			height = 35,
			frame_count = 16,
			scale = 1.5,
			animation_speed = 0.5
		},
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		recharging_light = {intensity = 0.4, size = 5, color = {r = 1.0, g = 1.0, b = 1.0}},
		request_to_open_door_timeout = 15,
		spawn_and_station_height = 0.33
	}
})

variations_util.createRoboportVariations("kr-small-roboport")
