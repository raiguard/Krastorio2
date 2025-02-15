-- TODO: Figure out how to reconcile this with the fission reactor equipment that is now in base
data:extend({
  {
    type = "recipe",
    name = "nuclear-reactor-equipment",
    energy_required = 60,
    enabled = false,
    ingredients = {
      { type = "item", name = "copper-plate", amount = 50 },
      { type = "item", name = "steel-plate", amount = 50 },
      { type = "item", name = "advanced-circuit", amount = 50 },
    },
    results = { { type = "item", name = "nuclear-reactor-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "nuclear-reactor-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/nuclear-reactor-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-1.png" },
    },
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/equipment/nuclear-reactor-equipment.png",
          size = 64,
          mipmap_count = 4,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/icons/equipment/nuclear-reactor-equipment-light.png",
          size = 64,
          mipmap_count = 4,
          scale = 0.5,
          draw_as_light = true,
          flags = { "light" },
        },
      },
    },
    place_as_equipment_result = "nuclear-reactor-equipment",
    subgroup = "equipment",
    order = "a2[energy-source]-a4[nuclear-reactor-equipment]",
    stack_size = 10,
  },
  {
    type = "generator-equipment",
    name = "nuclear-reactor-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/nuclear-reactor-equipment.png",
      width = 256,
      height = 256,
      priority = "medium",
      scale = 0.5,
    },
    shape = {
      width = 4,
      height = 4,
      type = "full",
    },
    burner = {
      type = "burner",
      fuel_categories = { "nuclear" },
      effectivity = 2,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
    },
    energy_source = {
      type = "electric",
      usage_priority = "primary-output",
    },
    power = "2.4MW", -- 50kW * 16 * 3 * 1
    categories = { "universal-equipment" },
  },
})
