local data_util = require("__flib__.data-util")

local tech = data.raw.technology["kr-decorations"]
if not tech then
  return
end

for name, tree in pairs(data.raw["tree"]) do
  table.insert(tech.effects, { type = "unlock-recipe", recipe = name })

  data:extend({
    {
      type = "item",
      name = name,
      icons = data_util.create_icons(tree),
      order = "a[" .. name .. "]",
      subgroup = "kr-decorations-1",
      stack_size = 10,
      place_result = name,
    },
    {
      type = "recipe",
      name = name,
      category = "growing",
      energy_required = 30,
      enabled = false,
      hide_from_player_crafting = true,
      ingredients = {
        { type = "item", name = "wood", amount = 40 },
        { type = "fluid", name = "water", amount = 100 },
      },
      results = { { type = "item", name = name, amount = 1 } },
    },
  })
end

for name, entity in pairs(data.raw["simple-entity"]) do
  -- Super naive and stupid way to check for rocks
  if string.find(name, "%f[%a]rock%f[%A]") and not string.find(name, "asteroid") then
    table.insert(tech.effects, {
      type = "unlock-recipe",
      recipe = name,
    })

    data:extend({
      {
        type = "item",
        name = name,
        icons = data_util.create_icons(entity),
        order = "b[" .. name .. "]",
        subgroup = "kr-decorations-1",
        stack_size = 10,
        place_result = name,
      },
      {
        type = "recipe",
        name = name,
        energy_required = 10,
        enabled = false,
        hide_from_player_crafting = true,
        ingredients = {
          { type = "item", name = "coal", amount = 50 },
          { type = "item", name = "stone", amount = 75 },
        },
        results = { { type = "item", name = name, amount = 1 } },
      },
    })
  end
end
