local kr_explosions_sprites_path = kr_entities_path .. "explosions/"

data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
    {
		type = "explosion",
		name = "impulse-rifle-beam",
		flags = {"not-on-map"},
		rotate = true,
		beam = true,
		animations =
		{
			{
				filename = kr_explosions_sprites_path .. "impulse-rifle-beam.png",
				priority = "extra-high",
				width = 62,
				height = 1,
				frame_count = 6
			}
		},
		light = {intensity = 1, size = 10, color = {r = 1.0, g = 1.0, b = 1.0}},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1
	},
-----------------------------------------------------------------------------------------------------------------
	{
		type = "explosion",
		name = "matter-explosion",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = kr_explosions_sprites_path .. "matter-explosion.png",
				flags = { "compressed" },
				width = 197,
				height = 245,
				frame_count = 47,
				line_length = 6,
				shift = {0.1875, -0.75},
				animation_speed = 0.5
			}
		},
		light = {intensity = 1, size = 50, color = {r=0.0, g=0.2, b=1}},
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = true
			},
			variations =
			{
				{
					filename = "__base__/sound/fight/large-explosion-1.ogg",
					volume = 1.0
				},
				{
					filename = "__base__/sound/fight/large-explosion-2.ogg",
					volume = 1.0
				}
			}
		},
		created_effect =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-particle",
						repeat_count = 5,
						entity_name = "explosion-remnants-particle",
						initial_height = 0.5,
						speed_from_center = 0.08,
						speed_from_center_deviation = 0.15,
						initial_vertical_speed = 0.08,
						initial_vertical_speed_deviation = 0.15,
						offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
					}
				}
			}
		}
    },
-----------------------------------------------------------------------------------------------------------------   
    {
		type = "explosion",
		name = "big-matter-explosion",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = kr_explosions_sprites_path .. "big-matter-explosion.png",
				flags = { "compressed" },
				width = 394,
				height = 490,
				frame_count = 47,
				line_length = 6,
				shift = {0.1875, -0.75},
				animation_speed = 0.35
			}
		},
		light = {intensity = 3, size = 100, color = {r=0, g=0.2, b=1}},
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = true
			},
			variations =
			{
				{
					filename = "__base__/sound/fight/large-explosion-1.ogg",
					volume = 2.0
				},
				{
					filename = "__base__/sound/fight/large-explosion-2.ogg",
					volume = 2.0
				}
			}
		},
		created_effect =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-particle",
						repeat_count = 5,
						entity_name = "explosion-remnants-particle",
						initial_height = 0.5,
						speed_from_center = 0.08,
						speed_from_center_deviation = 0.15,
						initial_vertical_speed = 0.08,
						initial_vertical_speed_deviation = 0.15,
						offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
					}
				}
			}
		}
    },
-----------------------------------------------------------------------------------------------------------------  
    {
		type = "explosion",
		name = "rail-matter-explosion",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = kr_explosions_sprites_path .. "rail-matter-explosion.png",
				flags = { "compressed" },
				animation_speed = 0.5,
				width = 324,
				height = 416,
				frame_count = 36,
				shift = util.by_pixel(0, -48),
				stripes =
				{
					{
						filename = kr_explosions_sprites_path .. "rail-matter-explosion-1.png",
						width_in_frames = 6,
						height_in_frames = 3
					},
					{
						filename = kr_explosions_sprites_path .. "rail-matter-explosion-2.png",
						width_in_frames = 6,
						height_in_frames = 3
					}
				}
			}
		},
		light = {intensity = 1, size =80, color = {r=0, g=0.2, b=1.0}},
		sound =
		{
			aggregation =
			{
				max_count = 2,
				remove = true
			},
			variations =
			{
				{
					filename = "__base__/sound/fight/large-explosion-1.ogg",
					volume = 1.0
				},
				{
					filename = "__base__/sound/fight/large-explosion-2.ogg",
					volume = 1.0
				}
			}
		},
		created_effect =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-particle",
						repeat_count = 3,
						entity_name = "explosion-remnants-particle",
						initial_height = 0.5,
						speed_from_center = 0.08,
						speed_from_center_deviation = 0.15,
						initial_vertical_speed = 0.08,
						initial_vertical_speed_deviation = 0.15,
						offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
					}
				}
			}
		}
	}
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
