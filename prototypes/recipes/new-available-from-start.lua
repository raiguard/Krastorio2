return {
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "recipe",
    name = "iron-beam",
    energy_required = 2,
    enabled = true,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 2 },
    },
    results = { { type = "item", name = "iron-beam", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-wind-turbine",
    energy_required = 5,
    enabled = true,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 6 },
      { type = "item", name = "iron-beam", amount = 2 },
      { type = "item", name = "iron-gear-wheel", amount = 6 },
      { type = "item", name = "copper-cable", amount = 6 },
    },
    results = { { type = "item", name = "kr-wind-turbine", amount = 1 } },
  },
  {
    type = "recipe",
    name = "inserter-parts",
    energy_required = 1,
    enabled = true,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "iron-stick", amount = 2 },
      { type = "item", name = "iron-gear-wheel", amount = 2 },
    },
    results = { { type = "item", name = "inserter-parts", amount = 1 } },
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
}
