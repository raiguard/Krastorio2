data:extend({
  {
    type = "item",
    name = "kr-creep",
    icon = "__Krastorio2Assets__/icons/items/biomass.png",
    subgroup = "terrain",
    order = "z[creep]-z[creep]",
    hidden = true,
    stack_size = 200,
    place_as_tile = {
      result = "kr-creep",
      condition_size = 1,
      condition = { layers = { water_tile = true } },
    },
    pictures = {
      {
        filename = "__Krastorio2Assets__/icons/items/biomass.png",
        size = 64,
        scale = 0.25,
      },
      {
        filename = "__Krastorio2Assets__/icons/items/biomass-1.png",
        size = 64,
        scale = 0.25,
      },
      {
        filename = "__Krastorio2Assets__/icons/items/biomass-2.png",
        size = 64,
        scale = 0.25,
      },
      {
        filename = "__Krastorio2Assets__/icons/items/biomass-3.png",
        size = 64,
        scale = 0.25,
      },
    },
  },
  {
    type = "item",
    name = "kr-black-reinforced-plate",
    icon = "__Krastorio2Assets__/icons/items/black-reinforced-plate.png",
    subgroup = "terrain",
    order = "z[black-reinforced-plate]-a1[black-reinforced-plate]",
    stack_size = 200,
    place_as_tile = {
      result = "kr-black-reinforced-plate",
      condition_size = 1,
      condition = { layers = { water_tile = true } },
    },
  },
  {
    type = "item",
    name = "kr-white-reinforced-plate",
    icon = "__Krastorio2Assets__/icons/items/white-reinforced-plate.png",
    subgroup = "terrain",
    order = "z[white-reinforced-plate]-a2[white-reinforced-plate]",
    stack_size = 200,
    place_as_tile = {
      result = "kr-white-reinforced-plate",
      condition_size = 1,
      condition = { layers = { water_tile = true } },
    },
  },
})
