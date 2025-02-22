data:extend({
  {
    type = "recipe",
    name = "advanced-exoskeleton-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "exoskeleton-equipment", amount = 1 },
      { type = "item", name = "low-density-structure", amount = 10 },
      { type = "item", name = "processing-unit", amount = 10 },
      { type = "item", name = "speed-module-2", amount = 10 },
    },
    results = { { type = "item", name = "advanced-exoskeleton-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "advanced-exoskeleton-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/advanced-exoskeleton-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-2.png" },
    },
    place_as_equipment_result = "advanced-exoskeleton-equipment",
    subgroup = "character-equipment",
    order = "e[exoskeleton]-a2[advanced-exoskeleton-equipment]",
    stack_size = 20,
  },
  {
    type = "movement-bonus-equipment",
    name = "advanced-exoskeleton-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/advanced-exoskeleton-equipment.png",
      width = 128,
      height = 256,
      priority = "medium",
      scale = 0.5,
    },
    shape = {
      width = 2,
      height = 4,
      type = "full",
    },
    energy_consumption = "300kW",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    categories = { "armor", "spidertron-only" },
    movement_bonus = 0.4,
  },
})
