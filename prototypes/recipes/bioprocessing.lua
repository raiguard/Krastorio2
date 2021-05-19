-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "growing"
return {
  {
    type = "recipe",
    name = "kr-biomass-growing",
    category = "bioprocessing",
    energy_required = 60,
    enabled = false,
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
    name = "kr-creep-virus",
    category = "bioprocessing",
    enabled = false,
    energy_required = 600,
    ingredients = {
      { type = "item", name = "poison-capsule", amount = 1 },
      { type = "item", name = "imersite-powder", amount = 5 },
      { type = "fluid", name = "hydrogen-chloride", amount = 50 },
      { type = "fluid", name = "sulfuric-acid", amount = 50 },
    },
    result = "kr-creep-virus",
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
    result = "kr-biter-virus",
  },
}
