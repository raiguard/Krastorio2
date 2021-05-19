return {
  {
    type = "recipe",
    name = "coke-liquefaction",
    category = "oil-processing",
    icon = kr_recipes_icons_path .. "coke-liquefaction.png",
    icon_size = 64,
    enabled = false,
    energy_required = 5,
    ingredients = {
      { type = "item", name = "coke", amount = 10 },
      { type = "fluid", name = "light-oil", amount = 25 },
      { type = "fluid", name = "steam", amount = 50 },
    },
    results = {
      { type = "fluid", name = "light-oil", amount = 90 },
      { type = "fluid", name = "heavy-oil", amount = 20 },
      { type = "fluid", name = "petroleum-gas", amount = 10 },
    },

    subgroup = "fluid-recipes",
    order = "a[oil-processing]-d[coke-liquefaction]",
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
    allow_decomposition = false,
  },
}
