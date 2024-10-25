data:extend({
  {
    type = "technology",
    name = "kr-electric-mining-drill",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/electric-mining-drill.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "electric-mining-drill",
      },
    },
    prerequisites = { "automation-science-pack" },
    unit = {
      count = 20,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-fluids-chemistry",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/fluids-chemistry.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-filtration-plant",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-electrolysis-plant",
      },
      {
        type = "unlock-recipe",
        recipe = "chemical-plant",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-water-electrolysis",
      },
    },
    prerequisites = { "kr-basic-fluid-handling", "steel-processing", "kr-stone-processing", "engine" },
    unit = {
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-sentinel",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/sentinel.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "lamp", "kr-stone-processing" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-sentinel",
      },
    },
    unit = {
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-shelter",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/shelter.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-shelter",
      },
    },
    prerequisites = { "automation-science-pack" },
    unit = {
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
      time = 30,
    },
  },
})
