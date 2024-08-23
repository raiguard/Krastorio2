-- -- -- Apply the choosen science pack recipes

-- Base
require("__Krastorio2__/lib/public/data-stages/science-pack-recipe")
-- Variations
require("__Krastorio2__/compatibility-scripts/settings-updates/science-pack-variations")

-- Change Recipes
data.raw.recipe["automation-science-pack"] =
  krastorio.science_pack_recipes[settings.startup["kr-automation-science-pack-recipe"].value]["automation-science-pack"]
data.raw.recipe["logistic-science-pack"] =
  krastorio.science_pack_recipes[settings.startup["kr-logistic-science-pack-recipe"].value]["logistic-science-pack"]
data.raw.recipe["military-science-pack"] =
  krastorio.science_pack_recipes[settings.startup["kr-military-science-pack-recipe"].value]["military-science-pack"]
data.raw.recipe["chemical-science-pack"] =
  krastorio.science_pack_recipes[settings.startup["kr-chemical-science-pack-recipe"].value]["chemical-science-pack"]
data.raw.recipe["production-science-pack"] =
  krastorio.science_pack_recipes[settings.startup["kr-production-science-pack-recipe"].value]["production-science-pack"]
data.raw.recipe["utility-science-pack"] =
  krastorio.science_pack_recipes[settings.startup["kr-utility-science-pack-recipe"].value]["utility-science-pack"]

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
krastorio.recipes.setCategoryIfExist(krastorio.optimization_tech_card_name, "t3-tech-cards")

-- Remove useless prerequisite
if not krastorio.recipes.hasIngredient("production-science-pack", "electric-furnace") then
  krastorio.technologies.removePrerequisite("production-science-pack", "advanced-material-processing-2")
end
