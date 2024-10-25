data:extend({
  {
    type = "recipe",
    name = "kr-superior-underground-belt",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-advanced-underground-belt", amount = 2 },
      { type = "item", name = "kr-superior-transport-belt", amount = 40 },
    },
    results = { { type = "item", name = "kr-superior-underground-belt", amount = 2 } },
  },
  {
    type = "item",
    name = "kr-superior-underground-belt",
    icon = "__Krastorio2Assets__/icons/entities/superior-underground-belt.png",
    subgroup = "belt",
    order = "b[underground-belt]-e[superior-underground-belt]",
    place_result = "kr-superior-underground-belt",
    stack_size = 50,
  },
  {
    type = "underground-belt",
    name = "kr-superior-underground-belt",
    icon = "__Krastorio2Assets__/icons/entities/superior-underground-belt.png",
    flags = { "placeable-neutral", "player-creation" },
    fast_replaceable_group = "transport-belt",
    minable = { mining_time = 0.2, result = "kr-superior-underground-belt" },
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    speed = 0.1875,
    max_distance = 40,
    max_health = 200,
    corpse = "kr-superior-underground-belt-remnant",
    resistances = {
      {
        type = "fire",
        percent = 50,
      },
      {
        type = "impact",
        percent = 30,
      },
    },
    belt_animation_set = require("prototypes.buildings.superior-belt-animation-set"),
    structure = {
      direction_in = {
        sheet = {
          filename = "__Krastorio2Assets__/buildings/superior-underground-belt/superior-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5,
        },
      },
      direction_out = {
        sheet = {
          filename = "__Krastorio2Assets__/buildings/superior-underground-belt/superior-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5,
        },
      },
      direction_in_side_loading = {
        sheet = {
          filename = "__Krastorio2Assets__/buildings/superior-underground-belt/superior-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192 * 3,
          scale = 0.5,
        },
      },
      direction_out_side_loading = {
        sheet = {
          filename = "__Krastorio2Assets__/buildings/superior-underground-belt/superior-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192 * 2,
          scale = 0.5,
        },
      },
      back_patch = {
        sheet = {
          filename = "__Krastorio2Assets__/buildings/superior-underground-belt/superior-underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5,
        },
      },
      front_patch = {
        sheet = {
          filename = "__Krastorio2Assets__/buildings/superior-underground-belt/superior-underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5,
        },
      },
    },
    underground_sprite = {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5,
    },
    underground_remove_belts_sprite = {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5,
    },
    animation_speed_coefficient = 30,
  },
})
