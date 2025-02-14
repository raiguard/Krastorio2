data:extend({
  {
    type = "explosion",
    name = "matter-shockwave",
    flags = { "not-on-map" },
    hidden = true,
    animations = {
      {
        filename = "__Krastorio2Assets__/explosions/matter-shockwave-1.png",
        priority = "high",
        flags = { "smoke" },
        line_length = 8,
        width = 132,
        height = 136,
        frame_count = 32,
        animation_speed = 0.5,
        shift = util.by_pixel(-0.5, 0),
        scale = 1.5,
      },
      {
        filename = "__Krastorio2Assets__/explosions/matter-shockwave-2.png",
        priority = "high",
        flags = { "smoke" },
        line_length = 8,
        width = 110,
        height = 128,
        frame_count = 32,
        animation_speed = 0.5,
        shift = util.by_pixel(0, 3),
        scale = 1.5,
      },
    },
  },
})
