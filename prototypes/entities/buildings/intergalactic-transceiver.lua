local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

data:extend(
{ 
	{
		type = "accumulator",
		name = "kr-intergalactic-transceiver",
		icon = "__base__/graphics/icons/accumulator.png",
		icon_size = 64, icon_mipmaps = 4,
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 0.1, result = "kr-intergalactic-transceiver"},
		max_health = 5000,
		corpse = "accumulator-remnants",
		dying_explosion = "accumulator-explosion",
		collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
		selection_box = {{-1, -1}, {1, 1}},
		damaged_trigger_effect = hit_effects.entity(),
		drawing_box = {{-1, -1.5}, {1, 1}},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "24TJ",
			usage_priority = "tertiary",
			input_flow_limit = "40GW",
			output_flow_limit = "0W"
		},
		picture = 
		{
			layers =
			{
				{
					filename = "__base__/graphics/entity/accumulator/accumulator.png",
					priority = "high",
					width = 66,
					height = 94,
					repeat_count = repeat_count,
					shift = util.by_pixel(0, -10),
					tint = tint,
					animation_speed = 0.5,
					hr_version =
					{
						filename = "__base__/graphics/entity/accumulator/hr-accumulator.png",
						priority = "high",
						width = 130,
						height = 189,
						repeat_count = repeat_count,
						shift = util.by_pixel(0, -11),
						tint = tint,
						animation_speed = 0.5,
						scale = 0.5
					}
				},
				{
					filename = "__base__/graphics/entity/accumulator/accumulator-shadow.png",
					priority = "high",
					width = 120,
					height = 54,
					repeat_count = repeat_count,
					shift = util.by_pixel(28, 6),
					draw_as_shadow = true,
					hr_version =
					{
						filename = "__base__/graphics/entity/accumulator/hr-accumulator-shadow.png",
						priority = "high",
						width = 234,
						height = 106,
						repeat_count = repeat_count,
						shift = util.by_pixel(29, 6),
						draw_as_shadow = true,
						scale = 0.5
					}
				}
			}
		},
		-- charge_animation = nil,
		charge_cooldown = 1,
		discharge_cooldown = 1,
		charge_light = {intensity = 0.3, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
		vehicle_impact_sound = sounds.generic_impact,
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/accumulator-working.ogg",
				volume = 0.7
			},
			idle_sound =
			{
				filename = "__base__/sound/accumulator-idle.ogg",
				volume = 0.5
			},
			max_sounds_per_type = 3,
			fade_in_ticks = 10,
			fade_out_ticks = 30
		},
		circuit_wire_connection_point = circuit_connector_definitions["accumulator"].points,
		circuit_connector_sprites = circuit_connector_definitions["accumulator"].sprites,
		circuit_wire_max_distance = default_circuit_wire_max_distance,
		default_output_signal = {type = "virtual", name = "signal-I"}
	}
})
