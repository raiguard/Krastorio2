data:extend(
{   
	{
	type = "assembling-machine",
    name = "crash-site-assembling-machine-2-repaired",
    icon = "__base__/graphics/icons/crash-site-assembling-machine-2-repaired.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-deconstructable", "hidden", "not-rotatable"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.7, -1.2}, {0.7, 1.2}},
    selection_box = {{-1, -1.5}, {1, 1.5}},
    alert_icon_shift = util.by_pixel(-3, -12),
    integration_patch_render_layer = "decals",
    integration_patch = hr_crash_site_assembling_machine_2_ground(),

    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-repaired.png",
          priority = crash_site_sprite_priority,
          width = 100,
          height = 98,
          frame_count = 20,
          line_length = 5,
          shift = util.by_pixel(-4, -10),
          animation_speed = crash_site_assembling_machine_2_animation_speed,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-repaired.png",
            priority = crash_site_sprite_priority,
            width = 198,
            height = 200,
            frame_count = 20,
            line_length = 5,
            shift = util.by_pixel(-4, -11),
            animation_speed = crash_site_assembling_machine_2_animation_speed,
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-repaired-shadow.png",
          priority = crash_site_sprite_priority,
          width = 106,
          height = 86,
          frame_count = 20,
          line_length = 5,
          draw_as_shadow = true,
          shift = util.by_pixel(2, -8),
          animation_speed = crash_site_assembling_machine_2_animation_speed,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-repaired-shadow.png",
            priority = crash_site_sprite_priority,
            width = 208,
            height = 174,
            frame_count = 20,
            line_length = 5,
            draw_as_shadow = true,
            shift = util.by_pixel(3, -9),
            animation_speed = crash_site_assembling_machine_2_animation_speed,
            scale = 0.5
          }
        }
      }
    },
    working_visualisations =
    {
      {
        animation =
        {
          filename = "__base__/graphics/entity/crash-site-assembling-machine/crash-site-assembling-machine-2-repaired-light.png",
          priority = crash_site_sprite_priority,
          width = 84,
          height = 62,
          frame_count = 20,
          line_length = 5,
          shift = util.by_pixel(-8, -6),
          blend_mode = "additive",
          animation_speed = crash_site_assembling_machine_2_animation_speed,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-assembling-machine/hr-crash-site-assembling-machine-2-repaired-light.png",
            priority = crash_site_sprite_priority,
            width = 174,
            height = 124,
            frame_count = 20,
            line_length = 5,
            shift = util.by_pixel(-7, -4),
            blend_mode = "additive",
            animation_speed = crash_site_assembling_machine_2_animation_speed,
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {"crafting", "basic-crafting"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 4
    },
    energy_usage = "90kW",
    ingredient_count = 2,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-repaired-1.ogg",
          volume = 0.8
        },
      },
      --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
      --max_sounds_per_type = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
	}
}