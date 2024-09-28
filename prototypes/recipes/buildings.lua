return {
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "recipe",
    name = "kr-electric-mining-drill-mk2",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "electric-mining-drill", amount = 1 },
      { type = "item", name = "steel-gear-wheel", amount = 5 },
      { type = "item", name = "rare-metals", amount = 4 },
    },
    results = { { type = "item", name = "kr-electric-mining-drill-mk2", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-electric-mining-drill-mk3",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-electric-mining-drill-mk2", amount = 1 },
      { type = "item", name = "imersium-gear-wheel", amount = 5 },
      { type = "item", name = "imersite-crystal", amount = 4 },
    },
    results = { { type = "item", name = "kr-electric-mining-drill-mk3", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-tesla-coil",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-beam", amount = 20 },
      { type = "item", name = "electronic-circuit", amount = 20 },
      { type = "item", name = "copper-cable", amount = 100 },
    },
    results = { { type = "item", name = "kr-tesla-coil", amount = 1 } },
  },
  -- -- --
  -- NEW LABORATORIES
  -- -- --
  {
    type = "recipe",
    name = "biusart-lab",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "advanced-circuit", amount = 10 },
      { type = "item", name = "steel-beam", amount = 5 },
      { type = "item", name = "lab", amount = 1 },
      { type = "item", name = "copper-cable", amount = 10 },
    },
    results = { { type = "item", name = "biusart-lab", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-singularity-lab",
    energy_required = 120,
    enabled = false,
    ingredients = {
      { type = "item", name = "ai-core", amount = 20 },
      { type = "item", name = "biusart-lab", amount = 5 },
      { type = "item", name = "steel-plate", amount = 40 },
      { type = "item", name = "electric-engine-unit", amount = 30 },
      { type = "item", name = "rare-metals", amount = 60 },
      { type = "item", name = "processing-unit", amount = 100 },
    },
    results = { { type = "item", name = "kr-singularity-lab", amount = 1 } },
  },
  -- -- --
  -- Research servers
  -- -- --
  -- -- --
  -- FLUID STORAGES
  -- -- --
  {
    type = "recipe",
    name = "kr-fluid-storage-1",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-beam", amount = 10 },
      { type = "item", name = "steel-plate", amount = 20 },
      { type = "item", name = "kr-steel-pipe", amount = 4 },
    },
    results = { { type = "item", name = "kr-fluid-storage-1", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-fluid-storage-2",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-beam", amount = 20 },
      { type = "item", name = "steel-plate", amount = 60 },
      { type = "item", name = "kr-steel-pipe", amount = 12 },
    },
    results = { { type = "item", name = "kr-fluid-storage-2", amount = 1 } },
  },
  -- -- --
  ---
  -- Belts
  ---
  -- Advanced
  {
    type = "recipe",
    name = "kr-advanced-splitter",
    --category = "crafting-with-fluid",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "express-splitter", amount = 1 },
      { type = "item", name = "steel-gear-wheel", amount = 4 },
      { type = "item", name = "advanced-circuit", amount = 1 },
    },
    results = { { type = "item", name = "kr-advanced-splitter", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-advanced-transport-belt",
    --category = "crafting-with-fluid",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
      { type = "item", name = "express-transport-belt", amount = 1 },
      { type = "item", name = "steel-gear-wheel", amount = 4 },
      { type = "item", name = "rare-metals", amount = 1 },
    },
    results = { { type = "item", name = "kr-advanced-transport-belt", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-advanced-underground-belt",
    --category = "crafting-with-fluid",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "express-underground-belt", amount = 2 },
      { type = "item", name = "kr-advanced-transport-belt", amount = 30 },
    },
    results = { { type = "item", name = "kr-advanced-underground-belt", amount = 2 } },
  },
  -- Superior
  {
    type = "recipe",
    name = "kr-superior-splitter",
    --category = "crafting-with-fluid",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-advanced-splitter", amount = 1 },
      { type = "item", name = "imersium-gear-wheel", amount = 4 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "kr-superior-splitter", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-superior-transport-belt",
    --category = "crafting-with-fluid",
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
    type = "recipe",
    name = "kr-superior-underground-belt",
    --category = "crafting-with-fluid",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "kr-advanced-underground-belt", amount = 2 },
      { type = "item", name = "kr-superior-transport-belt", amount = 40 },
    },
    results = { { type = "item", name = "kr-superior-underground-belt", amount = 2 } },
  },
  -- -- --
  -- Superior inserters
  -- -- --
  {
    type = "recipe",
    name = "kr-superior-inserter",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "inserter-parts", amount = 1 },
      { type = "item", name = "imersium-plate", amount = 1 },
      { type = "item", name = "imersium-gear-wheel", amount = 4 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "kr-superior-inserter", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-superior-long-inserter",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "inserter-parts", amount = 2 },
      { type = "item", name = "imersium-plate", amount = 2 },
      { type = "item", name = "imersium-gear-wheel", amount = 4 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "kr-superior-long-inserter", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-superior-filter-inserter",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "inserter-parts", amount = 1 },
      { type = "item", name = "imersium-plate", amount = 1 },
      { type = "item", name = "imersium-gear-wheel", amount = 4 },
      { type = "item", name = "processing-unit", amount = 2 },
    },
    results = { { type = "item", name = "kr-superior-filter-inserter", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-superior-long-filter-inserter",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "inserter-parts", amount = 2 },
      { type = "item", name = "imersium-plate", amount = 2 },
      { type = "item", name = "imersium-gear-wheel", amount = 4 },
      { type = "item", name = "processing-unit", amount = 2 },
    },
    results = { { type = "item", name = "kr-superior-long-filter-inserter", amount = 1 } },
  },
  -- -- --
  {
    type = "recipe",
    name = "kr-advanced-assembling-machine",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "imersium-beam", amount = 4 },
      { type = "item", name = "assembling-machine-3", amount = 2 },
      { type = "item", name = "electric-furnace", amount = 2 },
      { type = "item", name = "ai-core", amount = 2 },
    },
    results = { { type = "item", name = "kr-advanced-assembling-machine", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-large-roboport",
    energy_required = 30,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-plate", amount = 20 },
      { type = "item", name = "imersium-beam", amount = 20 },
      { type = "item", name = "imersium-gear-wheel", amount = 20 },
      { type = "item", name = "rare-metals", amount = 80 },
      { type = "item", name = "ai-core", amount = 10 },
      { type = "item", name = "roboport", amount = 1 },
    },
    results = { { type = "item", name = "kr-large-roboport", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-small-roboport",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "imersium-beam", amount = 3 },
      { type = "item", name = "steel-plate", amount = 10 },
      { type = "item", name = "rare-metals", amount = 20 },
      { type = "item", name = "ai-core", amount = 1 },
      { type = "item", name = "electronic-components", amount = 5 },
    },
    results = { { type = "item", name = "kr-small-roboport", amount = 2 } },
  },
  {
    type = "recipe",
    name = "kr-railgun-turret",
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "gun-turret", amount = 4 },
      { type = "item", name = "steel-beam", amount = 10 },
      { type = "item", name = "processing-unit", amount = 10 },
      { type = "item", name = "rare-metals", amount = 20 },
      { type = "item", name = "low-density-structure", amount = 10 },
    },
    results = { { type = "item", name = "kr-railgun-turret", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-rocket-turret",
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "rocket-launcher", amount = 6 },
      { type = "item", name = "steel-beam", amount = 10 },
      { type = "item", name = "rare-metals", amount = 20 },
      { type = "item", name = "processing-unit", amount = 20 },
      { type = "item", name = "low-density-structure", amount = 10 },
    },
    results = { { type = "item", name = "kr-rocket-turret", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-laser-artillery-turret",
    enabled = false,
    energy_required = 20,
    ingredients = {
      { type = "item", name = "energy-control-unit", amount = 6 },
      { type = "item", name = "steel-beam", amount = 10 },
      { type = "item", name = "rare-metals", amount = 20 },
      { type = "item", name = "ai-core", amount = 10 },
      { type = "item", name = "low-density-structure", amount = 10 },
    },
    results = { { type = "item", name = "kr-laser-artillery-turret", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-logo",
    energy_required = 666,
    enabled = false,
    ingredients = {
      { type = "item", name = "iron-stick", amount = 5000 },
      { type = "item", name = "poop", amount = 1 },
    },
    results = { { type = "item", name = "kr-logo", amount = 1 } },
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
}
