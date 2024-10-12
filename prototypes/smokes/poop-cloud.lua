data:extend({
  {
    type = "smoke-with-trigger",
    name = "poop-cloud",
    flags = { "not-on-map" },
    show_when_smoke_off = true,
    particle_count = 16,
    particle_spread = { 3.6 * 1.05, 3.6 * 0.6 * 1.05 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    wave_speed = { 1 / 80, 1 / 60 },
    wave_distance = { 0.3, 0.2 },
    spread_duration_variation = 20,
    particle_duration_variation = 60 * 3,
    render_layer = "object",
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20,
    fade_away_duration = 2 * 60,
    spread_duration = 20,
    color = { r = 0.5, g = 0.4, b = 0.35, a = 0.690 }, -- #3ddffdb0,
    animation = {
      width = 152,
      height = 120,
      line_length = 5,
      frame_count = 60,
      shift = { -0.53125, -0.4375 },
      priority = "high",
      animation_speed = 0.25,
      filename = "__base__/graphics/entity/smoke/smoke.png",
      flags = { "smoke" },
    },
    created_effect = {
      {
        type = "cluster",
        cluster_count = 10,
        distance = 4,
        distance_deviation = 5,
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "poop-cloud-visual-dummy",
            initial_height = 0,
          },
        },
      },
      {
        type = "cluster",
        cluster_count = 11,
        distance = 8 * 1.1,
        distance_deviation = 2,
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "create-smoke",
            show_in_tooltip = false,
            entity_name = "poop-cloud-visual-dummy",
            initial_height = 0,
          },
        },
      },
    },
    working_sound = {
      sound = {
        filename = "__base__/sound/fight/poison-cloud.ogg",
        volume = 0.7,
      },
    },
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          type = "nested-result",
          action = {
            type = "area",
            radius = 11,
            entity_flags = { "breaths-air" },
            action_delivery = {
              type = "instant",
              target_effects = {
                type = "damage",
                damage = { amount = 8, type = "poison" },
              },
            },
          },
        },
      },
    },
    action_cooldown = 30,
  },
})
