local data_util = require("data-util")

data.raw.recipe["battery-equipment"].ingredients = {
  { type = "item", name = "battery", amount = 2 },
  { type = "item", name = "iron-plate", amount = 2 },
  { type = "item", name = "electronic-circuit", amount = 1 },
}
data.raw.recipe["battery-mk2-equipment"].ingredients = {
  { type = "item", name = "battery-equipment", amount = 2 },
  { type = "item", name = "steel-plate", amount = 2 },
  { type = "item", name = "advanced-circuit", amount = 1 },
}

data_util.add_or_replace_ingredient("heavy-armor", "light-armor", { type = "item", name = "light-armor", amount = 1 })
data_util.remove_ingredient("heavy-armor", "copper-plate")

data_util.add_or_replace_ingredient("modular-armor", "heavy-armor", { type = "item", name = "heavy-armor", amount = 1 })
data_util.remove_ingredient("modular-armor", "steel-plate")

data.raw.recipe["night-vision-equipment"].ingredients = {
  { type = "item", name = "advanced-circuit", amount = 2 },
  { type = "item", name = "iron-plate", amount = 1 },
  { type = "item", name = "plastic-bar", amount = 1 },
  { type = "item", name = "glass", amount = 1 },
}

data_util.add_or_replace_ingredient(
  "personal-roboport-equipment",
  "battery",
  { type = "item", name = "battery", amount = 45 }
)
data_util.add_or_replace_ingredient(
  "personal-roboport-equipment",
  "advanced-circuit",
  { type = "item", name = "advanced-circuit", amount = 5 }
)
data_util.add_or_replace_ingredient(
  "personal-roboport-equipment",
  "iron-gear-wheel",
  { type = "item", name = "iron-gear-wheel", amount = 20 }
)
data_util.remove_ingredient("personal-roboport-equipment", "steel-plate")

data_util.add_or_replace_ingredient(
  "personal-roboport-mk2-equipment",
  "processing-unit",
  { type = "item", name = "processing-unit", amount = 20 }
)

data_util.add_or_replace_ingredient(
  "power-armor",
  "modular-armor",
  { type = "item", name = "modular-armor", amount = 1 }
)
data_util.remove_ingredient("power-armor", "steel-plate")

data_util.add_or_replace_ingredient(
  "power-armor-mk2",
  "power-armor",
  { type = "item", name = "power-armor", amount = 1 }
)
data_util.remove_ingredient("power-armor-mk2", "processing-unit")

table.insert(data.raw.recipe["solar-panel-equipment"].ingredients, { type = "item", name = "glass", amount = 5 })

-- TODO: Do we want the custom heavy/light oil icons?
-- data_util.set_icon(data.raw.recipe["coal-liquefaction"], "__Krastorio2Assets__/icons/recipes/coal-liquefaction.png")
-- data_util.set_icon(data.raw.recipe["heavy-oil-cracking"], "__Krastorio2Assets__/icons/recipes/heavy-oil-cracking.png")
-- data_util.set_icon(data.raw.recipe["light-oil-cracking"], "__Krastorio2Assets__/icons/recipes/light-oil-cracking.png")
-- local light_oil_icon = nil
-- if data.raw.fluid["light-oil"].icon == "__base__/graphics/icons/fluid/light-oil.png" then
--   light_oil_icon = "__Krastorio2Assets__/icons/fluids/light-oil.png"
-- else
--   light_oil_icon = data.raw.fluid["light-oil"].icon
-- end
-- local rocket_fuel_icons = {
--   { icon = "__Krastorio2Assets__/icons/recipes/rocket-fuel.png", icon_size = 64 },
--   { icon = light_oil_icon, icon_size = data.raw.fluid["light-oil"].icon_size or 64, scale = 0.26, shift = { 8, -8 } },
-- }
-- krastorio.icons.setRecipeIcons("rocket-fuel", rocket_fuel_icons)

-- local fluids_for_solid_fuel = { "petroleum-gas", "light-oil", "heavy-oil" }
-- for _, fluid in ipairs(fluids_for_solid_fuel) do
--   local icons = {
--     { icon = "__base__/graphics/icons/solid-fuel.png", icon_size = 64 },
--     {
--       icon = "__Krastorio2Assets__/icons/fluids/" .. fluid .. ".png",
--       icon_size = data.raw.fluid[fluid].icon_size or 64,
--       scale = 0.26,
--       shift = { -8, -8 },
--     },
--   }
--   krastorio.icons.setRecipeIcons("solid-fuel-from-" .. fluid, icons)
-- end
