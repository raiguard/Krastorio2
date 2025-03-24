data:extend({
  {
    type = "recipe",
    name = "big-battery-mk3-equipment",
    energy_required = 60,
    enabled = false,
    ingredients = {
      { type = "item", name = "big-battery-mk2-equipment", amount = 2 },
      { type = "item", name = "lithium-sulfur-battery", amount = 4 },
      { type = "item", name = "processing-unit", amount = 2 },
    },
    results = { { type = "item", name = "big-battery-mk3-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "big-battery-mk3-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/big-battery-mk3-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-3.png" },
    },
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/equipment/big-battery-mk3-equipment.png",
          size = 64,
          mipmap_count = 4,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/icons/equipment/big-battery-equipment-light.png",
          size = 64,
          mipmap_count = 4,
          scale = 0.5,
          draw_as_light = true,
          flags = { "light" },
        },
      },
    },
    place_as_equipment_result = "big-battery-mk3-equipment",
    subgroup = "equipment",
    order = "b3[battery]-b6[battery-equipment]",
    stack_size = 20,
  },
  {
    type = "battery-equipment",
    name = "big-battery-mk3-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/big-battery-mk3-equipment.png",
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
      buffer_capacity = "150MJ",
      input_flow_limit = "3MW",
      output_flow_limit = "4MW",
      usage_priority = "tertiary",
    },
    categories = { "armor", "vehicle" },
  },
})
