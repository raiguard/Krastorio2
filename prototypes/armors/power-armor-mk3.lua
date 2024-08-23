local flib_table = require("__flib__.table")

data:extend({
  {
    type = "recipe",
    name = "power-armor-mk3",
    enabled = false,
    energy_required = 40,
    ingredients = {
      { type = "item", name = "power-armor-mk2", amount = 1 },
      { type = "item", name = "speed-module-3", amount = 25 },
      { type = "item", name = "effectivity-module-3", amount = 25 },
      { type = "item", name = "energy-control-unit", amount = 25 },
    },
    results = { { type = "item", name = "power-armor-mk3", amount = 1 } },
    requester_paste_multiplier = 1,
  },
  {
    type = "armor",
    name = "power-armor-mk3",
    icon = "__Krastorio2Assets__/icons/equipments/character/power-armor-mk3.png",
    resistances = {
      {
        type = "physical",
        decrease = 20,
        percent = 50,
      },
      {
        type = "acid",
        decrease = 30,
        percent = 70,
      },
      {
        type = "explosion",
        decrease = 40,
        percent = 70,
      },
      {
        type = "fire",
        decrease = 20,
        percent = 80,
      },
      {
        type = "radioactive",
        decrease = 5,
        percent = 60,
      },
    },
    subgroup = "armor",
    order = "f[power-armor-mk3]",
    stack_size = 1,
    infinite = true,
    equipment_grid = "mk3-armor-grid",
    inventory_size_bonus = 40,
  },
})

for _, animation in pairs(data.raw.character.character.animations) do
  if animation.armors and flib_table.find(animation.armors, "power-armor-mk2") then
    animation.armors[#animation.armors + 1] = "power-armor-mk3"
    break
  end
end
