for _, car in pairs(data.raw.car) do
  if car.energy_source and car.energy_source.type == "burner" then
    car.energy_source.fuel_categories = { "vehicle-fuel" }
  end
end
