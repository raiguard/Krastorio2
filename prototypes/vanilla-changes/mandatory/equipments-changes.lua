-- -- -- ARMORS
-- Add radioactive damage resistance to armors
function addRadioactiveResistance(armor_name, decrease, percent)
	local armor = data.raw["armor"][armor_name]
	if armor then
		if not armor.resistances then
			armor.resistances = {}
		end
		table.insert(armor.resistances,
		{
			["type"]     = "radioactive",
			["decrease"] = decrease,
			["percent"]  = percent
		})
	end
end

addRadioactiveResistance("modular-armor", 2, 15)
addRadioactiveResistance("power-armor", 3, 30)
addRadioactiveResistance("power-armor-mk2", 4, 45)

-- -- -- VEHICLES
-- -- Creating new equipment vehicle grids and add it
data:extend(
{	
----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 
	-- Car
	{
		type = "equipment-grid",
		name = "kr-car-grid",
		width = 6,
		height = 6,
		equipment_categories = {"universal-equipment", "vehicle-equipment", "vehicle-motor"}
	},
-----------------------------------------------------------------------------------------------------------------
	-- Tanks	
	{
		type = "equipment-grid",
		name = "kr-tank-grid",
		width = 6,
		height = 11,
		equipment_categories = {"universal-equipment", "vehicle-equipment", "vehicle-motor"}
	},
	{
		type = "equipment-grid",
		name = "kr-tank-grid-2",
		width = 12,
		height = 15,
		equipment_categories = {"universal-equipment", "vehicle-equipment", "vehicle-motor"}
	},
-----------------------------------------------------------------------------------------------------------------  
	-- Train
	{
		type = "equipment-grid",
		name = "kr-locomotive-grid",
		width = 12,
		height = 12,
		equipment_categories = {"universal-equipment", "vehicle-equipment", "vehicle-motor"}
	},
	{
		type = "equipment-grid",
		name = "kr-wagons-grid",
		width = 6,
		height = 16,
		equipment_categories = {"universal-equipment", "vehicle-equipment"}
	}
----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 
})

-- -- General vehicles grids compatibility

local function applyAndIntegrateEquipmentCategories(vehicle_type, vehicle_name, equipment_grid_name)	
	if data.raw[vehicle_type][vehicle_name] then 
		if
		   data.raw[vehicle_type][vehicle_name].equipment_grid and
		   data.raw["equipment-grid"][data.raw[vehicle_type][vehicle_name].equipment_grid]
		then
			local equipment_categories_set = {}
			for _, equipment_category in pairs(data.raw["equipment-grid"][equipment_grid_name].equipment_categories) do
				equipment_categories_set[equipment_category] = true
			end	
		
			for _, equipment_category in pairs(data.raw["equipment-grid"][data.raw[vehicle_type][vehicle_name].equipment_grid].equipment_categories) do
				if equipment_category ~= "armor" and not equipment_categories_set[equipment_category] then
					table.insert(data.raw["equipment-grid"][equipment_grid_name].equipment_categories, equipment_category)
				end
			end	
		end
		
		data.raw[vehicle_type][vehicle_name].equipment_grid = equipment_grid_name
	end
end

applyAndIntegrateEquipmentCategories("car", "car", "kr-car-grid")
applyAndIntegrateEquipmentCategories("car", "tank", "kr-tank-grid")
applyAndIntegrateEquipmentCategories("locomotive", "locomotive", "kr-locomotive-grid")
applyAndIntegrateEquipmentCategories("cargo-wagon", "cargo-wagon", "kr-wagons-grid")
applyAndIntegrateEquipmentCategories("fluid-wagon", "fluid-wagon", "kr-wagons-grid")
applyAndIntegrateEquipmentCategories("artillery-wagon", "artillery-wagon", "kr-wagons-grid")



