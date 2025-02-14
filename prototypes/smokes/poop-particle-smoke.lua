data:extend({
  {
    type = "trivial-smoke",
    name = "poop-particle-smoke",
    hidden = true,
    animation = {
      filename = "__base__/graphics/entity/smoke-fast/smoke-fast.png",
      priority = "high",
      width = 50,
      height = 50,
      frame_count = 16,
      animation_speed = 16 / 60,
      scale = 0.2,
    },
    duration = 60,
    fade_away_duration = 60,
    render_layer = "higher-object-above",
    color = { r = 0.5, g = 0.4, b = 0.35, a = 0.690 },
  },
})
