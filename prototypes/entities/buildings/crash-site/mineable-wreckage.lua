data:extend(
{   
	{
		type = "simple-entity",
		name = "mineable-wreckage",
		icon = "__base__/graphics/icons/ship-wreck/small-ship-wreck.png",
		icon_size = 64, icon_mipmaps = 4,
		minable = {mining_time = 0.5, result = "iron-gear-wheel"},
		flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
		subgroup = "wrecks",
		order = "d[remnants]-d[ship-wreck]-c[small]-a",
		max_health = 200,
		collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
		selection_box = {{-1.3, -1.1}, {1.3, 1.1}},
		damaged_trigger_effect = hit_effects.entity(),
		pictures =
		{
			{
				filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-a.png",
				width = 65,
				height= 68
			},
			{
				filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-b.png",
				width = 109,
				height= 67
			},
			{
				filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-c.png",
				width = 63,
				height= 54
			},
			{
				filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-d.png",
				width = 82,
				height= 67
			},
			{
				filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-e.png",
				width = 78,
				height= 75,
				shift={0.3, -0.2}
			},
			{
				filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-f.png",
				width = 58,
				height= 35
			},
			{
				filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-g.png",
				width = 80,
				height= 72
			},
			{
				filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-h.png",
				width = 79,
				height= 54
			},
			{
				filename = kr_crash_site_sprites_path .. "mineable-wreckage/small-ship-wreck-i.png",
				width = 56,
				height= 55
			}
		},
		render_layer = "object"
	}
}