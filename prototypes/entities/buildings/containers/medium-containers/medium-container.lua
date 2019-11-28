local internal_path = "containers/medium-containers/medium-container/"

data:extend(
{   
	{
		type = "container",
		name = "kr-medium-container",
		icon = kr_entities_icons_path .. "containers/medium-containers/" .. "medium-container.png",
		icon_size = 32,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 0.5, result = "kr-medium-container"},
		max_health = 500,
		corpse = "big-remnants",
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
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		opened_duration = logistic_chest_opened_duration,
		picture =
		{
			filename = kr_entities_path .. internal_path .. "medium-container.png",
			priority = "extra-high",
			width = 85,
			height = 85,
			hr_version =
			{
				filename = kr_entities_path .. internal_path .. "hr-medium-container.png",
				priority = "extra-high",
				width = 340,
				height = 340,
				scale = 0.25,
			}
		},
		circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
		circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
		circuit_wire_max_distance = default_circuit_wire_max_distance,
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})