data:extend({
  ----------------------------------------------------------------------------------------------------
  -- -- MOTORS
  -- additional-engine
  {
    type = "movement-bonus-equipment",
    name = "additional-engine",
    sprite = {
      filename = kr_vehicle_equipments_path .. "additional-engine.png",
      width = 128,
      height = 128,
      priority = "medium",
      hr_version = {
        filename = kr_vehicle_equipments_path .. "hr-additional-engine.png",
        width = 256,
        height = 256,
        priority = "medium",
        scale = 0.5,
      },
    },
    shape = {
      width = 4,
      height = 4,
      type = "full",
    },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    energy_consumption = "100kW",
    movement_bonus = 0.3,
    categories = { "vehicle-motor" },
  },
  -- advanced-additional-engine
  {
    type = "movement-bonus-equipment",
    name = "advanced-additional-engine",
    sprite = {
      filename = kr_vehicle_equipments_path .. "advanced-additional-engine.png",
      width = 128,
      height = 128,
      priority = "medium",
      hr_version = {
        filename = kr_vehicle_equipments_path .. "hr-advanced-additional-engine.png",
        width = 256,
        height = 256,
        priority = "medium",
        scale = 0.5,
      },
    },
    shape = {
      width = 4,
      height = 4,
      type = "full",
    },
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
    },
    energy_consumption = "250kW",
    movement_bonus = 0.5,
    categories = { "vehicle-motor" },
  },
  -- VEHICLE ROBOPORT
  -- vehicle-roboport
  {
    type = "roboport-equipment",
    name = "vehicle-roboport",
    take_result = "vehicle-roboport",
    sprite = {
      filename = kr_vehicle_equipments_path .. "vehicle-roboport.png",
      width = 128,
      height = 128,
      priority = "medium",
      hr_version = {
        filename = kr_vehicle_equipments_path .. "hr-vehicle-roboport.png",
        width = 256,
        height = 256,
        priority = "medium",
        scale = 0.5,
      },
    },
    shape = {
      width = 4,
      height = 4,
      type = "full",
    },
    energy_source = {
      type = "electric",
      buffer_capacity = "250MJ",
      input_flow_limit = "50MW",
      usage_priority = "secondary-input",
    },
    charging_energy = "2500kW",
    robot_limit = 100,
    construction_radius = 48,
    spawn_and_station_height = 0.4,
    charge_approach_distance = 2.6,
    recharging_animation = {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5,
    },
    recharging_light = { intensity = 0.4, size = 5 },
    stationing_offset = { 0, -0.6 },
    charging_station_shift = { 0, 0.5 },
    charging_station_count = 12,
    charging_distance = 2,
    charging_threshold_distance = 6,
    categories = { "vehicle-robot-interaction-equipment" },
  },
})
