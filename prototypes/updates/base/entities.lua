data.raw.boiler["boiler"].energy_source.emissions_per_minute = { pollution = 20 }

data.raw.lab["lab"].fast_replaceable_group = "lab"
data.raw.radar["radar"].fast_replaceable_group = "radar"
data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"

data.raw["rocket-silo"]["rocket-silo"].localised_description = { "entity-description.kr-rocket-silo" }

data.raw.lab["lab"].next_upgrade = "biusart-lab"

data.raw["solar-panel"]["solar-panel"].production = "100kW"

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
data.raw.gate["gate"].resistances = {
  { type = "physical", decrease = 3, percent = 20 },
  { type = "impact", decrease = 45, percent = 60 },
  { type = "explosion", decrease = 50, percent = 80 },
  { type = "radioactive", percent = 100 },
  { type = "fire", percent = 100 },
  { type = "acid", percent = 80 },
  { type = "laser", percent = 70 },
}

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

data.raw.container["crash-site-chest-1"].minable = small_crash_site_minable
data.raw.container["crash-site-chest-2"].minable = small_crash_site_minable
data.raw.container["crash-site-spaceship-wreck-medium-1"].minable = small_crash_site_minable
data.raw.container["crash-site-spaceship-wreck-medium-2"].minable = small_crash_site_minable
data.raw.container["crash-site-spaceship-wreck-medium-3"].minable = small_crash_site_minable
data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-1"].minable = small_crash_site_minable
data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-2"].minable = small_crash_site_minable
data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-3"].minable = small_crash_site_minable
data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-4"].minable = small_crash_site_minable
data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-5"].minable = small_crash_site_minable
data.raw["simple-entity-with-owner"]["crash-site-spaceship-wreck-small-6"].minable = small_crash_site_minable

data.raw.container["crash-site-spaceship"].minable = {
  mining_time = 10,
  results = {
    { type = "item", name = "iron-plate", amount_min = 75, amount_max = 200 },
    { type = "item", name = "copper-cable", amount_min = 75, amount_max = 200 },
    { type = "item", name = "kr-sentinel", amount_min = 1, amount_max = 3 },
  },
  mining_particle = "shell-particle",
}

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
data.raw["corpse"]["spidertron-remnants"].animation = make_rotated_animation_variations_from_sheet(1, {
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
