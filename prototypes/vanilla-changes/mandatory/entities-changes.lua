local table = require("__flib__.table")

-- -- -- Changing "furnaces" from furnace prototype to assembler prototype

local function transferFromFurnacesToAssemblers(furnace_name)
  if data.raw.furnace[furnace_name] then
    local furnace = krastorio_utils.tables.fullCopy(data.raw.furnace[furnace_name])
    furnace.type = "assembling-machine"
    furnace.source_inventory_size = nil
    furnace.energy_usage = "350kW"
    -- Is this redundant?
    data.raw.furnace[furnace_name] = nil
    data:extend({ furnace })
  end
end

-- Automatically convert all furnaces that have the "smelting" category
-- Fill the excludes list with any breakages that are found
local excludes = table.invert({})
for _, furnace in pairs(data.raw["furnace"]) do
  if not excludes[furnace.name] and table.find(furnace.crafting_categories, "smelting") then
    transferFromFurnacesToAssemblers(furnace.name)
  end
end

-- Boilers

data.raw["boiler"]["boiler"].energy_source.emissions_per_minute = 20

-- Pumpjack sprites modification

data.raw["mining-drill"]["pumpjack"].icon = kr_entities_icons_path .. "oil-pumpjack.png"
data.raw["mining-drill"]["pumpjack"].icon_size = 64
data.raw["mining-drill"]["pumpjack"].icon_mipmaps = nil
data.raw["mining-drill"]["pumpjack"].radius_visualisation_picture.filename = kr_entities_path
  .. "oil-pumpjack/oil-pumpjack-radius-visualization.png"
data.raw["mining-drill"]["pumpjack"].base_picture.sheets = {
  {
    filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-base.png",
    priority = "extra-high",
    width = 131,
    height = 137,
    shift = util.by_pixel(-2.5, -4.5),
    hr_version = {
      filename = kr_entities_path .. "oil-pumpjack/hr-oil-pumpjack-base.png",
      priority = "extra-high",
      width = 261,
      height = 273,
      shift = util.by_pixel(-2.25, -4.75),
      scale = 0.5,
    },
  },
  {
    filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-base-shadow.png",
    priority = "extra-high",
    width = 110,
    height = 111,
    draw_as_shadow = true,
    shift = util.by_pixel(6, 0.5),
    hr_version = {
      filename = kr_entities_path .. "oil-pumpjack/hr-oil-pumpjack-base-shadow.png",
      width = 220,
      height = 220,
      scale = 0.5,
      draw_as_shadow = true,
      shift = util.by_pixel(6, 0.5),
    },
  },
}

data.raw["mining-drill"]["pumpjack"].animations = {
  north = {
    layers = {
      {
        animation_speed = 0.5,
        filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-horsehead.png",
        frame_count = 40,
        height = 102,
        line_length = 8,
        priority = "high",
        shift = util.by_pixel(-4, -24),
        width = 104,
        hr_version = {
          animation_speed = 0.5,
          filename = kr_entities_path .. "oil-pumpjack/hr-oil-pumpjack-horsehead.png",
          frame_count = 40,
          height = 202,
          line_length = 8,
          priority = "high",
          scale = 0.5,
          shift = util.by_pixel(-4, -24),
          width = 206,
        },
      },
      {
        animation_speed = 0.5,
        draw_as_shadow = true,
        filename = kr_entities_path .. "oil-pumpjack/oil-pumpjack-horsehead-shadow.png",
        frame_count = 40,
        height = 41,
        line_length = 8,
        priority = "high",
        shift = util.by_pixel(17.5, 14.5),
        width = 155,
        hr_version = {
          animation_speed = 0.5,
          draw_as_shadow = true,
          filename = kr_entities_path .. "oil-pumpjack/hr-oil-pumpjack-horsehead-shadow.png",
          frame_count = 40,
          height = 82,
          line_length = 8,
          priority = "high",
          scale = 0.5,
          shift = util.by_pixel(17.75, 14.5),
          width = 309,
        },
      },
    },
  },
}

data.raw.corpse["pumpjack-remnants"].animation = make_rotated_animation_variations_from_sheet(2, {
  filename = kr_entities_path .. "oil-pumpjack/remnants/oil-pumpjack-remnants.png",
  line_length = 1,
  width = 138,
  height = 142,
  frame_count = 1,
  direction_count = 1,
  shift = util.by_pixel(0, 3),
  hr_version = {
    filename = kr_entities_path .. "oil-pumpjack/remnants/hr-oil-pumpjack-remnants.png",
    line_length = 1,
    width = 274,
    height = 284,
    frame_count = 1,
    direction_count = 1,
    shift = util.by_pixel(0, 3.5),
    scale = 0.5,
  },
})

-- Offshore pump
data.raw["offshore-pump"]["offshore-pump"].pumping_speed = 20.8334

-- Chemical plant
--data.raw["assembling-machine"]["chemical-plant"].energy_source.emissions_per_minute = 2

-- Lab
data.raw.lab["lab"].fast_replaceable_group = "lab"
data.raw.lab["lab"].next_upgrade = "biusart-lab"

-- Solar panel
data.raw["solar-panel"]["solar-panel"].production = "100KW"
data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"

-- Radar
data.raw.radar["radar"].fast_replaceable_group = "radar"

-- Wall&gate resistances
data.raw.wall["stone-wall"].resistances = {
  {
    type = "physical",
    decrease = 3,
    percent = 20,
  },
  {
    type = "impact",
    decrease = 45,
    percent = 60,
  },
  {
    type = "explosion",
    decrease = 50,
    percent = 80,
  },
  {
    type = "kr-explosion",
    percent = 100,
  },
  {
    type = "radioactive",
    percent = 100,
  },
  {
    type = "fire",
    percent = 100,
  },
  {
    type = "acid",
    percent = 80,
  },
  {
    type = "laser",
    percent = 70,
  },
}
data.raw.gate["gate"].resistances = {
  {
    type = "physical",
    decrease = 3,
    percent = 20,
  },
  {
    type = "impact",
    decrease = 45,
    percent = 60,
  },
  {
    type = "explosion",
    decrease = 50,
    percent = 80,
  },
  {
    type = "radioactive",
    percent = 100,
  },
  {
    type = "fire",
    percent = 100,
  },
  {
    type = "acid",
    percent = 80,
  },
  {
    type = "laser",
    percent = 70,
  },
}

-- Spaceship drops
-- Minable random drops
local small_minable_ship_residues = {
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

krastorio.entities.overrideMiningResult("container", "crash-site-spaceship-wreck-medium-1", small_minable_ship_residues)
krastorio.entities.overrideMiningResult("container", "crash-site-spaceship-wreck-medium-2", small_minable_ship_residues)
krastorio.entities.overrideMiningResult("container", "crash-site-spaceship-wreck-medium-3", small_minable_ship_residues)

krastorio.entities.overrideMiningResult(
  "simple-entity-with-owner",
  "crash-site-spaceship-wreck-small-1",
  small_minable_ship_residues
)
krastorio.entities.overrideMiningResult(
  "simple-entity-with-owner",
  "crash-site-spaceship-wreck-small-2",
  small_minable_ship_residues
)
krastorio.entities.overrideMiningResult(
  "simple-entity-with-owner",
  "crash-site-spaceship-wreck-small-3",
  small_minable_ship_residues
)
krastorio.entities.overrideMiningResult(
  "simple-entity-with-owner",
  "crash-site-spaceship-wreck-small-4",
  small_minable_ship_residues
)
krastorio.entities.overrideMiningResult(
  "simple-entity-with-owner",
  "crash-site-spaceship-wreck-small-5",
  small_minable_ship_residues
)
krastorio.entities.overrideMiningResult(
  "simple-entity-with-owner",
  "crash-site-spaceship-wreck-small-6",
  small_minable_ship_residues
)

local crash_ship_residues = {
  mining_time = 10,
  results = {
    { type = "item", name = "iron-plate", amount_min = 75, amount_max = 200 },
    { type = "item", name = "copper-cable", amount_min = 75, amount_max = 200 },
    { type = "item", name = "kr-sentinel", amount_min = 1, amount_max = 3 },
  },
  mining_particle = "shell-particle",
}

krastorio.entities.overrideMiningResult("container", "crash-site-spaceship", crash_ship_residues)

-- Spidertron fuel usage
data.raw["spider-vehicle"]["spidertron"].energy_source = {
  type = "burner",
  emissions_per_minute = 0,
  effectivity = 1,
  render_no_power_icon = true,
  render_no_network_icon = false,
  fuel_inventory_size = 1,
  burnt_inventory_size = 1,
  fuel_category = "fusion-fuel",
}
data.raw["spider-vehicle"]["spidertron"].movement_energy_consumption = "3MW"
data.raw["corpse"]["spidertron-remnants"].animation = make_rotated_animation_variations_from_sheet(1, {
  layers = {
    {
      filename = kr_entities_path .. "remnants/spidertron/spidertron-remnants.png",
      line_length = 1,
      width = 224,
      height = 224,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0, 0),
      hr_version = {
        filename = kr_entities_path .. "remnants/spidertron/hr-spidertron-remnants.png",
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
    },
    {
      priority = "low",
      filename = "__base__/graphics/entity/spidertron/remnants/mask/spidertron-remnants-mask.png",
      width = 184,
      height = 176,
      frame_count = 1,
      apply_runtime_tint = true,
      direction_count = 1,
      shift = util.by_pixel(9, 1),
      hr_version = {
        priority = "low",
        filename = "__base__/graphics/entity/spidertron/remnants/mask/hr-spidertron-remnants-mask.png",
        width = 366,
        height = 350,
        frame_count = 1,
        apply_runtime_tint = true,
        direction_count = 1,
        shift = util.by_pixel(9, 1),
        scale = 0.5,
      },
    },
  },
})
