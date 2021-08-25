-- Adding a key to change inserter vectors (only belt lane)
data:extend({
  {
    type = "custom-input",
    name = "kr-inserter-change-lane",
    key_sequence = "SHIFT + L",
  },
  {
    type = "custom-input",
    name = "kr-change-roboport-state",
    key_sequence = "SHIFT + M",
  },
  {
    type = "custom-input",
    name = "kr-linked-focus-search",
    key_sequence = "",
    linked_game_control = "focus-search",
  },
  {
    type = "custom-input",
    name = "kr-creep-collector",
    key_sequence = "ALT + C",
    action = "spawn-item",
    item_to_spawn = "kr-creep-collector",
  },
  {
    type = "custom-input",
    name = "kr-jackhammer",
    key_sequence = "ALT + J",
    action = "spawn-item",
    item_to_spawn = "kr-jackhammer",
  },
})
