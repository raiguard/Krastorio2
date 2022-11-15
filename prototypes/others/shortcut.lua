data:extend({
  {
    type = "shortcut",
    name = "kr-creep-collector",
    icon = {
      filename = "__Krastorio2Assets__/gui/buttons/creep-collector.png",
      size = 64,
      mipmap_count = 4,
      flags = { "gui-icon" },
    },
    action = "spawn-item",
    item_to_spawn = "kr-creep-collector",
    associated_control_input = "kr-creep-collector",
  },
  {
    type = "shortcut",
    name = "kr-jackhammer",
    icon = {
      filename = "__Krastorio2Assets__/gui/buttons/jackhammer.png",
      size = 64,
      mipmap_count = 4,
      flags = { "gui-icon" },
    },
    action = "spawn-item",
    item_to_spawn = "kr-jackhammer",
    associated_control_input = "kr-jackhammer",
    technology_to_unlock = "concrete",
  },
})
