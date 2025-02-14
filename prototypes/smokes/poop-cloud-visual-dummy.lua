data:extend({
  {
    type = "smoke-with-trigger",
    name = "poop-cloud-visual-dummy",
    flags = { "not-on-map" },
    hidden = true,
    show_when_smoke_off = true,
    particle_count = 24,
    particle_spread = { 3.6 * 1.05, 3.6 * 0.6 * 1.05 },
    particle_distance_scale_factor = 0.5,
    particle_scale_factor = { 1, 0.707 },
    particle_duration_variation = 60 * 3,
    wave_speed = { 0.5 / 80, 0.5 / 60 },
    wave_distance = { 1, 0.5 },
    spread_duration_variation = 300 - 20,

    render_layer = "object",

    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 20 + 4 * 60,
    fade_away_duration = 3 * 60,
    spread_duration = (300 - 20) / 2,
    color = { r = 0.5, g = 0.4, b = 0.35, a = 0.690 }, -- #035b6452

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
  },
})
