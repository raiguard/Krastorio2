local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")

local planetary_teleporter_animation = {
  layers = {
    --SHADOW
    {
      filename = kr_entities_path .. "planetary-teleporter/hr-planetary-teleporter-shadow.png",
      priority = "low",
      width = 531,
      height = 292,
      scale = 0.5,
      frame_count = 1,
      repeat_count = 20,
      draw_as_shadow = true,
      animation_speed = 0.5,
      shift = { 1.9, 1.2 },
    },
    --BUILDING
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-base-combined.png",
      priority = "medium",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
    },
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-under-forward-towers.png",
      priority = "medium",
      width = 400,
      height = 475,
      scale = 0.5,
      repeat_count = 20,
      animation_speed = 0.5,
    },
    -- GLOWS
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-base-combined-glow.png",
      priority = "high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
      draw_as_glow = true,
      fadeout = true,
      blend_mode = "additive-soft",
    },
    -- LIGHTS
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-base-combined-glow.png",
      priority = "extra-high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
      draw_as_light = true,
      blend_mode = "additive-soft",
    },
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-forward-towers-light.png",
      priority = "extra-high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
    },
  },
}

local planetary_teleporter_animation_red = {
  layers = {
    --SHADOW
    {
      filename = kr_entities_path .. "planetary-teleporter/hr-planetary-teleporter-shadow.png",
      priority = "low",
      width = 531,
      height = 292,
      scale = 0.5,
      frame_count = 1,
      repeat_count = 20,
      draw_as_shadow = true,
      animation_speed = 0.5,
      shift = { 1.9, 1.2 },
    },
    --BUILDING
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-base-combined.png",
      priority = "medium",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
    },
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-under-forward-towers.png",
      priority = "medium",
      width = 400,
      height = 475,
      scale = 0.5,
      repeat_count = 20,
      animation_speed = 0.5,
    },
    -- TINT
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-base-combined-glow-red.png",
      flags = { "mask" },
      priority = "extra-high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
      apply_runtime_tint = true,
      tint = { r = 1, g = 0, b = 0, a = 1 },
    },
    -- GLOWS
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-base-combined-glow-red.png",
      priority = "high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
      draw_as_glow = true,
      fadeout = true,
      blend_mode = "additive-soft",
    },
    -- LIGHTS
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-base-combined-glow-red.png",
      priority = "extra-high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
      draw_as_light = true,
      blend_mode = "additive-soft",
    },
    {
      filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-forward-towers-light.png",
      priority = "extra-high",
      width = 400,
      height = 475,
      scale = 0.5,
      frame_count = 20,
      line_length = 5,
      animation_speed = 0.5,
    },
  },
}

data:extend({
  {
    type = "accumulator",
    name = "kr-planetary-teleporter",
    icon = kr_entities_icons_path .. "planetary-teleporter.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "placeable-player", "player-creation", "not-rotatable" },
    map_color = { r = 0.337, g = 0.011, b = 0.184 },
    max_health = 20000,
    minable = { mining_time = 10, result = "kr-planetary-teleporter" },
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    collision_box = { { -2.65, -1.9 }, { 2.65, 3.2 } },
    selection_box = { { -3, -2 }, { 3, 3.4 } },
    drawing_box = { { -3, -3 }, { 3, 3 } },
    collision_mask = { "item-layer", "object-layer", "water-tile" },
    resistances = {
      { type = "physical", percent = 75 },
      { type = "fire", percent = 75 },
      { type = "impact", percent = 75 },
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "400MJ",
      input_flow_limit = "20MW",
      usage_priority = "tertiary",
      output_flow_limit = "0W",
    },
    picture = planetary_teleporter_animation,
    charge_animation = planetary_teleporter_animation_red,
    charge_cooldown = 10,
    discharge_cooldown = 10,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = kr_buildings_sounds_path .. "planetary-teleporter-working-sound.ogg",
        volume = 0.50,
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg" },
      apparent_volume = 0.75,
    },
    open_sound = { filename = kr_buildings_sounds_path .. "planetary-teleporter-open-sound.ogg", volume = 1 },
    close_sound = { filename = kr_buildings_sounds_path .. "planetary-teleporter-close-sound.ogg", volume = 0.8 },
    audible_distance_modifier = 30,
    circuit_wire_connection_point = nil, --circuit_connector_definitions["accumulator"].points,
    circuit_connector_sprites = nil, --circuit_connector_definitions["accumulator"].sprites,
    circuit_wire_max_distance = 0, --default_circuit_wire_max_distance,
    default_output_signal = { type = "virtual", name = "signal-P" },
  },
})

local collision_index = 0
local function collision_entity(collision_box)
  collision_index = collision_index + 1
  return {
    type = "simple-entity",
    name = "kr-planetary-teleporter-collision-" .. collision_index,
    flags = { "not-on-map", "not-selectable-in-game", "placeable-off-grid" },
    collision_box = collision_box,
    picture = { filename = "__core__/graphics/empty.png", size = 1 },
    collision_mask = { "player-layer" },
    -- Squeak through compatibility
    squeak_behaviour = false,
  }
end

local function empty_animation()
  return {
    filename = "__core__/graphics/empty.png",
    width = 1,
    height = 1,
    line_length = 1,
    frame_count = 1,
    shift = { 0, 0 },
    animation_speed = 1,
    direction_count = 1,
  }
end

data:extend({
  -- dummy collision entities
  collision_entity({ { -1.5, -1 }, { 1.5, 0.4 } }),
  collision_entity({ { -0.8, -1 }, { 1.4, 1.2 } }),
  collision_entity({ { -1.4, -1 }, { 0.8, 1.2 } }),
  -- overlay
  {
    type = "simple-entity",
    name = "kr-planetary-teleporter-front-layer",
    flags = { "not-on-map", "not-selectable-in-game", "placeable-off-grid" },
    collision_mask = {},
    render_layer = "higher-object-above",
    picture = {
      layers = {
        {
          filename = kr_entities_path .. "planetary-teleporter/new/hr-teleporter-forward-towers.png",
          width = 400,
          height = 475,
          scale = 0.5,
        },
      },
    },
    -- Squeak through compatibility
    squeak_behaviour = false,
  },
  -- collision detection
  {
    type = "trigger-target-type",
    name = "character",
  },
  {
    type = "turret",
    name = "kr-planetary-teleporter-turret",
    icon = kr_entities_icons_path .. "planetary-teleporter.png",
    icon_size = 64,
    icon_mipmaps = 4,
    collision_mask = {},
    call_for_help_radius = 0,
    folded_animation = {
      north = empty_animation(),
      east = empty_animation(),
      south = empty_animation(),
      west = empty_animation(),
    },
    flags = { "not-on-map", "not-selectable-in-game", "placeable-off-grid" },
    attack_parameters = {
      type = "projectile",
      range = 0.75,
      cooldown = 1,
      ammo_type = {
        category = "melee",
        target_type = "position",
        energy_consumption = "1J",
        action = {
          type = "direct",
          action_delivery = {
            type = "instant",
            source_effects = {
              {
                type = "nested-result",
                affects_target = true,
                action = {
                  type = "area",
                  radius = 0.75,
                  collision_mode = "distance-from-center",
                  ignore_collision_condition = true,
                  trigger_target_mask = { "character" },
                  action_delivery = {
                    type = "instant",
                    target_effects = {
                      {
                        type = "script",
                        effect_id = "kr-planetary-teleporter-character-trigger",
                      },
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
  },
})
