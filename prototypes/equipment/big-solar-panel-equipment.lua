data:extend({
  {
    type = "recipe",
    name = "big-solar-panel-equipment",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "solar-panel-equipment", amount = 4 },
      { type = "item", name = "electronic-components", amount = 10 },
    },
    results = { { type = "item", name = "big-solar-panel-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "big-solar-panel-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/big-solar-panel-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-1.png" },
    },
    place_as_equipment_result = "big-solar-panel-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-a3[big-solar-panel-equipment]",
    stack_size = 50,
  },
  {
    type = "solar-panel-equipment",
    name = "big-solar-panel-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/big-solar-panel-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
      scale = 0.5,
    },
    shape = {
      width = 2,
      height = 2,
      type = "full",
    },
    energy_source = {
      type = "electric",
      usage_priority = "primary-output",
    },
    power = "192kW", -- 40kW * 4 * 1 * 1.2
    categories = { "universal-equipment" },
  },
})
