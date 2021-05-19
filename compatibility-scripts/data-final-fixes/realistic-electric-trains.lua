if mods["Realistic_Electric_Trains"] then
  -- Adapted Krastorio locomotive grid
  data:extend({
    {
      type = "equipment-grid",
      name = "ret-electric-locomotive-grid",
      width = 12,
      height = 12,
      equipment_categories = { "universal-equipment", "vehicle-equipment", "vehicle-motor", "electric-loco-modules" },
    },
  })

  -- -- Changing locomotive grids
  data.raw["locomotive"]["ret-electric-locomotive"].equipment_grid = "ret-electric-locomotive-grid"
  data.raw["locomotive"]["ret-electric-locomotive-mk2"].equipment_grid = "ret-electric-locomotive-grid"
  data.raw["locomotive"]["ret-modular-locomotive"].equipment_grid = "ret-electric-locomotive-grid"

  -- -- Place equipment in right category
  data.raw.item["ret-train-speed-module"].subgroup = "vehicle-motor"
  data.raw.item["ret-train-speed-module"].order = "f[electric-loco-modules]-f1[ret-train-speed-module]"

  data.raw.item["ret-train-productivity-module"].subgroup = "vehicle-motor"
  data.raw.item["ret-train-productivity-module"].order = "f[electric-loco-modules]-f2[ret-train-productivity-module]"

  data.raw.item["ret-train-efficiency-module"].subgroup = "vehicle-motor"
  data.raw.item["ret-train-efficiency-module"].order = "f[electric-loco-modules]-f4[ret-train-efficiency-module]"

  data.raw.item["ret-train-battery-module"].subgroup = "vehicle-motor"
  data.raw.item["ret-train-battery-module"].order = "f[electric-loco-modules]-f3[ret-train-speed-module]"
end
