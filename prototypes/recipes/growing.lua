-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "growing"
return {
  {
    type = "recipe",
    name = "kr-grow-wood-with-water",
    category = "growing",
    energy_required = 60,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "water", amount = 200 },
    },
    results = { { type = "item", name = "wood", amount = 40 } },
  },
  {
    type = "recipe",
    name = "kr-grow-wood-plus",
    category = "growing",
    icon = "__Krastorio2Assets__/icons/recipes/wood-plus.png",
    icon_size = 64,
    energy_required = 60,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "water", amount = 200 },
      { type = "item", name = "fertilizer", amount = 1 },
    },
    results = { { type = "item", name = "wood", amount = 80 } },
  },
}
