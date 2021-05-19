local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
  {
    type = "solar-panel",
    name = "kr-advanced-solar-panel",
    icon = kr_entities_icons_path .. "advanced-solar-panel.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.5, result = "kr-advanced-solar-panel" },
    max_health = 300,
    fast_replaceable_group = "solar-panel",
    corpse = "solar-panel-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = { { -1.75, -1.75 }, { 1.75, 1.75 } },
    selection_box = { { -2, -2 }, { 2, 2 } },
    damaged_trigger_effect = hit_effects.entity(),
    energy_source = {
      type = "electric",
      usage_priority = "solar",
    },
    picture = {
      layers = {
        {

          filename = kr_entities_path .. "advanced-solar-panel/advanced-solar-panel-light.png",
          priority = "high",
          width = 140,
          height = 140,
          shift = { 0.1, 0.1 },
          draw_as_light = true,
          hr_version = {
            filename = kr_entities_path .. "advanced-solar-panel/hr-advanced-solar-panel-light.png",
            priority = "high",
            width = 280,
            height = 280,
            shift = { 0.1, 0.1 },
            draw_as_light = true,
            scale = 0.5,
          },
        },
        {
          filename = kr_entities_path .. "advanced-solar-panel/advanced-solar-panel.png",
          priority = "high",
          width = 140,
          height = 140,
          shift = { 0.1, 0.1 },
          hr_version = {
            filename = kr_entities_path .. "advanced-solar-panel/hr-advanced-solar-panel.png",
            priority = "high",
            width = 280,
            height = 280,
            shift = { 0.1, 0.1 },
            scale = 0.5,
          },
        },
        {
          filename = kr_entities_path .. "advanced-solar-panel/advanced-solar-panel-sh.png",
          priority = "high",
          width = 140,
          height = 140,
          shift = { 0.1, 0.1 },
          draw_as_shadow = true,
          hr_version = {
            filename = kr_entities_path .. "advanced-solar-panel/hr-advanced-solar-panel-sh.png",
            priority = "high",
            width = 280,
            height = 280,
            shift = { 0.1, 0.1 },
            draw_as_shadow = true,
            scale = 0.5,
          },
        },
      },
    },
    overlay = {
      layers = {
        {
          filename = kr_entities_path .. "advanced-solar-panel/advanced-solar-panel-sh-ov.png",
          priority = "high",
          width = 140,
          height = 140,
          shift = { 0.1, 0.1 },
          hr_version = {
            filename = kr_entities_path .. "advanced-solar-panel/hr-advanced-solar-panel-sh-ov.png",
            priority = "high",
            width = 280,
            height = 280,
            shift = { 0.1, 0.1 },
            scale = 0.5,
          },
        },
      },
    },
    vehicle_impact_sound = sounds.generic_impact,
    production = "250kW",
  },
})
