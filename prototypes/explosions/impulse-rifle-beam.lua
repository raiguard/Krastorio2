data:extend({
  {
    type = "explosion",
    name = "impulse-rifle-beam",
    flags = { "not-on-map" },
    hidden = true,
    subgroup = "explosions",
    rotate = true,
    beam = true,
    animations = {
      {
        filename = "__Krastorio2Assets__/entities/explosions/impulse-rifle-beam.png",
        priority = "extra-high",
        draw_as_glow = true,
        width = 62,
        height = 1,
        frame_count = 6,
        line_length = 6,
      },
    },
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
  },
})
