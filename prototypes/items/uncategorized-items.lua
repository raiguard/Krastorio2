data:extend(
{
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------   
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
		icon = kr_mip_icons_path .. "glass.png",
		icon_size = 64,
		icon_mipmaps = 1,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "glass.png",   scale = 0.25, mipmap_count = 4 }
		},
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
		icon = "__base__/graphics/icons/steel-plate.png",
		icon_size = 32,
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
		name = "kr-void",
		icon = kr_icons_path .. "void.png",
		flags = {"hidden"},		
		icon_size = 32,
		order = "zzz[kr-void]",
		stack_size = 999
    }
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})