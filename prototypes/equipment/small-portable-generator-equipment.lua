data:extend({
  {
    type = "recipe",
    name = "small-portable-generator-equipment",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "engine-unit", amount = 1 },
      { type = "item", name = "iron-beam", amount = 2 },
    },
    results = { { type = "item", name = "small-portable-generator-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "small-portable-generator-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/small-portable-generator-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-1.png" },
    },
    place_as_equipment_result = "small-portable-generator-equipment",
    subgroup = "equipment",
    order = "a2[energy-source]-a2[small-portable-generator-equipment]",
    stack_size = 10,
  },
  {
    type = "generator-equipment",
    name = "small-portable-generator-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/small-portable-generator-equipment.png",
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
    power = "200kW", -- 50kW * 4 * 1 * 1
    categories = { "universal-equipment" },
  },
})
