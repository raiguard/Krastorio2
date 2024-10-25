data:extend({
  {
    type = "technology",
    name = "automation-science-pack", -- DON'T CHANGE THIS NAME (is needed for the enforce algorithm)
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/automation-tech-card.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "automation-science-pack",
      },
    },
    prerequisites = { "kr-automation-core" },
    unit = {
      count = 50,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-automation-core",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/automation-core.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "automation-core",
      },
    },
    prerequisites = {},
    unit = {
      count = 20,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 20,
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = not settings.startup["kr-tech-multiplier-everywhere"].value,
  },
  {
    type = "technology",
    name = "kr-basic-fluid-handling",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/basic-fluid-handling.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "pipe",
      },
      {
        type = "unlock-recipe",
        recipe = "pipe-to-ground",
      },
      {
        type = "unlock-recipe",
        recipe = "offshore-pump",
      },
    },
    prerequisites = { "kr-automation-core" },
    unit = {
      count = 10,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 20,
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = not settings.startup["kr-tech-multiplier-everywhere"].value,
  },
  {
    type = "technology",
    name = "kr-crusher",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/crusher.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-crusher",
      },
    },
    prerequisites = { "kr-automation-core" },
    unit = {
      count = 30,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 30,
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = not settings.startup["kr-tech-multiplier-everywhere"].value,
  },
  {
    type = "technology",
    name = "kr-decorations",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/decorations.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {}, -- This is populated during data-updates by prototypes/others/greenhouse.lua
    prerequisites = { "kr-greenhouse" },
    unit = {
      count = 30,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-greenhouse",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/greenhouse.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-greenhouse",
      },
      {
        type = "unlock-recipe",
        recipe = "kr-grow-wood-with-water",
      },
    },
    prerequisites = { "kr-automation-core", "kr-stone-processing", "kr-basic-fluid-handling" },
    unit = {
      count = 40,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 45,
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = not settings.startup["kr-tech-multiplier-everywhere"].value,
  },
  {
    type = "technology",
    name = "kr-iron-pickaxe",
    mod = "Krastorio2",
    icon_size = 256,
    icon_mipmaps = 4,
    icons = {
      {
        icon = "__Krastorio2Assets__/technologies/iron-pickaxe.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-mining.png",
        icon_size = 128,
        icon_mipmaps = 3,
        shift = { 100, 100 },
      },
    },
    effects = {
      {
        type = "character-mining-speed",
        modifier = 0.50,
      },
    },
    prerequisites = {},
    unit = {
      count = 25,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 30,
    },
    order = "b-c-a",
  },
  {
    type = "technology",
    name = "kr-steam-engine",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/steam-engine.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "boiler",
      },
      {
        type = "unlock-recipe",
        recipe = "steam-engine",
      },
    },
    prerequisites = { "kr-basic-fluid-handling" },
    unit = {
      count = 20,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 30,
    },
  },
  {
    type = "technology",
    name = "kr-stone-processing",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/stone-processing.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "sand",
      },
      {
        type = "unlock-recipe",
        recipe = "glass",
      },
    },
    prerequisites = { "kr-crusher" },
    unit = {
      count = 50,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 30,
    },
    -- Disable cost multiplier to avoid manually harvesting unreasonable amount of wood.
    ignore_tech_cost_multiplier = not settings.startup["kr-tech-multiplier-everywhere"].value,
  },
  {
    type = "technology",
    name = "light-armor",
    mod = "Krastorio2",
    icon = "__Krastorio2Assets__/technologies/light-armor.png",
    icon_size = 256,
    icon_mipmaps = 4,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "light-armor",
      },
    },
    prerequisites = { "military" },
    unit = {
      count = 50,
      ingredients = {
        { "basic-tech-card", 1 },
      },
      time = 20,
    },
  },
})
