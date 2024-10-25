data:extend({
  {
    type = "recipe",
    name = "kr-grow-wood-with-water",
    enabled = false,
    category = "growing",
    energy_required = 60,
    ingredients = {
      { type = "fluid", name = "water", amount = 200 },
    },
    results = {
      { type = "item", name = "wood", amount = 40 },
    },
  },
  {
    type = "recipe",
    name = "kr-grow-wood-plus",
    icon = "__Krastorio2Assets__/icons/recipes/wood-plus.png",
    enabled = false,
    category = "growing",
    energy_required = 60,
    ingredients = {
      { type = "fluid", name = "water", amount = 200 },
      { type = "item", name = "fertilizer", amount = 1 },
    },
    results = {
      { type = "item", name = "wood", amount = 80 },
    },
  },
})
