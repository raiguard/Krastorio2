data:extend({
  {
    type = "recipe",
    name = "additional-engine-equipment",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "electric-engine-unit", amount = 2 },
      { type = "item", name = "electronic-circuit", amount = 5 },
      { type = "item", name = "steel-plate", amount = 5 },
    },
    results = { { type = "item", name = "additional-engine-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "additional-engine-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/additional-engine-equipment.png", icon_size = 64 },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-1.png", icon_size = 64 },
    },
    place_as_equipment_result = "additional-engine-equipment",
    subgroup = "vehicle-motor",
    order = "e[additional-engines]-e1[advanced-additional-engine-equipment]",
    stack_size = 5,
  },
  {
    type = "movement-bonus-equipment",
    name = "additional-engine-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/additional-engine-equipment.png",
      width = 256,
      height = 256,
      scale = 0.5,
      priority = "medium",
    },
    shape = {
      type = "full",
      width = 4,
      height = 4,
    },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    energy_consumption = "100kW",
    movement_bonus = 0.3,
    categories = { "vehicle-motor" },
  },
})
