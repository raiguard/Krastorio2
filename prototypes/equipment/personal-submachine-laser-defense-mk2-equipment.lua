data:extend({
  {
    type = "recipe",
    name = "personal-submachine-laser-defense-mk2-equipment",
    energy_required = 30,
    enabled = false,
    ingredients = {
      { type = "item", name = "personal-submachine-laser-defense-mk1-equipment", amount = 1 },
      { type = "item", name = "battery", amount = 10 },
      { type = "item", name = "advanced-circuit", amount = 10 },
      { type = "item", name = "steel-plate", amount = 5 },
    },
    results = { { type = "item", name = "personal-submachine-laser-defense-mk2-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "personal-submachine-laser-defense-mk2-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/personal-submachine-laser-defense-mk2-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-2.png", icon_size = 64 },
    },
    place_as_equipment_result = "personal-submachine-laser-defense-mk2-equipment",
    subgroup = "equipment",
    order = "d[active-defense]-a3[personal-laser-defense-mk2-equipment]",
    stack_size = 10,
  },
  {
    type = "active-defense-equipment",
    name = "personal-submachine-laser-defense-mk2-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/personal-submachine-laser-defense-mk2-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
      scale = 0.5,
    },
    shape = {
      type = "full",
      width = 2,
      height = 2,
    },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "40MJ",
      input_flow_limit = "4MW",
    },
    automatic = true,
    categories = { "universal-equipment" },
    attack_parameters = {
      type = "beam",
      damage_modifier = 2,
      cooldown = 6,
      range = 18,
      projectile_center = { 0, 0.25 },
      projectile_creation_distance = 0.5,
      ammo_category = "laser",
      ammo_type = {
        energy_consumption = "0.35MJ",
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
              max_length = 29,
              duration = 3,
              source_offset = { 0, -1.31439 },
            },
          },
        },
      },
    },
  },
})
