data:extend({
  {
    type = "recipe",
    name = "electronic-components-with-lithium",
    icon = "__Krastorio2Assets__/icons/recipes/electronic-components-with-lithium.png",
    category = "advanced-chemistry",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "silicon", amount = 3 },
      { type = "item", name = "plastic-bar", amount = 3 },
      { type = "item", name = "glass", amount = 3 },
      { type = "item", name = "lithium", amount = 3 },
      { type = "fluid", name = "nitric-acid", amount = 20 },
    },
    results = { { type = "item", name = "electronic-components", amount = 10 } },
    allow_productivity = true,
  },
})
