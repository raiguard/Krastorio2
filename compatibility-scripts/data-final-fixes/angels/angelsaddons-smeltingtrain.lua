if mods["angelsaddons-smeltingtrain"] then
	local function removeEquipment(equipments, equipment_name)
		for index, inner_equipment_name in pairs(equipments) do
			if inner_equipment_name == equipment_name then
				table.remove(equipments, index)
				break
			end
		end
	end
	
	local new_train_grids =
	{
		"angels-smelting-locomotive",	  
		"angels-smelting-locomotive-tender",	  
		"angels-smelting-wagon"
	}
	  
	for _, grid_name in pairs(new_train_grids) do
		if data.raw["equipment-grid"][grid_name] then
			removeEquipment(data.raw["equipment-grid"][grid_name].equipment_categories, "angels-basegame-movement")
			table.insert(data.raw["equipment-grid"][grid_name].equipment_categories, "universal-equipment")
			table.insert(data.raw["equipment-grid"][grid_name].equipment_categories, "vehicle-equipment")
		end
	end
end
