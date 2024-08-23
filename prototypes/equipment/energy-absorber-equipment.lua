local constants = require("scripts.constants")

-- TODO: Rename to energy-absorber-equipment
data:extend({
  {
    type = "recipe",
    name = "energy-absorber",
    energy_required = 3,
    enabled = false,
    ingredients = {
      { type = "item", name = "copper-plate", amount = 6 },
      { type = "item", name = "copper-cable", amount = 12 },
      { type = "item", name = "battery", amount = 6 },
    },
    results = { { type = "item", name = "energy-absorber", amount = 1 } },
  },
  {
    type = "item",
    name = "energy-absorber",
    localised_description = { "equipment-description.energy-absorber" },
    icon = "__Krastorio2Assets__/icons/equipments/universal/energy-absorber.png",
    placed_as_equipment_result = "energy-absorber",
    subgroup = "equipment",
    order = "a1[energy-source]-a1[energy-absorber]",
    stack_size = 10,
  },
  {
    type = "battery-equipment",
    name = "energy-absorber",
    sprite = {
      filename = "__Krastorio2Assets__/equipments/universal/energy-absorber.png",
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
      output_flow_limit = util.format_number(
        constants.tesla_coil.charging_rate * constants.tesla_coil.simultaneous_allowed,
        true
      ) .. "W",
      usage_priority = "primary-output",
    },
    categories = { "universal-equipment" },
  },
})
