-- Adding a key to change inserter vectors (only belt lane)
data:extend({
  {
    type = "custom-input",
    name = "kr-inserter-change-lane",
    key_sequence = "SHIFT + L",
    consuming = "game-only",
  },
  {
    type = "custom-input",
    name = "kr-change-roboport-state",
    key_sequence = "SHIFT + M",
    consuming = "game-only",
  },
  {
    type = "custom-input",
    name = "kr-focus-search",
    key_sequence = "",
    linked_game_control = "focus-search",
  },
})
