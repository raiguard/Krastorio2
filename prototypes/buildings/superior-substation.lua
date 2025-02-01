local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-superior-substation",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "imersium-beam", amount = 3 },
      { type = "item", name = "rare-metals", amount = 6 },
      { type = "item", name = "substation", amount = 1 },
      { type = "item", name = "processing-unit", amount = 2 },
      { type = "item", name = "small-lamp", amount = 2 },
    },
    results = { { type = "item", name = "kr-superior-substation", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-superior-substation",
    icon = "__Krastorio2Assets__/icons/entities/superior-substation.png",
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-e[substation-mk2]",
    place_result = "kr-superior-substation",
    stack_size = 50,
  },
  {
    type = "electric-pole",
    name = "kr-superior-substation",
    icon = "__Krastorio2Assets__/icons/entities/superior-substation.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.1, result = "kr-superior-substation" },
    max_health = 250,
    corpse = "substation-remnants",
    dying_explosion = "substation-explosion",
    fast_replaceable_group = "substation",
    track_coverage_during_build_by_moving = true,
    resistances = { { type = "fire", percent = 90 } },
    collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    drawing_box_vertical_extension = 2,
    damaged_trigger_effect = hit_effects.entity({ { -0.5, -2.5 }, { 0.5, 0.5 } }),
    maximum_wire_distance = 24.25,
    supply_area_distance = 12,
    working_sound = {
      sound = { filename = "__base__/sound/substation.ogg", volume = 0.7 },
      max_sounds_per_prototype = 3,
      audible_distance_modifier = 0.7,
      fade_in_ticks = 30,
      fade_out_ticks = 40,
      use_doppler_shift = false,
    },
    vehicle_impact_sound = sounds.generic_impact,
    connection_points = {
      {
        shadow = { copper = util.by_pixel(136, 8), green = util.by_pixel(124, 8), red = util.by_pixel(151, 9) },
        wire = { copper = util.by_pixel(0, -86), green = util.by_pixel(-21, -82), red = util.by_pixel(22, -81) },
      },
      {
        shadow = { copper = util.by_pixel(133, 9), green = util.by_pixel(144, 21), red = util.by_pixel(110, -3) },
        wire = { copper = util.by_pixel(0, -85), green = util.by_pixel(15, -70), red = util.by_pixel(-15, -92) },
      },
      {
        shadow = { copper = util.by_pixel(133, 9), green = util.by_pixel(127, 26), red = util.by_pixel(127, -8) },
        wire = { copper = util.by_pixel(0, -85), green = util.by_pixel(0, -66), red = util.by_pixel(0, -97) },
      },
      {
        shadow = { copper = util.by_pixel(133, 9), green = util.by_pixel(111, 20), red = util.by_pixel(144, -3) },
        wire = { copper = util.by_pixel(0, -86), green = util.by_pixel(-15, -71), red = util.by_pixel(15, -92) },
      },
    },
    pictures = {
      layers = {

        {
          filename = "__Krastorio2Assets__/buildings/superior-substation/superior-substation.png",
          priority = "high",
          width = 138,
          height = 270,
          direction_count = 4,
          shift = util.by_pixel(0, 1 - 32),
          scale = 0.5,
        },
        {
          filename = "__base__/graphics/entity/substation/substation-shadow.png",
          priority = "high",
          width = 370,
          height = 104,
          direction_count = 4,
          shift = util.by_pixel(62, 42 - 32),
          draw_as_shadow = true,
          scale = 0.5,
        },
      },
    },
    -- TODO: Make this a separate lamp entity so it will consume power and turn on/off
    active_picture = {
      filename = "__Krastorio2Assets__/buildings/superior-substation/superior-substation-light.png",
      priority = "high",
      width = 92,
      height = 156,
      --direction_count = 4,
      shift = util.by_pixel(0.5, 16.5 - 32),
      blend_mode = "additive",
      scale = 0.5,
    },
    light = { intensity = 0.9, size = 65, color = { 1, 1, 0.75 } },
    radius_visualisation_picture = {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale",
    },
    water_reflection = {
      pictures = {
        filename = "__base__/graphics/entity/substation/substation-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 28,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },
  },
})

data.raw["electric-pole"]["substation"].fast_replaceable_group = "substation"
data.raw["electric-pole"]["substation"].next_upgrade = "kr-superior-substation"
