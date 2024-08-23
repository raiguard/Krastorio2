data:extend({
  {
    type = "recipe",
    name = "personal-submachine-laser-defense-mk1-equipment",
    energy_required = 15,
    enabled = false,
    ingredients = {
      { type = "item", name = "laser-turret", amount = 1 },
      { type = "item", name = "battery", amount = 5 },
      { type = "item", name = "electronic-components", amount = 10 },
      { type = "item", name = "iron-plate", amount = 5 },
    },
    results = { { type = "item", name = "personal-submachine-laser-defense-mk1-equipment", amount = 1 } },
  },
  {
    type = "item",
    name = "personal-submachine-laser-defense-mk1-equipment",
    icons = {
      { icon = "__Krastorio2Assets__/icons/equipment/personal-submachine-laser-defense-mk1-equipment.png" },
      { icon = "__Krastorio2Assets__/icons/equipment/tier-1.png", icon_size = 64 },
    },
    placed_as_equipment_result = "personal-submachine-laser-defense-mk1-equipment",
    subgroup = "equipment",
    order = "d[active-defense]-a2[personal-laser-defense-mk2-equipment]",
    stack_size = 10,
  },
  {
    type = "active-defense-equipment",
    name = "personal-submachine-laser-defense-mk1-equipment",
    sprite = {
      filename = "__Krastorio2Assets__/equipment/personal-submachine-laser-defense-mk1-equipment.png",
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
      buffer_capacity = "20MJ",
      input_flow_limit = "2MW",
    },
    automatic = true,
    categories = { "universal-equipment" },
    attack_parameters = {
      type = "beam",
      damage_modifier = 1.5,
      cooldown = 6,
      range = 15,
      projectile_center = { 0, 0.25 },
      projectile_creation_distance = 0.5,
      sound = {
        filename = "__base__/sound/fight/pulse.ogg",
        volume = 0.3,
      },
      ammo_category = "laser",
      ammo_type = {
        energy_consumption = "0.2MJ",
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
              max_length = 16,
              duration = 3,
              source_offset = { 0, -1.31439 },
            },
          },
        },
      },
    },
  },
})
