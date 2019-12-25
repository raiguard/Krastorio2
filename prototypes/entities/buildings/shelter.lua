local empty_sprite =
{
	filename = kr_entities_path .. "empty.png",
	priority = "high",
	width = 1,
	height = 1,
	scale = 0.5,
	shift = {0, 0}
}

-- Shelter
data:extend(
{
	-- Shelter
	{
		type = "container",
		name = "kr-shelter",
		icon = kr_entities_icons_path .. "shelter.png",
		icon_size = 64,
		allow_copy_paste = false,
		flags = {"placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-shelter"},
		max_health = 1500,
		corpse = "kr-big-random-pipes-remnant",
		collision_box = {{-2.75, -2.75}, {2.75, 2.75}},
		selection_box = {{-3, -3}, {3, 3.5}},
		resistances = 
		{
			{type = "physical",percent = 50},
			{type = "fire",percent = 75},
			{type = "impact",percent = 75}
		},
		fast_replaceable_group = "kr-shelter",
		inventory_size = 200,
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume = 0.5 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.6 },
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		picture =
		{
			layers =
			{
				{
					filename = kr_entities_path .. "shelter/shelter.png",
					priority = "high",
					width = 213,
					height = 213,
					scale = 0.9,
					frame_count = 6,
					line_length = 3,
					animation_speed = 0.5,
					hr_version =
					{
						filename = kr_entities_path .. "shelter/hr-shelter.png",
						priority = "medium",
						width = 512,
						height = 512,
						scale = 0.45,
						frame_count = 6,
						line_length = 3,
						animation_speed = 0.5
					}
				},
				{
					filename = kr_entities_path .. "shelter/shelter-shadow.png",
					priority = "high",
					width = 213,
					height = 213,
					scale = 0.9,
					shift = {0.47, 0},
					frame_count = 6,
					line_length = 3,
					animation_speed = 0.5,
					draw_as_shadow = true,
					hr_version =
					{
						filename = kr_entities_path .. "shelter/hr-shelter-shadow.png",
						priority = "medium",
						width = 512,
						height = 512,
						scale = 0.45,
						shift = {0.47, 0},
						frame_count = 6,
						line_length = 3,
						animation_speed = 0.5,
						draw_as_shadow = true,
					}
				}
			},
		},
		circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
		circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
		circuit_wire_max_distance = 20
	},
	-- Shelter light
	{
		type = "lamp",
		name = "kr-shelter-light",
		icon = kr_entities_path .. "empty.png",
		icon_size = 1,
		flags = {"hidden"},
		collision_box = {{0, 0}, {0, 0}},
		selection_box = {{0, 0}, {0, 0}},
		energy_source = {type = "void"},
		energy_usage_per_tick = "1W",
		darkness_for_all_lamps_on = 0.5,
		darkness_for_all_lamps_off = 0.3,
		light = 
		{
			intensity = 0.8, 
			size = 12, 
			shift = {0.0, 0.0}, 
			color = {r=0.1, g=0.5, b=1}
		},
		light_when_colored = 
		{
			intensity = 1, 
			size = 6, 
			color = {r=1.0, g=1.0, b=1.0}
		},
		glow_size = 6,
		glow_color_intensity = 0.135,
		picture_off = empty_sprite,
		picture_on  = empty_sprite
	}
})
