-- TODO: Rename to additional-engine-equipment
data:extend({
  {
    type = "recipe",
    name = "additional-engine",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "electric-engine-unit", amount = 2 },
      { type = "item", name = "electronic-circuit", amount = 5 },
      { type = "item", name = "steel-plate", amount = 5 },
    },
    results = { { type = "item", name = "additional-engine", amount = 1 } },
  },
  {
    type = "item",
    name = "additional-engine",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipments/vehicle/additional-engine.png", icon_size = 64 },
      { icon = "__Krastorio2Assets__/icons/equipments/tiers/1.png", icon_size = 64 },
    },
    placed_as_equipment_result = "additional-engine",
    subgroup = "vehicle-motor",
    order = "e[additional-engines]-e1[advanced-additional-engine]",
    stack_size = 5,
  },
  {
    type = "movement-bonus-equipment",
    name = "additional-engine",
    sprite = {
      filename = "__Krastorio2Assets__/equipments/vehicle/additional-engine.png",
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
