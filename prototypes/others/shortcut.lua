local data_util = require("__flib__.data-util")

data:extend{
  {
    type = "shortcut",
    name = "kr-creep-collector",
    icon = {filename = data_util.empty_image, size = 1},
    action = "spawn-item",
    item_to_spawn = "kr-creep-collector",
    associated_control_input = "kr-creep-collector",
  },
  {
    type = "shortcut",
    name = "kr-jackhammer",
    icon = {filename = data_util.empty_image, size = 1},
    action = "spawn-item",
    item_to_spawn = "kr-jackhammer",
    associated_control_input = "kr-jackhammer",
  },
}
