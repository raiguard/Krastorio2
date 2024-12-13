data:extend({
  {
    type = "recipe",
    name = "charged-matter-stabilizer",
    subgroup = "intermediate-product",
    enabled = false,
    category = "stabilizer-charging",
    energy_required = 2,
    ingredients = {
      { type = "item", name = "matter-stabilizer", amount = 1 },
    },
    results = {
      { type = "item", name = "charged-matter-stabilizer", amount = 1 },
    },
    allow_as_intermediate = false,
  },
})
