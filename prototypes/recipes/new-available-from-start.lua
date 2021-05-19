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
      { "iron-plate", 2 },
    },
    result = "iron-beam",
  },
  {
    type = "recipe",
    name = "kr-wind-turbine",
    energy_required = 5,
    enabled = true,
    ingredients = {
      { "iron-plate", 6 },
      { "iron-beam", 2 },
      { "iron-gear-wheel", 6 },
      { "copper-cable", 6 },
    },
    result = "kr-wind-turbine",
    result_count = 1,
  },
  {
    type = "recipe",
    name = "inserter-parts",
    energy_required = 1,
    enabled = true,
    allow_productivity = true,
    ingredients = {
      { "iron-stick", 2 },
      { "iron-gear-wheel", 2 },
    },
    result = "inserter-parts",
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
}
