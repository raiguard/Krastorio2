-- Recipe for make equipments (armors included)
return {
  -----------------------------------------------------------------------------------------------------------------
  --------------------------------------------------CHARACTER EQUIPMENTS-------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "recipe",
    name = "power-armor-mk3",
    enabled = false,
    energy_required = 40,
    ingredients = {
      { type = "item", name = "power-armor-mk2", amount = 1 },
      { type = "item", name = "speed-module-3", amount = 25 },
      { type = "item", name = "effectivity-module-3", amount = 25 },
      { type = "item", name = "energy-control-unit", amount = 25 },
    },
    results = { { type = "item", name = "power-armor-mk3", amount = 1 } },
    requester_paste_multiplier = 1,
  },
  {
    type = "recipe",
    name = "power-armor-mk4",
    enabled = false,
    energy_required = 40,
    category = "crafting-with-fluid",
    ingredients = {
      { type = "item", name = "power-armor-mk3", amount = 1 },
      { type = "item", name = "ai-core", amount = 40 },
      { type = "item", name = "imersium-plate", amount = 40 },
      { type = "item", name = "imersite-crystal", amount = 10 },
      { type = "fluid", name = "nitric-acid", amount = 50 },
    },
    results = { { type = "item", name = "power-armor-mk4", amount = 1 } },
    requester_paste_multiplier = 1,
  },
  -- -- Exoskeletons
  {
    type = "recipe",
    name = "advanced-exoskeleton-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "exoskeleton-equipment", amount = 1 },
      { type = "item", name = "low-density-structure", amount = 10 },
      { type = "item", name = "advanced-circuit", amount = 10 },
      { type = "item", name = "speed-module-2", amount = 10 },
    },
    results = { { type = "item", name = "advanced-exoskeleton-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "superior-exoskeleton-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "advanced-exoskeleton-equipment", amount = 1 },
      { type = "item", name = "ai-core", amount = 10 },
      { type = "item", name = "imersium-plate", amount = 10 },
      { type = "item", name = "speed-module-3", amount = 10 },
    },
    results = { { type = "item", name = "superior-exoskeleton-equipment", amount = 1 } },
  },
  -- -- Imersite night visor
  {
    type = "recipe",
    name = "imersite-night-vision-equipment",
    enabled = false,
    energy_required = 10,
    category = "crafting-with-fluid",
    ingredients = {
      { type = "item", name = "night-vision-equipment", amount = 1 },
      { type = "item", name = "low-density-structure", amount = 10 },
      { type = "item", name = "advanced-circuit", amount = 10 },
      { type = "item", name = "imersite-crystal", amount = 5 },
      { type = "fluid", name = "nitric-acid", amount = 25 },
    },
    results = { { type = "item", name = "imersite-night-vision-equipment", amount = 1 } },
  },
  -----------------------------------------------------------------------------------------------------------------
  --------------------------------------------------VEHICLES EQUIPMENTS--------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  {
    type = "recipe",
    name = "additional-engine",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "electric-engine-unit", amount = 2 },
      { type = "item", name = "electronic-circuit", amount = 5 },
      { type = "item", name = "steel-plate", amount = 5 },
    },
    results = { { type = "item", name = "additional-engine", amount = 1 } },
  },
  {
    type = "recipe",
    name = "advanced-additional-engine",
    energy_required = 30,
    enabled = false,
    ingredients = {
      { type = "item", name = "additional-engine", amount = 2 },
      { type = "item", name = "steel-plate", amount = 5 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "advanced-additional-engine", amount = 1 } },
  },
  {
    type = "recipe",
    name = "vehicle-roboport",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "personal-roboport-equipment", amount = 2 },
      { type = "item", name = "steel-plate", amount = 4 },
      { type = "item", name = "advanced-circuit", amount = 1 },
    },
    results = { { type = "item", name = "vehicle-roboport", amount = 1 } },
  },
  -----------------------------------------------------------------------------------------------------------------
  --------------------------------------------------UNIVERSAL EQUIPMENTS-------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -- -- BATTERIES
  -- battery-mk3-equipment
  {
    type = "recipe",
    name = "battery-mk3-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "battery-mk2-equipment", amount = 2 },
      { type = "item", name = "lithium-sulfur-battery", amount = 4 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "battery-mk3-equipment", amount = 1 } },
  },
  -- big-battery-equipment
  {
    type = "recipe",
    name = "big-battery-equipment",
    energy_required = 15,
    enabled = false,
    ingredients = {
      { type = "item", name = "battery-equipment", amount = 4 },
      { type = "item", name = "iron-plate", amount = 4 },
      { type = "item", name = "copper-plate", amount = 1 },
    },
    results = { { type = "item", name = "big-battery-equipment", amount = 1 } },
  },
  -- big-battery-mk2-equipment
  {
    type = "recipe",
    name = "big-battery-mk2-equipment",
    energy_required = 30,
    enabled = false,
    ingredients = {
      { type = "item", name = "big-battery-equipment", amount = 2 },
      { type = "item", name = "steel-plate", amount = 4 },
      { type = "item", name = "advanced-circuit", amount = 2 },
    },
    results = { { type = "item", name = "big-battery-mk2-equipment", amount = 1 } },
  },
  -- big-battery-mk3-equipment
  {
    type = "recipe",
    name = "big-battery-mk3-equipment",
    energy_required = 60,
    enabled = false,
    ingredients = {
      { type = "item", name = "big-battery-mk2-equipment", amount = 2 },
      { type = "item", name = "lithium-sulfur-battery", amount = 4 },
      { type = "item", name = "processing-unit", amount = 2 },
    },
    results = { { type = "item", name = "big-battery-mk3-equipment", amount = 1 } },
  },
  -- -- GENERATORS
  -- small-portable-generator-equipment
  {
    type = "recipe",
    name = "small-portable-generator",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "engine-unit", amount = 1 },
      { type = "item", name = "iron-beam", amount = 2 },
    },
    results = { { type = "item", name = "small-portable-generator", amount = 1 } },
  },
  -- portable-generator
  {
    type = "recipe",
    name = "portable-generator",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "iron-beam", amount = 2 },
      { type = "item", name = "engine-unit", amount = 2 },
      { type = "item", name = "small-portable-generator", amount = 2 },
    },
    results = { { type = "item", name = "portable-generator", amount = 1 } },
  },
  -- nuclear-reactor-equipment
  {
    type = "recipe",
    name = "nuclear-reactor-equipment",
    energy_required = 60,
    enabled = false,
    ingredients = {
      { type = "item", name = "copper-plate", amount = 50 },
      { type = "item", name = "steel-plate", amount = 50 },
      { type = "item", name = "advanced-circuit", amount = 50 },
    },
    results = { { type = "item", name = "nuclear-reactor-equipment", amount = 1 } },
  },
  -- antimatter-reactor-equipment
  {
    type = "recipe",
    name = "antimatter-reactor-equipment",
    energy_required = 60,
    enabled = false,
    ingredients = {
      { type = "item", name = "energy-control-unit", amount = 25 },
      { type = "item", name = "imersium-plate", amount = 100 },
      { type = "item", name = "ai-core", amount = 25 },
    },
    results = { { type = "item", name = "antimatter-reactor-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "energy-absorber",
    energy_required = 3,
    enabled = false,
    ingredients = {
      { type = "item", name = "copper-plate", amount = 6 },
      { type = "item", name = "copper-cable", amount = 12 },
      { type = "item", name = "battery", amount = 6 },
    },
    results = { { type = "item", name = "energy-absorber", amount = 1 } },
  },
  -- -- SOLAR PANELS (GENERATORS)
  {
    type = "recipe",
    name = "big-solar-panel-equipment",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "solar-panel-equipment", amount = 4 },
      { type = "item", name = "electronic-components", amount = 10 },
    },
    results = { { type = "item", name = "big-solar-panel-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "imersite-solar-panel-equipment",
    energy_required = 20,
    enabled = false,
    category = "crafting-with-fluid",
    ingredients = {
      { type = "item", name = "solar-panel-equipment", amount = 1 },
      { type = "item", name = "imersite-crystal", amount = 5 },
      { type = "fluid", name = "nitric-acid", amount = 25 },
      { type = "item", name = "processing-unit", amount = 1 },
    },
    results = { { type = "item", name = "imersite-solar-panel-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "big-imersite-solar-panel-equipment",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "imersite-solar-panel-equipment", amount = 4 },
      { type = "item", name = "electronic-components", amount = 40 },
    },
    results = { { type = "item", name = "big-imersite-solar-panel-equipment", amount = 1 } },
  },
  -- -- PERSONAL DEFENCES
  {
    type = "recipe",
    name = "personal-laser-defense-mk2-equipment",
    energy_required = 10,
    ingredients = {
      { type = "item", name = "personal-laser-defense-equipment", amount = 1 },
      { type = "item", name = "lithium-sulfur-battery", amount = 5 },
      { type = "item", name = "advanced-circuit", amount = 10 },
    },
    enabled = false,
    results = { { type = "item", name = "personal-laser-defense-mk2-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "personal-laser-defense-mk3-equipment",
    energy_required = 10,
    ingredients = {
      { type = "item", name = "personal-laser-defense-mk2-equipment", amount = 1 },
      { type = "item", name = "processing-unit", amount = 10 },
      { type = "item", name = "lithium-sulfur-battery", amount = 10 },
      { type = "item", name = "imersium-plate", amount = 5 },
    },
    enabled = false,
    results = { { type = "item", name = "personal-laser-defense-mk3-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "personal-laser-defense-mk4-equipment",
    energy_required = 10,
    ingredients = {
      { type = "item", name = "personal-laser-defense-mk3-equipment", amount = 1 },
      { type = "item", name = "ai-core", amount = 10 },
      { type = "item", name = "lithium-sulfur-battery", amount = 20 },
      { type = "item", name = "energy-control-unit", amount = 10 },
    },
    enabled = false,
    results = { { type = "item", name = "personal-laser-defense-mk4-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "personal-submachine-laser-defense-mk1-equipment",
    energy_required = 15,
    enabled = false,
    ingredients = {
      { type = "item", name = "laser-turret", amount = 1 },
      { type = "item", name = "battery", amount = 5 },
      { type = "item", name = "electronic-components", amount = 10 },
      { type = "item", name = "iron-plate", amount = 5 },
    },
    results = { { type = "item", name = "personal-submachine-laser-defense-mk1-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "personal-submachine-laser-defense-mk2-equipment",
    energy_required = 30,
    enabled = false,
    ingredients = {
      { type = "item", name = "personal-submachine-laser-defense-mk1-equipment", amount = 1 },
      { type = "item", name = "battery", amount = 10 },
      { type = "item", name = "advanced-circuit", amount = 10 },
      { type = "item", name = "steel-plate", amount = 5 },
    },
    results = { { type = "item", name = "personal-submachine-laser-defense-mk2-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "personal-submachine-laser-defense-mk3-equipment",
    energy_required = 60,
    enabled = false,
    ingredients = {
      { type = "item", name = "personal-submachine-laser-defense-mk2-equipment", amount = 1 },
      { type = "item", name = "processing-unit", amount = 10 },
      { type = "item", name = "lithium-sulfur-battery", amount = 5 },
      { type = "item", name = "imersium-plate", amount = 5 },
    },
    results = { { type = "item", name = "personal-submachine-laser-defense-mk3-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "personal-submachine-laser-defense-mk4-equipment",
    energy_required = 90,
    enabled = false,
    ingredients = {
      { type = "item", name = "personal-submachine-laser-defense-mk3-equipment", amount = 1 },
      { type = "item", name = "ai-core", amount = 10 },
      { type = "item", name = "lithium-sulfur-battery", amount = 10 },
      { type = "item", name = "energy-control-unit", amount = 5 },
    },
    results = { { type = "item", name = "personal-submachine-laser-defense-mk4-equipment", amount = 1 } },
  },
  -- -- SHIELDS
  {
    type = "recipe",
    name = "energy-shield-mk3-equipment",
    enabled = false,
    energy_required = 40,
    ingredients = {
      { type = "item", name = "energy-shield-mk2-equipment", amount = 5 },
      { type = "item", name = "electronic-components", amount = 20 },
      { type = "item", name = "lithium-sulfur-battery", amount = 10 },
    },
    results = { { type = "item", name = "energy-shield-mk3-equipment", amount = 1 } },
  },
  {
    type = "recipe",
    name = "energy-shield-mk4-equipment",
    enabled = false,
    energy_required = 80,
    ingredients = {
      { type = "item", name = "energy-shield-mk3-equipment", amount = 5 },
      { type = "item", name = "ai-core", amount = 5 },
      { type = "item", name = "imersium-plate", amount = 10 },
    },
    results = { { type = "item", name = "energy-shield-mk4-equipment", amount = 1 } },
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
}
