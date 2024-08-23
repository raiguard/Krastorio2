data:extend({
  {
    type = "recipe",
    name = "superior-exoskeleton-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "advanced-exoskeleton-equipment", amount = 1 },
      { type = "item", name = "ai-core", amount = 10 },
      { type = "item", name = "imersium-plate", amount = 10 },
      { type = "item", name = "speed-module-3", amount = 10 },
    },
    results = { { type = "item", name = "superior-exoskeleton-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "superior-exoskeleton-equipment",
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/equipment/superior-exoskeleton-equipment.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-3.png", icon_size = 64 },
    },
    placed_as_equipment_result = "superior-exoskeleton-equipment",
    subgroup = "character-equipment",
    order = "e[exoskeleton]-a3[superior-exoskeleton-equipment]",
    stack_size = 20,
  },
  {
    type = "movement-bonus-equipment",
    name = "superior-exoskeleton-equipment",
    categories = { "armor", "spidertron-only" },
    energy_consumption = "400kW",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    movement_bonus = 0.6,
    shape = {
      width = 2,
      height = 4,
      type = "full",
    },
    sprite = {
      filename = "__Krastorio2Assets__/equipment/superior-exoskeleton-equipment.png",
      width = 128,
      height = 256,
      priority = "medium",
      scale = 0.5,
    },
  },
})
