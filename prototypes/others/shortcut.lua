data:extend({
  {
    type = "shortcut",
    name = "kr-creep-collector",
    icon = { filename = "__Krastorio2Assets__/icons/items/creep-collector.png", size = 64, mipmap_count = 4 },
    action = "spawn-item",
    item_to_spawn = "kr-creep-collector",
    associated_control_input = "kr-creep-collector",
  },
  {
    type = "shortcut",
    name = "kr-jackhammer",
    icon = { filename = "__Krastorio2Assets__/icons/items/jackhammer.png", size = 64, mipmap_count = 4 },
    action = "spawn-item",
    item_to_spawn = "kr-jackhammer",
    associated_control_input = "kr-jackhammer",
    technology_to_unlock = "concrete",
  },
})
