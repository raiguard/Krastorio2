data:extend(
{   
	{
	 type = "container",
    name = "crash-site-chest-2",
    icon = "__base__/graphics/icons/crash-site-chest.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"not-deconstructable", "placeable-neutral", "player-creation"},
    max_health = 350,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
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
      filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2-ground.png",
      priority = crash_site_sprite_priority,
      width = 111,
      height = 95,
      shift = util.by_pixel(-12, 4),
      frame_count = 1,
      line_length = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-2-ground.png",
        priority = crash_site_sprite_priority,
        width = 218,
        height = 186,
        shift = util.by_pixel(-10, 5),
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
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2.png",
          priority = "extra-high",
          width = 59,
          height = 45,
          shift = util.by_pixel(0, 8),
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-2.png",
            priority = "extra-high",
            width = 116,
            height = 88,
            shift = util.by_pixel(0, 8),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2-shadow.png",
          priority = "extra-high",
          width = 95,
          height = 65,
          shift = util.by_pixel(0, 4),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/crash-site-chests/hr-crash-site-chest-2-shadow.png",
            priority = "extra-high",
            width = 188,
            height = 126,
            shift = util.by_pixel(0, 5),
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