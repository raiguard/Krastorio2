data:extend({
  {
    type = "technology",
    name = "automation-science-pack",
    icon = "__Krastorio2Assets__/technologies/automation-tech-card.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 50,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = { "kr-automation-core" },
    effects = {
      { type = "unlock-recipe", recipe = "automation-science-pack" },
    },
  },
  {
    type = "technology",
    name = "kr-automation-core",
    icon = "__Krastorio2Assets__/technologies/automation-core.png",
    icon_size = 256,
    unit = {
      time = 20,
      count = 20,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = {},
    effects = {
      { type = "unlock-recipe", recipe = "automation-core" },
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = true,
  },
  {
    type = "technology",
    name = "kr-basic-fluid-handling",
    icon = "__Krastorio2Assets__/technologies/basic-fluid-handling.png",
    icon_size = 256,
    unit = {
      time = 20,
      count = 10,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = { "kr-automation-core" },
    effects = {
      { type = "unlock-recipe", recipe = "pipe" },
      { type = "unlock-recipe", recipe = "pipe-to-ground" },
      { type = "unlock-recipe", recipe = "offshore-pump" },
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = true,
  },
  {
    type = "technology",
    name = "kr-crusher",
    icon = "__Krastorio2Assets__/technologies/crusher.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 30,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = { "kr-automation-core" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-crusher" },
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = true,
  },
  {
    type = "technology",
    name = "kr-decorations",
    icon = "__Krastorio2Assets__/technologies/decorations.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 30,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = { "kr-greenhouse" },
    effects = {}, -- This is populated during data-updates by prototypes/others/greenhouse.lua
  },
  {
    type = "technology",
    name = "kr-greenhouse",
    icon = "__Krastorio2Assets__/technologies/greenhouse.png",
    icon_size = 256,
    unit = {
      time = 45,
      count = 40,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = { "kr-automation-core", "kr-stone-processing", "kr-basic-fluid-handling" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-greenhouse" },
      { type = "unlock-recipe", recipe = "kr-grow-wood-with-water" },
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = true,
  },
  {
    type = "technology",
    name = "kr-iron-pickaxe",
    icons = {
      { icon = "__Krastorio2Assets__/technologies/iron-pickaxe.png", icon_size = 256 },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining.png",
        icon_size = 128,
        shift = { 100, 100 },
      },
    },
    order = "b-c-a",
    unit = {
      time = 30,
      count = 25,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = {},
    effects = {
      { type = "character-mining-speed", modifier = 0.50 },
    },
  },
  {
    type = "technology",
    name = "kr-steam-engine",
    icon = "__Krastorio2Assets__/technologies/steam-engine.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 20,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = { "kr-basic-fluid-handling" },
    effects = {
      { type = "unlock-recipe", recipe = "boiler" },
      { type = "unlock-recipe", recipe = "steam-engine" },
    },
  },
  {
    type = "technology",
    name = "kr-stone-processing",
    icon = "__Krastorio2Assets__/technologies/stone-processing.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 50,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = { "kr-crusher" },
    effects = {
      { type = "unlock-recipe", recipe = "sand" },
      { type = "unlock-recipe", recipe = "glass" },
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = true,
  },
  {
    type = "technology",
    name = "light-armor",
    icon = "__Krastorio2Assets__/technologies/light-armor.png",
    icon_size = 256,
    unit = {
      time = 20,
      count = 50,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = { "military" },
    effects = {
      { type = "unlock-recipe", recipe = "light-armor" },
    },
  },
})
