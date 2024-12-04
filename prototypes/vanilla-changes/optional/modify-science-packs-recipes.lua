-- -- -- Apply the choosen science pack recipes

-- Base
require("lib.public.data-stages.science-pack-recipe")
-- Variations
require("compatibility-scripts.settings-updates.science-pack-variations")

-- Change Recipes
data.raw.recipe["automation-science-pack"] =
  krastorio.science_pack_recipes["Krastorio 2"]["automation-science-pack"]
data.raw.recipe["logistic-science-pack"] =
  krastorio.science_pack_recipes["Krastorio 2"]["logistic-science-pack"]
data.raw.recipe["military-science-pack"] =
  krastorio.science_pack_recipes["Krastorio 2"]["military-science-pack"]
data.raw.recipe["chemical-science-pack"] =
  krastorio.science_pack_recipes["Krastorio 2"]["chemical-science-pack"]
data.raw.recipe["production-science-pack"] =
  krastorio.science_pack_recipes["Krastorio 2"]["production-science-pack"]
data.raw.recipe["utility-science-pack"] =
  krastorio.science_pack_recipes["Krastorio 2"]["utility-science-pack"]

-- Check and remove ingredients if the recipe is impossible
local unlockable_items = krastorio.recipes.findNotUnlockableRecipes()

krastorio.recipes.removeIngredients("automation-science-pack", unlockable_items)
krastorio.recipes.removeIngredients("logistic-science-pack", unlockable_items)
krastorio.recipes.removeIngredients("military-science-pack", unlockable_items)
krastorio.recipes.removeIngredients("production-science-pack", unlockable_items)
krastorio.recipes.removeIngredients("utility-science-pack", unlockable_items)

-- If K2 category exist use them
krastorio.recipes.setCategoryIfExist("production-science-pack", "t2-tech-cards")
krastorio.recipes.setCategoryIfExist("utility-science-pack", "t2-tech-cards")
krastorio.recipes.setCategoryIfExist(kr_optimization_tech_card_name, "t3-tech-cards")

-- Remove useless prerequisite
if not krastorio.recipes.hasIngredient("production-science-pack", "electric-furnace") then
  krastorio.technologies.removePrerequisite("production-science-pack", "advanced-material-processing-2")
end
