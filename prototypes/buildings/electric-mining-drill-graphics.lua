local graphics = {}

function graphics.smoke()
  return {
    priority = "high",
    filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill-smoke.png",
    line_length = 6,
    width = 48,
    height = 72,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    direction_count = 1,
    shift = util.by_pixel(0, 3),
    scale = 0.5,
  }
end

function graphics.smoke_front()
  return {
    priority = "high",
    filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill-smoke-front.png",
    line_length = 6,
    width = 148,
    height = 132,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    direction_count = 1,
    shift = util.by_pixel(-3, 9),
    scale = 0.5,
  }
end

function graphics.shadow_animation()
  return {
    priority = "high",
    filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill-shadow.png",
    line_length = 7,
    width = 232,
    height = 50,
    frame_count = 21,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_shadow_sequence,
    draw_as_shadow = true,
    shift = util.by_pixel(49, 7),
    scale = 0.5,
  }
end

function graphics.horizontal_shadow_animation()
  return {
    priority = "high",
    filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill-horizontal-shadow.png",
    line_length = 7,
    width = 236,
    height = 138,
    frame_count = 21,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_shadow_sequence,
    draw_as_shadow = true,
    shift = util.by_pixel(48, 5),
    scale = 0.5,
  }
end

function graphics.mk2_animation()
  return {
    priority = "high",
    filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill.png",
    line_length = 6,
    width = 194,
    height = 154,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    direction_count = 1,
    shift = util.by_pixel(0, -21),
    scale = 0.5,
  }
end

function graphics.mk2_horizontal_animation()
  return {
    priority = "high",
    filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill-horizontal.png",
    line_length = 6,
    width = 104,
    height = 178,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    direction_count = 1,
    shift = util.by_pixel(-3, -27),
    scale = 0.5,
  }
end

function graphics.horizontal_front_animation()
  return {
    priority = "high",
    filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill-horizontal-front.png",
    line_length = 6,
    width = 54,
    height = 136,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    direction_count = 1,
    shift = util.by_pixel(14, -23),
    scale = 0.5,
  }
end

function graphics.mk3_animation()
  return {
    priority = "high",
    filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk3/electric-mining-drill.png",
    line_length = 6,
    width = 194,
    height = 154,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    direction_count = 1,
    shift = util.by_pixel(0, -21),
    scale = 0.5,
  }
end

function graphics.mk3_horizontal_animation()
  return {
    priority = "high",
    filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk3/electric-mining-drill-horizontal.png",
    line_length = 6,
    width = 104,
    height = 178,
    frame_count = 30,
    animation_speed = electric_drill_animation_speed,
    frame_sequence = electric_drill_animation_sequence,
    direction_count = 1,
    shift = util.by_pixel(-3, -27),
    scale = 0.5,
  }
end

function graphics.status_leds_working_visualisation()
  local led_blend_mode = nil -- "additive"
  local led_tint = { 1, 1, 1, 0.5 }
  return {
    apply_tint = "status",
    always_draw = true,
    draw_as_sprite = true,
    draw_as_light = true,
    north_animation = {
      filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill-N-light.png",
      width = 30,
      height = 32,
      blend_mode = led_blend_mode,
      tint = led_tint,
      shift = util.by_pixel(26, -69),
      scale = 0.5,
    },
    east_animation = {
      filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill-E-light.png",
      width = 32,
      height = 34,
      blend_mode = led_blend_mode,
      tint = led_tint,
      shift = util.by_pixel(41, -45),
      scale = 0.5,
    },
    south_animation = {
      filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill-S-light.png",
      width = 32,
      height = 30,
      blend_mode = led_blend_mode,
      tint = led_tint,
      shift = util.by_pixel(26, 10),
      scale = 0.5,
    },
    west_animation = {
      filename = "__Krastorio2Assets__/buildings/electric-mining-drill-mk2/electric-mining-drill-W-light.png",
      width = 32,
      height = 34,
      blend_mode = led_blend_mode,
      tint = led_tint,
      shift = util.by_pixel(-42, -45),
      scale = 0.5,
    },
  }
end

function graphics.shift_animation_waypoints()
  -- stylua: ignore start
  return {
    -- Movement should be between 0.3-0.5 distance
    -- Bounds -0.7 - 0.6
    north = {{0, 0}, {0, 0.4}, {0, 0.1}, {0, -0.25}, {0, -0.5}, {0, -0.2}, {0, 0}, {0, -0.4}, {0, -0.1}, {0, 0.2}, {0, 0.6}, {0, 0.3}, {0, -0.1}, {0, -0.4}, {0, 0}, {0, 0.3}},
    -- Bounds -0.6 - 0.4
    east = {{0, 0}, {0.4, 0}, {0.1, 0}, {-0.3, 0}, {-0.6, 0}, {-0.2, 0}, {0.1, 0}, {-0.3, 0}, {0, 0}, {-0.35, 0}, {-0.6, 0}, {-0.2, 0}, {0.1, 0}, {-0.3, 0}},
    -- Bounds -0.7 - 0.5
    south = {{0, 0}, {0, -0.4}, {0, -0.1}, {0, 0.2}, {0, 0.5}, {0, 0.3}, {0, 0}, {0, 0.4}, {0, 0.1}, {0, -0.2}, {0, -0.6}, {0, -0.3}, {0, 0.1}, {0, 0.4}, {0, 0}, {0, -0.3}},
    -- Bounds -0.4 - 0.6
    west = {{0, 0}, {-0.4, 0}, {-0.1, 0}, {0.3, 0}, {0.6, 0}, {0.2, 0}, {-0.1, 0}, {0.3, 0}, {0, 0}, {0.35, 0}, {0.6, 0}, {0.2, 0}, {-0.1, 0}, {0.3, 0}},
  }
  -- stylua: ignore end
end

return graphics
