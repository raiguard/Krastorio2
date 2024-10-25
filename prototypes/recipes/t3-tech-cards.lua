data:extend({
  {
    type = "recipe",
    name = kr_optimization_tech_card_name,
    enabled = false,
    category = "t3-tech-cards",
    energy_required = 20,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 10 },
      { type = "item", name = "space-research-data", amount = 5 },
    },
    results = {
      { type = "item", name = kr_optimization_tech_card_name, amount = 5 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "matter-research-data",
    enabled = false,
    category = "t3-tech-cards",
    energy_required = 20,
    ingredients = {
      { type = "item", name = "imersite-crystal", amount = 5 },
      { type = "item", name = "rare-metals", amount = 5 },
      { type = "item", name = "lithium", amount = 5 },
      { type = "item", name = "plastic-bar", amount = 5 },
    },
    results = {
      { type = "item", name = "matter-research-data", amount = 5 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "matter-tech-card",
    enabled = false,
    category = "t3-tech-cards",
    energy_required = 20,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 15 },
      { type = "item", name = "matter-research-data", amount = 5 },
      { type = "item", name = "processing-unit", amount = 5 },
    },
    results = {
      { type = "item", name = "matter-tech-card", amount = 5 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "advanced-tech-card",
    enabled = false,
    category = "t3-tech-cards",
    energy_required = 20,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 15 },
      { type = "item", name = "imersium-gear-wheel", amount = 20 },
      { type = "item", name = "lithium-sulfur-battery", amount = 10 },
      { type = "item", name = "electric-engine-unit", amount = 5 },
    },
    results = {
      { type = "item", name = "advanced-tech-card", amount = 5 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "singularity-tech-card",
    enabled = false,
    category = "t3-tech-cards",
    energy_required = 20,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 15 },
      { type = "item", name = "charged-matter-stabilizer", amount = 5 },
      { type = "item", name = "ai-core", amount = 5 },
    },
    results = {
      { type = "item", name = "singularity-tech-card", amount = 5 },
    },
    allow_productivity = true,
  },
})
