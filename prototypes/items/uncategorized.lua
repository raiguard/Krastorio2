data:extend(
{	
	{
		type = "item",
		name = "biomass",
		icon = kr_mip_icons_path .. "biomass/biomass.png",
		icon_size = 64,
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "biomass/biomass.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "biomass/biomass-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "biomass/biomass-2.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "biomass/biomass-3.png", scale = 0.25, mipmap_count = 4 }
		},
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
		icon = kr_mip_icons_path .. "sand/sand.png",
		icon_size = 64,
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "sand/sand.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "sand/sand-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "sand/sand-2.png", scale = 0.25, mipmap_count = 4 }
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
		name = "quartz",
		icon = kr_mip_icons_path .. "quartz/quartz.png",
		icon_size = 64,
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "quartz/quartz.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "quartz/quartz-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "quartz/quartz-2.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "quartz/quartz-3.png", scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "raw-material",
		order = "b3[quartz]",
		stack_size = 200
    },
	{
		type = "item",
		name = "silicon",
		icon = kr_mip_icons_path .. "silicon/silicon.png",
		icon_size = 64,
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "silicon/silicon.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "silicon/silicon-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "silicon/silicon-2.png", scale = 0.25, mipmap_count = 4 }
		},  
		subgroup = "raw-material",
		order = "b4[silicon]",
		stack_size = 200
    },
	{
		type = "item",
		name = "electronic-components",
		icon = kr_icons_path .. "electronic-components.png",
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "e[ei-electronic-components]",
		stack_size = 200
	},
	{
		type = "item",
		name = "coke",
		icon = kr_mip_icons_path .. "coke/coke.png",
		icon_size = 64,
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "coke/coke.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "coke/coke-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "coke/coke-2.png", scale = 0.25, mipmap_count = 4 }
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
		name = "fuel",
		icon = kr_icons_path .. "fuel.png",
		icon_size = 64,
		fuel_category = "vehicle-fuel",
		fuel_value = "15MJ",
		fuel_emissions_multiplier = 1,
		fuel_acceleration_multiplier = 1.3,
		fuel_top_speed_multiplier = 1.1,
		subgroup = "raw-material",
		order = "zzz[fuel]",
		stack_size = 200
    },
	{
		type = "item",
		name = "bio-fuel",
		icon = kr_icons_path .. "bio-fuel.png",
		icon_size = 64,
		fuel_category = "vehicle-fuel",
		fuel_value = "15MJ",
		fuel_emissions_multiplier = 1,
		fuel_acceleration_multiplier = 1.3,
		fuel_top_speed_multiplier = 1.1,
		subgroup = "raw-material",
		order = "zzz[bio-fuel]",
		stack_size = 200
    },
	{
		type = "item",
		name = "advanced-fuel",
		icon = kr_icons_path .. "advanced-fuel.png",
		icon_size = 64,
		fuel_category = "vehicle-fuel",
		fuel_value = "10MJ",
		fuel_emissions_multiplier = 1.5,
		fuel_acceleration_multiplier = 1.4,
		fuel_top_speed_multiplier = 1.2,
		subgroup = "raw-material",
		order = "zzz[advanced-fuel]",
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
		name = "rare-metals",
		icon = kr_mip_icons_path .. "rare-metals/rare-metals.png",
		icon_size = 64,
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals/rare-metals.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals/rare-metals-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals/rare-metals-2.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals/rare-metals-3.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals/rare-metals-4.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals/rare-metals-5.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "rare-metals/rare-metals-6.png", scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "intermediate-product",
		order = "x[rare-metals]",
		stack_size = 200
	},
	{
		type = "item",
		name = "enriched-iron",
		icon = kr_mip_icons_path .. "enriched-iron/enriched-iron.png",
		icon_size = 64,
		icon_mipmaps = 3,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "enriched-iron/enriched-iron.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "enriched-iron/enriched-iron-1.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "enriched-iron/enriched-iron-2.png",   scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "raw-material",
		order = "e01[enriched-iron]",
		stack_size = 200
    },	
	{
		type = "item",
		name = "enriched-copper",
		icon = kr_mip_icons_path .. "enriched-copper/enriched-copper.png",
		icon_size = 64,
		icon_mipmaps = 3,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "enriched-copper/enriched-copper.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "enriched-copper/enriched-copper-1.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "enriched-copper/enriched-copper-2.png",   scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "raw-material",
		order = "e02[enriched-copper]",
		stack_size = 200
    },
	{
		type = "item",
		name = "lithium",
		icon = kr_mip_icons_path .. "lithium/lithium.png",
		icon_size = 64,
		icon_mipmaps = 3,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "lithium/lithium.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "lithium/lithium-1.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "lithium/lithium-2.png",   scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "raw-material",
		order = "e04[lithium]",
		stack_size = 200
    },
	{
		type = "item",
		name = "lithium-chloride",
		icon = kr_mip_icons_path .. "lithium-chloride/lithium-chloride.png",
		icon_size = 64,
		icon_mipmaps = 3,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "lithium-chloride/lithium-chloride.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "lithium-chloride/lithium-chloride-1.png",   scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "raw-material",
		order = "e05[lithium-chloride]",
		stack_size = 200
    },
})