data:extend({
  {
    type = "recipe",
    name = "kr-water-electrolysis",
    icon = "__Krastorio2Assets__/icons/recipes/water-electrolysis.png",
    subgroup = "fluid-recipes",
    order = "y01[water-electrolysis]",
    enabled = false,
    category = "electrolysis",
    energy_required = 3,
    ingredients = {
      { type = "item", name = "sand", amount = 10 },
      { type = "fluid", name = "water", amount = 40 },
    },
    results = {
      { type = "fluid", name = "chlorine", amount = 20 },
      { type = "fluid", name = "hydrogen", amount = 30 },
    },
    always_show_made_in = true,
    always_show_products = true,
    crafting_machine_tint = {
      primary = { r = 0.10, g = 0.75, b = 0.10, a = 0.10 },
    },
  },
  {
    type = "recipe",
    name = "kr-water-separation",
    subgroup = "fluid-recipes",
    order = "y02[water-separation]",
    icon = "__Krastorio2Assets__/icons/recipes/water-separation.png",
    icon_size = 128,
    enabled = false,
    category = "electrolysis",
    energy_required = 3,
    ingredients = {
      { type = "fluid", name = "water", amount = 50 },
    },
    results = {
      { type = "fluid", name = "oxygen", amount = 20 },
      { type = "fluid", name = "hydrogen", amount = 30 },
    },
    always_show_made_in = true,
    always_show_products = true,
    crafting_machine_tint = {
      primary = { r = 0.75, g = 0.10, b = 0.10, a = 0.10 },
    },
  },
  {
    type = "recipe",
    name = "lithium",
    icon = "__Krastorio2Assets__/icons/items-with-variations/lithium/lithium.png",
    subgroup = "raw-material",
    order = "h2[lithium]",
    enabled = false,
    category = "electrolysis",
    energy_required = 25,
    ingredients = {
      { type = "item", name = "lithium-chloride", amount = 5 },
      { type = "fluid", name = "water", amount = 50 },
    },
    results = {
      { type = "fluid", name = "chlorine", amount = 10 },
      { type = "item", name = "lithium", amount = 5 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
    crafting_machine_tint = {
      primary = { r = 0.70, g = 0.50, b = 0.05, a = 0.10 },
    },
  },
  {
    type = "recipe",
    name = "heavy-water",
    subgroup = "fluid-recipes",
    order = "y06[heavy-water]",
    enabled = false,
    energy_required = 120,
    category = "electrolysis",
    ingredients = {
      { type = "fluid", name = "water", amount = 500 },
    },
    results = {
      { type = "fluid", name = "heavy-water", amount = 20 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
    crafting_machine_tint = {
      primary = { r = 0.405, g = 0.402, b = 1.000, a = 1.000 },
      secondary = { r = 0.391, g = 0.720, b = 1.000, a = 0.900 },
      tertiary = { r = 1.000, g = 1.000, b = 1.000, a = 0.500 },
      quaternary = { r = 1.000, g = 1.000, b = 1.000, a = 0.300 },
    },
  },
})
