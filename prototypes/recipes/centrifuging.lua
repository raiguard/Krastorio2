-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "centrifuging"
return {
  {
    type = "recipe",
    name = "tritium",
    category = "centrifuging",
    energy_required = 30,
    enabled = false,
    always_show_made_in = true,
    allow_productivity = true,
    ingredients = {
      { "lithium", 30 },
      { "rare-metals", 5 },
      { "uranium-235", 1 },
    },
    results = { { type = "item", name = "tritium", amount = 5 } },
  },
}
