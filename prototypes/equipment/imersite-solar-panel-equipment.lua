data:extend({
  {
    type = "recipe",
    name = "imersite-solar-panel-equipment",
    energy_required = 20,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients = {
      { type = "item", name = "solar-panel-equipment", amount = 1 },
      { type = "item", name = "imersite-crystal", amount = 5 },
      { type = "fluid", name = "nitric-acid", amount = 25 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "imersite-solar-panel-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "imersite-solar-panel-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipments/universal/imersite-solar-panel-equipment.png", icon_size = 64 },
      { icon = "__Krastorio2Assets__/icons/equipments/tiers/2.png", icon_size = 64 },
    },
    placed_as_equipment_result = "imersite-solar-panel-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-a4[imersite-solar-panel-equipment]",
    stack_size = 50,
  },
  {
    type = "solar-panel-equipment",
    name = "imersite-solar-panel-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipments/universal/imersite-solar-panel-equipment.png",
      width = 64,
      height = 64,
      priority = "medium",
      scale = 0.5,
    },
    shape = {
      type = "full",
      width = 1,
      height = 1,
    },
    energy_source = {
      type = "electric",
      usage_priority = "primary-output",
    },
    power = "80kW", -- 40kW * 1 * 2 * 1
    categories = { "universal-equipment" },
  },
})
