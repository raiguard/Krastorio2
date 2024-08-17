local data_util = require("__flib__.data-util")

local item_template = {
  type = "item",
  subgroup = "kr-decorations-1",
  stack_size = 10,
}

local recipe_template = {
  type = "recipe",
  name = nil,
  category = "growing",
  energy_required = 30,
  enabled = false,
  hide_from_player_crafting = true,
  ingredients = {
    { type = "item", name = "wood", amount = 40 },
    { type = "fluid", name = "water", amount = 100 },
  },
}

local rock_recipe_template = {
  type = "recipe",
  name = nil,
  energy_required = 10,
  enabled = false,
  hide_from_player_crafting = true,
  ingredients = {
    { type = "item", name = "coal", amount = 50 },
    { type = "item", name = "stone", amount = 75 },
  },
}

local tech = data.raw["technology"]["kr-decorations"]
if not tech then
  return
end

for name, tree in pairs(data.raw["tree"]) do
  local item = table.deepcopy(item_template)
  item.name = name
  item.icons = data_util.create_icons(tree)
  item.order = "a[" .. name .. "]"
  item.place_result = name

  local recipe = table.deepcopy(recipe_template)
  recipe.name = name
  recipe.results = { { type = "item", name = name, amount = 1 } }

  table.insert(tech.effects, {
    type = "unlock-recipe",
    recipe = name,
  })

  data:extend({ item, recipe })
end

for name, entity in pairs(data.raw["simple-entity"]) do
  -- Super naive and stupid way to check for rocks
  if string.find(name, "%f[%a]rock%f[%A]") and not string.find(name, "asteroid") then
    local item = table.deepcopy(item_template)
    item.name = name
    item.icons = data_util.create_icons(entity)
    item.order = "b[" .. name .. "]"
    item.place_result = name

    local recipe = table.deepcopy(rock_recipe_template)
    recipe.name = name
    recipe.results = { { type = "item", name = name, amount = 1 } }

    table.insert(tech.effects, {
      type = "unlock-recipe",
      recipe = name,
    })

    data:extend({ item, recipe })
  end
end
