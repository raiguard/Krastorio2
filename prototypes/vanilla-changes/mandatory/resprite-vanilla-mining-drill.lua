require ("__base__/prototypes/entity/demo-pipecovers")
require ("__base__/prototypes/entity/assemblerpipes")

local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

circuit_connector_definitions["old-electric-mining-drill"] = circuit_connector_definitions.create
(
	universal_connector_template,
	{
		{ variation = 4, main_offset = util.by_pixel(-3.5, -55.5), shadow_offset = util.by_pixel(-2, -44.5), show_shadow = true },
		{ variation = 2, main_offset = util.by_pixel(42, -12.5), shadow_offset = util.by_pixel(43.5, -0.5), show_shadow = true },
		{ variation = 0, main_offset = util.by_pixel(4.5, 33), shadow_offset = util.by_pixel(8.5, 44.5), show_shadow = true },
		{ variation = 6, main_offset = util.by_pixel(-41.5, -6.5), shadow_offset = util.by_pixel(-33.5, 5), show_shadow = true }
	}
)

data:extend(
{
	{
		type = "mining-drill",
		name = "electric-mining-drill",
		icon = kr_entities_icons_path .. "electric-mining-drill.png",
		icon_size = 64, icon_mipmaps = 4,
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 0.3, result = "electric-mining-drill"},
		max_health = 300,
		resource_categories = {"basic-solid"},
		corpse = "medium-remnants",
		dying_explosion = "electric-mining-drill-explosion",
		collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
		damaged_trigger_effect = hit_effects.entity(),
		input_fluid_box =
		{
			production_type = "input-output",
			pipe_picture = assembler2pipepictures(),
			pipe_covers = pipecoverspictures(),
			base_area = 1,
			height = 2,
			base_level = -1,
			pipe_connections =
			{
				{ position = {-2, 0} },
				{ position = {2, 0} },
				{ position = {0, 2} }
			}
		},
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/electric-mining-drill.ogg",
				volume = 0.5
			},
			audible_distance_modifier = 0.5,
			fade_in_ticks = 4,
			fade_out_ticks = 20,
		},
		vehicle_impact_sound = sounds.generic_impact,
		open_sound = sounds.machine_open,
		close_sound = sounds.machine_close,
		animations =
		{
			north =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-N.png",
				line_length = 8,
				width = 98,
				height = 113,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(0, -8.5),
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-N.png",
					line_length = 8,
					width = 196,
					height = 226,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(0, -8),
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			},
			east =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-E.png",
				line_length = 8,
				width = 105,
				height = 98,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(3.5, -1),
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-E.png",
					line_length = 8,
					width = 211,
					height = 197,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(3.75, -1.25),
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			},
			south =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-S.png",
				line_length = 8,
				width = 98,
				height = 109,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(0, -1.5),
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-S.png",
					line_length = 8,
					width = 196,
					height = 219,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(0, -1.25),
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			},
			west =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-W.png",
				line_length = 8,
				width = 105,
				height = 98,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(-3.5, -1),
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-W.png",
					line_length = 8,
					width = 211,
					height = 197,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(-3.75, -0.75),
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			}
		},
		shadow_animations =
		{
			north =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-N-drill-shadow.png",
				flags = { "shadow" },
				line_length = 8,
				width = 101,
				height = 111,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(1.5, -7.5),
				draw_as_shadow = true,
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-N-drill-shadow.png",
					flags = { "shadow" },
					line_length = 8,
					width = 201,
					height = 223,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(1.25, -7.25),
					draw_as_shadow = true,
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			},
			east =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-E-drill-shadow.png",
				flags = { "shadow" },
				line_length = 8,
				width = 110,
				height = 97,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(6, -0.5),
				draw_as_shadow = true,
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-E-drill-shadow.png",
					flags = { "shadow" },
					line_length = 8,
					width = 221,
					height = 195,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(6.25, -0.25),
					draw_as_shadow = true,
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			},
			south =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-S-drill-shadow.png",
				flags = { "shadow" },
				line_length = 8,
				width = 100,
				height = 103,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(1, 2.5),
				draw_as_shadow = true,
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-S-drill-shadow.png",
					flags = { "shadow" },
					line_length = 8,
					width = 200,
					height = 206,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(1, 2.5),
					draw_as_shadow = true,
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			},
			west =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-W-drill-shadow.png",
				flags = { "shadow" },
				line_length = 8,
				width = 114,
				height = 97,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(1, -0.5),
				draw_as_shadow = true,
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-W-drill-shadow.png",
					flags = { "shadow" },
					line_length = 8,
					width = 229,
					height = 195,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(1.25, -0.25),
					draw_as_shadow = true,
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			}
		},
		input_fluid_patch_sprites =
		{
			north =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-N-patch.png",
				width = 100,
				height = 111,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(0, -6.5),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-N-patch.png",
					width = 200,
					height = 222,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-0.5, -6.5),
					scale = 0.5
				}
			},
			east =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-E-patch.png",
				width = 100,
				height = 110,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(0, -6),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-E-patch.png",
					width = 200,
					height = 219,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(0, -5.75),
					scale = 0.5
				}
			},
			south =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-S-patch.png",
				width = 100,
				height = 113,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(0, -7.5),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-S-patch.png",
					width = 200,
					height = 226,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-0.5, -7.5),
					scale = 0.5
				}
			},
			west =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-W-patch.png",
				width = 100,
				height = 108,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(0, -5),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-W-patch.png",
					width = 200,
					height = 220,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-0.5, -6),
					scale = 0.5
				}
			}
		},
		input_fluid_patch_shadow_sprites =
		{
			north =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-N-patch-shadow.png",
				flags = { "shadow" },
				width = 110,
				height = 98,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(5, 0),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-N-patch-shadow.png",
					flags = { "shadow" },
					width = 220,
					height = 197,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(5, -0.25),
					scale = 0.5
				}
			},
			east =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-E-patch-shadow.png",
				flags = { "shadow" },
				width = 112,
				height = 98,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(6, 0),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-E-patch-shadow.png",
					flags = { "shadow" },
					width = 224,
					height = 198,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(6, 0),
					scale = 0.5
				}
			},
			south =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-S-patch-shadow.png",
				flags = { "shadow" },
				width = 110,
				height = 98,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(5, 0),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-S-patch-shadow.png",
					flags = { "shadow" },
					width = 220,
					height = 197,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(5, -0.25),
					scale = 0.5
				}
			},
			west =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-W-patch-shadow.png",
				flags = { "shadow" },
				width = 110,
				height = 98,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(5, 0),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-W-patch-shadow.png",
					flags = { "shadow" },
					width = 220,
					height = 197,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(5, -0.25),
					scale = 0.5
				}
			}
		},
		input_fluid_patch_shadow_animations =
		{
			north =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-N-drill-received-shadow.png",
				tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
				line_length = 8,
				width = 100,
				height = 102,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(-1, -3),
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-N-drill-received-shadow.png",
					tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
					line_length = 8,
					width = 204,
					height = 206,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(-0.5, -2),
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			},
			east =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-E-drill-received-shadow.png",
				tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
				line_length = 8,
				width = 102,
				height = 98,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(0, -2),
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-E-drill-received-shadow.png",
					tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
					line_length = 8,
					width = 204,
					height = 209,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(-0.5, -1.25),
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			},
			south =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-S-drill-received-shadow.png",
				tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
				line_length = 8,
				width = 100,
				height = 98,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(-1, -1),
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-S-drill-received-shadow.png",
					tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
					line_length = 8,
					width = 204,
					height = 204,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(-0.5, -2.5),
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			},
			west =
			{
				priority = "high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-W-drill-received-shadow.png",
				tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
				line_length = 8,
				width = 96,
				height = 99,
				frame_count = 64,
				animation_speed = 0.5,
				direction_count = 1,
				shift = util.by_pixel(0, -1.5),
				run_mode = "forward-then-backward",
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-W-drill-received-shadow.png",
					tint = { r=0.5, g=0.5, b=0.5, a=0.5 },
					line_length = 8,
					width = 198,
					height = 206,
					frame_count = 64,
					animation_speed = 0.5,
					direction_count = 1,
					shift = util.by_pixel(1, -2),
					run_mode = "forward-then-backward",
					scale = 0.5
				}
			}
		},
		input_fluid_patch_window_sprites =
		{
			north =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-N-window-background.png",
				width = 72,
				height = 54,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(-1, 1),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-N-window-background.png",
					width = 142,
					height = 107,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-1, 0.75),
					scale = 0.5
				}
			},
			east =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-E-window-background.png",
				width = 51,
				height = 74,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(-11.5, -11),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-E-window-background.png",
					width = 104,
					height = 147,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-11, -11.25),
					scale = 0.5
				}
			},
			south =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-S-window-background.png",
				width = 71,
				height = 44,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(-1.5, -29),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-S-window-background.png",
					width = 141,
					height = 86,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-1.75, -29),
					scale = 0.5
				}
			},
			west =
			{
				priority = "extra-high",
				filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-W-window-background.png",
				width = 41,
				height = 69,
				frame_count = 1,
				direction_count = 1,
				shift = util.by_pixel(11.5, -11.5),
				hr_version =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-W-window-background.png",
					width = 80,
					height = 137,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(11.5, -11.25),
					scale = 0.5
				}
			}
		},

		input_fluid_patch_window_flow_sprites =
		{
			{
				north =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-N-fluid-flow.png",
					width = 68,
					height = 50,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-2, -1),
					hr_version =
					{
						priority = "extra-high",
						filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-N-fluid-flow.png",
						width = 136,
						height = 99,
						frame_count = 1,
						direction_count = 1,
						shift = util.by_pixel(-2.5, -0.75),
						scale = 0.5
					}
				},
				east =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-E-fluid-flow.png",
					width = 41,
					height = 70,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-11.5, -11),
					hr_version =
					{
						priority = "extra-high",
						filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-E-fluid-flow.png",
						width = 82,
						height = 139,
						frame_count = 1,
						direction_count = 1,
						shift = util.by_pixel(-11.5, -11.25),
						scale = 0.5
					}
				},
				south =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-S-fluid-flow.png",
					width = 68,
					height = 40,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-2, -29),
					hr_version =
					{
						priority = "extra-high",
						filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-S-fluid-flow.png",
						width = 136,
						height = 80,
						frame_count = 1,
						direction_count = 1,
						shift = util.by_pixel(-2.5, -29.5),
						scale = 0.5
					}
				},
				west =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-W-fluid-flow.png",
					width = 42,
					height = 70,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(11, -11),
					hr_version =
					{
						priority = "extra-high",
						filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-W-fluid-flow.png",
						width = 83,
						height = 140,
						frame_count = 1,
						direction_count = 1,
						shift = util.by_pixel(10.75, -11),
						scale = 0.5
					}
				}
			}
		},
		input_fluid_patch_window_base_sprites =
		{
			{
				north =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-N-fluid-background.png",
					width = 70,
					height = 48,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-2, 0),
					hr_version =
					{
						priority = "extra-high",
						filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-N-fluid-background.png",
						width = 138,
						height = 94,
						frame_count = 1,
						direction_count = 1,
						shift = util.by_pixel(-2, 0),
						scale = 0.5
					}
				},
				east =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-E-fluid-background.png",
					width = 42,
					height = 70,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-12, -11),
					hr_version =
					{
						priority = "extra-high",
						filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-E-fluid-background.png",
						width = 84,
						height = 138,
						frame_count = 1,
						direction_count = 1,
						shift = util.by_pixel(-12, -11),
						scale = 0.5
					}
				},
				south =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-S-fluid-background.png",
					width = 70,
					height = 40,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(-2, -29),
					hr_version =
					{
						priority = "extra-high",
						filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-S-fluid-background.png",
						width = 138,
						height = 80,
						frame_count = 1,
						direction_count = 1,
						shift = util.by_pixel(-2, -29),
						scale = 0.5
					}
				},
				west =
				{
					priority = "extra-high",
					filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-W-fluid-background.png",
					width = 42,
					height = 69,
					frame_count = 1,
					direction_count = 1,
					shift = util.by_pixel(12, -10.5),
					hr_version =
					{
						priority = "extra-high",
						filename = kr_entities_path .. "electric-mining-drill/hr-electric-mining-drill-W-fluid-background.png",
						width = 83,
						height = 137,
						frame_count = 1,
						direction_count = 1,
						shift = util.by_pixel(11.75, -10.75),
						scale = 0.5
					}
				}
			}
		},

		mining_speed = 0.5,
		energy_source =
		{
			type = "electric",
			emissions_per_minute = 10,
			usage_priority = "secondary-input"
		},
		energy_usage = "90kW",
		resource_searching_radius = 2.49,
		vector_to_place_result = {0, -1.85},
		module_specification =
		{
			module_slots = 3
		},
		radius_visualisation_picture =
		{
			filename = kr_entities_path .. "electric-mining-drill/electric-mining-drill-radius-visualization.png",
			width = 10,
			height = 10
		},
		monitor_visualization_tint = {r=78, g=173, b=255},
		fast_replaceable_group = "electric-mining-drill",
		next_upgrade = "kr-electric-mining-drill-mk2",

		circuit_wire_connection_points = circuit_connector_definitions["old-electric-mining-drill"].points,
		circuit_connector_sprites = circuit_connector_definitions["old-electric-mining-drill"].sprites,
		circuit_wire_max_distance = default_circuit_wire_max_distance
	}
})
