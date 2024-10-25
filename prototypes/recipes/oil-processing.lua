data:extend({
  {
    type = "recipe",
    name = "coke-liquefaction",
    icon = "__Krastorio2Assets__/icons/recipes/coke-liquefaction.png",
    subgroup = "fluid-recipes",
    order = "a[oil-processing]-d[coke-liquefaction]",
    enabled = false,
    category = "oil-processing",
    energy_required = 5,
    ingredients = {
      { type = "item", name = "coke", amount = 10 },
      { type = "fluid", name = "light-oil", amount = 25 },
      { type = "fluid", name = "steam", amount = 50 },
    },
    results = {
      { type = "fluid", name = "heavy-oil", amount = 20 },
      { type = "fluid", name = "light-oil", amount = 90 },
      { type = "fluid", name = "petroleum-gas", amount = 10 },
    },
    allow_decomposition = false,
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
  },
})
