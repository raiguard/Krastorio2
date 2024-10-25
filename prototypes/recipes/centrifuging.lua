data:extend({
  {
    type = "recipe",
    name = "tritium",
    category = "centrifuging",
    energy_required = 30,
    enabled = false,
    always_show_made_in = true,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "lithium", amount = 30 },
      { type = "item", name = "rare-metals", amount = 5 },
      { type = "item", name = "uranium-235", amount = 1 },
    },
    results = { { type = "item", name = "tritium", amount = 5 } },
  },
})
