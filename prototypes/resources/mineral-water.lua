-- Adding rare metals

data:extend(
{	
	{
		type = "resource",
		name = "mineral-water",
		icon = kr_resources_icons_path .. "mineral-water.png",
		icon_size = 64,
		flags = {"placeable-neutral"},
		category = "basic-fluid",
		order="a-b-a",
		infinite = false,
		highlight = true,
		minimum = 50000,
		normal = 250000,
		infinite_depletion_amount = 10,
		resource_patch_search_radius = 12,
		tree_removal_probability = 1,
		tree_removal_max_distance = 32 * 32,
		minable =
		{
		  mining_time = 1,
		  results =
		  {
			{
			  type = "fluid",
			  name = "mineral-water",
			  amount_min = 50,
			  amount_max = 50,
			  probability = 1
			}
		  }
		},
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "mineral-water",
			order = "f",
			base_density = 2,
			base_spots_per_km2 = 0.5,
			random_probability = 1/50,
			random_spot_size_minimum = 1,
			random_spot_size_maximum = 1, -- don't randomize spot size
			additional_richness = 100000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
			has_starting_area_placement = false,
			regular_rq_factor_multiplier = 1
		},
		stage_counts = {0},
		stages =
		{
			sheet =
			{
				filename = kr_resources_sprites_path .. "mineral-water.png",
				priority = "extra-high",
				width = 128,
				height = 128,
				frame_count = 8,
				variation_count = 8,
			}
		},
		map_color = {r=0.35, g=0.5, b=0.75}
	},
	{
		type = "autoplace-control",
		name = "mineral-water",
		order = "b-h",
		category = "resource"
	},
	{
		type = "noise-layer",
		name = "mineral-water"
	},
})