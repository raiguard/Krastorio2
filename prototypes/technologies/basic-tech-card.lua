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
      time = 10,
      count = 10,
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
    name = "kr-laboratory",
    icon = "__base__/graphics/technology/research-speed.png",
    icon_size = 256,
    unit = {
      time = 10,
      count = 15,
      ingredients = {
        { "basic-tech-card", 1 },
      },
    },
    prerequisites = { "electronics" },
    effects = {
      { type = "unlock-recipe", recipe = "lab" },
    },
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
    prerequisites = { "kr-automation-core", "kr-stone-processing", "steam-power" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-greenhouse" },
      { type = "unlock-recipe", recipe = "wood" },
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = true,
  },
  {
    type = "technology",
    name = "kr-iron-pickaxe",
    icons = util.technology_icon_constant_mining("__Krastorio2Assets__/technologies/iron-pickaxe.png"),
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
