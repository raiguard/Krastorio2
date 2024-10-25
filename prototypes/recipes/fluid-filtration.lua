data:extend({
  {
    type = "recipe",
    name = "quartz",
    icon = "__Krastorio2Assets__/icons/items-with-variations/quartz/quartz.png",
    icon_size = 64,
    category = "fluid-filtration",
    subgroup = "raw-material",
    energy_required = 2.1,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    ingredients = {
      { type = "item", name = "sand", amount = 10 },
      { type = "fluid", name = "water", amount = 10 },
    },
    results = {
      { type = "item", name = "quartz", amount = 6 },
    },
    crafting_machine_tint = {
      primary = { r = 0.96, g = 0.64, b = 0.38, a = 0.6 }, --dirty
      secondary = { r = 0.55, g = 0.55, b = 0.51, a = 0.5 }, --clear
    },
  },
  {
    type = "recipe",
    name = "coal-filtration",
    icon = "__Krastorio2Assets__/icons/recipes/coal-filtration.png",
    icon_size = 64,
    category = "fluid-filtration",
    subgroup = "raw-material",
    energy_required = 2,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    ingredients = {
      { type = "fluid", name = "heavy-oil", amount = 80 },
    },
    results = {
      { type = "item", name = "coal", amount = 8 },
      { type = "fluid", name = "water", amount = 40 },
    },
    crafting_machine_tint = {
      primary = data.raw.fluid["heavy-oil"].base_color, --dirty
      secondary = { r = 0.64, g = 0.83, b = 0.93, a = 0.9 }, --clear
    },
  },
  {
    type = "recipe",
    name = "dirty-water-filtration-1",
    category = "fluid-filtration",
    icons = {
      {
        icon = data.raw.fluid["dirty-water"].icon,
        icon_size = data.raw.fluid["dirty-water"].icon_size or 64,
      },
      {
        icon = data.raw.item["iron-ore"].icon,
        icon_size = data.raw.item["iron-ore"].icon_size or 64,
        scale = 0.20 * ((data.raw.fluid["dirty-water"].icon_size or 64) / (data.raw.item["iron-ore"].icon_size or 64)),
        shift = { 0, 4 },
      },
    },
    icon_size = data.raw.fluid["dirty-water"].icon_size or 64,
    energy_required = 2,
    enabled = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    always_show_products = true,
    ingredients = {
      { type = "fluid", name = "dirty-water", amount = 100 },
    },
    results = {
      { type = "fluid", name = "water", amount = 100 },
      { type = "item", name = "stone", probability = 0.30, amount = 1 },
      { type = "item", name = "iron-ore", probability = 0.10, amount = 1 },
    },
    crafting_machine_tint = {
      primary = { r = 0.49, g = 0.62, b = 0.75, a = 0.6 }, --dirty
      secondary = { r = 0.64, g = 0.83, b = 0.93, a = 0.9 }, --clear
    },
    subgroup = "raw-material",
    order = "w011[dirty-water-filtration-1]",
  },
  {
    type = "recipe",
    name = "dirty-water-filtration-2",
    category = "fluid-filtration",
    icons = {
      {
        icon = data.raw.fluid["dirty-water"].icon,
        icon_size = data.raw.fluid["dirty-water"].icon_size or 64,
      },
      {
        icon = data.raw.item["copper-ore"].icon,
        icon_size = data.raw.item["copper-ore"].icon_size or 64,
        scale = 0.20
          * ((data.raw.fluid["dirty-water"].icon_size or 64) / (data.raw.item["copper-ore"].icon_size or 64)),
        shift = { 0, 4 },
      },
    },
    icon_size = data.raw.fluid["dirty-water"].icon_size,
    energy_required = 2,
    enabled = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    always_show_products = true,
    ingredients = {
      { type = "fluid", name = "dirty-water", amount = 100 },
    },
    results = {
      { type = "fluid", name = "water", amount = 100 },
      { type = "item", name = "stone", probability = 0.30, amount = 1 },
      { type = "item", name = "copper-ore", probability = 0.10, amount = 1 },
    },
    crafting_machine_tint = {
      primary = { r = 0.60, g = 0.20, b = 0, a = 0.6 }, --dirty
      secondary = { r = 0.64, g = 0.83, b = 0.93, a = 0.9 }, --clear
    },
    subgroup = "raw-material",
    order = "w012[dirty-water-filtration-2]",
  },
  {
    type = "recipe",
    name = "dirty-water-filtration-3",
    category = "fluid-filtration",
    icons = {
      { icon = "__Krastorio2Assets__/icons/fluids/dirty-water.png" },
      {
        icon = "__Krastorio2Assets__/icons/items-with-variations/raw-rare-metals/raw-rare-metals.png",
        scale = 0.20,
        shift = { 0, 4 },
      },
    },
    subgroup = "raw-material",
    order = "w013[dirty-water-filtration-3]",
    energy_required = 2,
    enabled = false,
    allow_as_intermediate = false,
    always_show_made_in = true,
    always_show_products = true,
    ingredients = {
      { type = "fluid", name = "dirty-water", amount = 100 },
    },
    results = {
      { type = "fluid", name = "water", amount = 100 },
      { type = "item", name = "stone", probability = 0.30, amount = 1 },
      { type = "item", name = "raw-rare-metals", probability = 0.05, amount = 1 },
    },
    crafting_machine_tint = {
      primary = { r = 0.60, g = 0.20, b = 0, a = 0.6 }, -- Dirty
      secondary = { r = 1.0, g = 0.843, b = 0.0, a = 0.9 }, -- Clear
    },
  },
})
