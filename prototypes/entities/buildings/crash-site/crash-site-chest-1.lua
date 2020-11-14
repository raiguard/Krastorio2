data:extend(
{   
	{
	 type = "container",
    name = "crash-site-chest-1",
    icon = "__base__/graphics/icons/crash-site-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-deconstructable", "placeable-neutral", "player-creation"},
    max_health = 350,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.5 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.5 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "container",
    inventory_size = 48,
    vehicle_impact_sound = sounds.generic_impact,
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1-ground.png",
      priority = crash_site_sprite_priority,
      width = 111,
      height = 73,
      shift = util.by_pixel(-6, 12),
      frame_count = 1,
      line_length = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-1-ground.png",
        priority = crash_site_sprite_priority,
        width = 220,
        height = 148,
        shift = util.by_pixel(-6, 12),
        frame_count = 1,
        line_length = 1,
        scale = 0.5
      }
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1.png",
          priority = "extra-high",
          width = 61,
          height = 39,
          shift = util.by_pixel(2, 8),
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-1.png",
            priority = "extra-high",
            width = 120,
            height = 76,
            shift = util.by_pixel(2, 8),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1-shadow.png",
          priority = "extra-high",
          width = 99,
          height = 67,
          shift = util.by_pixel(-8, 2),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-1-shadow.png",
            priority = "extra-high",
            width = 210,
            height = 128,
            shift = util.by_pixel(-2, 3),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
	}
}