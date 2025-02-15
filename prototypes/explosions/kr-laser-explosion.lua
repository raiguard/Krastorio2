data:extend({
  {
    type = "explosion",
    name = "kr-laser-explosion",
    icon = "__base__/graphics/item-group/effects.png",
    flags = { "not-on-map" },
    hidden = true,
    subgroup = "explosions",
    animations = {
      filename = "__Krastorio2Assets__/explosions/laser-explosion.png",
      width = 300,
      height = 300,
      frame_count = 47,
      line_length = 8,
      shift = { 0.1875, -0.75 },
      draw_as_glow = true,
      animation_speed = 0.55,
    },
    sound = {
      aggregation = {
        max_count = 2,
        remove = true,
      },
      audible_distance_modifier = 1.95,
      variations = {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 0.75,
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 0.75,
        },
      },
    },
  },
})
