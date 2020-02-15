-- -- -- Chaning "furnaces" from furnace prototype to assembler prototype

local function transferFromFurnacesToAssemblers(furnace_name)
	if data.raw.furnace[furnace_name] then
		local furnace = krastorio_utils.tables.fullCopy(data.raw.furnace[furnace_name])
		furnace.type = "assembling-machine"
		furnace.source_inventory_size = 2
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
	furnace.name = "shit-api-furnace"
	furnace.source_inventory_size = 1
	furnace.result_inventory_size = 1
	data:extend({
	{
		type = "item",
		name = "shit-api-furnace",
		icon = "__base__/graphics/icons/stone-furnace.png",
		icon_size = 32,
		subgroup = "smelting-machine",
		order = "a[shit-api-furnace]",
		place_result = "shit-api-furnace",
		stack_size = 1
	}})
	data:extend({furnace})	
end


-- Boilers

data.raw["boiler"]["boiler"].energy_source.emissions_per_minute = 20

-- Pumpjack sprites modification

data.raw["mining-drill"]["pumpjack"].icon = kr_entities_icons_path .. "oil-pumpjack.png"
data.raw["mining-drill"]["pumpjack"].icon_size = 64
data.raw["mining-drill"]["pumpjack"].energy_usage = "100kW"
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
				priority = "high",
				filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-horsehead.png",
				line_length = 8,
				width = 104,
				height = 102,
				frame_count = 40,
				shift = util.by_pixel(-4, -24),
				animation_speed = 0.5,
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "oil-pumpjack/hr-oil-pumpjack-horsehead.png",
					animation_speed = 0.5,
					scale = 0.5,
					line_length = 8,
					width = 206,
					height = 202,
					frame_count = 40,
					shift = util.by_pixel(-4, -24)
				}
			},
			{
				priority = "high",
				filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-horsehead-shadow.png",
				animation_speed = 0.5,
				draw_as_shadow = true,
				line_length = 8,
				width = 155,
				height = 41,
				frame_count = 40,
				shift = util.by_pixel(17.5, 14.5),
				hr_version =
				{
					priority = "high",
					filename = kr_entities_path .. "oil-pumpjack/hr-oil-pumpjack-horsehead-shadow.png",
					animation_speed = 0.5,
					draw_as_shadow = true,
					line_length = 8,
					width = 309,
					height = 82,
					frame_count = 40,
					scale = 0.5,
					shift = util.by_pixel(17.75, 14.5)
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

-- Solar panel
data.raw["solar-panel"]["solar-panel"].production = "100KW"

