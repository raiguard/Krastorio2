data:extend({
  {
    type = "recipe",
    name = "charged-antimatter-fuel-cell",
    category = "matter-deconversion",
    enabled = false,
    allow_as_intermediate = false,
    energy_required = 5,
    ingredients = {
      { type = "fluid", name = "matter", amount = 1000 },
      { type = "item", name = "empty-antimatter-fuel-cell", amount = 1 },
    },
    results = { { type = "item", name = "charged-antimatter-fuel-cell", amount = 1 } },
  },
})
