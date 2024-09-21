data:extend({
  {
    type = "recipe",
    name = "energy-absorber-equipment",
    energy_required = 3,
    enabled = false,
    ingredients = {
      { type = "item", name = "copper-plate", amount = 6 },
      { type = "item", name = "copper-cable", amount = 12 },
      { type = "item", name = "battery", amount = 6 },
    },
    results = { { type = "item", name = "energy-absorber-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "energy-absorber-equipment",
    localised_description = { "equipment-description.energy-absorber-equipment" },
    icon = "__Krastorio2Assets__/icons/equipment/energy-absorber-equipment.png",
    place_as_equipment_result = "energy-absorber-equipment",
    subgroup = "equipment",
    order = "a1[energy-source]-a1[energy-absorber-equipment]",
    stack_size = 10,
  },
  {
    type = "battery-equipment",
    name = "energy-absorber-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/energy-absorber-equipment.png",
      width = 256,
      height = 256,
      scale = 0.275,
      priority = "medium",
    },
    shape = {
      width = 2,
      height = 2,
      type = "full",
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "5MJ",
      input_flow_limit = "12MW",
      output_flow_limit = "12MW",
      usage_priority = "primary-output",
    },
    categories = { "universal-equipment" },
  },
})
