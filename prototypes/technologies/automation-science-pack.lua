data:extend({
  {
    type = "technology",
    name = "kr-fluids-chemistry",
    icon = "__Krastorio2Assets__/technologies/fluids-chemistry.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
    },
    prerequisites = { "kr-basic-fluid-handling", "steel-processing", "kr-stone-processing", "engine" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-electrolysis-plant" },
      { type = "unlock-recipe", recipe = "chemical-plant" },
      { type = "unlock-recipe", recipe = "kr-water-electrolysis" },
    },
  },
  {
    type = "technology",
    name = "kr-sentinel",
    icon = "__Krastorio2Assets__/technologies/sentinel.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
    },
    prerequisites = { "lamp", "kr-stone-processing" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-sentinel" },
    },
  },
  {
    type = "technology",
    name = "kr-shelter",
    icon = "__Krastorio2Assets__/technologies/shelter.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
    },
    prerequisites = { "automation-science-pack" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-shelter" },
    },
  },
})
