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
-- krastorio.recipes.removeIngredient("solar-panel", { name = "glass", amount = 5 }) -- TODO: WTF?
