local kr_explosions_sprites_path = kr_entities_path .. "explosions/"

laser_gunshot = function()
  return
  {
    {
      filename = kr_explosions_sprites_path .. "laser_gunshot.png",
      priority = "extra-high",
      width = 51,
      height = 57,
      frame_count = 2,
      animation_speed = 1.5,
      shift = {0, 0}
    },
    {
      filename = kr_explosions_sprites_path .. "laser_gunshot.png",
      priority = "extra-high",
      width = 51,
      height = 57,
      x = 51 * 2,
      frame_count = 2,
      animation_speed = 1.5,
      shift = {0, 0}
    },
    {
      filename = kr_explosions_sprites_path .. "laser_gunshot.png",
      priority = "extra-high",
      width = 51,
      height = 57,
      x = 51 * 4,
      frame_count = 3,
      animation_speed = 1.5,
      shift = {0, 0}
    },
    {
      filename = kr_explosions_sprites_path .. "laser_gunshot.png",
      priority = "extra-high",
      width = 51,
      height = 57,
      x = 51 * 7,
      frame_count = 3,
      animation_speed = 1.5,
      shift = {0, 0}
    },
    {
      filename = kr_explosions_sprites_path .. "laser_gunshot.png",
      priority = "extra-high",
      width = 51,
      height = 57,
      x = 51 * 10,
      frame_count = 3,
      animation_speed = 1.5,
      shift = {0, 0}
    }
  }
end



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
			width = 316,
			height = 360,
			frame_count = 100,
			priority = "very-low",
			flags = {"linear-magnification"},
			shift = util.by_pixel(1, -123), --shift = util.by_pixel(1, -63), shifted by 60 due to scaling and centering
			animation_speed = 0.5 * 0.75,
			scale = 2,
			dice_y = 5,
			stripes =
			{
				{
					filename = kr_explosions_sprites_path .. "matter-explosion-1.png",
					width_in_frames = 5,
					height_in_frames = 5,
				},
				{
					filename = kr_explosions_sprites_path .. "matter-explosion-2.png",
					width_in_frames = 5,
					height_in_frames = 5,
				},
				{
					filename = kr_explosions_sprites_path .. "matter-explosion-3.png",
					width_in_frames = 5,
					height_in_frames = 5,
				},
				{
					filename = kr_explosions_sprites_path .. "matter-explosion-4.png",
					width_in_frames = 5,
					height_in_frames = 5,
				}
			},
			hr_version =
			{
				width = 628,
				height = 720,
				frame_count = 100,
				priority = "very-low",
				flags = {"linear-magnification"},
				shift = util.by_pixel(0.5, -122.5), --shift = util.by_pixel(0.5, -62.5), shifted by 60 due to scaling and centering
				animation_speed = 0.5 * 0.75,
				scale = 1,
				dice_y = 5,
				stripes =
				{
					{
						filename = kr_explosions_sprites_path .. "hr-matter-explosion-1.png",
						width_in_frames = 5,
						height_in_frames = 5,
					},
					{
						filename = kr_explosions_sprites_path .. "hr-matter-explosion-2.png",
						width_in_frames = 5,
						height_in_frames = 5,
					},
					{
						filename = kr_explosions_sprites_path .. "hr-matter-explosion-3.png",
						width_in_frames = 5,
						height_in_frames = 5,
					},
					{
						filename = kr_explosions_sprites_path .. "hr-matter-explosion-4.png",
						width_in_frames = 5,
						height_in_frames = 5,
					}
				}
			}
		},
		light = {intensity = 1, size = 50, color = {r=0.9, g=0.1, b=1}},
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
						particle_name = "explosion-remnants-particle",
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
				width = 800,
				height = 800,
				frame_count = 47,
				line_length = 8,
				shift = {0.1875, -0.75},
				animation_speed = 0.4
			}
		},
		light = {intensity = 3, size = 100, color = {r=0.9, g=0.1, b=1}},
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
						particle_name = "explosion-remnants-particle",
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
				width = 600,
				height = 800,
				line_length = 6,
				frame_count = 36,
				shift = util.by_pixel(0, -48),
			}
		},
		light = {intensity = 1, size =80, color = {r=0.9, g=0.1, b=1}},
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
						particle_name = "explosion-remnants-particle",
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
		name = "kr-laser-explosion-gunshot",
		flags = {"not-on-map"},
		subgroup = "explosions",
		animations = laser_gunshot(),
		rotate = true,
		light = {intensity = 1, size = 25, color = {r=1.0, g=0.1, b=0.1}},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 0.25
	},
	
	{
		type = "explosion",
		name = "kr-laser-explosion",
		icon = "__base__/graphics/item-group/effects.png",
		icon_size = 64,
		flags = {"not-on-map"},
		subgroup = "explosions",
		animations = 
		{
			filename = kr_explosions_sprites_path .. "laser-explosion.png",
			flags = { "compressed" },
			width = 300,
			height = 300,
			frame_count = 47,
			line_length = 8,
			shift = {0.1875, -0.75},
			animation_speed = 0.55
		},
		light = {intensity = 0.75, size = 30, color = {r=1.0, g=0.1, b=0.1}},
		sound =
		{
			aggregation =
			{
				max_count = 2,
				remove = true
			},
			audible_distance_modifier = 1.95,
			variations =
			{
				{
					filename = "__base__/sound/fight/large-explosion-1.ogg",
					volume = 0.75
				},
				{
					filename = "__base__/sound/fight/large-explosion-2.ogg",
					volume = 0.75
				}
			}
		},
	}
	
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
