data:extend({
  {
    type = "recipe",
    name = "energy-shield-mk3-equipment",
    energy_required = 40,
    enabled = false,
    ingredients = {
      { type = "item", name = "energy-shield-mk2-equipment", amount = 5 },
      { type = "item", name = "electronic-components", amount = 20 },
      { type = "item", name = "lithium-sulfur-battery", amount = 10 },
    },
    results = { { type = "item", name = "energy-shield-mk3-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "energy-shield-mk3-equipment",
    localised_name = { "equipment-name.shield-generator-mk3" },
    localised_description = { "equipment-description.shield-generator-mk3" },
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/equipment/energy-shield-mk3-equipment.png",
        icon_size = 64,
        mipmap_count = 4,
      },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-3.png", icon_size = 64 },
    },
    place_as_equipment_result = "energy-shield-mk3-equipment",
    subgroup = "equipment",
    order = "b[shield]-c[energy-shield-equipment-mk3]",
    stack_size = 50,
  },
  {
    type = "energy-shield-equipment",
    name = "energy-shield-mk3-equipment",
    localised_name = { "equipment-name.shield-generator-mk3" },
    localised_description = { "equipment-description.shield-generator-mk3" },
    sprite = {
      filename = "__Krastorio2Assets__/equipment/energy-shield-mk3-equipment.png",
      width = 128,
      height = 128,
      scale = 0.5,
      priority = "medium",
    },
    shape = {
      type = "full",
      width = 2,
      height = 2,
    },
    max_shield_value = 200,
    energy_per_shield = "40kJ",
    energy_source = {
      type = "electric",
      usage_priority = "primary-input",
      buffer_capacity = "270kJ",
      input_flow_limit = "540kW",
    },
    categories = { "universal-equipment" },
  },
})
