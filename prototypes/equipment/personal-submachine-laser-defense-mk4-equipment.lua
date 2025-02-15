data:extend({
  {
    type = "recipe",
    name = "personal-submachine-laser-defense-mk4-equipment",
    energy_required = 90,
    enabled = false,
    ingredients = {
      { type = "item", name = "personal-submachine-laser-defense-mk3-equipment", amount = 1 },
      { type = "item", name = "ai-core", amount = 10 },
      { type = "item", name = "lithium-sulfur-battery", amount = 10 },
      { type = "item", name = "energy-control-unit", amount = 5 },
    },
    results = { { type = "item", name = "personal-submachine-laser-defense-mk4-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "personal-submachine-laser-defense-mk4-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/personal-submachine-laser-defense-mk4-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-4.png" },
    },
    place_as_equipment_result = "personal-submachine-laser-defense-mk4-equipment",
    subgroup = "equipment",
    order = "d[active-defense]-a5[personal-laser-defense-mk4-equipment]",
    stack_size = 10,
  },
  {
    type = "active-defense-equipment",
    name = "personal-submachine-laser-defense-mk4-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/personal-submachine-laser-defense-mk4-equipment.png",
      width = 128,
      height = 128,
      scale = 0.5,
      priority = "medium",
    },
    shape = {
      type = "full",
      width = 2,
      height = 2,
    },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "75MJ",
      input_flow_limit = "7.5MW",
    },
    automatic = true,
    categories = { "universal-equipment" },
    attack_parameters = {
      type = "beam",
      damage_modifier = 6,
      cooldown = 6,
      range = 22,
      projectile_center = { 0, 0.25 },
      projectile_creation_distance = 0.5,
      ammo_category = "laser",
      ammo_type = {
        energy_consumption = "0.75MJ",
        action = {
          type = "direct",
          action_delivery = {
            {
              type = "beam",
              beam = "laser-beam",
              max_length = 23,
              duration = 3,
              source_offset = { 0, -1.31439 },
            },
          },
        },
      },
    },
  },
})
