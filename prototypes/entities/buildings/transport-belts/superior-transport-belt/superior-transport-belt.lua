data:extend({
  {
    type = "transport-belt",
    name = "kr-superior-transport-belt",
    icon = kr_entities_icons_path .. "transport-belts/superior-transport-belt/superior-transport-belt.png",
    icon_size = 64,
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.2, result = "kr-superior-transport-belt" },
    max_health = 200,
    corpse = "kr-superior-transport-belt-remnant",
    resistances = {
      {
        type = "fire",
        percent = 50,
      },
    },
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    working_sound = {
      sound = {
        filename = "__base__/sound/transport-belt.ogg",
        volume = 0.4,
      },
      persistent = true,
    },
    animations = {
      filename = kr_entities_path
        .. "transport-belts/superior-transport-belt/transport-belt/superior-transport-belt.png",
      priority = "extra-high",
      width = 40,
      height = 40,
      frame_count = 32,
      direction_count = 12,
      hr_version = {
        filename = kr_entities_path
          .. "transport-belts/superior-transport-belt/transport-belt/hr-superior-transport-belt.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 32,
        direction_count = 12,
        scale = 0.5,
      },
    },
    belt_animation_set = kr_superior_transport_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    related_underground_belt = "kr-superior-underground-belt",
    speed = 0.1875,
    animation_speed_coefficient = 32,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
  },
})
