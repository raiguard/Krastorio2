-- Adding menarite
data:extend(
{	
	{
		type = "resource",
		name = "menarite",
		category = "kr-quarry",
		icon = kr_mip_icons_path .. "raw-menarite/raw-menarite.png",
		icon_size = 64,
		flags = {"placeable-neutral"},
		order="a-b-a",
		infinite = false,
		highlight = true,
		minimum = 100,
		normal = 500,
		infinite_depletion_amount = 10,
		resource_patch_search_radius = 12,
		tree_removal_probability = 1,
		tree_removal_max_distance = 32 * 32,
		minable =
		{
		  hardness = 1,
		  mining_time = 1,
		  result = "raw-menarite"
		},
		collision_box = {{ -3.4, -3.4}, {3.4, 3.4}},
		selection_box = {{ -3.5, -3.5}, {3.5, 3.5}},
		autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "menarite",
			order = "e",
			base_density = 1,
			base_spots_per_km2 = 0.25,
			has_starting_area_placement = false,
			random_spot_size_minimum = 0.01,
			random_spot_size_maximum = 0.1,
			regular_blob_amplitude_multiplier = 1,
			richness_post_multiplier = 0.8,
			additional_richness = 300000,
			regular_rq_factor_multiplier = 0.1,
			candidate_spot_count = 22
		},
		stage_counts = {0},
		stages =
		{
		  sheet =
		  {
			filename = kr_resources_sprites_path .. "menarite/menarite-rift.png",
			priority = "extra-high",
			width = 250,
			height = 250,
			frame_count = 3,
			variation_count = 1,
			hr_version =
				{
				filename = kr_resources_sprites_path .. "menarite/hr-menarite-rift.png",
				priority = "extra-high",
				width = 500,
				height = 500,
				frame_count = 3,
				variation_count = 1,
				scale = 0.5,
				}
		  }
		},
		stages_effect =
		{
		  sheet =
		  {
			filename = kr_resources_sprites_path .. "menarite/menarite-rift-glow.png",
			priority = "extra-high",
			width = 250,
			height = 250,
			frame_count = 3,
			variation_count = 1,
			blend_mode = "additive",
			flags = {"light"},
			hr_version =
			{
				filename = kr_resources_sprites_path .. "menarite/hr-menarite-rift-glow.png",
				priority = "extra-high",
				width = 500,
				height = 500,
				frame_count = 3,
				variation_count = 1,
				scale = 0.5,
			  blend_mode = "additive",
			  flags = {"light"}
			}
		  }
		},
		effect_animation_period = 5,
		effect_animation_period_deviation = 1,
		effect_darkness_multiplier = 3.5,
		min_effect_alpha = 0.2,
		max_effect_alpha = 0.3,
		map_color = {r=0.1, g=0.75, b=1},
		map_grid = false
	},
	{
		type = "autoplace-control",
		name = "menarite",
		richness = true,
		order = "b-k",
		category = "resource"
	},
	{
		type = "noise-layer",
		name = "menarite"
	}
})	