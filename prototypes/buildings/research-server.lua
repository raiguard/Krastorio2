local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local pipe_pictures = {
  north = {
    filename = "__Krastorio2Assets__/buildings/research-server/research-server-k-pipe-N.png",
    priority = "extra-high",
    width = 71,
    height = 38,
    shift = util.by_pixel(2.25, 13.5),
    scale = 0.5,
  },
  east = {
    filename = "__Krastorio2Assets__/buildings/research-server/research-server-k-pipe-E.png",
    priority = "extra-high",
    width = 42,
    height = 76,
    shift = util.by_pixel(-24.5, 1),
    scale = 0.5,
  },
  south = {
    filename = "__Krastorio2Assets__/buildings/research-server/research-server-k-pipe-S.png",
    priority = "extra-high",
    width = 88,
    height = 61,
    shift = util.by_pixel(0, -31.25),
    scale = 0.5,
  },
  west = {
    filename = "__Krastorio2Assets__/buildings/research-server/research-server-k-pipe-W.png",
    priority = "extra-high",
    width = 39,
    height = 73,
    shift = util.by_pixel(25.75, 1.25),
    scale = 0.5,
  },
}

data:extend({
  {
    type = "recipe",
    name = "kr-research-server",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-beam", amount = 4 },
      { type = "item", name = "advanced-circuit", amount = 5 },
      { type = "item", name = "electronic-components", amount = 50 },
    },
    results = { { type = "item", name = "kr-research-server", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-research-server",
    icon = "__Krastorio2Assets__/icons/entities/research-server.png",
    subgroup = "production-machine",
    order = "f3[research-servers]-a1[research-server]",
    place_result = "kr-research-server",
    stack_size = 50,
  },
  {
    type = "assembling-machine",
    name = "kr-research-server",
    icon = "__Krastorio2Assets__/icons/entities/research-server.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "kr-research-server" },
    collision_box = { { -1.25, -1.25 }, { 1.25, 1.25 } },
    selection_box = { { -1.4, -1.4 }, { 1.4, 1.4 } },
    crafting_categories = { "research-data", "t2-tech-cards" },
    crafting_speed = 1,
    ingredient_count = 6,
    module_slots = 2,
    allowed_effects = { "consumption", "speed", "productivity", "pollution" },
    fluid_boxes = {
      {
        production_type = "input",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.north, position = { 0, -1 } } },
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "output",
        pipe_picture = pipe_pictures,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = { { flow_direction = "output", direction = defines.direction.south, position = { 0, 1 } } },
        secondary_draw_orders = { north = -1 },
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 0.5 },
    },
    energy_usage = "250kW",
    max_health = 250,
    corpse = "medium-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      { type = "physical", percent = 20 },
      { type = "fire", percent = 20 },
    },
    open_sound = { filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1 },
    close_sound = { filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1 },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        {
          filename = "__Krastorio2Assets__/sounds/buildings/small-research-server.ogg",
          volume = 0.75,
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
    },
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__Krastorio2Assets__/buildings/research-server/research-server.png",
            priority = "high",
            width = 256,
            height = 256,
            shift = { 0., -0.2 },
            frame_count = 60,
            line_length = 15,
            animation_speed = 0.9,
            scale = 0.5,
          },
          {
            filename = "__Krastorio2Assets__/buildings/research-server/research-server-shadow.png",
            priority = "high",
            width = 256,
            height = 256,
            draw_as_shadow = true,
            shift = { 0., -0.2 },
            repeat_count = 60,
            animation_speed = 0.9,
            scale = 0.5,
          },
        },
      },
      working_visualisations = {
        {
          animation = {
            filename = "__Krastorio2Assets__/buildings/research-server/research-server-light.png",
            priority = "extra-high",
            width = 256,
            height = 256,
            shift = { 0., -0.2 },
            draw_as_light = true,
            frame_count = 60,
            line_length = 15,
            animation_speed = 0.9,
            scale = 0.5,
          },
        },
        {
          light = {
            intensity = 0.25,
            size = 1,
            shift = { 0.0, 0.0 },
            color = { r = 0.1, g = 0.5, b = 1 },
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = "__Krastorio2Assets__/buildings/research-server/research-server-reflection.png",
          priority = "extra-high",
          width = 40,
          height = 40,
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
