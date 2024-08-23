if krastorio.general.getSafeSettingValue("kr-main-menu-song") then
  data:extend({
    -- Main Menu
    {
      type = "ambient-sound",
      name = "K2-main-menu",
      track_type = "menu-track",
      sound = {
        filename = "__Krastorio2Assets__/sounds/ambient/K2-main-menu.ogg",
        volume = 0.6,
      },
    },
    -- Ambient
    {
      type = "ambient-sound",
      name = "K2-ambient",
      track_type = "main-track",
      sound = {
        filename = "__Krastorio2Assets__/sounds/ambient/K2-main-menu.ogg",
        volume = 0.5,
      },
    },
  })

  -- Remove default menu song
  data.raw["ambient-sound"]["main-menu"] = nil
end

data:extend({
  -- -- Scripts
  {
    type = "sound",
    name = "kr-radioactive",
    category = "alert",
    filename = "__Krastorio2Assets__/sounds/others/radioactivity.ogg",
    volume = 0.75,
    audible_distance_modifier = 1000,
    aggregation = {
      max_count = 1,
      remove = true,
      count_already_playing = true,
    },
  },
  {
    type = "sound",
    name = "kr-welding",
    category = "alert",
    filename = "__Krastorio2Assets__/sounds/others/welding.ogg",
    volume = 0.75,
    audible_distance_modifier = 0.5,
    aggregation = {
      max_count = 1,
      remove = true,
      count_already_playing = true,
    },
  },
  {
    type = "sound",
    name = "kr-collect-creep",
    category = "alert",
    filename = "__Krastorio2Assets__/sounds/tiles/creep-deconstruction.ogg",
    volume = 0.75,
    audible_distance_modifier = 0.5,
    aggregation = {
      max_count = 1,
      remove = false,
      count_already_playing = true,
    },
  },
  {
    type = "sound",
    name = "kr-jackhammer",
    category = "alert",
    filename = "__Krastorio2Assets__/sounds/others/jackhammer.ogg",
    volume = 0.75,
    audible_distance_modifier = 0.5,
    aggregation = {
      max_count = 1,
      remove = false,
      count_already_playing = true,
    },
  },
  --[[
  {
    type     = "sound",
    name     = "kr-intergalactic-transceiver-win-wave",
    category = "alert",
    filename = "__Krastorio2Assets__/sounds/others/intergalactic-transceiver-win-wave.ogg",
    volume   = 0.75,
    audible_distance_modifier = 0.5,
    aggregation =
    {
      max_count             = 1,
      remove                = true,
      count_already_playing = true
    }
  },
  --]]
  {
    type = "sound",
    name = "kr-win-joke-voice",
    category = "alert",
    filename = "__Krastorio2Assets__/sounds/others/win-joke-voice.ogg",
    volume = 1.5,
    audible_distance_modifier = 1000,
    aggregation = {
      max_count = 1,
      remove = true,
      count_already_playing = true,
    },
  },
  {
    type = "sound",
    name = "kr-planetary-teleporter-effect-sound",
    category = "alert",
    filename = "__Krastorio2Assets__/sounds/others/planetary-teleporter-effect-sound.ogg",
    volume = 2.0,
    audible_distance_modifier = 2.0,
    aggregation = {
      max_count = 2,
      remove = true,
      count_already_playing = true,
    },
  },
  {
    type = "sound",
    name = "kr-intergalactic-transceiver-discharging-warning",
    category = "alert",
    filename = "__Krastorio2Assets__/sounds/others/alert-discharging.ogg",
    volume = 1.0,
    audible_distance_modifier = 1000,
    aggregation = {
      max_count = 1,
      remove = false,
      count_already_playing = true,
    },
  },
})
