local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-flare-stack",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-beam", amount = 10 },
      { type = "item", name = "steel-plate", amount = 20 },
      { type = "item", name = "electronic-circuit", amount = 3 },
    },
    results = { { type = "item", name = "kr-flare-stack", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-flare-stack",
    icon = "__Krastorio2Assets__/icons/entities/flare-stack.png",
    subgroup = "production-machine",
    order = "e-d1[flare-stack]",
    place_result = "kr-flare-stack",
    stack_size = 50,
  },
  {
    type = "furnace",
    name = "kr-flare-stack",
    icon = "__Krastorio2Assets__/icons/entities/flare-stack.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "kr-flare-stack" },
    max_health = 250,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 95 },
    },
    fluid_boxes = {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        pipe_picture = require("prototypes.entities.pipe-picture"),
        volume = 500,
        pipe_connections = {
          { flow_direction = "input", direction = defines.direction.south, position = { 0.5, 0.5 } },
        },
      },
    },
    collision_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    crafting_categories = { "fuel-burning" },
    crafting_speed = 1.0,
    source_inventory_size = 1,
    result_inventory_size = 1,
    module_slots = 1,
    allowed_effects = { "speed", "pollution", "consumption" },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 5 },
    },
    energy_usage = "0.1MW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/flare-stack.ogg",
        volume = 1,
      },
      idle_sound = {
        filename = "__base__/sound/idle1.ogg",
        volume = 1,
      },
      apparent_volume = 1,
    },
    graphics_set = {
      animation = {
        north = {
          layers = {
            {
              filename = "__Krastorio2Assets__/entities/flare-stack/flare-stack-n.png",
              width = 150,
              height = 300,
              scale = 0.5,
              frame_count = 1,
              shift = { 0, -1 },
            },
            {
              filename = "__Krastorio2Assets__/entities/flare-stack/flare-stack-sh.png",
              priority = "high",
              width = 258,
              height = 94,
              shift = { 1.1, 0.25 },
              frame_count = 1,
              draw_as_shadow = true,
              scale = 0.5,
            },
          },
        },
        east = {
          layers = {
            {
              filename = "__Krastorio2Assets__/entities/flare-stack/flare-stack-e.png",
              width = 150,
              height = 300,
              scale = 0.5,
              frame_count = 1,
              shift = { 0, -1 },
            },
            {
              filename = "__Krastorio2Assets__/entities/flare-stack/flare-stack-sh.png",
              priority = "high",
              width = 258,
              height = 94,
              shift = { 1.1, 0.25 },
              frame_count = 1,
              draw_as_shadow = true,
              scale = 0.5,
            },
          },
        },
        south = {
          layers = {
            {
              filename = "__Krastorio2Assets__/entities/flare-stack/flare-stack-s.png",
              width = 150,
              height = 300,
              scale = 0.5,
              frame_count = 1,
              shift = { 0, -1 },
            },
            {
              filename = "__Krastorio2Assets__/entities/flare-stack/flare-stack-sh.png",
              priority = "high",
              width = 258,
              height = 94,
              shift = { 1.1, 0.25 },
              frame_count = 1,
              draw_as_shadow = true,
              scale = 0.5,
            },
          },
        },
        west = {
          layers = {
            {
              filename = "__Krastorio2Assets__/entities/flare-stack/flare-stack-w.png",
              width = 150,
              height = 300,
              scale = 0.5,
              frame_count = 1,
              shift = { 0, -1 },
            },
            {
              filename = "__Krastorio2Assets__/entities/flare-stack/flare-stack-sh.png",
              priority = "high",
              width = 258,
              height = 94,
              shift = { 1.1, 0.25 },
              frame_count = 1,
              draw_as_shadow = true,
              scale = 0.5,
            },
          },
        },
      },
      working_visualisations = {
        {
          apply_recipe_tint = "quaternary",
          fadeout = true,
          animation = {
            filename = "__Krastorio2Assets__/entities/flare-stack/flare-stack-fire.png",
            line_length = 10,
            width = 40,
            height = 81,
            frame_count = 60,
            animation_speed = 0.75,
            scale = 0.50,
            shift = { 0, -3.25 },
          },
        },
        {
          light = {
            intensity = 0.75,
            size = 25,
            shift = { 0, 0 },
            color = { r = 1, g = 0.95, b = 0.75 },
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = "__Krastorio2Assets__/entities/flare-stack/flare-stack-reflection.png",
          priority = "extra-high",
          width = 20,
          height = 30,
          shift = util.by_pixel(0, 40),
          variation_count = 1,
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },
    },
  },
})
