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
      { type = "item", name = "copper-plate", amount = 1 },
      { type = "item", name = "iron-gear-wheel", amount = 1 },
    },
    results = { { type = "item", name = "automation-science-pack", amount = 1 } },
  }
  -- Logistic science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["logistic-science-pack"] = {
    type = "recipe",
    name = "logistic-science-pack",
    enabled = false,
    energy_required = 6,
    ingredients = {
      { type = "item", name = "inserter", amount = 1 },
      { type = "item", name = "transport-belt", amount = 1 },
    },
    results = { { type = "item", name = "logistic-science-pack", amount = 1 } },
  }
  -- Military science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["military-science-pack"] = {
    type = "recipe",
    name = "military-science-pack",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "piercing-rounds-magazine", amount = 1 },
      { type = "item", name = "grenade", amount = 1 },
      { type = "item", name = "stone-wall", amount = 2 },
    },
    results = { { type = "item", name = "military-science-pack", amount = 2 } },
  }
  -- Chemical science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["chemical-science-pack"] = {
    type = "recipe",
    name = "chemical-science-pack",
    enabled = false,
    energy_required = 24,
    ingredients = {
      { type = "item", name = "engine-unit", amount = 2 },
      { type = "item", name = "advanced-circuit", amount = 3 },
      { type = "item", name = "sulfur", amount = 1 },
    },
    results = { { type = "item", name = "chemical-science-pack", amount = 2 } },
  }
  -- Production science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["production-science-pack"] = {
    type = "recipe",
    name = "production-science-pack",
    enabled = false,
    energy_required = 21,
    ingredients = {
      { type = "item", name = "electric-furnace", amount = 1 },
      { type = "item", name = "productivity-module", amount = 1 },
      { type = "item", name = "rail", amount = 30 },
    },
    results = { { type = "item", name = "production-science-pack", amount = 3 } },
  }
  -- Utility science pack (Vanilla)
  krastorio.science_pack_recipes["Factorio"]["utility-science-pack"] = {
    type = "recipe",
    name = "utility-science-pack",
    enabled = false,
    energy_required = 21,
    ingredients = {
      { type = "item", name = "low-density-structure", amount = 3 },
      { type = "item", name = "processing-unit", amount = 2 },
      { type = "item", name = "flying-robot-frame", amount = 1 },
    },
    results = { { type = "item", name = "utility-science-pack", amount = 3 } },
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
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 5 },
      { type = "item", name = "automation-core", amount = 1 },
    },
    results = { { type = "item", name = "automation-science-pack", amount = 5 } },
  }
  -- Logistic science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["logistic-science-pack"] = {
    type = "recipe",
    name = "logistic-science-pack",
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 5 },
      { type = "item", name = "electronic-circuit", amount = 5 },
      { type = "item", name = "iron-gear-wheel", amount = 5 },
    },
    results = { { type = "item", name = "logistic-science-pack", amount = 5 } },
  }
  -- Military science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["military-science-pack"] = {
    type = "recipe",
    name = "military-science-pack",
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 5 },
      { type = "item", name = "biters-research-data", amount = 1 },
      { type = "item", name = "electronic-components", amount = 5 },
    },
    results = { { type = "item", name = "military-science-pack", amount = 5 } },
  }
  -- Chemical science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["chemical-science-pack"] = {
    type = "recipe",
    name = "chemical-science-pack",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 5 },
      { type = "item", name = "glass", amount = 15 },
      { type = "item", name = "advanced-circuit", amount = 5 },
      { type = "fluid", name = "sulfuric-acid", amount = 50 },
    },
    results = { { type = "item", name = "chemical-science-pack", amount = 5 } },
  }
  -- Production science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["production-science-pack"] = {
    type = "recipe",
    name = "production-science-pack",
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 10 },
      { type = "item", name = "fast-transport-belt", amount = 10 },
      { type = "item", name = "productivity-module", amount = 5 },
      { type = "item", name = "uranium-238", amount = 5 },
    },
    results = { { type = "item", name = "production-science-pack", amount = 5 } },
  }
  -- Utility science pack (Krastorio)
  krastorio.science_pack_recipes["Krastorio 2"]["utility-science-pack"] = {
    type = "recipe",
    name = "utility-science-pack",
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "blank-tech-card", amount = 10 },
      { type = "item", name = "processing-unit", amount = 5 },
      { type = "item", name = "rocket-fuel", amount = 5 },
      { type = "item", name = "low-density-structure", amount = 5 },
    },
    results = { { type = "item", name = "utility-science-pack", amount = 5 } },
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
