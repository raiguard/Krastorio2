data:extend({
  {
    type = "recipe",
    name = "charged-antimatter-fuel-cell",
    enabled = false,
    category = "matter-deconversion",
    energy_required = 5,
    ingredients = {
      { type = "fluid", name = "matter", amount = 1000 },
      { type = "item", name = "empty-antimatter-fuel-cell", amount = 1 },
    },
    results = { { type = "item", name = "charged-antimatter-fuel-cell", amount = 1 } },
    allow_as_intermediate = false,
  },
})
