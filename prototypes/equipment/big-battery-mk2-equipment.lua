data:extend({
  {
    type = "recipe",
    name = "big-battery-mk2-equipment",
    energy_required = 30,
    enabled = false,
    ingredients = {
      { type = "item", name = "big-battery-equipment", amount = 2 },
      { type = "item", name = "steel-plate", amount = 4 },
      { type = "item", name = "advanced-circuit", amount = 2 },
    },
    results = { { type = "item", name = "big-battery-mk2-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "big-battery-mk2-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/big-battery-mk2-equipment.png", icon_size = 64 },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-2.png", icon_size = 64 },
    },
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/equipment/big-battery-mk2-equipment.png",
          size = 64,
          mipmap_count = 4,
          scale = 0.25,
        },
        {
          filename = "__Krastorio2Assets__/icons/equipment/big-battery-equipment-light.png",
          size = 64,
          mipmap_count = 4,
          scale = 0.25,
          draw_as_light = true,
          flags = { "light" },
        },
      },
    },
    place_as_equipment_result = "big-battery-mk2-equipment",
    subgroup = "equipment",
    order = "b2[battery]-b4[battery-equipment]",
    stack_size = 20,
  },
  {
    type = "battery-equipment",
    name = "big-battery-mk2-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/big-battery-mk2-equipment.png",
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
    energy_source = {
      type = "electric",
      buffer_capacity = "75MJ",
      input_flow_limit = "1.5MW",
      output_flow_limit = "2MW",
      usage_priority = "tertiary",
    },
    categories = { "universal-equipment" },
  },
})
