data:extend({
  {
    type = "technology",
    name = "kr-advanced-fuel",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/advanced-fuel.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "advanced-fuel",
      },
    },
    prerequisites = { "kr-quarry-minerals-extraction", "kr-fuel", "kr-advanced-chemistry" },
    unit = {
      count = 250,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-advanced-solar-panel",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/advanced-solar-panel.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "solar-energy", "kr-quarry-minerals-extraction" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-advanced-solar-panel",
      },
    },
    unit = {
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-battery-mk3-equipment",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = "__Krastorio2Assets__/technologies/battery-mk3-equipment.png",
    upgrade = false,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "battery-mk3-equipment",
      },
      {
        type = "unlock-recipe",
        recipe = "big-battery-mk3-equipment",
      },
    },
    prerequisites = {
      "kr-quarry-minerals-extraction",
      "kr-lithium-sulfur-battery",
      "battery-mk2-equipment",
      "processing-unit",
    },
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
  },
  {
    type = "technology",
    name = "kr-quarry-minerals-extraction",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/quarry-drill.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-quarry-drill",
      },
      {
        type = "unlock-recipe",
        recipe = "imersite-powder",
      },
      {
        type = "unlock-recipe",
        recipe = "imersite-crystal",
      },
    },
    prerequisites = { "kr-advanced-chemistry", "processing-unit", "electric-engine" },
    order = "g-e-d",
    unit = {
      count = 350,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
      },
      time = 60,
    },
  },
})
