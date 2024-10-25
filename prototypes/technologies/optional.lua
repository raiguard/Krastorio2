local data_util = require("data-util")
-- Loader recipes
if settings.startup["kr-loaders"].value then
  data_util.add_recipe_unlock("kr-logistic-4", "kr-advanced-loader")
  data_util.add_recipe_unlock("kr-logistic-5", "kr-superior-loader")
end

-- Containers
if settings.startup["kr-containers"].value then
  data:extend({
    {
      type = "technology",
      name = "kr-containers",
      mod = "Krastorio2",
      icon = "__Krastorio2Assets__/technologies/containers.png",
      icon_size = 256,
      icon_mipmaps = 4,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "kr-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-warehouse",
        },
      },
      prerequisites = { "steel-processing" },
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
      name = "kr-logistic-containers-1",
      mod = "Krastorio2",
      localised_name = { "technology-name.kr-logistic-containers-1" },
      localised_description = { "technology-description.kr-logistic-containers-1" },
      icon = "__Krastorio2Assets__/technologies/logistic-containers-1.png",
      icon_size = 256,
      icon_mipmaps = 4,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "kr-passive-provider-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-storage-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-passive-provider-warehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-storage-warehouse",
        },
      },
      prerequisites = { "kr-containers", "logistic-robotics" },
      unit = {
        count = 250,
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "chemical-science-pack", 1 },
        },
        time = 30,
      },
    },
    {
      type = "technology",
      name = "kr-logistic-containers-2",
      mod = "Krastorio2",
      localised_name = { "technology-name.kr-logistic-containers-2" },
      localised_description = { "technology-description.kr-logistic-containers-2" },
      icon = "__Krastorio2Assets__/technologies/logistic-containers-2.png",
      icon_size = 256,
      icon_mipmaps = 4,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "kr-active-provider-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-buffer-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-requester-storehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-active-provider-warehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-buffer-warehouse",
        },
        {
          type = "unlock-recipe",
          recipe = "kr-requester-warehouse",
        },
      },
      prerequisites = { "kr-containers", "logistic-system" },
      unit = {
        count = 500,
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "chemical-science-pack", 1 },
          { "production-science-pack", 1 },
          { "utility-science-pack", 1 },
        },
        time = 30,
      },
    },
  })
end
