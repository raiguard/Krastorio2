base_tile_transition_effect_maps = {}
local ttfxmaps = base_tile_transition_effect_maps

ttfxmaps.water_creep =
{
  filename_norm = "__base__/graphics/terrain/effect-maps/water-sand-mask.png",
  filename_high = "__base__/graphics/terrain/effect-maps/hr-water-sand-mask.png",
  o_transition_tall = false,
  u_transition_count = 4,
  o_transition_count = 1,
}

ttfxmaps.water_creep_to_land =
{
  filename_norm = "__base__/graphics/terrain/effect-maps/water-sand-to-land-mask.png",
  filename_high = "__base__/graphics/terrain/effect-maps/hr-water-sand-to-land-mask.png",
  count = 3,
  u_transition_count = 1,
  o_transition_count = 0,
}

ttfxmaps.water_creep_to_out_of_map =
{
  filename_norm = "__base__/graphics/terrain/effect-maps/water-sand-to-out-of-map-mask.png",
  filename_high = "__base__/graphics/terrain/effect-maps/hr-water-sand-to-out-of-map-mask.png",
  count = 3,
  u_transition_count = 1,
  o_transition_count = 0,
}

local function append_transition_mask_white(options, tab)
  local mask_picture =  { picture = "__core__/graphics/white-square.png", count = 1, scale = 32 }
  local suffix = (options and options.mask_suffix) or "mask"
  tab["inner_corner_" .. suffix] = mask_picture
  tab["outer_corner_" .. suffix] = mask_picture
  tab["side_" .. suffix]         = mask_picture
  tab["u_transition_" .. suffix] = mask_picture
  tab["o_transition_" .. suffix] = mask_picture

  return tab
end

water_tile_type_names = { "water", "deepwater", "water-green", "deepwater-green", "water-shallow", "water-mud" }
patch_for_inner_corner_of_transition_between_transition =
{
  filename = "__base__/graphics/terrain/water-transitions/water-patch.png",
  width = 32,
  height = 32,
  hr_version =
  {
    filename = "__base__/graphics/terrain/water-transitions/hr-water-patch.png",
    scale = 0.5,
    width = 64,
    height = 64
  }
}


local function water_transition_template_with_effect(to_tiles, normal_res_transition, high_res_transition, options)
  return make_generic_transition_template(to_tiles, water_transition_group_id, nil, normal_res_transition, high_res_transition, options, true, false, true)
end


local function get_creep_transition_base_with_underwater_background(tab)
  local t = tab or {}

  --t.background_layer_offset = t.background_layer_offset or 1
  --t.background_layer_group = t.background_layer_group or "zero"
  --if (t.offset_background_layer_by_tile_layer == nil) then
  --  t.offset_background_layer_by_tile_layer = true
  --end
  --t.background_layer_group = "water-overlay"
  t.background_layer_group = "water"
  t.background_layer_offset = -5
  t.masked_background_layer_offset = 1
  t.offset_background_layer_by_tile_layer = false
  --return append_transition_mask_template("__base__/graphics/terrain/masks/transition-5.png",
  --                                       "__base__/graphics/terrain/masks/hr-transition-5.png",
  --                                       { mask_variations = 1, mask_suffix = "background_mask" },
  --                                       t)

  return append_transition_mask_white({ mask_suffix = "background_mask" }, t)
end

local creep_transitions =
{
  water_transition_template_with_effect
  (
    water_tile_type_names,
    kr_tiles_path .. "creep/creep-m.png",
    kr_tiles_path .. "creep/hr-creep-m.png",
    {
      effect_map = ttfxmaps.water_creep,
      o_transition_tall = false,
      u_transition_tall = false,
      side_tall = false,
      inner_corner_tall = false,
      outer_corner_tall = false,
      u_transition_count = 4,
      o_transition_count = 8,
      --base = init_transition_between_transition_common_options()
      base = get_creep_transition_base_with_underwater_background()
    }
  ),
  ground_to_out_of_map_transition
}

local creep_transitions_between_transitions =
{
  --generic_transition_between_transitions_template
  make_generic_transition_template --(nil, group1, group2, normal_res_transition, high_res_transition, options, true, true, true)
  (
    nil,
    default_transition_group_id,
    water_transition_group_id,
    kr_tiles_path .. "creep/creep-transition.png",
    kr_tiles_path .. "creep/hr-creep-transition.png",
    {
      effect_map = ttfxmaps.water_creep_to_land,
      side_tall = false,
      inner_corner_tall = false,
      outer_corner_tall = false,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
      base = { water_patch = patch_for_inner_corner_of_transition_between_transition, --[[ background_for_water_effect = true --]] }
    },
    true,
    false,
    true
  ),
  make_generic_transition_template
  (
    nil,
    default_transition_group_id,
    out_of_map_transition_group_id,
    "__base__/graphics/terrain/out-of-map-transition/sand-out-of-map-transition.png",
    "__base__/graphics/terrain/out-of-map-transition/hr-sand-out-of-map-transition.png",
    {
      inner_corner_tall = true,
      inner_corner_count = 3,
      outer_corner_count = 3,
      side_count = 3,
      u_transition_count = 1,
      o_transition_count = 0,
      base = init_transition_between_transition_common_options()
    },
    false,
    true,
    true
  ),
  make_generic_transition_template --generic_transition_between_transitions_template
  (
      nil, --
      water_transition_group_id,
      out_of_map_transition_group_id,
      "__base__/graphics/terrain/out-of-map-transition/sand-shore-out-of-map-transition.png",
      "__base__/graphics/terrain/out-of-map-transition/hr-sand-shore-out-of-map-transition.png",
      {
        effect_map = ttfxmaps.water_creep_to_out_of_map,
        o_transition_tall = false,
        inner_corner_count = 3,
        outer_corner_count = 3,
        side_count = 3,
        u_transition_count = 1,
        o_transition_count = 0,
        base = init_transition_between_transition_common_options(
                 get_creep_transition_base_with_underwater_background(
                   { water_patch = patch_for_inner_corner_of_transition_between_transition,
                     --overlay_layer_offset = 0,
                     --masked_material_layer_offset = 1
                   }))
      },
      true,
      true,
      true
  ),
}


data:extend(
{

	{	
		type = "tile",
		name = "kr-creep",
		needs_correction = false,
		minable = {mining_time = 1, result = "biomass", count = 10},
		mined_sound = { filename = kr_tiles_sounds_path .. "creep-deconstruction.ogg" },
		collision_mask = {"ground-tile"},
		walking_speed_modifier = 0.5,
		layer = 99,
		transition_overlay_layer_offset = 9,
		decorative_removal_probability = 1,
		variants = tile_variations_template
			(
				kr_tiles_path .. "creep/creep.png", "__base__/graphics/terrain/masks/transition-1.png",
				kr_tiles_path .. "creep/hr-creep.png", "__base__/graphics/terrain/masks/hr-transition-1.png",
				{
					max_size = 8,
					[2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
					[4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
					[8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
				}
			),
		walking_sound =
		{
			{
				filename = kr_tiles_sounds_path .. "creep-walk-01.ogg",
				volume = 0.75
			},
			{
				filename = kr_tiles_sounds_path .. "creep-walk-02.ogg",
				volume = 0.75
			},
			{
				filename = kr_tiles_sounds_path .. "creep-walk-03.ogg",
				volume = 0.75
			},
		},
		map_color={r=75, g=60, b=70},
		pollution_absorption_per_second = 0.01,
		vehicle_friction_modifier = 200,
		
		transitions = creep_transitions,
		transitions_between_transitions = creep_transitions_between_transitions,
		
	}
})
