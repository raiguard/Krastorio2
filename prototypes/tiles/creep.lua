data:extend(
{
	{	
		type = "tile",
		name = "kr-creep",
		needs_correction = false,
		minable = {mining_time = 1, result = "biomass", count = 10},
		mined_sound = { filename = kr_tiles_sounds_path .. "creep-deconstruction.ogg" },
		collision_mask = {"ground-tile"},
		walking_speed_modifier = 0.5,
		layer = 99,
		transition_overlay_layer_offset = 9,
		decorative_removal_probability = 1,
		variants =
		{
			main =
			{
				{
					picture = kr_tiles_path .. "creep/creep.png",
					count = 16,
					size = 4,
					hr_version =
					{
						picture = kr_tiles_path .. "creep/hr-creep.png",
						count = 16,
						scale = 0.5,
						size = 4
					}
				},
				{
					picture = kr_tiles_path .. "creep/creep.png",
					count = 16,
					size = 1,
					hr_version =
					{
						picture = kr_tiles_path .. "creep/hr-creep.png",
						count = 16,
						scale = 0.5,
						size = 1
					}
				},
			},
			inner_corner =
			{
				picture = kr_tiles_path .. "creep/creep-inner-corner.png",
				count = 4,
				tall = true,
				hr_version =
				{
					picture = kr_tiles_path .. "creep/hr-creep-inner-corner.png",
					count = 4,
					tall = true,
					scale = 0.5
				}
			},
			outer_corner =
			{
				picture = kr_tiles_path .. "creep/creep-outer-corner.png",
				count = 4,
				tall = true,
				hr_version =
				{
					picture = kr_tiles_path .. "creep/hr-creep-outer-corner.png",
					count = 4,
					tall = true,
					scale = 0.5
				}
			},
			side =
			{
				picture = kr_tiles_path .. "creep/creep-side.png",
				count = 16,
				tall = true,
				hr_version =
				{
					picture = kr_tiles_path .. "creep/hr-creep-side.png",
					count = 16,
					tall = true,
					scale = 0.5
				}
			},
			u_transition =
			{
				picture = kr_tiles_path .. "creep/creep-u.png",
				count = 2,
				tall = true,
				hr_version =
				{
					picture = kr_tiles_path .. "creep/hr-creep-u.png",
					count = 2,
					tall = true,
					scale = 0.5
				}
			},
			o_transition =
			{
				picture = kr_tiles_path .. "creep/creep-o.png",
				count = 2,
				hr_version =
				{
					picture = kr_tiles_path .. "creep/hr-creep-o.png",
					count = 2,
					scale = 0.5
				}
			}
		},
		walking_sound =
		{
			{
				filename = kr_tiles_sounds_path .. "creep-walk-01.ogg",
				volume = 0.75
			},
			{
				filename = kr_tiles_sounds_path .. "creep-walk-02.ogg",
				volume = 0.75
			},
			{
				filename = kr_tiles_sounds_path .. "creep-walk-03.ogg",
				volume = 0.75
			},
		},
		map_color={r=75, g=60, b=70},
		pollution_absorption_per_second = 0.01,
		vehicle_friction_modifier = 200,
		
	}
})
