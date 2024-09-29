local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

if not settings.startup["kr-containers"].value then
  return
end

data:extend({
  {
    type = "recipe",
    name = "kr-medium-storage-container",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-medium-container", amount = 1 },
      { type = "item", name = "advanced-circuit", amount = 5 },
    },
    results = { { type = "item", name = "kr-medium-storage-container", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-medium-storage-container",
    icon = "__Krastorio2Assets__/icons/entities/medium-storage-container.png",
    subgroup = "kr-logistics-2",
    order = "f[medium-storage-container]",
    place_result = "kr-medium-storage-container",
    stack_size = 50,
  },
  {
    type = "container",
    name = "kr-medium-storage-container",
    icon = "__Krastorio2Assets__/icons/entities/medium-storage-container.png",
    flags = { "placeable-player", "player-creation", "not-rotatable" },
    fast_replaceable_group = "container",
    minable = { mining_time = 0.5, result = "kr-medium-storage-container" },
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    inventory_size = 120,
    logistic_mode = "storage",
    max_health = 500,
    corpse = "big-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      { type = "physical", percent = 30 },
      { type = "fire", percent = 50 },
      { type = "impact", percent = 50 },
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    picture = {
      filename = "__Krastorio2Assets__/entities/medium-storage-container/medium-storage-container.png",
      priority = "extra-high",
      width = 340,
      height = 340,
      scale = 0.25,
    },
    opened_duration = logistic_chest_opened_duration,
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
})
