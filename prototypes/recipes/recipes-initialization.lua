local krastorio_new_recipes = {
  -- -- New recipes new available from start
  require("__Krastorio2__/prototypes/recipes/new-available-from-start"),

  -- -- Recipes for buildings and other entities (not associated non-buildings-items)
  require("__Krastorio2__/prototypes/recipes/buildings"),

  -- -- New science packs recipes (tech card) (tools)
  require("__Krastorio2__/prototypes/recipes/tech-cards"),

  -- -- New generic recipes for items (not associated to buildings)
  require("__Krastorio2__/prototypes/recipes/items-crafting"),

  -- -- New recipes for equipments items
  require("__Krastorio2__/prototypes/recipes/equipments"),

  -- -- New recipes for plants(wood) growing
  require("__Krastorio2__/prototypes/recipes/growing"),

  -- -- New recipes for crushing items
  require("__Krastorio2__/prototypes/recipes/crushing"),

  -- -- New recipes for smelting items
  require("__Krastorio2__/prototypes/recipes/smelting"),

  -- -- New recipes for electrolysis items
  require("__Krastorio2__/prototypes/recipes/electrolysis"),

  -- -- New recipes for fluid-filtration items
  require("__Krastorio2__/prototypes/recipes/fluid-filtration"),

  -- -- New recipes for atmosphere condensation products(should produce only gases)
  require("__Krastorio2__/prototypes/recipes/atmosphere-condensation"),

  -- -- New recipes for chemistry products(can produce fluids)
  require("__Krastorio2__/prototypes/recipes/chemistry"),

  -- -- New recipes for fuel refinery products(produce only fuels)
  require("__Krastorio2__/prototypes/recipes/fuel-refinery"),

  -- -- Recipes used by fusion reactor to create steam
  require("__Krastorio2__/prototypes/recipes/nuclear-fusion"),

  -- -- Recipes for centrifuging processing
  require("__Krastorio2__/prototypes/recipes/centrifuging"),

  -- -- Recipes used for purify air from pollution
  require("__Krastorio2__/prototypes/recipes/air-purification"),

  -- -- Recipes used for bio- and crep processing
  require("__Krastorio2__/prototypes/recipes/bioprocessing"),

  -- -- Recipe for charge stabilizers
  require("__Krastorio2__/prototypes/recipes/stabilizer-charging"),

  -- -- Vehicle recipes
  require("__Krastorio2__/prototypes/recipes/vehicles"),

  -- -- Recipes for refinery
  require("__Krastorio2__/prototypes/recipes/oil-processing"),

  -- -- Recipes for smelting assemblers
  require("__Krastorio2__/prototypes/recipes/smelting-crafting"),
}

-- -- Anti recipes override check
-- This will avoid that Krastorio 2 will accidentally override a recipe of vanilla or of other mods
-- If one vanilla recipes will be changes or disabled this will be done in the vanilla-changes mod folder
for _, recipe_section in pairs(krastorio_new_recipes) do
  for _, recipe in pairs(recipe_section) do
    recipe.mod = "Krastorio2"
    krastorio.recipes.addWithOverrideSafeNewRecipe(recipe)
  end
end

-- Optional recipes
require("__Krastorio2__/prototypes/recipes/containers")
require("__Krastorio2__/prototypes/recipes/loaders")
