data:extend({
  {
    type = "recipe",
    name = "personal-laser-defense-mk4-equipment",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "personal-laser-defense-mk3-equipment", amount = 1 },
      { type = "item", name = "ai-core", amount = 10 },
      { type = "item", name = "lithium-sulfur-battery", amount = 20 },
      { type = "item", name = "energy-control-unit", amount = 10 },
    },
    results = { { type = "item", name = "personal-laser-defense-mk4-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "personal-laser-defense-mk4-equipment",
    icons = {
      {
        icon = "__Krastorio2Assets__/icons/equipment/personal-laser-defense-mk4-equipment.png",
        icon_size = 64,
      },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-4.png", icon_size = 64 },
    },
    order = "d[active-defense]-b4[personal-laser-defense-mk4-equipment]",
    placed_as_equipment_result = "personal-laser-defense-mk4-equipment",
    stack_size = 20,
    subgroup = "equipment",
  },
  {
    type = "active-defense-equipment",
    name = "personal-laser-defense-mk4-equipment",
    localised_name = { "equipment-name.personal-sniper-laser-defense-mk4-equipment" },
    localised_description = { "equipment-description.personal-sniper-laser-defense-mk4-equipment" },
    shape = {
      type = "full",
      width = 2,
      height = 2,
    },
    sprite = {
      filename = "__Krastorio2Assets__/equipment/personal-laser-defense-mk4-equipment.png",
      width = 128,
      height = 128,
      scale = 0.5,
      priority = "medium",
    },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "50MJ",
      input_flow_limit = "10MW",
    },
    automatic = true,
    categories = { "universal-equipment" },
    attack_parameters = {
      type = "beam",
      cooldown = 100,
      damage_modifier = 30,
      projectile_center = { 0, 0 },
      range = 37.5,
      ammo_category = "laser",
      ammo_type = {
        energy_consumption = "8MJ",
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
              max_length = 40,
              duration = 40,
              source_offset = { 0, -1.31439 },
            },
          },
        },
      },
    },
  },
})
