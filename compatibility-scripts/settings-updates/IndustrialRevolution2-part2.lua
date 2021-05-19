local science_pack_recipe = require("__Krastorio2__/lib/public/data-stages/science-pack-recipe")

-- THIS RECIPES ARE ENFORCED TO BE COMPATIBLE
if mods["IndustrialRevolution"] then
  -- Automation science pack
  science_pack_recipe.addRecipeVariation("Industrial Revolution", "automation-science-pack", {
    type = "recipe",
    name = "automation-science-pack",
    category = "crafting",
    enabled = false,
    energy_required = 4,
    ingredients = {
      { "blank-tech-card", 5 },
      { "automation-core", 1 },
    },
    result = "automation-science-pack",
    result_count = 1,
  })
  -- Logistic science pack
  science_pack_recipe.addRecipeVariation("Industrial Revolution", "logistic-science-pack", {
    type = "recipe",
    name = "logistic-science-pack",
    category = "crafting",
    enabled = false,
    energy_required = 4,
    ingredients = {
      { "glass", 2 },
      { "bronze-plate-heavy", 2 },
    },
    result = "logistic-science-pack",
    result_count = 1,
  })
  -- Military science pack
  science_pack_recipe.addRecipeVariation("Industrial Revolution", "military-science-pack", {
    type = "recipe",
    name = "military-science-pack",
    category = "crafting",
    enabled = false,
    energy_required = 6,
    ingredients = {
      { "gold-gate", 1 },
      { "biters-research-data", 1 },
      { "blank-tech-card", 5 },
    },
    result = "military-science-pack",
    result_count = 1,
  })
  -- Chemical science pack
  science_pack_recipe.addRecipeVariation("Industrial Revolution", "chemical-science-pack", {
    type = "recipe",
    name = "chemical-science-pack",
    category = "crafting",
    enabled = false,
    energy_required = 8,
    ingredients = {
      { "electronic-circuit", 2 },
      { "concrete", 5 },
      { "iron-beam", 3 },
    },
    result = "chemical-science-pack",
    result_count = 1,
  })
  -- Production science pack
  science_pack_recipe.addRecipeVariation("Industrial Revolution", "production-science-pack", {
    type = "recipe",
    name = "production-science-pack",
    category = "crafting",
    enabled = false,
    energy_required = 8,
    ingredients = {
      { "advanced-circuit", 2 },
      { "electric-engine-unit", 2 },
      { "solid-fuel", 2 },
    },
    result = "production-science-pack",
    result_count = 1,
  })
  -- Utility science pack
  science_pack_recipe.addRecipeVariation("Industrial Revolution", "utility-science-pack", {
    type = "recipe",
    name = "utility-science-pack",
    category = "crafting",
    enabled = false,
    energy_required = 8,
    ingredients = {
      { "processing-unit", 2 },
      { "low-density-structure", 2 },
      { "chromium-piston", 2 },
    },
    result = "utility-science-pack",
    result_count = 1,
  })
end
