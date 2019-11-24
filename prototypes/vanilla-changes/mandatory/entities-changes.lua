-- -- -- Chaning "furnaces" from furnace prototype to assembler prototype

local function transferFromFurnacesToAssemblers(furnace_name)
	if data.raw.furnace[furnace_name] then
		local furnace = krastorio_utils.tables.fullCopy(data.raw.furnace[furnace_name])
		furnace.type = "assembling-machine"
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
