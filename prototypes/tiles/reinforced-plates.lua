water_tile_type_names = { "water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud" }
patch_for_inner_corner_of_transition_between_transition = {
  filename = "__base__/graphics/terrain/water-transitions/water-patch.png",
  width = 32,
  height = 32,
  hr_version = {
    filename = "__base__/graphics/terrain/water-transitions/hr-water-patch.png",
    scale = 0.5,
    width = 64,
    height = 64,
  },
}

default_transition_group_id = 0
water_transition_group_id = 1
out_of_map_transition_group_id = 2

local function water_transition_template_with_effect(to_tiles, normal_res_transition, high_res_transition, options)
  return make_generic_transition_template(
    to_tiles,
    water_transition_group_id,
    nil,
    normal_res_transition,
    high_res_transition,
    options,
    true,
    false,
    true
  )
end

function water_transition_template(to_tiles, normal_res_transition, high_res_transition, options)
  return make_generic_transition_template(
    to_tiles,
    water_transition_group_id,
    nil,
    normal_res_transition,
    high_res_transition,
    options,
    true,
    true,
    true
  )
end

function make_water_transition_template(
  to_tiles,
  normal_res_transition,
  high_res_transition,
  options,
  base_layer,
  background,
  mask
)
  return make_generic_transition_template(
    to_tiles,
    water_transition_group_id,
    nil,
    normal_res_transition,
    high_res_transition,
    options,
    base_layer,
    background,
    mask
  )
end

function out_of_map_transition_template(to_tiles, normal_res_transition, high_res_transition, options)
  return make_generic_transition_template(
    to_tiles,
    out_of_map_transition_group_id,
    nil,
    normal_res_transition,
    high_res_transition,
    options,
    true,
    true,
    true
  )
end

function make_out_of_map_transition_template(
  to_tiles,
  normal_res_transition,
  high_res_transition,
  options,
  base_layer,
  background,
  mask
)
  return make_generic_transition_template(
    to_tiles,
    out_of_map_transition_group_id,
    nil,
    normal_res_transition,
    high_res_transition,
    options,
    base_layer,
    background,
    mask
  )
end

function generic_transition_between_transitions_template(
  group1,
  group2,
  normal_res_transition,
  high_res_transition,
  options
)
  return make_generic_transition_template(
    nil,
    group1,
    group2,
    normal_res_transition,
    high_res_transition,
    options,
    true,
    true,
    true
  )
end

function init_transition_between_transition_common_options(base)
  local t = base or {}

  t.background_layer_offset = t.background_layer_offset or 1
  t.background_layer_group = t.background_layer_group or "zero"
  if t.offset_background_layer_by_tile_layer == nil then
    t.offset_background_layer_by_tile_layer = true
  end

  return t
end

function init_transition_between_transition_water_out_of_map_options(base)
  return init_transition_between_transition_common_options(base)

  --[[
  local t = base or {}

  t.background_layer_offset = t.background_layer_offset or 1
  t.background_layer_group = t.background_layer_group or "water-overlay"
  t.water_patch = patch_for_inner_corner_of_transition_between_transition
  --if (t.offset_background_layer_by_tile_layer == nil) then
  --  t.offset_background_layer_by_tile_layer = true
  --end

  return t
  --]]
end

base_tile_transition_effect_maps = {}
local ttfxmaps = base_tile_transition_effect_maps

ttfxmaps.water_stone = {
  filename_norm = "__base__/graphics/terrain/effect-maps/water-stone-mask.png",
  filename_high = "__base__/graphics/terrain/effect-maps/hr-water-stone-mask.png",
  count = 1,
  o_transition_tall = false,
}

ttfxmaps.water_stone_to_land = {
  filename_norm = "__base__/graphics/terrain/effect-maps/water-stone-to-land-mask.png",
  filename_high = "__base__/graphics/terrain/effect-maps/hr-water-stone-to-land-mask.png",
  count = 3,
  u_transition_count = 1,
  o_transition_count = 0,
}

ttfxmaps.water_stone_to_out_of_map = {
  filename_norm = "__base__/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
  filename_high = "__base__/graphics/terrain/effect-maps/hr-water-stone-to-out-of-map-mask.png",
  count = 3,
  u_transition_count = 0,
  o_transition_count = 0,
}

ttfxmaps.water_stone_to_out_of_map = {
  filename_norm = "__base__/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
  filename_high = "__base__/graphics/terrain/effect-maps/hr-water-stone-to-out-of-map-mask.png",
  count = 3,
  u_transition_count = 0,
  o_transition_count = 0,
}

local concrete_transitions = {
  water_transition_template_with_effect(
    water_tile_type_names,
    "__base__/graphics/terrain/water-transitions/concrete.png",
    "__base__/graphics/terrain/water-transitions/hr-concrete.png",
    {
      effect_map = ttfxmaps.water_stone,
      o_transition_tall = false,
      u_transition_count = 4,
      o_transition_count = 4,
      side_count = 8,
      outer_corner_count = 8,
      inner_corner_count = 8,
      --base = { layer = 40 }
    }
  ),
  -- This doesn't exist?
  -- concrete_out_of_map_transition,
}

local concrete_transitions_between_transitions = {
  make_generic_transition_template( -- generic_transition_between_transitions_template
    nil,
    default_transition_group_id,
    water_transition_group_id,
    "__base__/graphics/terrain/water-transitions/concrete-transitions.png",
    "__base__/graphics/terrain/water-transitions/hr-concrete-transitions.png",
    {
      effect_map = ttfxmaps.water_stone_to_land,
      inner_corner_tall = true,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
    },
    true,
    false,
    true
  ),
  make_generic_transition_template(
    nil,
    default_transition_group_id,
    out_of_map_transition_group_id,
    "__base__/graphics/terrain/out-of-map-transition/concrete-out-of-map-transition-b.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-concrete-out-of-map-transition-b.png",
    {
      inner_corner_tall = true,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
      base = init_transition_between_transition_common_options(),
    },
    true,
    true,
    true
  ),
  generic_transition_between_transitions_template(
    water_transition_group_id,
    out_of_map_transition_group_id,
    "__base__/graphics/terrain/out-of-map-transition/concrete-shore-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-concrete-shore-out-of-map-transition.png",
    {
      effect_map = ttfxmaps.water_stone_to_out_of_map,
      o_transition_tall = false,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
      base = init_transition_between_transition_water_out_of_map_options(),
    }
  ),
}

local refined_concrete_sounds = {
  {
    filename = "__base__/sound/walking/refined-concrete-01.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-02.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-03.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-04.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-05.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-06.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-07.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-08.ogg",
    volume = 0.75,
  },
  {
    filename = "__base__/sound/walking/refined-concrete-09.ogg",
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

data:extend({
  {
    type = "tile",
    name = "kr-black-reinforced-plate",
    needs_correction = false,
    minable = not data.is_demo and { mining_time = 0.1, result = "kr-black-reinforced-plate" } or nil,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = { "ground-tile" },
    walking_speed_modifier = 1.75,
    layer = 95,
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.95,
    variants = {
      main = {
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 1,
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39,
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1,
        },
      },
      inner_corner = {
        picture = kr_tiles_path .. "reinforced-plates/concrete-inner-corner.png",
        count = 16,
        hr_version = {
          picture = kr_tiles_path .. "reinforced-plates/hr-concrete-inner-corner.png",
          count = 16,
          scale = 0.5,
        },
      },
      inner_corner_mask = {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
        count = 16,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner-mask.png",
          count = 16,
          scale = 0.5,
        },
      },

      outer_corner = {
        picture = kr_tiles_path .. "reinforced-plates/concrete-outer-corner.png",
        count = 8,
        hr_version = {
          picture = kr_tiles_path .. "reinforced-plates/hr-concrete-outer-corner.png",
          count = 8,
          scale = 0.5,
        },
      },
      outer_corner_mask = {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
        count = 8,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner-mask.png",
          count = 8,
          scale = 0.5,
        },
      },

      side = {
        picture = kr_tiles_path .. "reinforced-plates/concrete-side.png",
        count = 16,
        hr_version = {
          picture = kr_tiles_path .. "reinforced-plates/hr-concrete-side.png",
          count = 16,
          scale = 0.5,
        },
      },
      side_mask = {
        picture = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
        count = 16,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side-mask.png",
          count = 16,
          scale = 0.5,
        },
      },

      u_transition = {
        picture = kr_tiles_path .. "reinforced-plates/concrete-u.png",
        count = 8,
        hr_version = {
          picture = kr_tiles_path .. "reinforced-plates/hr-concrete-u.png",
          count = 8,
          scale = 0.5,
        },
      },
      u_transition_mask = {
        picture = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
        count = 8,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u-mask.png",
          count = 8,
          scale = 0.5,
        },
      },

      o_transition = {
        picture = kr_tiles_path .. "reinforced-plates/concrete-o.png",
        count = 4,
        hr_version = {
          picture = kr_tiles_path .. "reinforced-plates/hr-concrete-o.png",
          count = 4,
          scale = 0.5,
        },
      },
      o_transition_mask = {
        picture = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
        count = 4,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o-mask.png",
          count = 4,
          scale = 0.5,
        },
      },

      material_background = {
        picture = kr_tiles_path .. "reinforced-plates/black-reinforced-plate.png",
        count = 16,
        hr_version = {
          picture = kr_tiles_path .. "reinforced-plates/hr-black-reinforced-plate.png",
          count = 16,
          scale = 0.5,
        },
      },
    },

    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound = refined_concrete_sounds,

    map_color = { r = 40, g = 40, b = 40 },
    pollution_absorption_per_second = 0,
    vehicle_friction_modifier = 0.75,
  },

  {
    type = "tile",
    name = "kr-white-reinforced-plate",
    needs_correction = false,
    minable = not data.is_demo and { mining_time = 0.1, result = "kr-white-reinforced-plate" } or nil,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = { "ground-tile" },
    walking_speed_modifier = 1.75,
    layer = 90,
    transition_overlay_layer_offset = 2, -- need to render border overlay on top of hazard-concrete
    decorative_removal_probability = 0.95,
    variants = {
      main = {
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 1,
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 2,
          probability = 0.39,
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete-dummy.png",
          count = 1,
          size = 4,
          probability = 1,
        },
      },
      inner_corner = {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
        count = 16,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner.png",
          count = 16,
          scale = 0.5,
        },
      },
      inner_corner_mask = {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
        count = 16,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner-mask.png",
          count = 16,
          scale = 0.5,
        },
      },

      outer_corner = {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
        count = 8,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner.png",
          count = 8,
          scale = 0.5,
        },
      },
      outer_corner_mask = {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
        count = 8,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner-mask.png",
          count = 8,
          scale = 0.5,
        },
      },

      side = {
        picture = "__base__/graphics/terrain/concrete/concrete-side.png",
        count = 16,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side.png",
          count = 16,
          scale = 0.5,
        },
      },
      side_mask = {
        picture = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
        count = 16,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side-mask.png",
          count = 16,
          scale = 0.5,
        },
      },

      u_transition = {
        picture = "__base__/graphics/terrain/concrete/concrete-u.png",
        count = 8,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u.png",
          count = 8,
          scale = 0.5,
        },
      },
      u_transition_mask = {
        picture = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
        count = 8,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u-mask.png",
          count = 8,
          scale = 0.5,
        },
      },

      o_transition = {
        picture = "__base__/graphics/terrain/concrete/concrete-o.png",
        count = 4,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o.png",
          count = 4,
          scale = 0.5,
        },
      },
      o_transition_mask = {
        picture = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
        count = 4,
        hr_version = {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o-mask.png",
          count = 4,
          scale = 0.5,
        },
      },

      material_background = {
        picture = kr_tiles_path .. "reinforced-plates/white-reinforced-plate.png",
        count = 16,
        hr_version = {
          picture = kr_tiles_path .. "reinforced-plates/hr-white-reinforced-plate.png",
          count = 16,
          scale = 0.5,
        },
      },
    },

    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound = refined_concrete_sounds,

    map_color = { r = 110, g = 110, b = 110 },
    pollution_absorption_per_second = 0,
    vehicle_friction_modifier = 0.75,
  },
})
