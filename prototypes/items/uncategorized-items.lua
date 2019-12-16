data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------   
	
	{
		type = "item",
		name = "biomass",
		icon = kr_icons_path .. "biomass.png",
		icon_size = 64,
		subgroup = "raw-resource",
		order = "a[biomass]",
		stack_size = 200
	},
	{
		type = "item",
		name = "fertilizer",
		icon = kr_icons_path .. "fertilizer.png",
		icon_size = 64,
		subgroup = "raw-material",
		order = "a[fertilizer]",
		stack_size = 200
	},
	{
		type = "item",
		name = "automation-core",
		icon = kr_icons_path .. "automation-core.png",
		icon_size = 64,
		subgroup = "raw-material",
		order = "a[automation-core]",
		stack_size = 200
	},
	{
		type = "item",
		name = "sand",
		icon = kr_mip_icons_path .. "sand.png",
		icon_size = 64,
		icon_mipmaps = 3,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "sand.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "sand-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "sand-2.png", scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "raw-resource",
		order = "a[sand]",
		stack_size = 200
	},
	{
		type = "item",
		name = "glass",
		icon = kr_icons_path .."glass.png",
		icon_size = 64,
		subgroup = "raw-material",
		order = "a1[glass]",
		stack_size = 200
    },
	{
		type = "item",
		name = "silicon",
		icon = kr_mip_icons_path .. "silicon.png",
		icon_size = 64,
		icon_mipmaps = 3,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "silicon.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "silicon-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "silicon-2.png", scale = 0.25, mipmap_count = 4 }
		},  
		subgroup = "raw-material",
		order = "a1[silicon]",
		stack_size = 200
    },
	{
		type = "item",
		name = "coke",
		icon = kr_mip_icons_path .. "coke.png",
		icon_size = 64,
		icon_mipmaps = 3,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "coke.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "coke-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "coke-2.png", scale = 0.25, mipmap_count = 4 }
		},
		fuel_category = "chemical",
		fuel_value = "10MJ",
		fuel_emissions_multiplier = 1.25,
		fuel_acceleration_multiplier = 1.1,
		fuel_top_speed_multiplier = 1.1,
		subgroup = "raw-material",
		order = "a1[coke]",
		stack_size = 200
    },
	{
		type = "item",
		name = "iron-beam",
		icon = kr_icons_path .. "iron-beam.png",
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "b-a2[iron-beam]",
		stack_size = 200
	},
	{
		type = "item",
		name = "steel-gear-wheel",
		icon = kr_icons_path .. "steel-gear-wheel.png",
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "c-a2[steel-gear-wheel]",
		stack_size = 200
	},
	{
		type = "item",
		name = "steel-beam",
		icon = kr_icons_path .. "steel-beam.png",
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "c-a2[steel-beam]",
		stack_size = 200
	},
	{
		type = "item",
		name = "kr-void",
		icon = kr_icons_path .. "void.png",
		flags = {"hidden"},		
		icon_size = 32,
		order = "zzz[kr-void]",
		stack_size = 999
    },
	{
		type = "item",
		name = "raw-rare-metals",
		icon = kr_mip_icons_path .. "raw-rare-metals.png",
		icon_size = 64,
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "raw-rare-metals.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "raw-rare-metals-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "raw-rare-metals-2.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "raw-rare-metals-3.png", scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "raw-material",
		order = "x[raw-rare-metals]",
		stack_size = 200
	},
	{
		type = "item",
		name = "rare-metals",
		icon = kr_mip_icons_path .. "rare-metals.png",
		icon_size = 64,
		icon_mipmaps = 7,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals-2.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals-3.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals-4.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals-5.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals-6.png", scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "intermediate-product",
		order = "x[rare-metals]",
		stack_size = 200
	}
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})