local kr_icons_size = false

if krastorio.general.getSafeSettingValue("kr-large-icons") then
  kr_icons_size = true
end

local s_tint = { r = 1, g = 1, b = 1, a = 1 } -- White (should be never setted)
local setting_color = krastorio.general.getSafeSettingValue("kr-shelter-tint") or "Yellow"

s_tint = { r = 0.9, g = 0.7, b = 0, a = 0.75 }
if setting_color == "Yellow" then
elseif setting_color == "Olive" then
  s_tint = { r = 0.50, g = 0.60, b = 0.2, a = 0.5 }
elseif setting_color == "Pink" then
  s_tint = { r = 1, g = 0.75, b = 0.3, a = 0.5 }
elseif setting_color == "Red" then
  s_tint = { r = 1, g = 0.3, b = 0.3, a = 1 }
elseif setting_color == "Blue" then
  s_tint = { r = 0.20, g = 0.25, b = 0.75, a = 0.75 }
elseif setting_color == "Green" then
  s_tint = { r = 0.2, g = 0.8, b = 0.2, a = 0.8 }
elseif setting_color == "Cyan" then
  s_tint = { r = 0.6, g = 1, b = 1, a = 1 }
elseif setting_color == "Purple" then
  s_tint = { r = 0.45, g = 0.25, b = 0.7, a = 0.72 }
elseif setting_color == "Gray" then
  s_tint = { r = 0.2, g = 0.2, b = 0.2, a = 0.8 }
end

local empty_sprite = {
  filename = kr_entities_path .. "empty.png",
  priority = "high",
  width = 1,
  height = 1,
  scale = 0.5,
  shift = { 0, 0 },
}

local armored_shelter_animation = {
  layers = {
    {
      filename = kr_entities_path .. "shelter-plus/shelter-plus-light.png",
      priority = "high",
      width = 225,
      height = 225,
      scale = 0.9,
      shift = { 0, -0.15 },
      draw_as_light = true,
      frame_count = 6,
      line_length = 3,
      animation_speed = 0.5,
      hr_version = {
        filename = kr_entities_path .. "shelter-plus/hr-shelter-plus-light.png",
        priority = "high",
        width = 450,
        height = 450,
        scale = 0.45,
        shift = { 0, -0.15 },
        draw_as_light = true,
        frame_count = 6,
        line_length = 3,
        animation_speed = 0.5,
      },
    },
    {
      filename = kr_entities_path .. "shelter-plus/shelter-plus.png",
      priority = "high",
      height = 225,
      width = 225,
      scale = 0.9,
      shift = { 0, -0.15 },
      frame_count = 6,
      line_length = 3,
      animation_speed = 0.5,
      hr_version = {
        filename = kr_entities_path .. "shelter-plus/hr-shelter-plus.png",
        priority = "high",
        width = 450,
        height = 450,
        scale = 0.45,
        shift = { 0, -0.15 },
        frame_count = 6,
        line_length = 3,
        animation_speed = 0.5,
      },
    },
    {
      filename = kr_entities_path .. "shelter-plus/shelter-plus-sh.png",
      priority = "high",
      width = 260,
      height = 171,
      scale = 0.9,
      shift = { 0.54, 0.46 },
      frame_count = 1,
      repeat_count = 6,
      animation_speed = 0.5,
      draw_as_shadow = true,
      hr_version = {
        filename = kr_entities_path .. "shelter-plus/hr-shelter-plus-sh.png",
        priority = "high",
        width = 520,
        height = 342,
        scale = 0.45,
        shift = { 0.54, 0.46 },
        frame_count = 1,
        repeat_count = 6,
        animation_speed = 0.5,
        draw_as_shadow = true,
      },
    },
    {
      filename = kr_entities_path .. "shelter-plus/shelter-plus-mask.png",
      flags = { "mask" },
      priority = "extra-high",
      width = 225,
      height = 225,
      scale = 0.9,
      shift = { 0, -0.15 },
      frame_count = 1,
      repeat_count = 6,
      animation_speed = 0.5,
      apply_runtime_tint = true,
      tint = s_tint,
      hr_version = {
        filename = kr_entities_path .. "shelter-plus/hr-shelter-plus-mask.png",
        flags = { "mask" },
        priority = "extra-high",
        width = 450,
        height = 450,
        scale = 0.45,
        shift = { 0, -0.15 },
        frame_count = 1,
        repeat_count = 6,
        animation_speed = 0.5,
        apply_runtime_tint = true,
        tint = s_tint,
      },
    },
  },
}

-- Shelter
data:extend({
  {
    type = "electric-energy-interface",
    name = "kr-shelter-plus",
    localised_description = { "entity-description.kr-shelter-plus" },
    icon = kr_entities_icons_path .. "shelter-plus.png",
    icon_size = 64,
    icon_mipmaps = 4,
    allow_copy_paste = false,
    flags = { "hidden", "not-on-map" },
    fast_replaceable_group = "kr-shelter-plus",
    minable = { mining_time = 0.5, result = "kr-shelter-plus" },
    collision_box = { { -2.72, -2.72 }, { 2.72, 2.72 } },
    selection_box = { { 0, 0 }, { 0, 0 } },
    energy_source = {
      type = "electric",
      buffer_capacity = "250kJ",
      usage_priority = "primary-output",
      input_flow_limit = "0kW",
      output_flow_limit = "250kW",
      render_no_power_icon = false,
      render_no_network_icon = false,
    },
    energy_production = "250kW",
  },
  -- Shelter
  {
    type = "container",
    name = "kr-shelter-plus-container",
    localised_name = { "entity-name.kr-shelter-plus" },
    localised_description = { "entity-description.kr-shelter-plus" },
    icon = kr_entities_icons_path .. "shelter-plus.png",
    icon_size = 64,
    icon_mipmaps = 4,
    allow_copy_paste = false,
    flags = {
      "no-automated-item-insertion",
      "no-automated-item-removal",
      "not-blueprintable",
      "not-rotatable",
      "player-creation",
    },
    minable = { mining_time = 0.5, result = "kr-shelter-plus" },
    max_health = 5000,
    corpse = "kr-medium-random-pipes-remnant",
    collision_box = { { -2.75, -2.75 }, { 2.75, 2.75 } },
    selection_box = { { -3, -3 }, { 3, 3 } },
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 75 },
      { type = "impact", percent = 75 },
    },

    water_reflection = {
      pictures = {
        filename = kr_entities_path .. "shelter/shelter-reflection.png",
        priority = "extra-high",
        width = 60,
        height = 50,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5,
      },
      rotate = false,
      orientation_to_variation = false,
    },

    picture = armored_shelter_animation,
    inventory_size = 200,
    scale_info_icons = kr_icons_size,
    open_sound = { filename = kr_sounds_mod .. "buildings/open.ogg", volume = 1 },
    close_sound = { filename = kr_sounds_mod .. "buildings/close.ogg", volume = 1 },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  },

  -- Shelter light

  {
    type = "lamp",
    name = "kr-shelter-plus-light",
    localised_name = { "entity-name.kr-shelter-plus" },
    localised_description = { "entity-description.kr-shelter-plus" },
    icon = kr_entities_path .. "empty.png",
    icon_size = 1,
    allow_copy_paste = false,
    flags = { "hidden", "not-on-map" },
    collision_box = { { 0, 0 }, { 0, 0 } },
    selection_box = { { 0, 0 }, { 0, 0 } },
    energy_source = { type = "void" },
    energy_usage_per_tick = "1W",
    darkness_for_all_lamps_on = 0.2,
    darkness_for_all_lamps_off = 0.1,
    light = {
      intensity = 0.8,
      size = 12,
      shift = { 0.0, 1.75 },
      color = { r = 0.95, g = 0.88, b = 0.85 },
    },
    light_when_colored = {
      intensity = 1,
      size = 6,
      color = { r = 1.0, g = 1.0, b = 1.0 },
    },
    glow_size = 6,
    glow_color_intensity = 0.25,
    picture_off = empty_sprite,
    picture_on = empty_sprite,
  },
})
