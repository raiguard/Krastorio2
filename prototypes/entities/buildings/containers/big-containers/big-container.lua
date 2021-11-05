local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local kr_icons_size = false

if krastorio.general.getSafeSettingValue("kr-large-icons") then
  kr_icons_size = true
end

circuit_connector_definitions["kr-big-container"] = circuit_connector_definitions.create(universal_connector_template, {
  {
    variation = 26,
    main_offset = util.by_pixel(0.5, -2.6),
    shadow_offset = util.by_pixel(3.5, 0),
    show_shadow = true,
  },
})

local _medium_containers = "containers/big-containers/"
local _specific = "big-container/"
local _icon_path = kr_entities_icons_path .. _medium_containers
local _sprites_path = kr_entities_path .. _medium_containers .. _specific

if krastorio.general.getSafeSettingValue("kr-containers") then
  data:extend({
    {
      type = "container",
      name = "kr-big-container",
      icon = _icon_path .. "big-container.png",
      icon_size = 64,
      icon_mipmaps = 4,
      flags = { "placeable-player", "player-creation", "not-rotatable" },
      minable = { mining_time = 1, result = "kr-big-container" },
      max_health = 1500,
      corpse = "kr-big-random-pipes-remnant",
      collision_box = { { -2.75, -2.75 }, { 2.75, 2.75 } },
      selection_box = { { -3, -3 }, { 3, 3 } },
      damaged_trigger_effect = hit_effects.entity(),
      resistances = {
        { type = "physical", percent = 50 },
        { type = "fire", percent = 75 },
        { type = "impact", percent = 75 },
      },
      fast_replaceable_group = "container",
      inventory_size = 500,
      scale_info_icons = kr_icons_size,
      vehicle_impact_sound = sounds.generic_impact,
      opened_duration = logistic_chest_opened_duration,
      picture = {
        filename = _sprites_path .. "big-container.png",
        priority = "extra-high",
        width = 213,
        height = 213,
        scale = 1.2,
        hr_version = {
          filename = _sprites_path .. "hr-big-container.png",
          priority = "extra-high",
          width = 512,
          height = 512,
          scale = 0.5,
        },
      },

      water_reflection = {
        pictures = {
          filename = kr_entities_path .. "containers/big-containers/big-container-reflection.png",
          priority = "extra-high",
          width = 60,
          height = 50,
          shift = util.by_pixel(0, 40),
          variation_count = 1,
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },

      circuit_wire_connection_point = circuit_connector_definitions["kr-big-container"].points,
      circuit_connector_sprites = circuit_connector_definitions["kr-big-container"].sprites,
      circuit_wire_max_distance = 20,
      open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
      close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    },
  })
end
