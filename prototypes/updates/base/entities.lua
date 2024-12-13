local data_util = require("data-util")
local sounds = require("__base__.prototypes.entity.sounds")

--- Change the vehicle to the given grid and update the equipment grid with the categories of the vehicle's former grid.
--- @param vehicle_type string
--- @param vehicle_name data.EntityID
--- @param new_equipment_grid_id data.EquipmentGridID
local function convert_equipment_grid(vehicle_type, vehicle_name, new_equipment_grid_id)
  local vehicle = data.raw[vehicle_type][vehicle_name]
  if not vehicle then
    error("Vehicle " .. vehicle_type .. "/" .. vehicle_name .. " does not exist.")
  end
  local old_equipment_grid_id = vehicle.equipment_grid
  if not old_equipment_grid_id then
    return
  end
  local old_equipment_grid = data.raw["equipment-grid"][old_equipment_grid_id]
  if not old_equipment_grid then
    error("Equipment grid " .. old_equipment_grid_id .. " does not exist.")
  end
  local new_equipment_grid = data.raw["equipment-grid"][new_equipment_grid_id]
  if not new_equipment_grid then
    error("Equipment grid " .. new_equipment_grid_id .. " does not exist.")
  end

  local equipment_categories_set = {}
  for _, equipment_category in pairs(new_equipment_grid.equipment_categories) do
    equipment_categories_set[equipment_category] = true
  end

  for _, equipment_category in pairs(old_equipment_grid.equipment_categories) do
    if equipment_category ~= "armor" and not equipment_categories_set[equipment_category] then
      table.insert(new_equipment_grid.equipment_categories, equipment_category)
    end
  end

  data.raw[vehicle_type][vehicle_name].equipment_grid = new_equipment_grid_id
end

--- @type data.MineableProperties
local small_crash_site_minable = {
  mining_time = 2,
  results = {
    { type = "item", name = "iron-plate", amount_min = 1, amount_max = 3, probability = 0.70 },
    { type = "item", name = "copper-cable", amount_min = 0, amount_max = 3, probability = 0.55 },
    { type = "item", name = "iron-gear-wheel", amount_min = 0, amount_max = 3, probability = 0.55 },
    { type = "item", name = "electronic-circuit", amount_min = 0, amount_max = 3, probability = 0.20 },
    { type = "item", name = "kr-sentinel", amount_min = 0, amount_max = 3, probability = 0.10 },
  },
  mining_particle = "shell-particle",
}
convert_equipment_grid("artillery-wagon", "artillery-wagon", "kr-wagons-grid")
data.raw["artillery-wagon"]["artillery-wagon"].max_health = 1000
data.raw["artillery-wagon"]["artillery-wagon"].minable = { mining_time = 0.5, result = "artillery-wagon" }
data.raw["artillery-wagon"]["artillery-wagon"].weight = 3000

data.raw["assembling-machine"]["assembling-machine-1"].energy_usage = "75kW"

data.raw["assembling-machine"]["assembling-machine-2"].energy_usage = "125kW"

data.raw["assembling-machine"]["assembling-machine-3"].energy_usage = "200kW"

data.raw.boiler["boiler"].energy_source.emissions_per_minute = { pollution = 20 }
data_util.add_fuel_category(data.raw.boiler["boiler"].energy_source, "vehicle-fuel")

data.raw.boiler["heat-exchanger"].energy_consumption = "50MW"
data.raw.boiler["heat-exchanger"].energy_source.max_transfer = "10GW"
data.raw.boiler["heat-exchanger"].energy_source.min_working_temperature = 415
data.raw.boiler["heat-exchanger"].energy_source.specific_heat = "5MJ"
data.raw.boiler["heat-exchanger"].max_health = 250
data.raw.boiler["heat-exchanger"].target_temperature = 415

convert_equipment_grid("car", "car", "kr-car-grid")
data.raw.car["car"].minable = { mining_time = 3, result = "car" }
data.raw.car["car"].energy_source.fuel_categories = { "vehicle-fuel" }
data.raw.car["car"].energy_source.emissions_per_minute = { pollution = 5 }

convert_equipment_grid("car", "tank", "kr-tank-grid")
data.raw.car["tank"].localised_name = { "entity-name.kr-armored-vehicle" }
data.raw.car["tank"].max_health = 3000
data.raw.car["tank"].minable = { mining_time = 5, result = "tank" }
data.raw.car["tank"].energy_source.fuel_categories = { "vehicle-fuel" }
data.raw.car["tank"].energy_source.emissions_per_minute = { pollution = 15 }
data.raw.car["tank"].inventory_size = 100
data.raw.car["tank"].weight = 30000
data.raw.car["tank"].consumption = "1MW"
data.raw.car["tank"].braking_power = "1.75MW"

convert_equipment_grid("cargo-wagon", "cargo-wagon", "kr-wagons-grid")
data.raw["cargo-wagon"]["cargo-wagon"].allow_robot_dispatch_in_automatic_mode = true
data.raw["cargo-wagon"]["cargo-wagon"].max_health = 750
data.raw["cargo-wagon"]["cargo-wagon"].minable = { mining_time = 0.5, result = "cargo-wagon" }
data.raw["cargo-wagon"]["cargo-wagon"].weight = 2000

data.raw["combat-robot"]["defender"].time_to_live = 60 * 120
data.raw["combat-robot"]["defender"].attack_parameters = {
  type = "projectile",
  cooldown = 20,
  projectile_center = { 0, 1 },
  projectile_creation_distance = 0.6,
  range = 20,
  sound = sounds.light_gunshot,
  ammo_category = "bullet",
  ammo_type = {
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

if not mods["boblogistics"] then
  data.raw["construction-robot"]["construction-robot"].speed = 0.09257
  data.raw["construction-robot"]["construction-robot"].max_energy = "3MJ"
  data.raw["construction-robot"]["construction-robot"].max_health = 50
  data.raw["construction-robot"]["construction-robot"].max_payload_size = 2
end

data.raw.container["crash-site-chest-1"].minable = small_crash_site_minable

data.raw.container["crash-site-chest-2"].minable = small_crash_site_minable

data.raw.container["crash-site-spaceship-wreck-medium-1"].minable = small_crash_site_minable

data.raw.container["crash-site-spaceship-wreck-medium-2"].minable = small_crash_site_minable

data.raw.container["crash-site-spaceship-wreck-medium-3"].minable = small_crash_site_minable

data.raw.container["crash-site-spaceship"].minable = {
  mining_time = 10,
  results = {
    { type = "item", name = "iron-plate", amount_min = 75, amount_max = 200 },
    { type = "item", name = "copper-cable", amount_min = 75, amount_max = 200 },
    { type = "item", name = "kr-sentinel", amount_min = 1, amount_max = 3 },
  },
  mining_particle = "shell-particle",
}

data.raw.corpse["spidertron-remnants"].animation = make_rotated_animation_variations_from_sheet(1, {
  layers = {
    {
      filename = "__Krastorio2Assets__/remnants/spidertron-remnant/spidertron-remnants.png",
      line_length = 1,
      width = 448,
      height = 448,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0, 0),
      scale = 0.5,
    },
    {
      priority = "low",
      filename = "__base__/graphics/entity/spidertron/remnants/mask/spidertron-remnants-mask.png",
      width = 366,
      height = 350,
      frame_count = 1,
      apply_runtime_tint = true,
      direction_count = 1,
      shift = util.by_pixel(9, 1),
      scale = 0.5,
    },
  },
})

data.raw["electric-pole"]["big-electric-pole"].maximum_wire_distance = 32.25

data.raw["electric-pole"]["medium-electric-pole"].maximum_wire_distance = 9.75
data.raw["electric-pole"]["medium-electric-pole"].supply_area_distance = 4.5

data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance = 7.75

data.raw["electric-pole"]["substation"].maximum_wire_distance = 20.25
data.raw["electric-pole"]["substation"].supply_area_distance = 10

convert_equipment_grid("fluid-wagon", "fluid-wagon", "kr-wagons-grid")
data.raw["fluid-wagon"]["fluid-wagon"].max_health = 150
data.raw["fluid-wagon"]["fluid-wagon"].minable = { mining_time = 0.5, result = "fluid-wagon" }
data.raw["fluid-wagon"]["fluid-wagon"].weight = 2000

data.raw.furnace["electric-furnace"].energy_source.emissions_per_minute = { pollution = 1 }
data.raw.furnace["electric-furnace"].energy_usage = "350kW"

data_util.add_fuel_category(data.raw.furnace["steel-furnace"].energy_source, "vehicle-fuel")

data_util.add_fuel_category(data.raw.furnace["stone-furnace"].energy_source, "vehicle-fuel")

data.raw.gate["gate"].resistances = {
  { type = "physical", decrease = 3, percent = 20 },
  { type = "impact", decrease = 45, percent = 60 },
  { type = "explosion", decrease = 50, percent = 80 },
  { type = "radioactive", percent = 100 },
  { type = "fire", percent = 100 },
  { type = "acid", percent = 80 },
  { type = "laser", percent = 70 },
}

data.raw["generator"]["steam-engine"].effectivity = 1
data.raw["generator"]["steam-engine"].fluid_usage_per_tick = 1 / 6
data.raw["generator"]["steam-engine"].maximum_temperature = 165
data.raw["generator"]["steam-engine"].max_power_output = "0.75MW"

data.raw["heat-pipe"]["heat-pipe"].heat_buffer.max_transfer = "6GW"
data.raw["heat-pipe"]["heat-pipe"].heat_buffer.specific_heat = "6MJ"
data.raw["heat-pipe"]["heat-pipe"].max_health = 100

data.raw["inserter"]["bulk-inserter"].next_upgrade = "kr-superior-inserter"
data.raw.inserter["bulk-inserter"].energy_per_movement = "12kJ"
data.raw.inserter["bulk-inserter"].energy_per_movement = "12kJ"

data_util.add_fuel_category(data.raw.inserter["burner-inserter"].energy_source, "vehicle-fuel")

data.raw["inserter"]["fast-inserter"].next_upgrade = "bulk-inserter"

data.raw["inserter"]["long-handed-inserter"].fast_replaceable_group = "long-handed-inserter"

data.raw["inserter"]["long-handed-inserter"].next_upgrade = "kr-superior-long-inserter"

data.raw.lab["lab"].energy_usage = "200kW"
data.raw.lab["lab"].fast_replaceable_group = "lab"
data.raw.lab["lab"].next_upgrade = "biusart-lab"
table.insert(data.raw.lab["lab"].inputs, 1, "basic-tech-card")
data_util.remove_lab_input("lab", "production-science-pack")
data_util.remove_lab_input("lab", "utility-science-pack")
data_util.remove_lab_input("lab", kr_optimization_tech_card_name)

data.raw.lamp["small-lamp"].glow_size = 8 --6

data.raw.locomotive["locomotive"].max_health = 1000
data.raw.locomotive["locomotive"].braking_force = 30
data.raw.locomotive["locomotive"].energy_source.fuel_inventory_size = 3
data.raw.locomotive["locomotive"].energy_source.fuel_categories = { "chemical", "vehicle-fuel" }
data.raw.locomotive["locomotive"].energy_source.emissions_per_minute = { pollution = 20 }
data.raw.locomotive["locomotive"].minable = { mining_time = 1, result = "locomotive" }
data.raw.locomotive["locomotive"].weight = 10000
data.raw.locomotive["locomotive"].max_speed = 1.0185
data.raw.locomotive["locomotive"].max_power = "2MW"
data.raw.locomotive["locomotive"].energy_source.effectivity = 1

if not mods["boblogistics"] then
  data.raw["logistic-robot"]["logistic-robot"].speed = 0.0694
  data.raw["logistic-robot"]["logistic-robot"].max_energy = "3MJ"
  data.raw["logistic-robot"]["logistic-robot"].max_health = 50
  data.raw["logistic-robot"]["logistic-robot"].max_payload_size = 7
end

convert_equipment_grid("locomotive", "locomotive", "kr-locomotive-grid")

data.raw["mining-drill"]["burner-mining-drill"].energy_source.emissions_per_minute = { pollution = 5 }
data.raw["mining-drill"]["burner-mining-drill"].energy_usage = "100kW"
data_util.add_fuel_category(data.raw["mining-drill"]["burner-mining-drill"].energy_source, "vehicle-fuel")

data_util.set_icon(
  data.raw["mining-drill"]["electric-mining-drill"],
  "__Krastorio2Assets__/icons/entities/electric-mining-drill.png"
)
data.raw["mining-drill"]["electric-mining-drill"].fast_replaceable_group = "electric-mining-drill"
data.raw["mining-drill"]["electric-mining-drill"].next_upgrade = "kr-electric-mining-drill-mk2"
data.raw["mining-drill"]["electric-mining-drill"].energy_source.emissions_per_minute = { pollution = 7.5 }
data.raw["mining-drill"]["electric-mining-drill"].energy_usage = "100kW"
data.raw["mining-drill"]["electric-mining-drill"].module_slots = 2

data.raw["mining-drill"]["pumpjack"].localised_name = { "entity-name.kr-oil-pumpjack" }

data.raw.pipe["pipe"].fast_replaceable_group = "pipe"
data.raw.pipe["pipe"].next_upgrade = "kr-steel-pipe"

data.raw["pipe-to-ground"]["pipe-to-ground"].fast_replaceable_group = "pipe"
data.raw["pipe-to-ground"]["pipe-to-ground"].next_upgrade = "kr-steel-pipe-to-ground"

data.raw.pump["pump"].fast_replaceable_group = "pump"
data.raw.pump["pump"].next_upgrade = "kr-steel-pump"

data.raw.reactor["nuclear-reactor"].consumption = "250MW"
data.raw.reactor["nuclear-reactor"].energy_source.effectivity = 1
data.raw.reactor["nuclear-reactor"].heat_buffer.max_transfer = "50GW"
data.raw.reactor["nuclear-reactor"].heat_buffer.specific_heat = "50MJ"
data.raw.reactor["nuclear-reactor"].max_health = 1000
data.raw.reactor["nuclear-reactor"].minable = { hardness = 1, mining_time = 1, result = "nuclear-reactor" }
data.raw.reactor["nuclear-reactor"].neighbour_bonus = 0.25
data.raw.reactor["nuclear-reactor"].meltdown_action.action_delivery.target_effects = {
  {
    type = "create-trivial-smoke",
    smoke_name = "nuclear-smoke",
    repeat_count = 200,
    offset_deviation = { { -1, -1 }, { 1, 1 } },
    starting_frame = 3,
    starting_frame_deviation = 5,
    starting_frame_speed = 0,
    starting_frame_speed_deviation = 5,
    speed_from_center = 0.5,
  },
  { type = "create-entity", entity_name = "big-explosion" },
  { type = "damage", damage = { amount = 500, type = "explosion" } },
  { type = "create-entity", entity_name = "small-scorchmark", check_buildability = true },
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

if not mods["aai-industry"] then
  data.raw["offshore-pump"]["offshore-pump"].energy_usage = "19kW"
  data.raw["offshore-pump"]["offshore-pump"].energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    drain = "1kW",
  }
end

data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance = 20

data.raw["radar"]["radar"].energy_per_nearby_scan = "250kJ"
data.raw["radar"]["radar"].energy_per_sector = "2MJ"
data.raw["radar"]["radar"].energy_usage = "1MW"
data.raw.radar["radar"].fast_replaceable_group = "radar"
data.raw["radar"]["radar"].max_distance_of_nearby_sector_revealed = 5
data.raw["radar"]["radar"].max_distance_of_sector_revealed = 16
data.raw["radar"]["radar"].max_health = 300
data.raw["radar"]["radar"].next_upgrade = "kr-advanced-radar"

data.raw["rocket-silo"]["rocket-silo"].localised_description = { "entity-description.kr-rocket-silo" }

data.raw["roboport"]["roboport"].charging_energy = "1000kW"
data.raw["roboport"]["roboport"].energy_source.input_flow_limit = "5MW"
data.raw["roboport"]["roboport"].material_slots_count = 3
data.raw["roboport"]["roboport"].robot_slots_count = 3

data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-1"].minable = small_crash_site_minable

data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-2"].minable = small_crash_site_minable

data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-3"].minable = small_crash_site_minable

data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-4"].minable = small_crash_site_minable

data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-5"].minable = small_crash_site_minable

data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-6"].minable = small_crash_site_minable

data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"
data.raw["solar-panel"]["solar-panel"].production = "100kW"

convert_equipment_grid("spider-vehicle", "spidertron", "kr-spidertron-equipment-grid")
data.raw["spider-vehicle"]["spidertron"].energy_source = {
  type = "burner",
  emissions_per_minute = { pollution = 0 },
  effectivity = 1,
  render_no_power_icon = true,
  render_no_network_icon = false,
  fuel_inventory_size = 1,
  burnt_inventory_size = 1,
  fuel_categories = { "fusion-fuel" },
}
data.raw["spider-vehicle"]["spidertron"].movement_energy_consumption = "3MW"

data.raw["splitter"]["express-splitter"].next_upgrade = "kr-advanced-splitter"

data.raw.wall["stone-wall"].resistances = {
  { type = "physical", decrease = 3, percent = 20 },
  { type = "impact", decrease = 45, percent = 60 },
  { type = "explosion", decrease = 50, percent = 80 },
  { type = "kr-explosion", percent = 100 },
  { type = "radioactive", percent = 100 },
  { type = "fire", percent = 100 },
  { type = "acid", percent = 80 },
  { type = "laser", percent = 70 },
}

data.raw["transport-belt"]["express-transport-belt"].next_upgrade = "kr-advanced-transport-belt"

data.raw["turret"]["behemoth-worm-turret"].max_health = 5000
data.raw["turret"]["big-worm-turret"].max_health = 2500
data.raw["turret"]["medium-worm-turret"].max_health = 950

data.raw["underground-belt"]["fast-underground-belt"].max_distance = 10

data.raw["underground-belt"]["express-underground-belt"].next_upgrade = "kr-advanced-underground-belt"
data.raw["underground-belt"]["express-underground-belt"].max_distance = 20

data.raw["unit"]["behemoth-biter"].max_health = 3500
data.raw["unit"]["big-biter"].max_health = 500
data.raw["unit"]["medium-biter"].max_health = 100

data.raw["unit"]["behemoth-biter"].absorptions_to_join_attack.pollution = 500

data.raw["unit"]["behemoth-spitter"].max_health = 2500
data.raw["unit"]["big-spitter"].max_health = 350
data.raw["unit"]["medium-spitter"].max_health = 75

data.raw["unit"]["behemoth-spitter"].absorptions_to_join_attack.pollution = 500

data.raw["unit-spawner"]["biter-spawner"].max_health = 750
data.raw["unit-spawner"]["spitter-spawner"].max_health = 750
