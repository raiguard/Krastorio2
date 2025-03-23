data:extend({
  {
    type = "recipe",
    name = "biomass",
    category = "bioprocessing",
    enabled = false,
    energy_required = 60,
    ingredients = {
      { type = "fluid", name = "petroleum-gas", amount = 50 },
      { type = "fluid", name = "oxygen", amount = 50 },
    },
    results = {
      { type = "item", name = "biomass", amount = 5 },
    },
  },
  {
    type = "recipe",
    name = "kr-biter-virus",
    category = "bioprocessing",
    enabled = false,
    energy_required = 600,
    ingredients = {
      { type = "item", name = "poison-capsule", amount = 1 },
      { type = "item", name = "imersite-powder", amount = 5 },
      { type = "fluid", name = "nitric-acid", amount = 50 },
      { type = "fluid", name = "biomethanol", amount = 50 },
    },
    results = { { type = "item", name = "kr-biter-virus", amount = 1 } },
  },
})
