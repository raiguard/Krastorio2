data:extend(
{
	-- Heavy water
	{
		type = "fluid",
		name = "heavy-water",
		default_temperature = 25,
		max_temperature = 100,
		auto_barrel = true,
		base_color = {r=0.2, g=0.3, b=0.32},
		flow_color = {r=0.5, g=0.9, b=0.6},
		icon = kr_fluids_icons_path  .. "heavy-water.png",
		icon_size = 64,
		order = "yb00[heavy-water]"
    },
	-- Ammonia
	{
		type = "fluid",
		name = "ammonia",
		default_temperature = 25,
		max_temperature = 100,
		auto_barrel = true,
		base_color = {r=0.25, g=0.25, b=0.45},
		flow_color = {r=0.25, g=0.25, b=0.45},
		icon = kr_fluids_icons_path  .. "ammonia.png",
		icon_size = 64,
		order = "yc00[ammonia]"
    },
	-- Chlorine
	{
		type = "fluid",
		name = "chlorine",
		default_temperature = 15,
		max_temperature = 100,
		auto_barrel = true,
		base_color = {r=0.30, g=0.60, b=0.1},
		flow_color = {r=0.30, g=0.60, b=0.1},
		gas_temperature = 15,
		icon = kr_fluids_icons_path  .. "chlorine.png",
		icon_size = 64,
		order = "yc00[chlorine]"
    },
	-- Hydrogen
	{
		type = "fluid",
		name = "hydrogen",
		default_temperature = 15,
		max_temperature = 100,
		auto_barrel = true,
		base_color = {r=0.50, g=0.50, b=0.50},
		flow_color = {r=0.50, g=0.50, b=0.50},
		gas_temperature = 15,
		icon = kr_fluids_icons_path  .. "hydrogen.png",
		icon_size = 64,
		order = "yc00[hydrogen]"
    },
	-- Nitrogen
	{
		type = "fluid",
		name = "nitrogen",
		default_temperature = 15,
		max_temperature = 100,
		auto_barrel = true,
		base_color = {r=0.05, g=0.10, b=0.50},
		flow_color = {r=0.05, g=0.10, b=0.50},
		gas_temperature = 15,
		icon = kr_fluids_icons_path  .. "nitrogen.png",
		icon_size = 64,
		order = "yc00[nitrogen]"
    },
	-- Oxygen
	{
		type = "fluid",
		name = "oxygen",
		default_temperature = 15,
		max_temperature = 100,
		auto_barrel = true,
		base_color = {r=0.75, g=0.40, b=0.40},
		flow_color = {r=0.80, g=0.60, b=0.60},
		gas_temperature = 15,
		icon = kr_fluids_icons_path  .. "oxygen.png",
		icon_size = 64,
		order = "yc00[oxygen]"
    },
	-- Nitric acid
	{
		type = "fluid",
		name = "nitric-acid",
		default_temperature = 15,
		max_temperature = 100,
		auto_barrel = true,
		base_color = {r=0.50, g=0.35, b=0.20},
		flow_color = {r=0.50, g=0.35, b=0.20},
		gas_temperature = 15,
		icon = kr_fluids_icons_path  .. "nitric-acid.png",
		icon_size = 64,
		order = "yc00[nitric-acid]"
    },
	-- Hydrogen chloride
	{
		type = "fluid",
		name = "hydrogen-chloride",
		default_temperature = 15,
		max_temperature = 100,
		auto_barrel = true,
		base_color = {r=0.50, g=0.75, b=0.30},
		flow_color = {r=0.50, g=0.75, b=0.30},
		gas_temperature = 15,
		icon = kr_fluids_icons_path  .. "hydrogen-chloride.png",
		icon_size = 64,
		order = "yc00[hydrogen-chloride]"
    }	
})