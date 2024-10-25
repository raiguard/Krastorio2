data:extend({
  {
    type = "recipe",
    name = "charge-stabilizer",
    category = "stabilizer-charging",
    subgroup = "intermediate-product",
    allow_as_intermediate = false,
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "matter-stabilizer", amount = 1 },
    },
    results = { { type = "item", name = "charged-matter-stabilizer", amount = 1 } },
  },
})
