data:extend({
  {
    type = "recipe",
    name = "big-superior-solar-panel-equipment",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "superior-solar-panel-equipment", amount = 4 },
      { type = "item", name = "electronic-components", amount = 40 },
    },
    results = { { type = "item", name = "big-superior-solar-panel-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "big-superior-solar-panel-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/big-superior-solar-panel-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-2.png" },
    },
    place_as_equipment_result = "big-superior-solar-panel-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-a5[superior-solar-panel-equipment]",
    stack_size = 50,
  },
  {
    type = "solar-panel-equipment",
    name = "big-superior-solar-panel-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/big-superior-solar-panel-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
      scale = 0.5,
    },
    shape = {
      type = "full",
      width = 2,
      height = 2,
    },
    energy_source = {
      type = "electric",
      usage_priority = "primary-output",
    },
    power = "384kW", -- 40kW * 4 * 2 * 1.2
    categories = { "armor", "vehicle" },
  },
})
