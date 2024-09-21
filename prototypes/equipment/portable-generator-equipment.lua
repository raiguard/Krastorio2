data:extend({
  {
    type = "recipe",
    name = "portable-generator-equipment",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "iron-beam", amount = 2 },
      { type = "item", name = "engine-unit", amount = 2 },
      { type = "item", name = "small-portable-generator-equipment", amount = 2 },
    },
    results = { { type = "item", name = "portable-generator-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "portable-generator-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/portable-generator-equipment.png", icon_size = 64 },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-2.png", icon_size = 64 },
    },
    place_as_equipment_result = "portable-generator-equipment",
    subgroup = "equipment",
    order = "a2[energy-source]-a3[k-generator]",
    stack_size = 10,
  },
  {
    type = "generator-equipment",
    name = "portable-generator-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/portable-generator-equipment.png",
      width = 256,
      height = 256,
      scale = 0.5,
      priority = "medium",
    },
    shape = {
      width = 3,
      height = 3,
      type = "full",
    },
    burner = {
      type = "burner",
      fuel_categories = { "chemical", "vehicle-fuel" },
      effectivity = 2,
      fuel_inventory_size = 2,
      burnt_inventory_size = 1,
      smoke = {
        {
          name = "smoke",
          deviation = { -0.25, -0.25 },
          frequency = 1,
          position = { 0, 0.5 },
          height = 1.25,
          starting_frame_deviation = 60,
        },
      },
    },
    energy_source = {
      type = "electric",
      usage_priority = "primary-output",
    },
    power = "540kW", -- 50kW * 9 * 1 * 1.2
    categories = { "universal-equipment" },
  },
})
