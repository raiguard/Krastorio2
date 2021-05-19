if mods["angelsaddons-petrotrain"] or mods["angelsaddons-mobility"] then
  local function removeEquipment(equipments, equipment_name)
    for index, inner_equipment_name in pairs(equipments) do
      if inner_equipment_name == equipment_name then
        table.remove(equipments, index)
        break
      end
    end
  end

  local function changeLocomotiveBurnerCategory(locomotive_name)
    if
      krastorio.general.getSafeSettingValue("kr-rebalance-vehicles&fuels")
      and data.raw.locomotive[locomotive_name]
      and data.raw.locomotive[locomotive_name].burner
    then
      data.raw.locomotive[locomotive_name].burner.fuel_category = nil
      if mods["IndustrialRevolution"] then
        data.raw.locomotive[locomotive_name].burner.fuel_categories = { "chemical", "vehicle-fuel", "battery" }
      else
        data.raw.locomotive[locomotive_name].burner.fuel_categories = { "chemical", "vehicle-fuel" }
      end
    end
  end

  local new_train_grids = {
    "angels-petro-locomotive",
    "angels-petro-tank1",
    "angels-petro-tank2",
  }

  for _, grid_name in pairs(new_train_grids) do
    if data.raw["equipment-grid"][grid_name] then
      removeEquipment(data.raw["equipment-grid"][grid_name].equipment_categories, "angels-basegame-movement")
      table.insert(data.raw["equipment-grid"][grid_name].equipment_categories, "universal-equipment")
      table.insert(data.raw["equipment-grid"][grid_name].equipment_categories, "vehicle-equipment")
    end
  end

  changeLocomotiveBurnerCategory("petro-locomotive-1")
end
