-- -- -- VANILLA EQUIPMENTS MODIFICATION

----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 

-- -- Utils Function

-- Add radioactive damage resistance to armors
-- @armor_name, armor name
-- @decrease, decrease value
-- @percent, percent value
local function addRadioactiveResistance(armor_name, decrease, percent)
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

-- Update a icon and sprites a given table (dictionary),
-- formatted with: { categories{ items-->[path,icon_size,sprite.width,sprite.height]... }... }
-- @_objects_to_modify, list of graphics to modify with the format over described
-- @icons_path, path where is the new icons of this objects
-- @sprites_path, path where is the new sprites of this objects
local function updateVanillaEquipmentGraphics(_objects_to_modify, icons_path, sprites_path)
	for category_name, items in pairs(_objects_to_modify) do
		for item_name, item in pairs(items) do
			if data.raw.item[item_name] then
				data.raw.item[item_name].icon                      = icons_path .. item[1]
				data.raw.item[item_name].icon_size                 = item[2]
				if data.raw[category_name][item_name] then
					data.raw[category_name][item_name].sprite.filename = sprites_path .. item[1]
					data.raw[category_name][item_name].sprite.width    = item[3]
					data.raw[category_name][item_name].sprite.height   = item[4]
				end
			end
		end
	end
end

-- Update grid of specified vehicle, will integrate with the grid the equipment categories of old grid
-- that is different from "armor" that is dedicated to character equipment
-- @vehicle_type, prototype type of vehicle
-- @vehicle_name, name of vehicle
-- @equipment_grid_name, name of the new grid to apply
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

----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 

-- -- -- ARMORS
addRadioactiveResistance("modular-armor", 2, 15)
addRadioactiveResistance("power-armor", 3, 30)
addRadioactiveResistance("power-armor-mk2", 4, 45)

-- Armors:
table.insert(data.raw["equipment-grid"]["small-equipment-grid"].equipment_categories,  "universal-equipment")
table.insert(data.raw["equipment-grid"]["small-equipment-grid"].equipment_categories,  "robot-interaction-equipment")
table.insert(data.raw["equipment-grid"]["medium-equipment-grid"].equipment_categories, "universal-equipment")
table.insert(data.raw["equipment-grid"]["medium-equipment-grid"].equipment_categories, "robot-interaction-equipment")
table.insert(data.raw["equipment-grid"]["large-equipment-grid"].equipment_categories,  "universal-equipment")
table.insert(data.raw["equipment-grid"]["large-equipment-grid"].equipment_categories,  "robot-interaction-equipment")

----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 

-- -- -- VEHICLES
-- -- Creating new equipment vehicle grids and add it
data:extend(
{	
-----------------------------------------------------------------------------------------------------------------
	-- Car
	{
		type = "equipment-grid",
		name = "kr-car-grid",
		width = 6,
		height = 6,
		equipment_categories = {"universal-equipment", "robot-interaction-equipment", "vehicle-equipment", "vehicle-motor"}
	},
-----------------------------------------------------------------------------------------------------------------
	-- Tanks	
	{
		type = "equipment-grid",
		name = "kr-tank-grid",
		width = 6,
		height = 11,
		equipment_categories = {"universal-equipment", "robot-interaction-equipment", "vehicle-equipment", "vehicle-motor"}
	},
	{
		type = "equipment-grid",
		name = "kr-tank-grid-2",
		width = 12,
		height = 15,
		equipment_categories = {"universal-equipment", "robot-interaction-equipment", "vehicle-equipment", "vehicle-motor"}
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
 
})

-- -- General vehicles grids compatibility, modify grid and integrate it
applyAndIntegrateEquipmentCategories("car", "car", "kr-car-grid")
applyAndIntegrateEquipmentCategories("car", "tank", "kr-tank-grid")
applyAndIntegrateEquipmentCategories("locomotive", "locomotive", "kr-locomotive-grid")
applyAndIntegrateEquipmentCategories("cargo-wagon", "cargo-wagon", "kr-wagons-grid")
applyAndIntegrateEquipmentCategories("fluid-wagon", "fluid-wagon", "kr-wagons-grid")
applyAndIntegrateEquipmentCategories("artillery-wagon", "artillery-wagon", "kr-wagons-grid")

----------------------------------------------------------------------------------------------------------------- 
----------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------

-- -- -- ITEMS(EQUIPMENTS)
local objects_to_modify = nil
	
-----------------------------------------------------------------------------------------------------------------
-- -- Personal roboports 
-----------------------------------------------------------------------------------------------------------------

-- Personal roboports (both vanilla)
if data.raw["roboport-equipment"]["personal-roboport-equipment"] then
	data.raw["roboport-equipment"]["personal-roboport-equipment"].robot_limit = 20
	data.raw["roboport-equipment"]["personal-roboport-equipment"].construction_radius = 15
	data.raw["roboport-equipment"]["personal-roboport-equipment"].categories = {"robot-interaction-equipment"}
end
if data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"] then
	data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].energy_source =
    {
		type = "electric",
		buffer_capacity = "50MJ",
		input_flow_limit = "5000KW",
		usage_priority = "secondary-input"
    }
    data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].charging_energy = "2000kW"
	data.raw["roboport-equipment"]["personal-roboport-mk2-equipment"].categories = {"robot-interaction-equipment"}
end

-- Personal roboport equipment (recipe)
krastorio.recipes.addIngredient("personal-roboport-equipment", {"steel-plate", 10})
krastorio.recipes.replaceIngredient("personal-roboport-equipment", "battery", {"battery", 45})
krastorio.recipes.replaceIngredient("personal-roboport-equipment", "advanced-circuit", {"advanced-circuit", 5})
krastorio.recipes.replaceIngredient("personal-roboport-equipment", "iron-gear-wheel", {"iron-gear-wheel", 20})
krastorio.recipes.removeIngredient("personal-roboport-equipment", "steel-plate")

-- Personal roboport mk2 equipment (recipe)
krastorio.recipes.replaceIngredient("personal-roboport-mk2-equipment", "processing-unit", {"processing-unit", 20})

-----------------------------------------------------------------------------------------------------------------
-- -- Batteries
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify =
{
	["battery-equipment"] =
	{
		["battery-equipment"]     = {"battery-mk1-equipment.png", 32, 32, 64},
		["battery-mk2-equipment"] = {"battery-mk2-equipment.png", 32, 32, 64}
	},
	["active-defense-equipment"] = 
	{
		["personal-laser-defense-equipment"] = {"personal-laser-defense-mk1-equipment.png", 32, 64, 64}
	}
}

-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_universal_equipments_icons_path, kr_universal_equipments_path)

-- Equipments categories
table.insert(data.raw["battery-equipment"]["battery-equipment"].categories, "universal-equipment")
table.insert(data.raw["battery-equipment"]["battery-mk2-equipment"].categories, "universal-equipment")

-----------------------------------------------------------------------------------------------------------------
-- -- Discharge defense
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["active-defense-equipment"]["discharge-defense-equipment"].categories, "universal-equipment")

-----------------------------------------------------------------------------------------------------------------
-- -- Fusion reactor
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify =
{		
	["generator-equipment"] =
	{
		["fusion-reactor-equipment"] = {"fusion-reactor-equipment.png", 32, 128, 128}
	}
}
-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_universal_equipments_icons_path, kr_universal_equipments_path)

-- Equipments categories
table.insert(data.raw["generator-equipment"]["fusion-reactor-equipment"].categories, "universal-equipment")

-----------------------------------------------------------------------------------------------------------------
-- -- Personal laser
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["active-defense-equipment"]["personal-laser-defense-equipment"].categories, "universal-equipment")

-----------------------------------------------------------------------------------------------------------------
-- -- Shields
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify =
{
	["energy-shield-equipment"] = 
	{
		["energy-shield-equipment"]     = {"energy-shield-mk1-equipment.png", 32, 64, 64},
		["energy-shield-mk2-equipment"] = {"energy-shield-mk2-equipment.png", 32, 64, 64}
	}
}
-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_universal_equipments_icons_path, kr_universal_equipments_path)

-- Equipments categories
table.insert(data.raw["energy-shield-equipment"]["energy-shield-equipment"].categories, "universal-equipment")
table.insert(data.raw["energy-shield-equipment"]["energy-shield-mk2-equipment"].categories, "universal-equipment")

-----------------------------------------------------------------------------------------------------------------
-- -- Solar pannel
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["solar-panel-equipment"]["solar-panel-equipment"].categories, "universal-equipment")

-----------------------------------------------------------------------------------------------------------------
-- -- Belt Immunity
-----------------------------------------------------------------------------------------------------------------

-- Equipments categories
table.insert(data.raw["belt-immunity-equipment"]["belt-immunity-equipment"].categories, "universal-equipment")

-----------------------------------------------------------------------------------------------------------------
-- Night visor
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify =
{
	["night-vision-equipment"] =
	{
		["night-vision-equipment"] = {"night-vision-equipment.png", 32, 64, 64}
	}
}

-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_character_equipments_icons_path, kr_character_equipments_path)

-----------------------------------------------------------------------------------------------------------------
-- Exoskeleton equipment
-----------------------------------------------------------------------------------------------------------------

-- -- Items visual(icon, sprites)/modifcation
objects_to_modify =
{
	["movement-bonus-equipment"] = 
	{
		["exoskeleton-equipment"] = {"exoskeleton-equipment.png", 32, 64, 128}
	}
}

-- iterating...
updateVanillaEquipmentGraphics(objects_to_modify, kr_character_equipments_icons_path, kr_character_equipments_path)


-----------------------------------------------------------------------------------------------------------------