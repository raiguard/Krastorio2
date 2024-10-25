data:extend({
  {
    type = "technology",
    name = "kr-fluid-excess-handling",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/flare-stack.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-flare-stack",
      },
    },
    prerequisites = { "kr-fluids-chemistry", "electronics" },
    unit = {
      count = 150,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-fuel",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/fuel-refinery.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-fuel-refinery",
      },
      {
        type = "unlock-recipe",
        recipe = "fuel-1",
      },
      {
        type = "unlock-recipe",
        recipe = "fuel-2",
      },
    },
    prerequisites = { "oil-processing" },
    unit = {
      count = 125,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 45,
    },
  },
  {
    type = "technology",
    name = "kr-gas-power-station",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/gas-power-station.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-gas-power-station",
      },
    },
    prerequisites = { "oil-processing", "engine" },
    unit = {
      count = 250,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-mineral-water-gathering",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/mineral-water-gathering.png",
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = { "fluid-handling", "kr-fluids-chemistry" },
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-mineral-water-pumpjack",
      },
    },
    unit = {
      count = 50,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-silicon-processing",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/silicon-processing.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "silicon",
      },
      {
        type = "unlock-recipe",
        recipe = "quartz",
      },
    },
    prerequisites = { "kr-fluids-chemistry", "automation-2" },
    order = "c-a",
    unit = {
      count = 125,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-steel-fluid-handling",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/steel-fluid-handling.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-steel-pipe",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-steel-pipe-to-ground",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-steel-pump",
      },
    },
    prerequisites = { "steel-processing", "fluid-handling" },
    unit = {
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-steel-fluid-tanks",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/steel-fluid-tanks.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-big-storage-tank",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-huge-storage-tank",
      },
    },
    prerequisites = { "kr-steel-fluid-handling" },
    unit = {
      count = 120,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
      },
      time = 30,
    },
  },
})
