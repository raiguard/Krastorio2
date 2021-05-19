if mods["pycoalprocessing"] then
  -- Recipes fixes
  krastorio.recipes.removeIngredient("big-electric-pole", "copper-cable")

  -- Re-apply Krastorio science icons
  krastorio.icons.setItemIcon("automation-science-pack", kr_cards_icons_path .. "automation-tech-card.png")
  krastorio.icons.setItemIcon("logistic-science-pack", kr_cards_icons_path .. "logistic-tech-card.png")
  krastorio.icons.setItemIcon("chemical-science-pack", kr_cards_icons_path .. "chemical-tech-card.png")
end
