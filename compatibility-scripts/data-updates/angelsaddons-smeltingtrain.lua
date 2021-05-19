if mods["angelsaddons-smeltingtrain"] then
  data.raw["locomotive"]["smelting-locomotive-1"].burner.fuel_category = nil
  data.raw["locomotive"]["smelting-locomotive-1"].burner.fuel_categories = { "chemical", "vehicle-fuel" }
  data.raw["locomotive"]["smelting-locomotive-1"].max_health = 1000
  data.raw["locomotive"]["smelting-locomotive-1"].braking_force = 30
  data.raw["locomotive"]["smelting-locomotive-1"].burner.emissions_per_minute = 20
  data.raw["locomotive"]["smelting-locomotive-1"].weight = 10000
  data.raw["locomotive"]["smelting-locomotive-1"].max_speed = 1.0185
  data.raw["locomotive"]["smelting-locomotive-1"].max_power = "2MW"
  data.raw["locomotive"]["smelting-locomotive-1"].burner.effectivity = 1

  data.raw["locomotive"]["smelting-locomotive-tender"].burner.fuel_category = nil
  data.raw["locomotive"]["smelting-locomotive-tender"].burner.fuel_categories = { "chemical", "vehicle-fuel" }
  data.raw["locomotive"]["smelting-locomotive-tender"].max_health = 1000
  data.raw["locomotive"]["smelting-locomotive-tender"].braking_force = 30
  data.raw["locomotive"]["smelting-locomotive-tender"].burner.emissions_per_minute = 20
  data.raw["locomotive"]["smelting-locomotive-tender"].weight = 10000
  data.raw["locomotive"]["smelting-locomotive-tender"].max_speed = 1.0185
  data.raw["locomotive"]["smelting-locomotive-tender"].max_power = "2MW"
  data.raw["locomotive"]["smelting-locomotive-tender"].burner.effectivity = 1
end
