kr_pipepictures = function()
  return {
    straight_vertical_single = {
      filename = "__base__/graphics/entity/pipe/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 160,
      height = 160,
      scale = 0.5,
    },
    straight_vertical = {
      filename = "__Krastorio2Assets__/entities/iron-pipe/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    straight_vertical_window = {
      filename = "__Krastorio2Assets__/entities/iron-pipe/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    straight_horizontal_window = {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    straight_horizontal = {
      filename = "__base__/graphics/entity/pipe/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    corner_up_right = {
      filename = "__Krastorio2Assets__/entities/iron-pipe/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    corner_up_left = {
      filename = "__Krastorio2Assets__/entities/iron-pipe/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    corner_down_right = {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    corner_down_left = {
      filename = "__base__/graphics/entity/pipe/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    t_up = {
      filename = "__Krastorio2Assets__/entities/iron-pipe/pipe-t-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    t_down = {
      filename = "__base__/graphics/entity/pipe/pipe-t-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    t_right = {
      filename = "__Krastorio2Assets__/entities/iron-pipe/pipe-t-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    t_left = {
      filename = "__Krastorio2Assets__/entities/iron-pipe/pipe-t-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    cross = {
      filename = "__Krastorio2Assets__/entities/iron-pipe/pipe-cross.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    ending_up = {
      filename = "__Krastorio2Assets__/entities/iron-pipe/pipe-ending-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    ending_down = {
      filename = "__base__/graphics/entity/pipe/pipe-ending-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    ending_right = {
      filename = "__base__/graphics/entity/pipe/pipe-ending-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    ending_left = {
      filename = "__base__/graphics/entity/pipe/pipe-ending-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    horizontal_window_background = {
      filename = "__base__/graphics/entity/pipe/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    vertical_window_background = {
      filename = "__base__/graphics/entity/pipe/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
    },
    fluid_background = {
      filename = "__base__/graphics/entity/pipe/fluid-background.png",
      priority = "extra-high",
      width = 64,
      height = 40,
      scale = 0.5,
    },
    low_temperature_flow = {
      filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18,
    },
    middle_temperature_flow = {
      filename = "__base__/graphics/entity/pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18,
    },
    high_temperature_flow = {
      filename = "__base__/graphics/entity/pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18,
    },
    gas_flow = {
      filename = "__base__/graphics/entity/pipe/steam.png",
      priority = "extra-high",
      line_length = 10,
      width = 48,
      height = 30,
      frame_count = 60,
      axially_symmetrical = false,
      direction_count = 1,
    },
  }
end

data.raw.pipe["pipe"].pictures = kr_pipepictures()
data.raw["pipe-to-ground"]["pipe-to-ground"].pictures = {
  up = {
    filename = "__Krastorio2Assets__/entities/iron-pipe/pipe-to-ground-up.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
  },
  down = {
    filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
  },
  left = {
    filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
  },
  right = {
    filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
    priority = "extra-high",
    width = 128,
    height = 128,
    scale = 0.5,
  },
}