local color = require("__Krastorio2__/lib/private/data-stages/colorRGB")
local matrix = require("__Krastorio2__/lib/private/data-stages/matrix")

-- -- -- FLUID BURNER UTIL
-- Notes: in fluid burner for don't handle a fluid must be blacklisted

if not krastorio.fluid_burner_util then
  krastorio.fluid_burner_util = {}
  -- CONSTANTS
  krastorio.fluid_burner_util.CORNER_PATH = kr_icons_path .. "burn-recipes-background/burn-recipe-corner.png"
  krastorio.fluid_burner_util.CORNER_PATH_MASK = kr_icons_path .. "burn-recipes-background/burn-recipe-corner-mask.png"
  krastorio.fluid_burner_util.ICON_SIZE = 64
  krastorio.fluid_burner_util.SCALE = 0.34
end

-- Blacklisted fluids in burn recipes (singleton table)
if not krastorio.fluid_burner_util.blacklist then
  krastorio.fluid_burner_util.blacklist = {
    ["matter"] = true,
    ["high-pressure-matter"] = true,
  }
end

-- Products of burn recipes (singleton table)
if not krastorio.fluid_burner_util.fluid_products then
  krastorio.fluid_burner_util.fluid_products = {
    ["dirty-water"] = { { type = "item", name = "stone", amount = 1, probability = 0.30 } },
  }
end

-- Emissions of burn recipes (singleton table)
if not krastorio.fluid_burner_util.fluid_emissions_multiplier then
  krastorio.fluid_burner_util.fluid_emissions_multiplier = {
    ["crude-oil"] = 9.0,
    ["heavy-oil"] = 4.0,
    ["light-oil"] = 3.0,
    ["petroleum-gas"] = 2.0,
    ["lubricant"] = 4.0,
    ["oxygen"] = 0.0,
    ["steam"] = 0.0,
    ["water"] = 0.0,
    ["dirty-water"] = 6.0,
    ["chlorine"] = 2.0,
    ["hydrogen"] = 0.0,
    ["hydrogen-chloride"] = 2.0,
    ["ammonia"] = 0.0,
    ["nitrogen"] = 2.0,
  }
end

-- -- -- PUBLIC
-- Notes:
--[[
  This functions must be called in data phase,
  Krastorio generate all burn recipes in data update phase,
  if someone want add post data update phase burn modifications,
  must be regenerate the specific recipes.
]]
--
--------

--[[
  With this funcion, could be blacklisted in Krastorio a fluid for not be
  burn it in Krastorio fluid burner.
]]
--
-- @fluid_name, name of fluid to blacklist
function krastorio.fluid_burner_util.blacklistFluid(fluid_name)
  krastorio.fluid_burner_util.blacklist[fluid_name] = true
end

--[[
  With this funcion, is possible assign a product/products generated from
  burn a specific fluid in Krastorio fluid burner.

  The given table can be composed from one or more products
  must be defined with the standard form of Factorio inventory item:
  table :
  {
    {item_name, amount} or {type="item" item_name=_item_name, amount=_amount},
    ...
  }
  The product/products can't be another fluid! But could have a probability.

  Description of burn recipes suppose that products is composed only by one product
]]
--
-- @fluid_name, name of fluid that create the product
-- @products, the products table for this fluid
function krastorio.fluid_burner_util.addBurnFluidProduct(fluid_name, products)
  if products and #products > 1 then
    krastorio.fluid_burner_util.fluid_products[fluid_name] = products
  end
end
function krastorio.fluid_burner_util.setBurnFluidProduct(fluid_name, products)
  krastorio.fluid_burner_util.addBurnFluidProduct(fluid_name, products)
end

--[[
  With this funcion, is possible assign a emissions_multiplier generated from
  burn a specific fluid in Krastorio fluid burner.

  Can also be used to change exising values.
]]
--
function krastorio.fluid_burner_util.addBurnFluidEmissionsMultiplier(fluid_name, emissions_multiplier)
  if fluid_name and emissions_multiplier then
    krastorio.fluid_burner_util.fluid_emissions_multiplier[fluid_name] = emissions_multiplier
  end
end
function krastorio.fluid_burner_util.setBurnFluidEmissionsMultiplier(fluid_name, emissions_multiplier)
  krastorio.fluid_burner_util.addBurnFluidEmissionsMultiplier(fluid_name, emissions_multiplier)
end

--[[
  Create a burn fluid recipe of one fluid, with some conditions:
  - if fluid exist
  - if fluid is not blacklist
  - will automatically add sub product if present in fluid_burner_util.fluid_products
    added in fluid_burner_util.addBurnFluidProduct(fluid_name, product)
  - if the burn recipe already exist, will be overwritten
]]
--
function krastorio.fluid_burner_util.generateBurnFluidsRecipe(fluid_name)
  if data.raw.fluid[fluid_name] then
    local tech = krastorio.technologies.getTechnologyThatUnlockRecipe("kr-fluid-burner")
    local tech_name = tech and tech.name or nil
    local accepted = false
    if not krastorio.fluid_burner_util.blacklist[fluid_name] then
      accepted = true
    end -- blacklist

    if tech_name and accepted then
      local fluid = data.raw.fluid[fluid_name]
      local recipe = {
        type = "recipe",
        name = "kr-burn-" .. fluid.name,
        localised_name = { "recipe-name.kr-burn", fluid.localised_name or { "fluid-name." .. fluid.name } },
        localised_description = {
          "recipe-description.kr-burn",
          fluid.localised_name or { "fluid-name." .. fluid.name },
        },
        category = "fuel-burning",
        icons = {
          {
            icon = krastorio.fluid_burner_util.CORNER_PATH,
            icon_size = krastorio.fluid_burner_util.ICON_SIZE,
          },
          {
            icon = krastorio.fluid_burner_util.CORNER_PATH_MASK,
            icon_size = krastorio.fluid_burner_util.ICON_SIZE,
            tint = krastorio.fluid_burner_util.setTransparency(fluid.base_color, 0.9),
          },
        },
        crafting_machine_tint = {
          primary = fluid.base_color,
          secondary = krastorio.fluid_burner_util.setTransparency(fluid.base_color, 0.35),
          tertiary = krastorio.fluid_burner_util.setTransparency(fluid.flow_color, 0.5),
          quaternary = krastorio.fluid_burner_util.setTransparency(fluid.flow_color, 0.75),
        },
        energy_required = 2,
        enabled = false,
        hidden = true,
        hide_from_player_crafting = true,
        always_show_products = false,
        show_amount_in_title = false,
        ingredients = {
          { type = "fluid", name = fluid.name, amount = 100 },
        },
        results = {
          { type = "item", name = "kr-void", amount = 0 },
        },
        subgroup = "kr-void",
        order = fluid.order,
      }

      -- complete icon overlay
      krastorio.icons.addOverlayIcons(
        recipe,
        krastorio.icons.getIconsForOverlay(fluid),
        krastorio.fluid_burner_util.ICON_SIZE,
        krastorio.fluid_burner_util.SCALE
      )

      -- if have a residue, insert in product and changed description
      if krastorio.fluid_burner_util.fluid_products[fluid.name] then
        recipe.results = krastorio.fluid_burner_util.fluid_products[fluid.name]
        recipe.always_show_products = true
        recipe.localised_description = {
          "recipe-description.kr-burn-with-residue",
          { "fluid-name." .. fluid.name },
          { "item-name." .. krastorio.items.getItemName(krastorio.fluid_burner_util.fluid_products[fluid.name][1]) },
        }
      end

      -- if have a special emissions multiplier
      if krastorio.fluid_burner_util.fluid_emissions_multiplier[fluid.name] then
        recipe.emissions_multiplier = krastorio.fluid_burner_util.fluid_emissions_multiplier[fluid.name]
      end

      data:extend({ recipe })
      krastorio.technologies.addUnlockRecipe(tech_name, recipe.name)
    end
  end
end

--[[
  Disable a specific burn recipe, need the name of fluid
--]]
function krastorio.fluid_burner_util.removeBurnFluidsRecipe(fluid_name)
  local recipe = krastorio.recipes.getRecipeFromName("kr-burn-" .. fluid_name)
  if recipe then
    recipe.enabled = false
    krastorio.technologies.removeUnlockRecipe(
      krastorio.technologies.getTechnologyThatUnlockRecipe("kr-fluid-burner").name,
      recipe.name
    )
  end
end

-- For fade the fluid corner colors, used in flame quaternary colors definition
function krastorio.fluid_burner_util.setTransparency(colour, alpha)
  colour.a = alpha
  return colour
end

-- See https://en.wikipedia.org/wiki/Color_balance#Scaling_monitor_R,_G,_and_B
function krastorio.fluid_burner_util.scalingColorMonitor(fixer, colour)
  local fixer_matrix = matrix({ { fixer.r, 0, 0 }, { 0, fixer.g, 0 }, { 0, 0, fixer.b } })
  local colour_matrix = matrix({ { colour.r }, { colour.g }, { colour.b } })

  local result_matrix = fixer_matrix * colour_matrix

  return { r = result_matrix[1][1], g = result_matrix[2][1], b = result_matrix[3][1] }
end

-- -- -- KRASTORIO ONLY (Use it if you know what you are doing)

-- Generate all recipes
function krastorio.fluid_burner_util.generateBurnFluidsRecipes()
  for _, fluid in pairs(data.raw.fluid) do
    krastorio.fluid_burner_util.generateBurnFluidsRecipe(fluid.name)
  end
end

return krastorio.fluid_burner_util
