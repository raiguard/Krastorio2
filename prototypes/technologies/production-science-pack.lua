data:extend({
  {
    type = "technology",
    name = "kr-advanced-fuel",
    icon = "__Krastorio2Assets__/technologies/advanced-fuel.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 250,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
    },
    prerequisites = { "kr-quarry-minerals-extraction", "kr-fuel", "kr-advanced-chemistry" },
    effects = {
      { type = "unlock-recipe", recipe = "advanced-fuel" },
    },
  },
  {
    type = "technology",
    name = "kr-advanced-solar-panel",
    icon = "__Krastorio2Assets__/technologies/advanced-solar-panel.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
    },
    prerequisites = { "solar-energy", "kr-quarry-minerals-extraction" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-advanced-solar-panel" },
    },
  },
  {
    type = "technology",
    name = "kr-battery-mk3-equipment",
    icon_size = 256,
    icon = "__Krastorio2Assets__/technologies/battery-mk3-equipment.png",
    upgrade = false,
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
      time = 60,
    },
    prerequisites = {
      "kr-quarry-minerals-extraction",
      "kr-lithium-sulfur-battery",
      "battery-mk2-equipment",
      "processing-unit",
    },
    effects = {
      { type = "unlock-recipe", recipe = "battery-mk3-equipment" },
      { type = "unlock-recipe", recipe = "big-battery-mk3-equipment" },
    },
  },
  {
    type = "technology",
    name = "kr-quarry-minerals-extraction",
    icon = "__Krastorio2Assets__/technologies/quarry-drill.png",
    icon_size = 256,
    order = "g-e-d",
    unit = {
      time = 60,
      count = 350,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
    },
    prerequisites = { "kr-advanced-chemistry", "processing-unit", "electric-engine" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-quarry-drill" },
      { type = "unlock-recipe", recipe = "imersite-powder" },
      { type = "unlock-recipe", recipe = "imersite-crystal" },
    },
  },
})
