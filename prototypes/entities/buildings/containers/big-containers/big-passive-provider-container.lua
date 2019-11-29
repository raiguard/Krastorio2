local _medium_containers = "containers/big-containers/"
local _specific = "big-passive-provider-container/"
local _icon_path = kr_entities_icons_path .. _medium_containers
local _sprites_path = kr_entities_path .. _medium_containers .. _specific

data:extend(
{
	{
		type = "logistic-container",
		name = "kr-big-passive-provider-container",
		icon = _icon_path .. "big-passive-provider-container.png",
		icon_size = 32,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-big-passive-provider-container"},
		max_health = 1500,
		corpse = "medium-remnants",
		collision_box = {{-2.75, -2.75}, {2.75, 2.75}},
		selection_box = {{-3, -3}, {3, 3}},
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 75},
			{type = "impact",percent = 75}
		},
		fast_replaceable_group = "container",
		inventory_size = 750,
		logistic_mode = "passive-provider",
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		opened_duration = logistic_chest_opened_duration,
		animation =
		{
			filename = _sprites_path .. "big-passive-provider-container.png",
			priority = "extra-high",
			width = 213,
			height = 213,
			frame_count = 6,
			line_length = 2,
			scale = 1.2,
			hr_version =
			{
				filename = _sprites_path .. "hr-big-passive-provider-container.png",
				priority = "extra-high",
				width = 512,
				height = 512,
				frame_count = 6,
				line_length = 3,
				scale = 0.5
			}
		},
		circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
		circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
		circuit_wire_max_distance = 20,
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
    }
})
