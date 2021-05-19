-- Nuclear reactor

-- stats
data.raw["reactor"]["nuclear-reactor"].minable = { hardness = 1, mining_time = 1, result = "nuclear-reactor" }
data.raw["reactor"]["nuclear-reactor"].max_health = 1000
data.raw["reactor"]["nuclear-reactor"].consumption = "250MW"
data.raw["reactor"]["nuclear-reactor"].energy_source.effectivity = 1
data.raw["reactor"]["nuclear-reactor"].heat_buffer.specific_heat = "50MJ"
data.raw["reactor"]["nuclear-reactor"].heat_buffer.max_transfer = "50GW"
data.raw["reactor"]["nuclear-reactor"].neighbour_bonus = 0.25
data.raw.item["nuclear-reactor"].stack_size = 1

-- Heat pipe
data.raw["heat-pipe"]["heat-pipe"].max_health = 100
data.raw["heat-pipe"]["heat-pipe"].heat_buffer.specific_heat = "6MJ"
data.raw["heat-pipe"]["heat-pipe"].heat_buffer.max_transfer = "6GW"

-- Heat exchanger
data.raw["boiler"]["heat-exchanger"].max_health = 250
data.raw["boiler"]["heat-exchanger"].target_temperature = 415
data.raw["boiler"]["heat-exchanger"].energy_consumption = "50MW"
data.raw["boiler"]["heat-exchanger"].energy_source.specific_heat = "5MJ"
data.raw["boiler"]["heat-exchanger"].energy_source.max_transfer = "10GW"
data.raw["boiler"]["heat-exchanger"].energy_source.min_working_temperature = 415

-- Steam turbine
data.raw["generator"]["steam-turbine"].max_health = 300
data.raw["generator"]["steam-turbine"].maximum_temperature = 415
data.raw["generator"]["steam-turbine"].effectivity = 1
data.raw["generator"]["steam-turbine"].fluid_usage_per_tick = 5 / 6
data.raw["generator"]["steam-turbine"].fluid_box.minimum_temperature = 100
data.raw["generator"]["steam-turbine"].max_power_output = "10MW"

-- Nuclear fuel
data.raw.item["uranium-fuel-cell"].fuel_value = "50GJ" --  = 200s in reactor

-- Atomic bomb
--krastorio.technologies.setResearchUnitCount("atomic-bomb", 7500)
--krastorio.technologies.addPrerequisite("atomic-bomb", "menarite-processor")

-- meltdown addition
data.raw["reactor"]["nuclear-reactor"].meltdown_action.action_delivery.target_effects = {
  {
    repeat_count = 200,
    type = "create-trivial-smoke",
    smoke_name = "nuclear-smoke",
    offset_deviation = { { -1, -1 }, { 1, 1 } },
    starting_frame = 3,
    starting_frame_deviation = 5,
    starting_frame_speed = 0,
    starting_frame_speed_deviation = 5,
    speed_from_center = 0.5,
  },
  {
    type = "create-entity",
    entity_name = "big-explosion",
  },
  {
    type = "damage",
    damage = { amount = 500, type = "explosion" },
  },
  {
    type = "create-entity",
    entity_name = "small-scorchmark",
    check_buildability = true,
  },
  {
    type = "nested-result",
    action = {
      type = "area",
      target_entities = false,
      trigger_from_target = true,
      repeat_count = 3000,
      radius = 128,
      action_delivery = {
        type = "projectile",
        projectile = "atomic-bomb-wave",
        starting_speed = 0.35,
      },
    },
  },
}
