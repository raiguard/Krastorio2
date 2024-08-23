-- TODO: Rename to superior-solar-panel-equipment?
--
data:extend({
  {
    type = "recipe",
    name = "big-imersite-solar-panel-equipment",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "imersite-solar-panel-equipment", amount = 4 },
      { type = "item", name = "electronic-components", amount = 40 },
    },
    results = { { type = "item", name = "big-imersite-solar-panel-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "big-imersite-solar-panel-equipment",
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/equipments/universal/big-imersite-solar-panel-equipment.png",
        icon_size = 64,
      },
      { icon = "__Krastorio2Assets__/icons/equipments/tiers/2.png", icon_size = 64 },
    },
    placed_as_equipment_result = "big-imersite-solar-panel-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-a5[imersite-solar-panel-equipment]",
    stack_size = 50,
  },
  {
    type = "solar-panel-equipment",
    name = "big-imersite-solar-panel-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipments/universal/big-imersite-solar-panel-equipment.png",
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
    categories = { "universal-equipment" },
  },
})
