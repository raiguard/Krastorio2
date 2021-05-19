-- -- -- Robots charging

-- Vanilla roboport
data.raw["roboport"]["roboport"].energy_source.input_flow_limit = "5MW" --5
data.raw["roboport"]["roboport"].charging_energy = "1000kW" --1000
--data.raw["roboport"]["roboport"].logistics_radius = 32
--data.raw["roboport"]["roboport"].construction_radius = 68
data.raw["roboport"]["roboport"].robot_slots_count = 3 --7
data.raw["roboport"]["roboport"].material_slots_count = 3 --7

-- -- Robots
--------------------------------------
-- logistic-robot
data.raw["logistic-robot"]["logistic-robot"].speed = 0.0694
data.raw["logistic-robot"]["logistic-robot"].max_energy = "3MJ"
data.raw["logistic-robot"]["logistic-robot"].max_health = 50
data.raw["logistic-robot"]["logistic-robot"].max_payload_size = 7

-- Construction robot
data.raw["construction-robot"]["construction-robot"].speed = 0.09257
data.raw["construction-robot"]["construction-robot"].max_energy = "3MJ"
data.raw["construction-robot"]["construction-robot"].max_health = 50
data.raw["construction-robot"]["construction-robot"].max_payload_size = 2
--------------------------------------

local sounds = require("__base__/prototypes/entity/sounds")

-- -- Robot capsule
--------------------------------------

-- Defender robot (capsule)
data.raw["combat-robot"]["defender"].time_to_live = 60 * 120
data.raw["combat-robot"]["defender"].attack_parameters = {
  type = "projectile",
  cooldown = 20,
  projectile_center = { 0, 1 },
  projectile_creation_distance = 0.6,
  range = 20,
  sound = sounds.light_gunshot,
  ammo_type = {
    category = "bullet",
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          type = "create-explosion",
          entity_name = "explosion-gunshot-small",
        },
        target_effects = {
          {
            type = "create-entity",
            entity_name = "explosion-hit",
          },
          {
            type = "damage",
            damage = { amount = 8, type = "physical" },
          },
        },
      },
    },
  },
}

-- Distractor robot (capsule)
data.raw["combat-robot"]["distractor"].time_to_live = 60 * 120
data.raw["combat-robot"]["distractor"].attack_parameters = {
  type = "beam",
  ammo_category = "laser",
  cooldown = 20,
  damage_modifier = 2,
  projectile_center = { 0, 0 },
  projectile_creation_distance = 0.6,
  range = 20,
  sound = make_laser_sounds(),
  ammo_type = {
    category = "laser",
    action = {
      type = "direct",
      action_delivery = {
        type = "beam",
        beam = "laser-beam",
        max_length = 20,
        duration = 20,
        --starting_speed = 0.3
      },
    },
  },
}

-- Destroyer robot (capsule)
data.raw["combat-robot"]["destroyer"].time_to_live = 60 * 180
data.raw["combat-robot"]["destroyer"].attack_parameters = {
  type = "beam",
  ammo_category = "laser",
  cooldown = 20,
  damage_modifier = 2,
  range = 25,
  ammo_type = {
    category = "laser",
    action = {
      type = "direct",
      action_delivery = {
        type = "beam",
        beam = "electric-beam",
        max_length = 25,
        duration = 20,
        source_offset = { 0.15, -0.5 },
      },
    },
  },
}
--------------------------------------
