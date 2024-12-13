if mods["pycoalprocessing"] then
  -- Recipes fixes
  krastorio.recipes.removeIngredient("big-electric-pole", "copper-cable")

  -- Re-apply Krastorio science icons
  krastorio.icons.setItemIcon("automation-science-pack", "__Krastorio2Assets__/icons/cards/automation-tech-card.png")
  krastorio.icons.setItemIcon("logistic-science-pack", "__Krastorio2Assets__/icons/cards/logistic-tech-card.png")
  krastorio.icons.setItemIcon("chemical-science-pack", "__Krastorio2Assets__/icons/cards/chemical-tech-card.png")
end
