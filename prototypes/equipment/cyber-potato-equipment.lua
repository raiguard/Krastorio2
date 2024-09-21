data:extend({
  -- Patreon item - no recipe
  {
    type = "item",
    name = "cyber-potato-equipment",
    localised_description = { "equipment-description.cyber-potato-equipment" },
    icon = "__Krastorio2Assets__/icons/equipment/cyber-potato-equipment.png",
    place_as_equipment_result = "cyber-potato-equipment",
    --- @diagnostic disable-next-line
    rocket_launch_product = { "spoiled-potato", 1 }, -- TODO: Rocket launch products are no more
    subgroup = "other",
    hidden = true,
    stack_size = 10,
  },
  {
    type = "generator-equipment",
    name = "cyber-potato-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/cyber-potato-equipment.png",
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
    energy_source = {
      type = "electric",
      usage_priority = "primary-output",
    },
    power = "5.0MW", -- 50kW * 16 * 5 * 1
    categories = { "universal-equipment" },
  },
})
