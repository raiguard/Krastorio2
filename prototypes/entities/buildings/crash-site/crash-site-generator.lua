data:extend(
{   
	{
	type = "electric-energy-interface",
    name = "crash-site-generator",
    icon = "__base__/graphics/icons/crash-site-generator.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-deconstructable", "placeable-player", "player-creation", "hidden", "not-rotatable"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 150,
    corpse = "medium-remnants",
    --subgroup = "other",
    collision_box = {{-1.5, -0.9}, {0.9, 0.9}},
    selection_box = {{-1.5, -0.9}, {0.9, 0.9}},
    allow_copy_paste = false,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "10GJ",
      usage_priority = "tertiary",
      input_flow_limit = "0kW",
      output_flow_limit = "500GW"
    },

    energy_production = "500GW",
    energy_usage = "0kW",
    light = {intensity = 0.75, size = 6, color = {r = 1.0, g = 1.0, b = 1.0}, shift = {64/64, -140/64}},
    continuous_animation = true,
    integration_patch_render_layer = "decals",
    -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-generator/crash-site-generator-ground.png",
      priority = crash_site_sprite_priority,
      width = 192,
      height = 180,
      shift = util.by_pixel(-28, -38),
      frame_count = 1,
      line_length = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/crash-site-generator/hr-crash-site-generator-ground.png",
        priority = crash_site_sprite_priority,
        width = 384,
        height = 360,
        shift = util.by_pixel(-28, -38),
        frame_count = 1,
        line_length = 1,
        scale = 0.5
      }
    },

    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-generator/crash-site-generator.png",
          priority = crash_site_sprite_priority,
          width = 142,
          height= 128,
          frame_count = 5,
          line_length = 5,
          repeat_count = 16,
          shift = util.by_pixel(-10, -24),
          animation_speed = crash_site_generator_animation_speed,
          hr_version = {
            filename = "__base__/graphics/entity/crash-site-generator/hr-crash-site-generator.png",
            priority = crash_site_sprite_priority,
            width = 286,
            height= 252,
            frame_count = 5,
            line_length = 5,
            repeat_count = 16,
            animation_speed = crash_site_generator_animation_speed,
            shift = util.by_pixel(-11, -23),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-generator/crash-site-generator-beams.png",
          priority = crash_site_sprite_priority,
          width = 48,
          height= 116,
          frame_count = 16,
          line_length = 4,
          repeat_count = 5,
          shift = util.by_pixel(24, -30),
          animation_speed = crash_site_generator_animation_speed,
          hr_version = {
            filename = "__base__/graphics/entity/crash-site-generator/hr-crash-site-generator-beams.png",
            priority = crash_site_sprite_priority,
            width = 224,
            height= 232,
            frame_count = 16,
            line_length = 4,
            repeat_count = 5,
            animation_speed = crash_site_generator_animation_speed,
            shift = util.by_pixel(-8, -30),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-generator/crash-site-generator-shadow.png",
          priority = crash_site_sprite_priority,
          width = 236,
          height= 78,
          frame_count = 1,
          line_length = 1,
          repeat_count = 80,
          shift = util.by_pixel(26, 4),
          draw_as_shadow = true,
          animation_speed = crash_site_generator_animation_speed,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-generator/hr-crash-site-generator-shadow.png",
            priority = crash_site_sprite_priority,
            width = 474,
            height= 152,
            frame_count = 1,
            line_length = 1,
            repeat_count = 80,
            draw_as_shadow = true,
            shift = util.by_pixel(25, 5),
            animation_speed = crash_site_generator_animation_speed,
            scale = 0.5
          }
        },
      }
    },
    vehicle_impact_sound = sounds.generic_impact
	}
}