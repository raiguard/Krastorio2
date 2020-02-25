local _medium_containers = "containers/medium-containers/"
local _specific = "medium-requester-container/"
local _icon_path = kr_entities_icons_path .. _medium_containers
local _sprites_path = kr_entities_path .. _medium_containers .. _specific

data:extend(
{
	{
		type = "logistic-container",
		name = "kr-medium-requester-container",
		icon = _icon_path .. "medium-requester-container.png",
		icon_size = 64,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "kr-medium-requester-container"},
		max_health = 500,
		logistic_slots_count = 18,
		corpse = "kr-medium-random-pipes-remnant",
		collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
		selection_box = {{-1, -1}, {1, 1}},
		resistances = 
		{
			{type = "physical",percent = 30},
			{type = "fire",percent = 50},
			{type = "impact",percent = 50}
		},
		fast_replaceable_group = "container",
		inventory_size = 100,
		logistic_mode = "requester",
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		opened_duration = logistic_chest_opened_duration,
		animation =
		{
			filename = _sprites_path .. "medium-requester-container.png",
			priority = "extra-high",
			width = 85,
			height = 85,
			frame_count = 6,
			hr_version =
			{
				filename = _sprites_path .. "hr-medium-requester-container.png",
				priority = "extra-high",
				width = 340,
				height = 340,
				frame_count = 6,
				line_length = 3,
				scale = 0.25
			}
		},
		circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
		circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
		circuit_wire_max_distance = default_circuit_wire_max_distance,
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})
