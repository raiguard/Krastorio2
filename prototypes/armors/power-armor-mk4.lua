local flib_table = require("__flib__.table")

data:extend({
  {
    type = "recipe",
    name = "power-armor-mk4",
    enabled = false,
    energy_required = 40,
    category = "crafting-with-fluid",
    ingredients = {
      { type = "item", name = "power-armor-mk3", amount = 1 },
      { type = "item", name = "ai-core", amount = 40 },
      { type = "item", name = "imersium-plate", amount = 40 },
      { type = "item", name = "imersite-crystal", amount = 10 },
      { type = "fluid", name = "nitric-acid", amount = 50 },
    },
    results = { { type = "item", name = "power-armor-mk4", amount = 1 } },
    requester_paste_multiplier = 1,
  },
  {
    type = "armor",
    name = "power-armor-mk4",
    icon = "__Krastorio2Assets__/icons/armors/power-armor-mk4.png",
    resistances = {
      {
        type = "physical",
        decrease = 30,
        percent = 60,
      },
      {
        type = "acid",
        decrease = 30,
        percent = 80,
      },
      {
        type = "explosion",
        decrease = 50,
        percent = 80,
      },
      {
        type = "fire",
        decrease = 30,
        percent = 90,
      },
      {
        type = "radioactive",
        decrease = 6,
        percent = 80,
      },
    },
    subgroup = "armor",
    order = "g[power-armor-mk4]",
    stack_size = 1,
    infinite = true,
    equipment_grid = "mk4-armor-grid",
    inventory_size_bonus = 50,
  },
})

for _, animation in pairs(data.raw.character.character.animations) do
  if animation.armors and flib_table.find(animation.armors, "power-armor-mk2") then
    animation.armors[#animation.armors + 1] = "power-armor-mk4"
    break
  end
end
