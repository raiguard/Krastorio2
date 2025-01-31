-- water_tile_type_names = { "water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud" }
-- patch_for_inner_corner_of_transition_between_transition = {
--     filename = "__base__/graphics/terrain/water-transitions/water-patch.png",
--     scale = 0.5,
--     width = 64,
--     height = 64,
-- }

-- default_transition_group_id = 0
-- water_transition_group_id = 1
-- out_of_map_transition_group_id = 2

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

-- function water_transition_template(to_tiles, normal_res_transition, high_res_transition, options)
--   return make_generic_transition_template(
--     to_tiles,
--     water_transition_group_id,
--     nil,
--     normal_res_transition,
--     high_res_transition,
--     options,
--     true,
--     true,
--     true
--   )
-- end

-- function make_water_transition_template(
--   to_tiles,
--   normal_res_transition,
--   high_res_transition,
--   options,
--   base_layer,
--   background,
--   mask
-- )
--   return make_generic_transition_template(
--     to_tiles,
--     water_transition_group_id,
--     nil,
--     normal_res_transition,
--     high_res_transition,
--     options,
--     base_layer,
--     background,
--     mask
--   )
-- end

-- function out_of_map_transition_template(to_tiles, normal_res_transition, high_res_transition, options)
--   return make_generic_transition_template(
--     to_tiles,
--     out_of_map_transition_group_id,
--     nil,
--     normal_res_transition,
--     high_res_transition,
--     options,
--     true,
--     true,
--     true
--   )
-- end

-- function make_out_of_map_transition_template(
--   to_tiles,
--   normal_res_transition,
--   high_res_transition,
--   options,
--   base_layer,
--   background,
--   mask
-- )
--   return make_generic_transition_template(
--     to_tiles,
--     out_of_map_transition_group_id,
--     nil,
--     normal_res_transition,
--     high_res_transition,
--     options,
--     base_layer,
--     background,
--     mask
--   )
-- end

-- function generic_transition_between_transitions_template(
--   group1,
--   group2,
--   normal_res_transition,
--   high_res_transition,
--   options
-- )
--   return make_generic_transition_template(
--     nil,
--     group1,
--     group2,
--     normal_res_transition,
--     high_res_transition,
--     options,
--     true,
--     true,
--     true
--   )
-- end

-- function init_transition_between_transition_common_options(base)
--   local t = base or {}

--   t.background_layer_offset = t.background_layer_offset or 1
--   t.background_layer_group = t.background_layer_group or "zero"
--   if t.offset_background_layer_by_tile_layer == nil then
--     t.offset_background_layer_by_tile_layer = true
--   end

--   return t
-- end

-- function init_transition_between_transition_water_out_of_map_options(base)
--   return init_transition_between_transition_common_options(base)

--   --[[
--   local t = base or {}

--   t.background_layer_offset = t.background_layer_offset or 1
--   t.background_layer_group = t.background_layer_group or "water-overlay"
--   t.water_patch = patch_for_inner_corner_of_transition_between_transition
--   --if (t.offset_background_layer_by_tile_layer == nil) then
--   --  t.offset_background_layer_by_tile_layer = true
--   --end

--   return t
--   --]]
-- end

-- base_tile_transition_effect_maps = {}
-- local ttfxmaps = base_tile_transition_effect_maps

-- ttfxmaps.water_stone = {
--   filename_norm = "__base__/graphics/terrain/effect-maps/water-stone-mask.png",
--   filename_high = "__base__/graphics/terrain/effect-maps/water-stone-mask.png",
--   count = 1,
--   o_transition_tall = false,
-- }

-- ttfxmaps.water_stone_to_land = {
--   filename_norm = "__base__/graphics/terrain/effect-maps/water-stone-to-land-mask.png",
--   filename_high = "__base__/graphics/terrain/effect-maps/water-stone-to-land-mask.png",
--   count = 3,
--   u_transition_count = 1,
--   o_transition_count = 0,
-- }

-- ttfxmaps.water_stone_to_out_of_map = {
--   filename_norm = "__base__/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
--   filename_high = "__base__/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
--   count = 3,
--   u_transition_count = 0,
--   o_transition_count = 0,
-- }

-- ttfxmaps.water_stone_to_out_of_map = {
--   filename_norm = "__base__/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
--   filename_high = "__base__/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
--   count = 3,
--   u_transition_count = 0,
--   o_transition_count = 0,
-- }

-- local concrete_transitions = {
--   water_transition_template_with_effect(
--     water_tile_type_names,
--     "__base__/graphics/terrain/water-transitions/concrete.png",
--     "__base__/graphics/terrain/water-transitions/concrete.png",
--     {
--       effect_map = ttfxmaps.water_stone,
--       o_transition_tall = false,
--       u_transition_count = 4,
--       o_transition_count = 4,
--       side_count = 8,
--       outer_corner_count = 8,
--       inner_corner_count = 8,
--       --base = { layer = 40 }
--     }
--   ),
--   -- This doesn't exist?
--   -- concrete_out_of_map_transition,
-- }

-- local concrete_transitions_between_transitions = {
--   make_generic_transition_template( -- generic_transition_between_transitions_template
--     nil,
--     default_transition_group_id,
--     water_transition_group_id,
--     "__base__/graphics/terrain/water-transitions/concrete-transitions.png",
--     "__base__/graphics/terrain/water-transitions/concrete-transitions.png",
--     {
--       effect_map = ttfxmaps.water_stone_to_land,
--       inner_corner_tall = true,
--       inner_corner_count = 3,
--       outer_corner_count = 3,
--       side_count = 3,
--       u_transition_count = 1,
--       o_transition_count = 0,
--     },
--     true,
--     false,
--     true
--   ),
--   make_generic_transition_template(
--     nil,
--     default_transition_group_id,
--     out_of_map_transition_group_id,
--     "__base__/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition-b.png",
--     "__base__/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition-b.png",
--     {
--       inner_corner_tall = true,
--       inner_corner_count = 3,
--       outer_corner_count = 3,
--       side_count = 3,
--       u_transition_count = 1,
--       o_transition_count = 0,
--       base = init_transition_between_transition_common_options(),
--     },
--     true,
--     true,
--     true
--   ),
--   generic_transition_between_transitions_template(
--     water_transition_group_id,
--     out_of_map_transition_group_id,
--     "__base__/graphics/terrain/out-of-map-transition/concrete-shore-out-of-map-transition.png",
--     "__base__/graphics/terrain/out-of-map-transition/concrete-shore-out-of-map-transition.png",
--     {
--       effect_map = ttfxmaps.water_stone_to_out_of_map,
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

local refined_concrete_sounds = {
  {
    filename = "__base__/sound/walking/refined-concrete-1.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-2.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-3.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-4.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-5.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-6.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-7.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-8.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-9.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-10.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-11.ogg",
    volume = 0.75,
  },
}

local tile_graphics = require("__base__.prototypes.tile.tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local concrete_transitions = {
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/concrete.png",
    layout = tile_spritesheet_layout.transition_8_8_8_4_4,
    background_enabled = false,
    effect_map_layout = {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-mask.png",
      inner_corner_count = 1,
      outer_corner_count = 1,
      side_count = 1,
      u_transition_count = 1,
      o_transition_count = 1,
    },
  },
  base_tiles_util.concrete_to_out_of_map_transition,
}

local concrete_transitions_between_transitions = {
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/concrete-transitions.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout = {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-to-land-mask.png",
      o_transition_count = 0,
    },
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition-b.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__base__/graphics/terrain/out-of-map-transition/concrete-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout = {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0,
    },
  },
}

data:extend({
  {
    type = "tile",
    name = "kr-black-reinforced-plate",
    needs_correction = false,
    minable = not data.is_demo and { mining_time = 0.1, result = "kr-black-reinforced-plate" } or nil,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = { layers = { ground_tile = true } },
    walking_speed_modifier = 1.75,
    layer = 95,
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.95,
    variants = {
      transition = {
        overlay_layout = {
          inner_corner = {
            spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates/concrete-inner-corner.png",
            count = 16,
            scale = 0.5,
          },
          outer_corner = {
            spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates/concrete-outer-corner.png",
            count = 8,
            scale = 0.5,
          },
          side = {
            spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates/concrete-side.png",
            count = 16,
            scale = 0.5,
          },
          u_transition = {
            spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates/concrete-u.png",
            count = 8,
            scale = 0.5,
          },
          o_transition = {
            spritesheet = "__Krastorio2Assets__/tiles/reinforced-plates/concrete-o.png",
            count = 4,
            scale = 0.5,
          },
        },
        mask_layout = {
          inner_corner = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
            count = 16,
            scale = 0.5,
          },
          outer_corner = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
            count = 8,
            scale = 0.5,
          },
          side = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
            count = 16,
            scale = 0.5,
          },
          u_transition = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
            count = 8,
            scale = 0.5,
          },
          o_transition = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
            count = 4,
            scale = 0.5,
          },
        },
      },
      material_background = {
        picture = "__Krastorio2Assets__/tiles/reinforced-plates/black-reinforced-plate.png",
        count = 16,
        scale = 0.5,
      },
    },

    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound = refined_concrete_sounds,

    map_color = { r = 40, g = 40, b = 40 },
    absorptions_per_second = { pollution = 0 },
    vehicle_friction_modifier = 0.75,
  },

  {
    type = "tile",
    name = "kr-white-reinforced-plate",
    needs_correction = false,
    minable = not data.is_demo and { mining_time = 0.1, result = "kr-white-reinforced-plate" } or nil,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = { layers = { ground_tile = true } },
    walking_speed_modifier = 1.75,
    layer = 90,
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.95,
    variants = {
      transition = {
        overlay_layout = {
          inner_corner = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
            count = 16,
            scale = 0.5,
          },
          outer_corner = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
            count = 8,
            scale = 0.5,
          },
          side = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-side.png",
            count = 16,
            scale = 0.5,
          },
          u_transition = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-u.png",
            count = 8,
            scale = 0.5,
          },
          o_transition = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-o.png",
            count = 4,
            scale = 0.5,
          },
        },
        mask_layout = {
          inner_corner = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
            count = 16,
            scale = 0.5,
          },
          outer_corner = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
            count = 8,
            scale = 0.5,
          },
          side = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
            count = 16,
            scale = 0.5,
          },
          u_transition = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
            count = 8,
            scale = 0.5,
          },
          o_transition = {
            spritesheet = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
            count = 4,
            scale = 0.5,
          },
        },
      },
      material_background = {
        picture = "__Krastorio2Assets__/tiles/reinforced-plates/white-reinforced-plate.png",
        count = 16,
        scale = 0.5,
      },
    },

    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound = refined_concrete_sounds,

    map_color = { r = 110, g = 110, b = 110 },
    absorptions_per_second = { pollution = 0 },
    vehicle_friction_modifier = 0.75,
  },
})
