data:extend({
  {
    type = "recipe",
    name = "big-battery-equipment",
    energy_required = 15,
    enabled = false,
    ingredients = {
      { type = "item", name = "battery-equipment", amount = 4 },
      { type = "item", name = "iron-plate", amount = 4 },
      { type = "item", name = "copper-plate", amount = 1 },
    },
    results = { { type = "item", name = "big-battery-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "big-battery-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/big-battery-equipment.png", icon_size = 64 },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-1.png", icon_size = 64 },
    },
    pictures = {
      layers = {
        {
          size = 64,
          filename = "__Krastorio2Assets__/icons/equipment/big-battery-equipment.png",
          scale = 0.25,
          mipmap_count = 4,
        },
        {
          draw_as_light = true,
          flags = { "light" },
          size = 64,
          filename = "__Krastorio2Assets__/icons/equipment/big-battery-equipment-light.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
    },
    place_as_equipment_result = "big-battery-equipment",
    subgroup = "equipment",
    order = "b1[battery]-b2[battery-equipment]",
    stack_size = 20,
  },
  {
    type = "battery-equipment",
    name = "big-battery-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/big-battery-equipment.png",
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
      buffer_capacity = "30MJ",
      input_flow_limit = "0.75MW",
      output_flow_limit = "1MW",
      usage_priority = "tertiary",
    },
    categories = { "universal-equipment" },
  },
})
