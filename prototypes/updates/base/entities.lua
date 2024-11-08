local data_util = require("data-util")

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

data.raw.boiler["boiler"].energy_source.emissions_per_minute = { pollution = 20 }

data.raw.boiler["heat-exchanger"].energy_consumption = "50MW"
data.raw.boiler["heat-exchanger"].energy_source.max_transfer = "10GW"
data.raw.boiler["heat-exchanger"].energy_source.min_working_temperature = 415
data.raw.boiler["heat-exchanger"].energy_source.specific_heat = "5MJ"
data.raw.boiler["heat-exchanger"].max_health = 250
data.raw.boiler["heat-exchanger"].target_temperature = 415

convert_equipment_grid("car", "car", "kr-car-grid")

convert_equipment_grid("car", "tank", "kr-tank-grid")

convert_equipment_grid("cargo-wagon", "cargo-wagon", "kr-wagons-grid")
data.raw["cargo-wagon"]["cargo-wagon"].allow_robot_dispatch_in_automatic_mode = true

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

convert_equipment_grid("fluid-wagon", "fluid-wagon", "kr-wagons-grid")

data.raw.gate["gate"].resistances = {
  { type = "physical", decrease = 3, percent = 20 },
  { type = "impact", decrease = 45, percent = 60 },
  { type = "explosion", decrease = 50, percent = 80 },
  { type = "radioactive", percent = 100 },
  { type = "fire", percent = 100 },
  { type = "acid", percent = 80 },
  { type = "laser", percent = 70 },
}

data.raw["heat-pipe"]["heat-pipe"].heat_buffer.max_transfer = "6GW"
data.raw["heat-pipe"]["heat-pipe"].heat_buffer.specific_heat = "6MJ"
data.raw["heat-pipe"]["heat-pipe"].max_health = 100

data.raw.lab["lab"].fast_replaceable_group = "lab"
data.raw.lab["lab"].next_upgrade = "biusart-lab"

convert_equipment_grid("locomotive", "locomotive", "kr-locomotive-grid")

data_util.set_icon(
  data.raw["mining-drill"]["electric-mining-drill"],
  "__Krastorio2Assets__/icons/entities/electric-mining-drill.png"
)

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

data.raw.radar["radar"].fast_replaceable_group = "radar"

data.raw["rocket-silo"]["rocket-silo"].localised_description = { "entity-description.kr-rocket-silo" }

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
