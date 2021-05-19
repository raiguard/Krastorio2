--[[
  -- How is defined science_pack_recipes: 
  science_pack_recipes["name of mod"]["name of science pack"]
  
  "name of science pack" could be only:
  "automation-science-pack",
  "logistic-science-pack",
  "military-science-pack",
  "chemical-science-pack",
  "production-science-pack",
  "utility-science-pack"
  
  Also, to add a new variant in automatic way, call this function:
  science_pack_recipes.addRecipeVariation(mod_name, science_pack_name, recipe)
  where:
  @ mod_name, name of mod that use this recipe for this science pack
  @ science_pack_name, name of science pack es: "automation-science-pack"
  @ recipe, all recipe defined as standard of data.raw of Factorio
--]]

if not krastorio then
  krastorio = {}
end

if not krastorio.science_pack_recipes then
  krastorio.science_pack_recipes = {}

  --------------------------------------------------------------------------------------
  -- -- Base vanilla recipes
  --------------------------------------------------------------------------------------

  krastorio.science_pack_recipes["Factorio"] = {}
  -- Automation science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["automation-science-pack"] = {
    type = "recipe",
    name = "automation-science-pack",
    enabled = false,
    energy_required = 5,
    ingredients = {
      { "copper-plate", 1 },
      { "iron-gear-wheel", 1 },
    },
    result = "automation-science-pack",
  }
  -- Logistic science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["logistic-science-pack"] = {
    type = "recipe",
    name = "logistic-science-pack",
    enabled = false,
    energy_required = 6,
    ingredients = {
      { "inserter", 1 },
      { "transport-belt", 1 },
    },
    result = "logistic-science-pack",
  }
  -- Military science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["military-science-pack"] = {
    type = "recipe",
    name = "military-science-pack",
    enabled = false,
    energy_required = 10,
    result_count = 2,
    ingredients = {
      { "piercing-rounds-magazine", 1 },
      { "grenade", 1 },
      { "stone-wall", 2 },
    },
    result = "military-science-pack",
  }
  -- Chemical science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["chemical-science-pack"] = {
    type = "recipe",
    name = "chemical-science-pack",
    enabled = false,
    energy_required = 24,
    result_count = 2,
    ingredients = {
      { "engine-unit", 2 },
      { "advanced-circuit", 3 },
      { "sulfur", 1 },
    },
    result = "chemical-science-pack",
  }
  -- Production science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["production-science-pack"] = {
    type = "recipe",
    name = "production-science-pack",
    enabled = false,
    energy_required = 21,
    result_count = 3,
    ingredients = {
      { "electric-furnace", 1 },
      { "productivity-module", 1 },
      { "rail", 30 },
    },
    result = "production-science-pack",
  }
  -- Utility science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["utility-science-pack"] = {
    type = "recipe",
    name = "utility-science-pack",
    enabled = false,
    energy_required = 21,
    result_count = 3,
    ingredients = {
      { "low-density-structure", 3 },
      { "processing-unit", 2 },
      { "flying-robot-frame", 1 },
    },
    result = "utility-science-pack",
  }

  --------------------------------------------------------------------------------------
  -- -- Krastorio recipes
  --------------------------------------------------------------------------------------

  krastorio.science_pack_recipes["Krastorio 2"] = {}
  -- Automation science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["automation-science-pack"] = {
    type = "recipe",
    name = "automation-science-pack",
    enabled = false,
    energy_required = 20,
    result_count = 5,
    ingredients = {
      { "blank-tech-card", 5 },
      { "automation-core", 1 },
    },
    result = "automation-science-pack",
  }
  -- Logistic science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["logistic-science-pack"] = {
    type = "recipe",
    name = "logistic-science-pack",
    enabled = false,
    energy_required = 20,
    result_count = 5,
    ingredients = {
      { "blank-tech-card", 5 },
      { "electronic-circuit", 5 },
      { "iron-gear-wheel", 5 },
    },
    result = "logistic-science-pack",
  }
  -- Military science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["military-science-pack"] = {
    type = "recipe",
    name = "military-science-pack",
    enabled = false,
    energy_required = 20,
    result_count = 5,
    ingredients = {
      { "blank-tech-card", 5 },
      { "biters-research-data", 1 },
      { "electronic-components", 5 },
    },
    result = "military-science-pack",
  }
  -- Chemical science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["chemical-science-pack"] = {
    type = "recipe",
    name = "chemical-science-pack",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 20,
    result_count = 5,
    ingredients = {
      { "blank-tech-card", 5 },
      { "glass", 15 },
      { "advanced-circuit", 5 },
      { type = "fluid", name = "sulfuric-acid", amount = 50 },
    },
    result = "chemical-science-pack",
  }
  -- Production science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["production-science-pack"] = {
    type = "recipe",
    name = "production-science-pack",
    enabled = false,
    energy_required = 20,
    result_count = 5,
    ingredients = {
      { "blank-tech-card", 10 },
      { "fast-transport-belt", 10 },
      { "productivity-module", 5 },
      { "uranium-238", 5 },
    },
    result = "production-science-pack",
  }
  -- Utility science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["utility-science-pack"] = {
    type = "recipe",
    name = "utility-science-pack",
    enabled = false,
    energy_required = 20,
    result_count = 5,
    ingredients = {
      { "blank-tech-card", 10 },
      { "processing-unit", 5 },
      { "rocket-fuel", 5 },
      { "low-density-structure", 5 },
    },
    result = "utility-science-pack",
  }
end

-- Add a new recipe variation for one mod
-- (call this function two time with the same mod_name, science_pack_name will overwrite the previus variation)
-- this function must be called with the same argument in setting-update stage and in data-update stage, both!
-- @ mod_name, name of mod that use this recipe for this science pack
-- @ science_pack_name, name of science pack es: "automation-science-pack"
-- @ recipe, all recipe defined as standard of data.raw of Factorio
function krastorio.science_pack_recipes.addRecipeVariation(mod_name, science_pack_name, recipe)
  if not krastorio.science_pack_recipes[mod_name] then
    krastorio.science_pack_recipes[mod_name] = {}
  end
  if data.raw["string-setting"] and data.raw["string-setting"]["kr-" .. science_pack_name .. "-recipe"] then
    table.insert(data.raw["string-setting"]["kr-" .. science_pack_name .. "-recipe"].allowed_values, mod_name)
  else
    krastorio.science_pack_recipes[mod_name][science_pack_name] = recipe
  end
end

return krastorio.science_pack_recipes
