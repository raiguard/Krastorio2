local smoke_animations = require("__base__.prototypes.entity.smoke-animations")

data:extend({
  {
    type = "trivial-smoke",
    name = "matter-smoke",
    hidden = true,
    spread_duration = 100,
    duration = 30,
    fade_in_duration = 10,
    fade_away_duration = 20,
    start_scale = 1.5,
    end_scale = 0.2,
    render_layer = "higher-object-under",
    color = { r = 0.15, g = 0.09, b = 0.12, a = 0.5 },
    affected_by_wind = true,
    cyclic = true,
    animation = smoke_animations.trivial_smoke_fast({
      animation_speed = 1 / 6,
      scale = 2,
      flags = { "smoke", "linear-magnification" },
    }),
  },
})
