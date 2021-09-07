if mods["pycoalprocessing"] then
  -- Fix bad code in science icons updating
  ---@diagnostic disable-next-line
  ITEM("automation-science-pack", "tool"):set("icon_size", 32)
  ---@diagnostic disable-next-line
  ITEM("logistic-science-pack", "tool"):set("icon_size", 32)
  ---@diagnostic disable-next-line
  ITEM("chemical-science-pack", "tool"):set("icon_size", 32)
end
