-- -- -- Universal equipments
data:extend(
{
	-- -- BATTERIES
	-- battery-mk3-equipment
	{
		type = "battery-equipment",
		name = "battery-mk3-equipment",
		sprite =
		{
			filename = kr_universal_equipments_path .. "battery-mk3-equipment.png",
			width = 32,
			height = 64,
			priority = "medium"
		},
		shape =
		{
			width = 1,
			height = 2,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "50MJ",
			input_flow_limit = "1MW",
			output_flow_limit = "2MW",
			usage_priority = "tertiary"
		},
		categories = {"universal-equipment"}
	},
	-- big-battery-equipment
	{
		type = "battery-equipment",
		name = "big-battery-equipment",
		sprite =
		{
			filename = kr_universal_equipments_path .. "big-battery-equipment.png",
			width = 64,
			height = 64,
			priority = "medium"
		},
		shape =
		{
			width = 2,
			height = 2,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "30MJ",
			input_flow_limit = "0.75MW",
			output_flow_limit = "1MW",
			usage_priority = "tertiary"
		},
		categories = {"universal-equipment"}
	},
	-- big-battery-mk2-equipment
	{
		type = "battery-equipment",
		name = "big-battery-mk2-equipment",
		sprite =
		{
			filename = kr_universal_equipments_path .. "big-battery-mk2-equipment.png",
			width = 64,
			height = 64,
			priority = "medium"
		},
		shape =
		{
			width = 2,
			height = 2,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "75MJ",
			input_flow_limit = "1.5MW",
			output_flow_limit = "2MW",
			usage_priority = "tertiary"
		},
		categories = {"universal-equipment"}
	},
	-- big-battery-mk3-equipment
	{
		type = "battery-equipment",
		name = "big-battery-mk3-equipment",
		sprite =
		{
			filename = kr_universal_equipments_path .. "big-battery-mk3-equipment.png",
			width = 64,
			height = 64,
			priority = "medium"
		},
		shape =
		{
			width = 2,
			height = 2,
			type = "full"
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "150MJ",
			input_flow_limit = "3MW",
			output_flow_limit = "4MW",
			usage_priority = "tertiary"
		},
		categories = {"universal-equipment"}
	},
	-- -- GENERATORS
	-- small-portable-generator-equipment
	{
		type = "generator-equipment",
		name = "small-portable-generator",
		sprite =
		{
			filename = kr_universal_equipments_path .. "small-portable-generator.png",
			width = 64,
			height = 64,
			priority = "medium"
		},
		shape =
		{
			width = 2,
			height = 2,
			type = "full"
		},
		burner =
		{
			fuel_categories = {"chemical", "vehicle-fuel"},
			effectivity = 2,
			fuel_inventory_size = 2,
			burnt_inventory_size = 1
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "primary-output"
		},
		power = "200kW", -- 50kW * 4  * 1 * 1
		categories = {"universal-equipment"}
	},
	-- portable-generator
	{
		type = "generator-equipment",
		name = "portable-generator",
		sprite =
		{
			filename = kr_universal_equipments_path .. "portable-generator.png",
			width = 128,
			height = 128,
			priority = "medium"
		},
		shape =
		{
			width = 3,
			height = 3,
			type = "full"
		},
		burner =
		{
			fuel_categories = {"chemical", "vehicle-fuel"},
			effectivity = 2,
			fuel_inventory_size = 3,
			burnt_inventory_size = 1
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "primary-output"
		},
		power = "540kW", -- 50kW * 9  * 1 * 1.2
		categories = {"universal-equipment"}
	},
})
