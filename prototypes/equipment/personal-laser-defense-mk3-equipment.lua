data:extend({
  {
    type = "recipe",
    name = "personal-laser-defense-mk3-equipment",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "personal-laser-defense-mk2-equipment", amount = 1 },
      { type = "item", name = "processing-unit", amount = 10 },
      { type = "item", name = "lithium-sulfur-battery", amount = 10 },
      { type = "item", name = "imersium-plate", amount = 5 },
    },
    results = { { type = "item", name = "personal-laser-defense-mk3-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "personal-laser-defense-mk3-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/personal-laser-defense-mk3-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-3.png" },
    },
    subgroup = "equipment",
    order = "d[active-defense]-b3[personal-laser-defense-mk3-equipment]",
    place_as_equipment_result = "personal-laser-defense-mk3-equipment",
    stack_size = 20,
  },
  {
    type = "active-defense-equipment",
    name = "personal-laser-defense-mk3-equipment",
    localised_name = { "equipment-name.personal-sniper-laser-defense-mk3-equipment" },
    localised_description = { "equipment-description.personal-sniper-laser-defense-mk3-equipment" },
    shape = {
      type = "full",
      width = 2,
      height = 2,
    },
    sprite = {
      filename = "__Krastorio2Assets__/equipment/personal-laser-defense-mk3-equipment.png",
      width = 128,
      height = 128,
      scale = 0.5,
      priority = "medium",
    },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      buffer_capacity = "36MJ",
      input_flow_limit = "6MW",
    },
    automatic = true,
    categories = { "universal-equipment" },
    attack_parameters = {
      type = "beam",
      cooldown = 90,
      damage_modifier = 25,
      projectile_center = { 0, 0 },
      range = 35,
      ammo_category = "laser",
      ammo_type = {
        energy_consumption = "6MJ",
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
