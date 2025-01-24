data:extend({
  {
    type = "recipe",
    name = "battery-mk3-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "battery-mk2-equipment", amount = 2 },
      { type = "item", name = "lithium-sulfur-battery", amount = 4 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "battery-mk3-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "battery-mk3-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/battery-mk3-equipment.png", icon_size = 64 },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-3.png", icon_size = 64 },
    },
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/equipment/battery-mk3-equipment.png",
          size = 64,
          mipmap_count = 4,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/icons/equipment/battery-equipment-light.png",
          size = 64,
          mipmap_count = 4,
          scale = 0.5,
          draw_as_light = true,
          flags = { "light" },
        },
      },
    },
    place_as_equipment_result = "battery-mk3-equipment",
    subgroup = "equipment",
    order = "b3[battery]-b5[battery-equipment]",
    stack_size = 20,
  },
  {
    type = "battery-equipment",
    name = "battery-mk3-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/battery-mk3-equipment.png",
      width = 64,
      height = 128,
      priority = "medium",
      scale = 0.5,
    },
    shape = {
      type = "full",
      width = 1,
      height = 2,
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "50MJ",
      input_flow_limit = "1MW",
      output_flow_limit = "2MW",
      usage_priority = "tertiary",
    },
    categories = { "universal-equipment" },
  },
})
