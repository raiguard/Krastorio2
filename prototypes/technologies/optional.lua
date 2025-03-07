local data_util = require("data-util")

if settings.startup["kr-loaders"].value then
  data_util.add_recipe_unlock("kr-logistic-4", "kr-advanced-loader")
  data_util.add_recipe_unlock("kr-logistic-5", "kr-superior-loader")
end

if not settings.startup["kr-containers"].value then
  return
end

data:extend({
  {
    type = "technology",
    name = "kr-containers",
    icon = "__Krastorio2Assets__/technologies/containers.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 100,
      ingredients = {
        { "basic-tech-card", 1 },
        { "automation-science-pack", 1 },
      },
    },
    prerequisites = { "steel-processing" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-strongbox" },
      { type = "unlock-recipe", recipe = "kr-warehouse" },
    },
  },
  {
    type = "technology",
    name = "kr-logistic-containers-1",
    localised_name = { "technology-name.kr-logistic-containers-1" },
    localised_description = { "technology-description.kr-logistic-containers-1" },
    icon = "__Krastorio2Assets__/technologies/logistic-containers-1.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 250,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
      },
    },
    prerequisites = { "kr-containers", "logistic-robotics" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-passive-provider-strongbox" },
      { type = "unlock-recipe", recipe = "kr-storage-strongbox" },
      { type = "unlock-recipe", recipe = "kr-passive-provider-warehouse" },
      { type = "unlock-recipe", recipe = "kr-storage-warehouse" },
    },
  },
  {
    type = "technology",
    name = "kr-logistic-containers-2",
    localised_name = { "technology-name.kr-logistic-containers-2" },
    localised_description = { "technology-description.kr-logistic-containers-2" },
    icon = "__Krastorio2Assets__/technologies/logistic-containers-2.png",
    icon_size = 256,
    unit = {
      time = 30,
      count = 500,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
      },
    },
    prerequisites = { "kr-containers", "logistic-system" },
    effects = {
      { type = "unlock-recipe", recipe = "kr-active-provider-strongbox" },
      { type = "unlock-recipe", recipe = "kr-buffer-strongbox" },
      { type = "unlock-recipe", recipe = "kr-requester-strongbox" },
      { type = "unlock-recipe", recipe = "kr-active-provider-warehouse" },
      { type = "unlock-recipe", recipe = "kr-buffer-warehouse" },
      { type = "unlock-recipe", recipe = "kr-requester-warehouse" },
    },
  },
})
