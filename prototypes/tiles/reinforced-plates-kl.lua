if krastorio.general.getSafeSettingValue("kr-kl-stuff") then
  local stack_size = 100

  if stack_size > 100 then
    stack_size = krastorio.general.getSafeSettingValue("kr-stack-size")
  end

  data:extend({
    {
      type = "item",
      name = "kr-black-reinforced-plate-l",
      icon = kr_items_icons_path .. "black-reinforced-plate-kl.png",
      icon_size = 64,
      icon_mipmaps = 4,
      subgroup = "terrain",
      order = "z[black-reinforced-plate]-a1[black-reinforced-plate]",
      place_as_tile = {
        result = "kr-black-reinforced-plate-l",
        condition_size = 1,
        condition = { "water-tile" },
      },
      stack_size = stack_size,
    },
    {
      type = "item",
      name = "kr-white-reinforced-plate-l",
      icon = kr_items_icons_path .. "white-reinforced-plate-kl.png",
      icon_size = 64,
      icon_mipmaps = 4,
      subgroup = "terrain",
      order = "z[white-reinforced-plate]-a2[white-reinforced-plate]",
      place_as_tile = {
        result = "kr-white-reinforced-plate-l",
        condition_size = 1,
        condition = { "water-tile" },
      },
      stack_size = stack_size,
    },

    {
      type = "recipe",
      name = "kr-black-reinforced-plate-l",
      energy_required = 5,
      enabled = false,
      ingredients = {
        { "refined-concrete", 20 },
        { "steel-beam", 5 },
      },
      result = "kr-black-reinforced-plate-l",
      result_count = 10,
    },
    {
      type = "recipe",
      name = "kr-white-reinforced-plate-l",
      energy_required = 5,
      enabled = false,
      ingredients = {
        { "refined-concrete", 20 },
        { "steel-beam", 5 },
      },
      result = "kr-white-reinforced-plate-l",
      result_count = 10,
    },

    {
      type = "tile",
      name = "kr-white-reinforced-plate-l",
      needs_correction = false,
      minable = { mining_time = 0.05, result = "kr-white-reinforced-plate-l" },
      mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
      collision_mask = { "ground-tile" },
      walking_speed_modifier = 1.75,
      layer = 80,
      transition_overlay_layer_offset = 5,
      decorative_removal_probability = 1,
      variants = {
        main = {
          {
            picture = kr_tiles_path .. "reinforced-plates-kl/reinforced-plate.png",
            count = 16,
            size = 4,
            hr_version = {
              picture = kr_tiles_path .. "reinforced-plates-kl/hr-reinforced-plate.png",
              count = 16,
              scale = 0.5,
              size = 4,
            },
          },
          {
            picture = kr_tiles_path .. "reinforced-plates-kl/reinforced-plate.png",
            count = 16,
            size = 1,
            hr_version = {
              picture = kr_tiles_path .. "reinforced-plates-kl/hr-reinforced-plate.png",
              count = 16,
              scale = 0.5,
              size = 1,
            },
          },
        },
        inner_corner = {
          picture = kr_tiles_path .. "reinforced-plates-kl/plate-inner-corner.png",
          count = 4,
          tall = true,
          hr_version = {
            picture = kr_tiles_path .. "reinforced-plates-kl/hr-plate-inner-corner.png",
            count = 4,
            tall = true,
            scale = 0.5,
          },
        },
        outer_corner = {
          picture = kr_tiles_path .. "reinforced-plates-kl/plate-outer-corner.png",
          count = 4,
          tall = true,
          hr_version = {
            picture = kr_tiles_path .. "reinforced-plates-kl/hr-plate-outer-corner.png",
            count = 4,
            tall = true,
            scale = 0.5,
          },
        },
        side = {
          picture = kr_tiles_path .. "reinforced-plates-kl/plate-side.png",
          count = 16,
          tall = true,
          hr_version = {
            picture = kr_tiles_path .. "reinforced-plates-kl/hr-plate-side.png",
            count = 16,
            tall = true,
            scale = 0.5,
          },
        },
        u_transition = {
          picture = kr_tiles_path .. "reinforced-plates-kl/plate-u.png",
          count = 2,
          tall = true,
          hr_version = {
            picture = kr_tiles_path .. "reinforced-plates-kl/hr-plate-u.png",
            count = 2,
            tall = true,
            scale = 0.5,
          },
        },
        o_transition = {
          picture = kr_tiles_path .. "reinforced-plates-kl/plate-o.png",
          count = 2,
          hr_version = {
            picture = kr_tiles_path .. "reinforced-plates-kl/hr-plate-o.png",
            count = 2,
            scale = 0.5,
          },
        },
      },
      walking_sound = {
        {
          filename = "__base__/sound/walking/concrete-01.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/walking/concrete-02.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/walking/concrete-03.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/walking/concrete-04.ogg",
          volume = 1.0,
        },
      },
      map_color = { r = 175, g = 175, b = 175 },
      pollution_absorption_per_second = 0,
      vehicle_friction_modifier = 0.8,
    },

    {
      type = "tile",
      name = "kr-black-reinforced-plate-l",
      needs_correction = false,
      minable = { mining_time = 0.05, result = "kr-black-reinforced-plate-l" },
      mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
      collision_mask = { "ground-tile" },
      walking_speed_modifier = 1.75,
      layer = 85,
      transition_overlay_layer_offset = 6,
      decorative_removal_probability = 1,
      variants = {
        main = {
          {
            picture = kr_tiles_path .. "reinforced-plates-kl/black-reinforced-plate.png",
            count = 16,
            size = 4,
            hr_version = {
              picture = kr_tiles_path .. "reinforced-plates-kl/hr-black-reinforced-plate.png",
              count = 16,
              scale = 0.5,
              size = 4,
            },
          },
          {
            picture = kr_tiles_path .. "reinforced-plates-kl/black-reinforced-plate.png",
            count = 16,
            size = 1,
            hr_version = {
              picture = kr_tiles_path .. "reinforced-plates-kl/hr-black-reinforced-plate.png",
              count = 16,
              scale = 0.5,
              size = 1,
            },
          },
        },
        inner_corner = {
          picture = kr_tiles_path .. "reinforced-plates-kl/plate-inner-corner.png",
          count = 4,
          tall = true,
          hr_version = {
            picture = kr_tiles_path .. "reinforced-plates-kl/hr-plate-inner-corner.png",
            count = 4,
            tall = true,
            scale = 0.5,
          },
        },
        outer_corner = {
          picture = kr_tiles_path .. "reinforced-plates-kl/plate-outer-corner.png",
          count = 4,
          tall = true,
          hr_version = {
            picture = kr_tiles_path .. "reinforced-plates-kl/hr-plate-outer-corner.png",
            count = 4,
            tall = true,
            scale = 0.5,
          },
        },
        side = {
          picture = kr_tiles_path .. "reinforced-plates-kl/plate-side.png",
          count = 16,
          tall = true,
          hr_version = {
            picture = kr_tiles_path .. "reinforced-plates-kl/hr-plate-side.png",
            count = 16,
            tall = true,
            scale = 0.5,
          },
        },
        u_transition = {
          picture = kr_tiles_path .. "reinforced-plates-kl/plate-u.png",
          count = 2,
          tall = true,
          hr_version = {
            picture = kr_tiles_path .. "reinforced-plates-kl/hr-plate-u.png",
            count = 2,
            tall = true,
            scale = 0.5,
          },
        },
        o_transition = {
          picture = kr_tiles_path .. "reinforced-plates-kl/plate-o.png",
          count = 2,
          hr_version = {
            picture = kr_tiles_path .. "reinforced-plates-kl/hr-plate-o.png",
            count = 2,
            scale = 0.5,
          },
        },
      },
      walking_sound = {
        {
          filename = "__base__/sound/walking/concrete-01.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/walking/concrete-02.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/walking/concrete-03.ogg",
          volume = 1.0,
        },
        {
          filename = "__base__/sound/walking/concrete-04.ogg",
          volume = 1.0,
        },
      },
      map_color = { r = 50, g = 50, b = 50 },
      pollution_absorption_per_second = 0,
      vehicle_friction_modifier = 0.8,
    },
  })

  krastorio.technologies.addUnlockRecipe("kr-reinforced-plates", "kr-black-reinforced-plate-l")
  krastorio.technologies.addUnlockRecipe("kr-reinforced-plates", "kr-white-reinforced-plate-l")
end
