local coke_value, coke_acceleration_multiplier, coke_top_speed_multiplier = nil, nil, nil
local fuel_value, fuel_acceleration_multiplier, fuel_top_speed_multiplier = nil, nil, nil
local bio_fuel_value, bio_fuel_acceleration_multiplier, bio_fuel_top_speed_multiplier = nil, nil, nil
local advanced_fuel_value = nil

if krastorio.general.getSafeSettingValue("kr-rebalance-fuels") then
	-- Coke
	coke_value                   = "8MJ"
	coke_acceleration_multiplier = 1.0
	coke_top_speed_multiplier    = 1.0
	
	-- Fuel
	fuel_value                   = "10MJ"
	fuel_acceleration_multiplier = 1
	fuel_top_speed_multiplier    = 1
	
	-- Bio fuel
	bio_fuel_value                   = "10MJ"
	bio_fuel_acceleration_multiplier = 0.8
	bio_fuel_top_speed_multiplier    = 0.8
	
	-- Advanced fuel
	advanced_fuel_value = "10MJ"
else
	-- Coke
	coke_value                   = "10MJ"
	coke_acceleration_multiplier = 1.1
	coke_top_speed_multiplier    = 1.1
	
	-- Fuel
	fuel_value                   = "15MJ"
	fuel_acceleration_multiplier = 1.3
	fuel_top_speed_multiplier    = 1.1
	
	-- Bio fuel
	bio_fuel_value                   = "15MJ"
	bio_fuel_acceleration_multiplier = 1.2
	bio_fuel_top_speed_multiplier    = 1.1
	
	-- Advanced fuel
	advanced_fuel_value = "15MJ"
end

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
		subgroup = "intermediate-product",
		order = "e1[automation-core]",
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
	---
	-- Fuels
	---
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
		fuel_value = coke_value,
		fuel_emissions_multiplier = 1.25,
		fuel_acceleration_multiplier = coke_acceleration_multiplier,
		fuel_top_speed_multiplier = coke_top_speed_multiplier,
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
		fuel_value = fuel_value,
		fuel_emissions_multiplier = 1,
		fuel_acceleration_multiplier = fuel_acceleration_multiplier,
		fuel_top_speed_multiplier = fuel_top_speed_multiplier,
		subgroup = "raw-material",
		order = "w01[fuel]",
		stack_size = 200
    },
	{
		type = "item",
		name = "bio-fuel",
		icon = kr_icons_path .. "bio-fuel.png",
		icon_size = 64,
		fuel_category = "vehicle-fuel",
		fuel_value = bio_fuel_value,
		fuel_emissions_multiplier = 0.5,
		fuel_acceleration_multiplier = bio_fuel_acceleration_multiplier,
		fuel_top_speed_multiplier = bio_fuel_top_speed_multiplier,
		subgroup = "raw-material",
		order = "w02[bio-fuel]",
		stack_size = 200
    },
	{
		type = "item",
		name = "advanced-fuel",
		icon = kr_icons_path .. "advanced-fuel.png",
		icon_size = 64,
		fuel_category = "vehicle-fuel",
		fuel_value = advanced_fuel_value,
		fuel_emissions_multiplier = 1.75,
		fuel_acceleration_multiplier = 1.25,
		fuel_top_speed_multiplier = 1.25,
		subgroup = "raw-material",
		order = "w03[advanced-fuel]",
		stack_size = 200
    },
	---
	{
		type = "item",
		name = "iron-beam",
		icon = kr_icons_path .. "iron-beam.png",
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "c-a2[iron-beam]",
		stack_size = 200
	},
	{
		type = "item",
		name = "steel-gear-wheel",
		icon = kr_icons_path .. "steel-gear-wheel.png",
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "d-a2[steel-gear-wheel]",
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
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "enriched-iron/enriched-iron.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "enriched-iron/enriched-iron-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "enriched-iron/enriched-iron-2.png", scale = 0.25, mipmap_count = 4 }
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
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "enriched-copper/enriched-copper.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "enriched-copper/enriched-copper-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "enriched-copper/enriched-copper-2.png", scale = 0.25, mipmap_count = 4 }
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
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "lithium/lithium.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "lithium/lithium-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "lithium/lithium-2.png", scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "raw-material",
		order = "h2[lithium]",
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
			{ size = 64, filename = kr_mip_icons_path .. "lithium-chloride/lithium-chloride-1.png", scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "raw-material",
		order = "h1[lithium-chloride]",
		stack_size = 200
    },
	{
		type = "item",
		name = "imersite-powder",
		icon = kr_mip_icons_path .. "imersite-powder/imersite-powder.png",
		icon_size = 64,
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "imersite-powder/imersite-powder.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "imersite-powder/imersite-powder-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "imersite-powder/imersite-powder-2.png", scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "raw-material",
		order = "q01[imersite-powder]",
		stack_size = 200
    },
	{
		type = "item",
		name = "imersite-crystal",
		icon = kr_mip_icons_path .. "imersite-crystal/imersite-crystal.png",
		icon_size = 64,
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = kr_mip_icons_path .. "imersite-crystal/imersite-crystal.png",   scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "imersite-crystal/imersite-crystal-1.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "imersite-crystal/imersite-crystal-2.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "imersite-crystal/imersite-crystal-3.png", scale = 0.25, mipmap_count = 4 },
			{ size = 64, filename = kr_mip_icons_path .. "imersite-crystal/imersite-crystal-4.png", scale = 0.25, mipmap_count = 4 }
		},
		subgroup = "intermediate-product",
		order = "q03[imersite-crystal]",
		stack_size = 50
    },
	{
		type = "item",
		name = "lithium-sulfur-battery",
		icon = kr_icons_path .. "lithium-sulfur-battery.png",
		icon_size = 64,
		subgroup = "raw-material",
		order = "i2[lithium-sulfur-battery]",
		stack_size = 200
	},
	{
		type = "item",
		name = "ai-core",
		icon = kr_icons_path .. "ai-core.png",
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "h1[ai-core]",
		stack_size = 200
	},
	{
		type = "item",
		name = "pollution-filter",
		icon = kr_icons_path .. "pollution-filter.png",
		icon_size = 64,
		stack_size = 50,		
		subgroup = "intermediate-product",
		order = "06[pollution-filter]",
	},
	{
		type = "item",
		name = "used-pollution-filter",
		icon = kr_icons_path .. "used-pollution-filter.png",
		icon_size = 64,
		stack_size = 50,		
		subgroup = "intermediate-product",
		order = "07[used-pollution-filter]",
	},
	{
		type = "item",
		name = "deuterium-oxide",
		icon = kr_icons_path .. "deuterium-oxide.png",
		icon_size = 64,
		subgroup = "intermediate-product",
		order = "p[deuterium-oxide]",
		stack_size = 200
    },
	{
		type = "item",
		name = "tritium",
		icon = kr_icons_path .. "tritium.png",
		icon_size = 64,
		subgroup = "raw-material",
		order = "s[tritium]",
		stack_size = 200
    },
	{
		type = "item",
		name = "dt-fuel",
		icon = kr_icons_path .. "dt-fuel.png",
		icon_size = 32,
		fuel_category = "fusion-fuel",
		fuel_value = "50GJ",
		subgroup = "intermediate-product",
		order = "r[uranium-processing]-b[dt-fuel]",
		stack_size = 50
    },
	---
	-- Drill heads
	---
	{
		type = "item",
		name = "steel-drill-head",
		icon = kr_icons_path .. "drill-heads/steel-drill-head.png",
		icon_size = 32,
		fuel_category = "kr-quarry-drill-fuel",
		fuel_value = "50MJ",
		subgroup = "intermediate-product",
		order = "w08[drill-heads]-a1[steel-drill-head]",
		stack_size = 200
    },	
	{
		type = "item",
		name = "alloy-drill-head",
		icon = kr_icons_path .. "drill-heads/alloy-drill-head.png",
		icon_size = 32,
		fuel_category = "kr-quarry-drill-fuel",
		fuel_value = "75MJ",
		subgroup = "intermediate-product",
		order = "w08[drill-heads]-a2[alloy-drill-head]",
		stack_size = 200
    },	
	{
		type = "item",
		name = "imersite-drill-head",
		icon = kr_icons_path .. "drill-heads/imersite-drill-head.png",
		icon_size = 32,
		fuel_category = "kr-quarry-drill-fuel",
		fuel_value = "100MJ",
		subgroup = "intermediate-product",
		order = "w08[drill-heads]-a3[imersite-drill-head]",
		stack_size = 200
    }
	---
})
