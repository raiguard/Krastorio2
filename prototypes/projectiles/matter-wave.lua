data:extend({
  {
    type = "projectile",
    name = "matter-wave",
    flags = { "not-on-map" },
    hidden = true,
    acceleration = 0,
    action = {
      {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-entity",
              entity_name = "small-matter-explosion",
            },
            {
              type = "destroy-cliffs",
              radius = 1.5,
              explosion = "explosion",
            },
            {
              type = "destroy-decoratives",
              from_render_layer = "decorative",
              to_render_layer = "object",
              include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
              include_decals = false,
              invoke_decorative_trigger = true,
              decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
              radius = 2, -- large radius for demostrative purposes
            },
          },
        },
      },
      {
        type = "area",
        radius = 6,
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "damage",
            damage = { amount = 3000, type = "explosion" },
          },
        },
      },
    },
    animation = util.empty_animation(),
    shadow = util.empty_animation(),
  },
})
