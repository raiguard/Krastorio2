local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local function railgun_turret_attack_sheet(inputs)
  return {
    layers = {
      {
        width = 440,
        height = 380,
        frame_count = inputs.frame_count and inputs.frame_count or 4,
        axially_symmetrical = false,
        direction_count = 64,
        animation_speed = 0.35,
        shift = { 0, -0.7 },
        stripes = {
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-1.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-2.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-3.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-4.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
        },
        scale = 0.5,
      },

      {
        flags = { "mask" },
        line_length = inputs.frame_count or 4,
        width = 440,
        height = 380,
        frame_count = inputs.frame_count or 4,
        axially_symmetrical = false,
        direction_count = 64,
        shift = { 0, -0.7 },
        apply_runtime_tint = true,
        stripes = {
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-maks-1.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-maks-2.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-maks-3.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-maks-4.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
        },
        scale = 0.5,
      },

      {
        width = 440,
        height = 380,
        frame_count = inputs.frame_count and inputs.frame_count or 4,
        axially_symmetrical = false,
        direction_count = 64,
        shift = { 0.9, -0.05 },
        draw_as_shadow = true,
        stripes = {
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-shadow-1.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-shadow-2.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-shadow-3.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
          {
            filename = "__Krastorio2Assets__/entities/turrets/railgun-turret-attack-sheet-shadow-4.png",
            width_in_frames = inputs.frame_count or 4,
            height_in_frames = 16,
          },
        },
        scale = 0.5,
      },
    },
  }
end

data:extend({
  {
    type = "recipe",
    name = "kr-railgun-turret",
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "gun-turret", amount = 4 },
      { type = "item", name = "steel-beam", amount = 10 },
      { type = "item", name = "processing-unit", amount = 10 },
      { type = "item", name = "rare-metals", amount = 20 },
      { type = "item", name = "low-density-structure", amount = 10 },
    },
    results = { { type = "item", name = "kr-railgun-turret", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-railgun-turret",
    icon = "__Krastorio2Assets__/icons/entities/railgun-turret.png",
    subgroup = "railgun-turret",
    order = "a01[railgun-turret]",
    place_result = "kr-railgun-turret",
    stack_size = 50,
  },
  {
    type = "ammo-turret",
    name = "kr-railgun-turret",
    icon = "__Krastorio2Assets__/icons/entities/railgun-turret.png",
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "kr-railgun-turret" },
    collision_box = { { -1.75, -1.75 }, { 1.75, 1.75 } },
    selection_box = { { -2, -2 }, { 2, 2 } },
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 0.2,
    rotation_speed = 0.002,
    attack_parameters = {
      type = "projectile",
      ammo_category = "railgun-shell",
      cooldown = 120,
      projectile_creation_distance = 3.25,
      projectile_center = { 0, 0.15 },
      range = 50,
      min_range = 20,
      rotate_penalty = 20,
      health_penalty = -100,
      sound = {
        {
          filename = "__Krastorio2Assets__/sounds/weapons/railgun.ogg",
          volume = 1.5,
        },
      },
    },
    call_for_help_radius = 80,
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
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    folded_animation = railgun_turret_attack_sheet({ frame_count = 1, line_length = 1 }),
    attacking_animation = railgun_turret_attack_sheet({ frame_count = 4, line_length = 4 }),
    graphics_set = {
      base_visualisation = {
        animation = {
          layers = {
            {
              filename = "__Krastorio2Assets__/entities/turrets/kr-turret-base.png",
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
              filename = "__Krastorio2Assets__/entities/turrets/kr-turret-base-mask.png",
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
              filename = "__Krastorio2Assets__/entities/turrets/kr-turret-base-shadow.png",
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
          filename = "__Krastorio2Assets__/entities/turrets/turrets-reflection.png",
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
  },
})
