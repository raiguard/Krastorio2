return {
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -- -- --
  -- NEW LABORATORIES
  -- -- --
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
  -- -- --
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
}
