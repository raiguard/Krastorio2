local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-superior-transport-belt",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-advanced-transport-belt", amount = 1 },
      { type = "item", name = "imersium-gear-wheel", amount = 4 },
      { type = "item", name = "low-density-structure", amount = 1 },
    },
    results = { { type = "item", name = "kr-superior-transport-belt", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-superior-transport-belt",
    icon = "__Krastorio2Assets__/icons/entities/superior-transport-belt.png",
    subgroup = "belt",
    order = "a[transport-belt]-e[superior-transport-belt]",
    place_result = "kr-superior-transport-belt",
    stack_size = 100,
  },
  {
    type = "transport-belt",
    name = "kr-superior-transport-belt",
    icon = "__Krastorio2Assets__/icons/entities/superior-transport-belt.png",
    flags = { "placeable-neutral", "player-creation" },
    fast_replaceable_group = "transport-belt",
    minable = { mining_time = 0.2, result = "kr-superior-transport-belt" },
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    speed = 0.1875,
    related_underground_belt = "kr-superior-underground-belt",
    max_health = 200,
    corpse = "kr-superior-transport-belt-remnant",
    resistances = {
      {
        type = "fire",
        percent = 50,
      },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = {
      sound = {
        filename = "__base__/sound/transport-belt.ogg",
        volume = 0.4,
      },
      persistent = true,
    },
    animations = {
      filename = "__Krastorio2Assets__/buildings/superior-transport-belt/superior-transport-belt.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      frame_count = 32,
      direction_count = 12,
      scale = 0.5,
    },
    belt_animation_set = require("prototypes.buildings.superior-belt-animation-set"),
    animation_speed_coefficient = 32,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector = circuit_connector_definitions["belt"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
  },
})
