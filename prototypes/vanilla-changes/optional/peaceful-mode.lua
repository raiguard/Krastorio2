-- -- Peaceful mod

if krastorio.general.getSafeSettingValue("kr-peaceful-mode") then
  -- Item recipes fix
  krastorio.recipes.overrideIngredients("fertilizer", {
    { type = "fluid", name = "sulfuric-acid", amount = 50 },
    { type = "fluid", name = "nitric-acid", amount = 50 },
    { type = "item", name = "coal", amount = 1 },
  })
  krastorio.recipes.overrideIngredients("first-aid-kit", {
    { "raw-fish", 1 },
    { "wood", 1 },
    { "iron-plate", 1 },
  })

  -- Science recipe fix
  if settings.startup["kr-military-science-pack-recipe"].value == "Krastorio 2" or mods["IndustrialRevolution"] then
    data.raw.item["biters-research-data"].localised_name = { "item-name.military-research-data" }
    krastorio.recipes.overrideIngredients("biters-research-data", {
      { "submachine-gun", 3 },
      { "grenade", 3 },
      { "stone-wall", 6 },
    })
  end
end
