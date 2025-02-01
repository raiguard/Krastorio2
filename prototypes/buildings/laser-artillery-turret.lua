local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local function laser_artillery_turret_sheet(inputs)
  return {
    layers = {
      {
        filename = "__Krastorio2Assets__/buildings/laser-artillery-turret/laser-artillery-turret.png",
        width = 440,
        height = 380,
        line_length = inputs.frame_count or 8,
        frame_count = inputs.frame_count or 1,
        axially_symmetrical = false,
        direction_count = 64,
        shift = { 0, -0.7 },
        scale = 0.5,
      },
      {
        flags = { "mask" },
        filename = "__Krastorio2Assets__/buildings/laser-artillery-turret/laser-artillery-turret-mask.png",
        width = 440,
        height = 380,
        line_length = inputs.frame_count or 8,
        frame_count = inputs.frame_count or 1,
        axially_symmetrical = false,
        direction_count = 64,
        shift = { 0, -0.7 },
        apply_runtime_tint = true,
        scale = 0.5,
      },
      {
        filename = "__Krastorio2Assets__/buildings/laser-artillery-turret/laser-artillery-turret-shadow.png",
        width = 460,
        height = 380,
        line_length = inputs.frame_count or 8,
        frame_count = inputs.frame_count or 1,
        axially_symmetrical = false,
        direction_count = 64,
        shift = { 0.9, 0.05 },
        draw_as_shadow = true,
        scale = 0.5,
      },
    },
  }
end

data:extend({
  {
    type = "recipe",
    name = "kr-laser-artillery-turret",
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "energy-control-unit", amount = 6 },
      { type = "item", name = "steel-beam", amount = 10 },
      { type = "item", name = "rare-metals", amount = 20 },
      { type = "item", name = "ai-core", amount = 10 },
      { type = "item", name = "low-density-structure", amount = 10 },
    },
    results = { { type = "item", name = "kr-laser-artillery-turret", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-laser-artillery-turret",
    icon = "__Krastorio2Assets__/icons/entities/laser-artillery-turret.png",
    subgroup = "vanilla-turrets",
    order = "b[turret]-e[artillery-turret]-a[laser-artillery-turret]",
    place_result = "kr-laser-artillery-turret",
    stack_size = 50,
  },
  {
    type = "electric-turret",
    name = "kr-laser-artillery-turret",
    icon = "__Krastorio2Assets__/icons/entities/laser-artillery-turret.png",
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-laser-artillery-turret" },
    collision_box = { { -1.75, -1.75 }, { 1.75, 1.75 } },
    selection_box = { { -2, -2 }, { 2, 2 } },
    rotation_speed = 0.002,
    preparing_speed = 0.08,
    folding_speed = 0.02,
    shoot_in_prepare_state = false,
    turret_base_has_direction = true,
    call_for_help_radius = 110,
    attack_parameters = {
      type = "projectile",
      cooldown = 120,
      projectile_creation_distance = 3.9,
      projectile_center = { 0, 0.2 },
      range = 7 * 32, -- same of artillery is 7 * 32
      min_range = 32, -- same of artillery is 32
      ammo_category = "laser",
      ammo_type = {
        target_type = "entity",
        energy_consumption = "99.9MJ",
        action = {
          type = "direct",
          action_delivery = {
            type = "projectile",
            projectile = "laser-projectile",
            starting_speed = 5,
            direction_deviation = 0.1,
            range_deviation = 0.1,
            max_range = 7 * 32, -- same of artillery
            source_effects = {
              type = "create-explosion",
              entity_name = "kr-laser-explosion-gunshot",
            },
          },
        },
      },
      rotate_penalty = 200,
      health_penalty = -10000,
      --warmup = 27, -- its strongly reduce rate of fire, was used to sync the sounds of turret when shot
      sound = {
        {
          filename = "__Krastorio2Assets__/sounds/weapons/laser-artillery-turret-shot.ogg",
          volume = 1,
        },
      },
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "100MJ",
      input_flow_limit = "150MW",
      drain = "50MW",
      usage_priority = "primary-input",
    },
    max_health = 1000,
    corpse = "turret-remnant",
    damaged_trigger_effect = hit_effects.entity(),
    dying_explosion = "big-explosion",
    resistances = {
      { type = "physical", percent = 50 },
      { type = "fire", percent = 75 },
      { type = "impact", percent = 75 },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    starting_attack_sound = {
      {
        filename = "__Krastorio2Assets__/sounds/weapons/laser-artillery-turret-starting_attack_sound.ogg",
        volume = 0.40,
      },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    graphics_set = {
      base_visualisation = {
        animation = {
          layers = {
            {
              filename = "__Krastorio2Assets__/buildings/turret-common/turret-base.png",
              priority = "high",
              width = 440,
              height = 380,
              axially_symmetrical = false,
              direction_count = 1,
              frame_count = 1,
              shift = { 0, -0.8 },
              scale = 0.5,
            },
            {
              filename = "__Krastorio2Assets__/buildings/turret-common/turret-base-mask.png",
              flags = { "mask", "low-object" },
              line_length = 1,
              width = 440,
              height = 380,
              axially_symmetrical = false,
              direction_count = 1,
              frame_count = 1,
              shift = { 0, -0.8 },
              apply_runtime_tint = true,
              scale = 0.5,
            },
            {
              filename = "__Krastorio2Assets__/buildings/turret-common/turret-base-shadow.png",
              line_length = 1,
              width = 440,
              height = 380,
              axially_symmetrical = false,
              draw_as_shadow = true,
              direction_count = 1,
              frame_count = 1,
              shift = { 0, -0.8 },
              scale = 0.5,
            },
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = "__Krastorio2Assets__/buildings/turret-common/turret-reflection.png",
          priority = "extra-high",
          width = 50,
          height = 50,
          shift = util.by_pixel(0, 40),
          variation_count = 1,
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },
    },
    energy_glow_animation = laser_turret_shooting_glow(),
    folded_animation = laser_artillery_turret_sheet({ direction_count = 8, line_length = 1 }),
    glow_light_intensity = 0.5, -- defaults to 0
  },
})
