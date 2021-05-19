if mods["ElectricTrain"] then
  local function changeLocomotiveGrid(locomotive_name)
    if data.raw["locomotive"][locomotive_name] then
      if
        data.raw["locomotive"][locomotive_name].equipment_grid
        and data.raw["equipment-grid"][data.raw["locomotive"][locomotive_name].equipment_grid]
      then
        local equipment_categories_set = {}
        for _, equipment_category in pairs(data.raw["equipment-grid"]["kr-locomotive-grid"].equipment_categories) do
          equipment_categories_set[equipment_category] = true
        end

        for _, equipment_category in pairs(data.raw["equipment-grid"][data.raw["locomotive"][locomotive_name].equipment_grid].equipment_categories) do
          if equipment_category ~= "armor" and not equipment_categories_set[equipment_category] then
            table.insert(data.raw["equipment-grid"]["kr-locomotive-grid"].equipment_categories, equipment_category)
          end
        end
      end

      data.raw["locomotive"][locomotive_name].equipment_grid = "kr-locomotive-grid"
    end
  end

  changeLocomotiveGrid("et-electric-locomotive-1")
  changeLocomotiveGrid("et-electric-locomotive-2")
  changeLocomotiveGrid("et-electric-locomotive-3")

  if mods["MultipleUnitTrainControl"] then
    changeLocomotiveGrid("et-electric-locomotive-1-mu")
    changeLocomotiveGrid("et-electric-locomotive-2-mu")
    changeLocomotiveGrid("et-electric-locomotive-3-mu")
  end
end
