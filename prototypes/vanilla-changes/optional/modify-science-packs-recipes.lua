-- -- -- Apply K2 science pack recipes

-- Change Recipes

-- Automation science pack
data.raw.recipe["automation-science-pack"] = {
  type = "recipe",
  name = "automation-science-pack",
  enabled = false,
  energy_required = 20,
  ingredients = {
    { type = "item", name = "blank-tech-card", amount = 5 },
    { type = "item", name = "automation-core", amount = 1 },
  },
  results = { { type = "item", name = "automation-science-pack", amount = 5 } },
}
-- Logistic science pack
data.raw.recipe["logistic-science-pack"] = {
  type = "recipe",
  name = "logistic-science-pack",
  enabled = false,
  energy_required = 20,
  ingredients = {
    { type = "item", name = "blank-tech-card",    amount = 5 },
    { type = "item", name = "electronic-circuit", amount = 5 },
    { type = "item", name = "iron-gear-wheel",    amount = 5 },
  },
  results = { { type = "item", name = "logistic-science-pack", amount = 5 } },
}
-- Military science pack
data.raw.recipe["military-science-pack"] = {
  type = "recipe",
  name = "military-science-pack",
  enabled = false,
  energy_required = 20,
  ingredients = {
    { type = "item", name = "blank-tech-card",       amount = 5 },
    { type = "item", name = "biters-research-data",  amount = 1 },
    { type = "item", name = "electronic-components", amount = 5 },
  },
  results = { { type = "item", name = "military-science-pack", amount = 5 } },
}
-- Chemical science pack
data.raw.recipe["chemical-science-pack"] = {
  type = "recipe",
  name = "chemical-science-pack",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 20,
  ingredients = {
    { type = "item",  name = "blank-tech-card",  amount = 5 },
    { type = "item",  name = "glass",            amount = 15 },
    { type = "item",  name = "advanced-circuit", amount = 5 },
    { type = "fluid", name = "sulfuric-acid",    amount = 50 },
  },
  results = { { type = "item", name = "chemical-science-pack", amount = 5 } },
}
-- Production science pack
data.raw.recipe["production-science-pack"] = {
  type = "recipe",
  name = "production-science-pack",
  enabled = false,
  energy_required = 20,
  ingredients = {
    { type = "item", name = "blank-tech-card",     amount = 10 },
    { type = "item", name = "fast-transport-belt", amount = 10 },
    { type = "item", name = "productivity-module", amount = 5 },
    { type = "item", name = "uranium-238",         amount = 5 },
  },
  results = { { type = "item", name = "production-science-pack", amount = 5 } },
}
-- Utility science pack
data.raw.recipe["utility-science-pack"] = {
  type = "recipe",
  name = "utility-science-pack",
  enabled = false,
  energy_required = 20,
  ingredients = {
    { type = "item", name = "blank-tech-card",       amount = 10 },
    { type = "item", name = "processing-unit",       amount = 5 },
    { type = "item", name = "rocket-fuel",           amount = 5 },
    { type = "item", name = "low-density-structure", amount = 5 },
  },
  results = { { type = "item", name = "utility-science-pack", amount = 5 } },
}
