-- Shelter
data:extend(
{
	{
		type = "container",
		name = "kr-shelter",
		icon = kr_entities_icons_path .. "shelter.png",
		icon_size = 32,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-shelter"},
		max_health = 1500,
		corpse = "kr-big-random-pipes-remnant",
		collision_box = {{-2.75, -2.75}, {2.75, 2.75}},
		selection_box = {{-3, -3}, {3, 3}},
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 75},
			{type = "impact",percent = 75}
		},
		fast_replaceable_group = "container",
		inventory_size = 200,
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		opened_duration = logistic_chest_opened_duration,
		picture =
		{
			filename = kr_entities_path .. "shelter/shelter.png",
			priority = "extra-high",
			width = 213,
			height = 213,
			scale = 1.0,
			hr_version =
			{
				filename = kr_entities_path .. "shelter/hr-shelter.png",
				priority = "extra-high",
				width = 512,
				height = 512,
				scale = 0.5,
			}
		},
		circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
		circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
		circuit_wire_max_distance = 20,
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})
