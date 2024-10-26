local data_util = require("data-util")
local flib_locale = require("__flib__.locale")
local flib_prototypes = require("__flib__.prototypes")
local flib_table = require("__flib__.table")

--- Allows the manipulation of Krastorio 2 matter recipes.
--- @class k2.matter_lib
local matter_lib = {}

--- @class k2.MatterRecipeDefinition
--- @field material data.IngredientPrototype|data.ProductPrototype The material involved in the conversion.
--- @field matter_count float How much matter is involved in one conversion.
--- @field energy_required double? Crafting energy of the recipe. Defaults to `2`.
--- @field needs_stabilizer boolean? If true, a matter stabilizer will be required for this recipe.
--- @field allow_productivity boolean? If true, productivity modules may be used in the deconversion recipe.
--- @field unlocked_by data.TechnologyID? Which technology will unlock the recipe. Defaults to `kr-matter-processing`.

--- Adds a matter conversion recipe (item -> matter).
--- @param def k2.MatterRecipeDefinition
function matter_lib.make_conversion_recipe(def)
  local material = def.material
  --- @cast material data.IngredientPrototype
  local recipe_name = material.name .. "-to-matter"
  if data.raw.recipe[recipe_name] then
    error("Recipe '" .. recipe_name .. "' already exists.'")
  end
  local prototype = flib_prototypes.get(material.type, material.name) --[[@as data.FluidPrototype|data.ItemPrototype]]
  data:extend({
    {
      type = "recipe",
      name = recipe_name,
      localised_name = { "recipe-name.to-matter", flib_locale.of(prototype) },
      icons = {
        { icon = "__Krastorio2Assets__/icons/arrows/arrow-m.png" },
        table.unpack(data_util.transform_icons(data_util.get_icons(prototype), { scale = 0.28, shift = { -8, -6 } })),
        { icon = "__Krastorio2Assets__/icons/fluids/matter.png", scale = 0.28, shift = { 4, 8 } },
      },
      category = "matter-conversion",
      subgroup = "matter-conversion",
      hide_from_player_crafting = true,
      enabled = false,
      energy_required = def.energy_required or 2,
      ingredients = {
        { type = material.type, name = material.name, amount = material.amount },
      },
      results = {
        { type = "fluid", name = "matter", amount = def.matter_count },
        def.needs_stabilizer and { type = "item", name = "charged-matter-stabilizer", amount = 1 } or nil,
      },
      main_product = "",
      allow_as_intermediate = false,
      allow_productivity = def.allow_productivity,
    },
  })
  data_util.add_recipe_unlock(def.unlocked_by or "kr-matter-processing", recipe_name)
end

--- Adds a matter deconversion recipe (matter -> item).
--- @param def k2.MatterRecipeDefinition
function matter_lib.make_deconversion_recipe(def)
  local material = def.material
  --- @cast material data.ProductPrototype
  local recipe_name = "matter-to-" .. material.name
  if data.raw.recipe[recipe_name] then
    error("Recipe '" .. recipe_name .. "' already exists.'")
  end
  if material.type == "research-progress" then
    error("research-progress is not supported in matter recipes.")
  end
  local prototype = flib_prototypes.get(def.material.type --[[@as string]], def.material.name) --[[@as data.FluidPrototype|data.ItemPrototype]]
  data:extend({
    {
      type = "recipe",
      name = recipe_name,
      localised_name = { "recipe-name.matter-to", flib_locale.of(prototype) },
      icons = flib_table.array_merge({
        {
          { icon = "__Krastorio2Assets__/icons/arrows/arrow-i.png" },
          { icon = "__Krastorio2Assets__/icons/fluids/matter.png", scale = 0.28, shift = { 8, -6 } },
        },
        data_util.transform_icons(data_util.get_icons(prototype), { scale = 0.28, shift = { -4, 8 } }),
      }),
      category = "matter-deconversion",
      subgroup = "matter-deconversion",
      hide_from_player_crafting = true,
      enabled = false,
      energy_required = def.energy_required or 2,
      ingredients = {
        { type = "fluid", name = "matter", amount = def.matter_count },
        def.needs_stabilizer and { type = "item", name = "charged-matter-stabilizer", amount = 1 } or nil,
      },
      results = { material },
      main_product = "",
      allow_as_intermediate = false,
      allow_productivity = def.allow_productivity,
      always_show_made_in = true,
      always_show_products = true,
    },
  })
  data_util.add_recipe_unlock(def.unlocked_by or "kr-matter-processing", recipe_name)
end

--- Adds a matter conversion and deconversion recipe with the given data.
--- @param def k2.MatterRecipeDefinition
function matter_lib.make_recipes(def)
  matter_lib.make_conversion_recipe(def)
  matter_lib.make_deconversion_recipe(def)
end

return matter_lib
