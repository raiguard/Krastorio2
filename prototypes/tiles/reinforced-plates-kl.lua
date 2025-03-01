-- This file exists for legacy purposes only.
-- TODO: Make this a separate mod?
--- @diagnostic disable

if not settings.startup["kr-kl-stuff"].value then
  return
end

local data_util = require("data-util")

local stack_size = 100

if stack_size > 100 then
  stack_size = settings.startup["kr-stack-size"].value
end

data:extend({
  {
    type = "item",
    name = "kr-black-reinforced-plate-l",
    icon = "__Krastorio2Assets__/icons/items/black-reinforced-plate-kl.png",
    subgroup = "terrain",
    order = "z[black-reinforced-plate]-a1[black-reinforced-plate]",
    place_as_tile = {
      results = { { type = "item", name = "kr-black-reinforced-plate-l", amount = 1 } },
      condition_size = 1,
      condition = { layers = { water_tile = true } },
    },
    stack_size = stack_size,
  },
  {
    type = "item",
    name = "kr-white-reinforced-plate-l",
    icon = "__Krastorio2Assets__/icons/items/white-reinforced-plate-kl.png",
    subgroup = "terrain",
    order = "z[white-reinforced-plate]-a2[white-reinforced-plate]",
    place_as_tile = {
      results = { { type = "item", name = "kr-white-reinforced-plate-l", amount = 1 } },
      condition_size = 1,
      condition = { layers = { water_tile = true } },
    },
    stack_size = stack_size,
  },

  {
    type = "recipe",
    name = "kr-black-reinforced-plate-l",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "refined-concrete", amount = 20 },
      { type = "item", name = "steel-beam", amount = 5 },
    },
    results = { { type = "item", name = "kr-black-reinforced-plate-l", amount = 10 } },
  },
  {
    type = "recipe",
    name = "kr-white-reinforced-plate-l",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "refined-concrete", amount = 20 },
      { type = "item", name = "steel-beam", amount = 5 },
    },
    results = { { type = "item", name = "kr-white-reinforced-plate-l", amount = 10 } },
  },

  {
    type = "tile",
    name = "kr-white-reinforced-plate-l",
    needs_correction = false,
    minables = {
      { type = "item", name = { mining_time = 0.05, result = "kr-white-reinforced-plate-l" }, amount = 1 },
    },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = { layers = { ground_tile = true } },
    walking_speed_modifier = 1.75,
    layer = 80,
    transition_overlay_layer_offset = 5,
    decorative_removal_probability = 1,
    variants = {
      main = {
        {
          picture = "__Krastorio2Assets__/tiles/reinforced-plates-kl/reinforced-plate.png",
          count = 16,
          scale = 0.5,
          size = 4,
        },
        {
          picture = "__Krastorio2Assets__/tiles/reinforced-plates-kl/reinforced-plate.png",
          count = 16,
          scale = 0.5,
          size = 1,
        },
      },
      transition = {
        overlay_layout = {
          inner_corner = {
            spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates-kl/plate-inner-corner.png",
            count = 4,
            tall = true,
            scale = 0.5,
          },
          outer_corner = {
            spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates-kl/plate-outer-corner.png",
            count = 4,
            tall = true,
            scale = 0.5,
          },
          side = {
            spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates-kl/plate-side.png",
            count = 16,
            tall = true,
            scale = 0.5,
          },
          u_transition = {
            spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates-kl/plate-u.png",
            count = 2,
            tall = true,
            scale = 0.5,
          },
          o_transition = {
            spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates-kl/plate-o.png",
            count = 2,
            scale = 0.5,
          },
        },
      },
    },
    walking_sound = {
      {
        filename = "__base__/sound/walking/concrete-1.ogg",
        volume = 1.0,
      },
      {
        filename = "__base__/sound/walking/concrete-2.ogg",
        volume = 1.0,
      },
      {
        filename = "__base__/sound/walking/concrete-3.ogg",
        volume = 1.0,
      },
      {
        filename = "__base__/sound/walking/concrete-4.ogg",
        volume = 1.0,
      },
    },
    map_color = { r = 175, g = 175, b = 175 },
    vehicle_friction_modifier = 0.8,
  },

  {
    type = "tile",
    name = "kr-black-reinforced-plate-l",
    needs_correction = false,
    minables = {
      { type = "item", name = { mining_time = 0.05, result = "kr-black-reinforced-plate-l" }, amount = 1 },
    },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = { layers = { ground_tile = true } },
    walking_speed_modifier = 1.75,
    layer = 85,
    transition_overlay_layer_offset = 6,
    decorative_removal_probability = 1,
    variants = {
      main = {
        {
          picture = "__Krastorio2Assets__/tiles/reinforced-plates-kl/black-reinforced-plate.png",
          count = 16,
          scale = 0.5,
          size = 4,
        },
        {
          picture = "__Krastorio2Assets__/tiles/reinforced-plates-kl/black-reinforced-plate.png",
          count = 16,
          scale = 0.5,
          size = 1,
        },
      },
      overlay_layout = {
        inner_corner = {
          spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates-kl/plate-inner-corner.png",
          count = 4,
          tall = true,
          scale = 0.5,
        },
        outer_corner = {
          spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates-kl/plate-outer-corner.png",
          count = 4,
          tall = true,
          scale = 0.5,
        },
        side = {
          spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates-kl/plate-side.png",
          count = 16,
          tall = true,
          scale = 0.5,
        },
        u_transition = {
          spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates-kl/plate-u.png",
          count = 2,
          tall = true,
          scale = 0.5,
        },
        o_transition = {
          spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates-kl/plate-o.png",
          count = 2,
          scale = 0.5,
        },
      },
    },
    walking_sound = {
      {
        filename = "__base__/sound/walking/concrete-1.ogg",
        volume = 1.0,
      },
      {
        filename = "__base__/sound/walking/concrete-2.ogg",
        volume = 1.0,
      },
      {
        filename = "__base__/sound/walking/concrete-3.ogg",
        volume = 1.0,
      },
      {
        filename = "__base__/sound/walking/concrete-4.ogg",
        volume = 1.0,
      },
    },
    map_color = { r = 50, g = 50, b = 50 },
    vehicle_friction_modifier = 0.8,
  },
})

data_util.add_recipe_unlock("kr-reinforced-plates", "kr-black-reinforced-plate-l")
data_util.add_recipe_unlock("kr-reinforced-plates", "kr-white-reinforced-plate-l")
