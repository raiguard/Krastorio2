-- -- -- Vehicles minable changes
if krastorio.general.getSafeSettingValue("kr-vehicles-minable-changes") then
  for _, type in ipairs({ "car", "locomotive", "artillery-wagon", "cargo-wagon", "fluid-wagon", "spider-vehicle" }) do
    if data.raw[type] then
      for _, vehicle in pairs(data.raw[type]) do
        vehicle.minable = nil
      end
    end
  end
end
