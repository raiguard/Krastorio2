-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "stabilizer-charging"
return {
  {
    type = "recipe",
    name = "charge-stabilizer",
    category = "stabilizer-charging",
    subgroup = "intermediate-product",
    allow_as_intermediate = false,
    energy_required = 2,
    enabled = false,
    ingredients = {
      { "matter-stabilizer", 1 },
    },
    result = "charged-matter-stabilizer",
  },
}
