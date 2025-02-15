data:extend({
  {
    type = "recipe",
    name = "personal-submachine-laser-defense-mk3-equipment",
    energy_required = 60,
    enabled = false,
    ingredients = {
      { type = "item", name = "personal-submachine-laser-defense-mk2-equipment", amount = 1 },
      { type = "item", name = "processing-unit", amount = 10 },
      { type = "item", name = "lithium-sulfur-battery", amount = 5 },
      { type = "item", name = "imersium-plate", amount = 5 },
    },
    results = { { type = "item", name = "personal-submachine-laser-defense-mk3-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "personal-submachine-laser-defense-mk3-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/personal-submachine-laser-defense-mk3-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-3.png" },
    },
    place_as_equipment_result = "personal-submachine-laser-defense-mk3-equipment",
    subgroup = "equipment",
    order = "d[active-defense]-a4[personal-laser-defense-mk3-equipment]",
    stack_size = 10,
  },
  {
    type = "active-defense-equipment",
    name = "personal-submachine-laser-defense-mk3-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/personal-submachine-laser-defense-mk3-equipment.png",
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
      buffer_capacity = "60MJ",
      input_flow_limit = "6MW",
    },
    automatic = true,
    categories = { "universal-equipment" },
    attack_parameters = {
      type = "beam",
      damage_modifier = 3,
      cooldown = 6,
      range = 20,
      projectile_center = { 0, 0.25 },
      projectile_creation_distance = 0.5,
      ammo_category = "laser",
      ammo_type = {
        energy_consumption = "0.5MJ",
        action = {
          type = "direct",
          action_delivery = {
            {
              type = "instant",
              target_effects = {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                },
              },
            },
            {
              type = "beam",
              beam = "laser-beam",
              max_length = 21,
              duration = 3,
              source_offset = { 0, -1.31439 },
            },
          },
        },
      },
    },
  },
})
