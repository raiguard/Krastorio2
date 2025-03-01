data:extend({
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
