if mods["MineLiquidOres"] then
  if data.raw["mining-drill"]["pumpjack"] then
    data.raw["mining-drill"]["pumpjack"].resource_categories = { "oil", "liquid-ore" }
  end
end
