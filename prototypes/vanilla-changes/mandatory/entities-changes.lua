-- -- -- Chaning "furnaces" from furnace prototype to assembler prototype

local function transferFromFurnacesToAssemblers(furnace_name)
	if data.raw.furnace[furnace_name] then
		local furnace = krastorio_utils.tables.fullCopy(data.raw.furnace[furnace_name])
		furnace.type = "assembling-machine"
		furnace.source_inventory_size = 2
		furnace.energy_usage = "350kW"
		data.raw.furnace[furnace_name] = nil
		data:extend({furnace})
	end
end

local vanilla_furnaces = 
{
	"stone-furnace",
	"steel-furnace",
	"electric-furnace"
}

for _, furnace_name in pairs(vanilla_furnaces) do
	transferFromFurnacesToAssemblers(furnace_name)
end

-- Because Factorio won't start if not exist at least one prototype of assemblers and furnaces
if #data.raw.furnace == 0 then
	local _, first_assembler = next(data.raw["assembling-machine"])
	local furnace = krastorio_utils.tables.fullCopy(first_assembler)
	furnace.type = "furnace"
	furnace.name = "anti-crash-furnace"
	furnace.flags = {"hidden"}
	furnace.gui_mode = "none"
	furnace.group = "other"
	furnace.source_inventory_size = 1
	furnace.result_inventory_size = 1
	data:extend({
	{
		type = "item",
		name = "anti-crash-furnace",
		flags = {"hidden"},
		icon = "__base__/graphics/icons/stone-furnace.png",
		icon_size = 64,
		place_result = "anti-crash-furnace",
		stack_size = 1
	}})
	data:extend({furnace})	
end



-- Boilers

data.raw["boiler"]["boiler"].energy_source.emissions_per_minute = 20

-- Pumpjack sprites modification

data.raw["mining-drill"]["pumpjack"].icon = kr_entities_icons_path .. "oil-pumpjack.png"
data.raw["mining-drill"]["pumpjack"].icon_size = 64
data.raw["mining-drill"]["pumpjack"].icon_mipmaps = nil
data.raw["mining-drill"]["pumpjack"].energy_usage = "100kW"
data.raw["mining-drill"]["pumpjack"].mining_speed = 2
data.raw["mining-drill"]["pumpjack"].radius_visualisation_picture.filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-radius-visualization.png"
data.raw["mining-drill"]["pumpjack"].base_picture.sheets =
{
	{
		filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-base.png",
		priority = "extra-high",
		width = 131,
		height = 137,
		shift = util.by_pixel(-2.5, -4.5),
		hr_version =
		{
			filename = kr_entities_path .. "oil-pumpjack/hr-oil-pumpjack-base.png",
			priority = "extra-high",
			width = 261,
			height = 273,
			shift = util.by_pixel(-2.25, -4.75),
			scale = 0.5
		}
	},
	{
		filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-base-shadow.png",
		priority = "extra-high",
		width = 110,
		height = 111,
		draw_as_shadow = true,
		shift = util.by_pixel(6, 0.5),
		hr_version =
		{
			filename = kr_entities_path .. "oil-pumpjack/hr-oil-pumpjack-base-shadow.png",
			width = 220,
			height = 220,
			scale = 0.5,
			draw_as_shadow = true,
			shift = util.by_pixel(6, 0.5)
		}
	}
}
	  
data.raw["mining-drill"]["pumpjack"].animations =
{
	north =
	{
		layers =
		{
			{
				animation_speed = 0.5,
				filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-horsehead.png",
				frame_count = 40,
				height = 102,
				line_length = 8,
				priority = "high",
				shift = util.by_pixel(-4, -24),
				width = 104,
				hr_version =
				{
					animation_speed = 0.5,
					filename = kr_entities_path .. "oil-pumpjack/hr-oil-pumpjack-horsehead.png",
					frame_count = 40,
					height = 202,
					line_length = 8,
					priority = "high",
					scale = 0.5,
					shift = util.by_pixel(-4, -24),
					width = 206
				}
			},
			{
				animation_speed = 0.5,
				draw_as_shadow = true,
				filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-horsehead-shadow.png",
				frame_count = 40,
				height = 41,
				line_length = 8,
				priority = "high",
				shift = util.by_pixel(17.5, 14.5),
				width = 155,
				hr_version =
				{
					animation_speed = 0.5,
					draw_as_shadow = true,
					filename = kr_entities_path .. "oil-pumpjack/hr-oil-pumpjack-horsehead-shadow.png",
					frame_count = 40,
					height = 82,
					line_length = 8,
					priority = "high",
					scale = 0.5,
					shift = util.by_pixel(17.75, 14.5),
					width = 309
				}
			}
		}
	}
}
	
data.raw.corpse["pumpjack-remnants"].animation = make_rotated_animation_variations_from_sheet(2,
{
	filename = kr_entities_path .. "oil-pumpjack/remnants/oil-pumpjack-remnants.png",
	line_length = 1,
	width = 138,
	height = 142,
	frame_count = 1,
	direction_count = 1,
	shift = util.by_pixel(0, 3),
	hr_version =
	{
		filename = kr_entities_path .. "oil-pumpjack/remnants/hr-oil-pumpjack-remnants.png",
		line_length = 1,
		width = 274,
		height = 284,
		frame_count = 1,
		direction_count = 1,
		shift = util.by_pixel(0, 3.5),
		scale = 0.5
	}
})

-- Chemical plant
--data.raw["assembling-machine"]["chemical-plant"].energy_source.emissions_per_minute = 2

-- E Drill
data.raw["mining-drill"]["electric-mining-drill"].fast_replaceable_group = "electric-mining-drill"
data.raw["mining-drill"]["electric-mining-drill"].next_upgrade = "kr-electric-mining-drill-mk2"

-- Lab
data.raw.lab["lab"].fast_replaceable_group = "lab"
data.raw.lab["lab"].next_upgrade = "biusart-lab"

-- Solar panel
data.raw["solar-panel"]["solar-panel"].production = "100KW"

-- Radar
data.raw.radar["radar"].fast_replaceable_group = "radar"
