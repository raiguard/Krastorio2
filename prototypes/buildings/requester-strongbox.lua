local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

if not settings.startup["kr-containers"].value then
  return
end

data:extend({
  {
    type = "recipe",
    name = "kr-requester-strongbox",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-strongbox", amount = 1 },
      { type = "item", name = "advanced-circuit", amount = 5 },
    },
    results = { { type = "item", name = "kr-requester-strongbox", amount = 1 } },
  },
  {
    type = "item",
    name = "kr-requester-strongbox",
    icon = "__Krastorio2Assets__/icons/entities/requester-strongbox.png",
    subgroup = "kr-logistics-2",
    order = "e[requester-strongbox]",
    place_result = "kr-requester-strongbox",
    stack_size = 50,
  },
  {
    type = "container",
    name = "kr-requester-strongbox",
    icon = "__Krastorio2Assets__/icons/entities/requester-strongbox.png",
    flags = { "placeable-player", "player-creation", "not-rotatable" },
    fast_replaceable_group = "container",
    minable = { mining_time = 0.5, result = "kr-requester-strongbox" },
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    inventory_size = 120,
    logistic_mode = "requester",
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
      filename = "__Krastorio2Assets__/buildings/requester-strongbox/requester-strongbox.png",
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
