-- This file exists purely for legacy purposes - the creep tile is no longer present in the mod.
--- @diagnostic disable

-- Sounds
local collect_creep_sound = {
  filename = "__Krastorio2Assets__/sounds/tiles/creep-deconstruction.ogg",
  aggregation = {
    max_count = 1,
    remove = false,
    count_already_playing = true,
  },
}
local creep_walking_sound = {
  variations = {
    {
      filename = "__Krastorio2Assets__/sounds/tiles/creep-walk-1.ogg",
      volume = 0.75,
    },
    {
      filename = "__Krastorio2Assets__/sounds/tiles/creep-walk-2.ogg",
      volume = 0.75,
    },
    {
      filename = "__Krastorio2Assets__/sounds/tiles/creep-walk-3.ogg",
      volume = 0.75,
    },
    {
      filename = "__Krastorio2Assets__/sounds/tiles/creep-walk-4.ogg",
      volume = 0.80,
    },
    {
      filename = "__Krastorio2Assets__/sounds/tiles/creep-walk-5.ogg",
      volume = 0.75,
    },
    {
      filename = "__Krastorio2Assets__/sounds/tiles/creep-walk-6.ogg",
      volume = 0.80,
    },
    {
      filename = "__Krastorio2Assets__/sounds/tiles/creep-walk-7.ogg",
      volume = 0.75,
    },
    {
      filename = "__Krastorio2Assets__/sounds/tiles/creep-walk-8.ogg",
      volume = 0.80,
    },
  },
  aggregation = {
    max_count = 6,
    remove = false,
    count_already_playing = true,
  },
}

-- Sprites
-- water_tile_type_names = { "water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud" }
-- default_transition_group_id = 0
-- water_transition_group_id = 1
-- out_of_map_transition_group_id = 2
-- patch_for_inner_corner_of_transition_between_transition = {
--     filename = "__base__/graphics/terrain/water-transitions/water-patch.png",
--     scale = 0.5,
--     width = 64,
--     height = 64,
-- }

-- local function create_transition_to_out_of_map_from_template(normal_res_template_path, high_res_template_path, options)
--   return make_out_of_map_transition_template({ "out-of-map" }, normal_res_template_path, high_res_template_path, {
--     o_transition_tall = false,
--     side_count = 8,
--     inner_corner_count = 4,
--     outer_corner_count = 4,
--     u_transition_count = 1,
--     o_transition_count = 1,
--     base = init_transition_between_transition_common_options(),
--   }, options.has_base_layer == true, options.has_background == true, options.has_mask == true)
-- end

-- local function water_transition_template_with_effect(to_tiles, normal_res_transition, high_res_transition, options)
--   return make_generic_transition_template(
--     to_tiles,
--     water_transition_group_id,
--     nil,
--     normal_res_transition,
--     high_res_transition,
--     options,
--     true,
--     false,
--     true
--   )
-- end

-- local ground_to_out_of_map_transition = create_transition_to_out_of_map_from_template(
--   "__base__/graphics/terrain/out-of-map-transition/out-of-map-transition.png",
--   "__base__/graphics/terrain/out-of-map-transition/out-of-map-transition.png",
--   { has_base_layer = false, has_background = true, has_mask = true }
-- )
-- base_tile_transition_effect_maps = {}
-- local ttfxmaps = base_tile_transition_effect_maps

-- ttfxmaps.water_creep = {
--   filename_norm = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
--   filename_high = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
--   count = 8,
--   o_transition_tall = false,
--   u_transition_count = 2,
--   o_transition_count = 1,
-- }

-- ttfxmaps.water_creep_to_land = {
--   filename_norm = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
--   filename_high = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
--   count = 3,
--   u_transition_count = 1,
--   o_transition_count = 0,
-- }

-- ttfxmaps.water_creep_to_out_of_map = {
--   filename_norm = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
--   filename_high = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
--   count = 3,
--   u_transition_count = 0,
--   o_transition_count = 0,
-- }

-- local creep_out_of_map_transition = make_generic_transition_template(
--   nil,
--   default_transition_group_id,
--   out_of_map_transition_group_id,
--   "__base__/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
--   "__base__/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
--   {
--     inner_corner_tall = true,
--     inner_corner_count = 3,
--     outer_corner_count = 3,
--     side_count = 3,
--     u_transition_count = 1,
--     o_transition_count = 0,
--     base = init_transition_between_transition_common_options(),
--   },
--   false,
--   true,
--   true
-- )

-- local creep_transitions = {
--   water_transition_template_with_effect(
--     water_tile_type_names,
--     "__base__/graphics/terrain/water-transitions/dark-dirt.png",
--     "__base__/graphics/terrain/water-transitions/dark-dirt.png",
--     {
--       effect_map = ttfxmaps.water_creep,
--       o_transition_tall = false,
--       u_transition_count = 2,
--       o_transition_count = 4,
--       side_count = 8,
--       outer_corner_count = 8,
--       inner_corner_count = 8,
--     }
--   ),
--   ground_to_out_of_map_transition,
-- }

-- local creep_transitions_between_transitions = {
--   make_generic_transition_template( --generic_transition_between_transitions_template
--     nil,
--     default_transition_group_id,
--     water_transition_group_id,
--     "__base__/graphics/terrain/water-transitions/dark-dirt-transition.png",
--     "__base__/graphics/terrain/water-transitions/dark-dirt-transition.png",
--     {
--       effect_map = ttfxmaps.water_creep_to_land,
--       o_transition_tall = false,
--       inner_corner_count = 3,
--       outer_corner_count = 3,
--       side_count = 3,
--       u_transition_count = 1,
--       o_transition_count = 0,
--       base = { water_patch = patch_for_inner_corner_of_transition_between_transition },
--     },
--     true,
--     false,
--     true
--   ),
--   creep_out_of_map_transition,
--   generic_transition_between_transitions_template(
--     water_transition_group_id,
--     out_of_map_transition_group_id,
--     "__base__/graphics/terrain/out-of-map-transition/dark-dirt-shore-out-of-map-transition.png",
--     "__base__/graphics/terrain/out-of-map-transition/dark-dirt-shore-out-of-map-transition.png",
--     {
--       effect_map = ttfxmaps.water_creep_to_out_of_map,
--       o_transition_tall = false,
--       inner_corner_count = 3,
--       outer_corner_count = 3,
--       side_count = 3,
--       u_transition_count = 1,
--       o_transition_count = 0,
--       base = init_transition_between_transition_water_out_of_map_options(),
--     }
--   ),
-- }

-- ~~~CREEP

local tile_graphics = require("__base__.prototypes.tile.tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local creep_out_of_map_transition = {
  transition_group1 = default_transition_group_id,
  transition_group2 = out_of_map_transition_group_id,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/dirt-out-of-map-transition.png",
  layout = tile_spritesheet_layout.transition_3_3_3_1_0,
  overlay_enabled = false,
}

local creep_transitions = {
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/dry-dirt.png",
    layout = tile_spritesheet_layout.transition_8_8_8_2_4,
    background_enabled = false,
    effect_map_layout = {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      o_transition_count = 1,
    },
  },
  -- This is ground_to_out_of_map_transition (data/base/prototypes/tile/tiles.lua)
  {
    to_tiles = out_of_map_tile_type_names,
    transition_group = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_4_4_8_1_1,
    overlay_enabled = false,
  },
}

local creep_transitions_between_transitions = {
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/dry-dirt-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout = {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0,
    },

    water_patch = patch_for_inner_corner_of_transition_between_transition,
  },
  creep_out_of_map_transition,
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/dry-dirt-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout = {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0,
    },
  },
}

data:extend({
  {
    type = "tile",
    name = "kr-creep",
    order = "b-a-a",
    needs_correction = false,
    can_be_part_of_blueprint = true,
    collision_mask = {
      layers = { ghost = true, ground_tile = true, floor = true },
      not_colliding_with_itself = true,
    },
    minable = { mining_time = 15, result = "biomass", probability = 0.35, amount = 1 },
    walking_speed_modifier = 0.35,
    layer = 200,
    transition_overlay_layer_offset = 3,
    decorative_removal_probability = 0.35,
    variants = tile_variations_template(
      "__Krastorio2Assets__/tiles/creep/creep.png",
      "__base__/graphics/terrain/masks/transition-1.png",
      {
        max_size = 4,
        [1] = {
          weights = { 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05 },
        },
        [2] = {
          probability = 1,
          weights = { 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05 },
        },
        [4] = {
          probability = 1,
          weights = { 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05 },
        },
      }
    ),
    map_color = { r = 80, g = 60, b = 65 },
    absorptions_per_second = { pollution = 0.005 },
    vehicle_friction_modifier = 175,

    mined_sound = collect_creep_sound,
    walking_sound = creep_walking_sound,

    transitions = creep_transitions,
    transitions_between_transitions = creep_transitions_between_transitions,
  },
})
