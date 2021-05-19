-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "electrolysis"
return {
  {
    type = "recipe",
    name = "kr-water-electrolysis",
    category = "electrolysis",
    icon = kr_recipes_icons_path .. "water-electrolysis.png",
    icon_size = 128,
    energy_required = 3,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    ingredients = {
      { type = "item", name = "sand", amount = 10 },
      { type = "fluid", name = "water", amount = 40, catalyst_amount = 40 },
    },
    results = {
      { type = "fluid", name = "chlorine", amount = 20 },
      { type = "fluid", name = "hydrogen", amount = 30 },
    },
    crafting_machine_tint = {
      primary = { r = 0.10, g = 0.75, b = 0.10, a = 0.10 }, --electrolysis plant have only primary color
    },
    subgroup = "fluid-recipes",
    order = "y01[water-electrolysis]",
  },
  {
    type = "recipe",
    name = "kr-water-separation",
    category = "electrolysis",
    icon = kr_recipes_icons_path .. "water-separation.png",
    icon_size = 128,
    energy_required = 3,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    ingredients = {
      { type = "fluid", name = "water", amount = 50, catalyst_amount = 50 },
    },
    results = {
      { type = "fluid", name = "oxygen", amount = 20 },
      { type = "fluid", name = "hydrogen", amount = 30 },
    },
    crafting_machine_tint = {
      primary = { r = 0.75, g = 0.10, b = 0.10, a = 0.10 }, --electrolysis plant have only primary color
    },
    subgroup = "fluid-recipes",
    order = "y02[water-separation]",
  },
  {
    type = "recipe",
    name = "lithium",
    icon = kr_items_with_variations_icons_path .. "lithium/lithium.png",
    icon_size = 64,
    category = "electrolysis",
    energy_required = 25,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "lithium-chloride", amount = 5 },
      { type = "fluid", name = "water", amount = 50 },
    },
    results = {
      { type = "fluid", name = "chlorine", amount = 10 },
      { type = "item", name = "lithium", amount = 5 },
    },
    crafting_machine_tint = {
      primary = { r = 0.70, g = 0.50, b = 0.05, a = 0.10 }, --electrolysis plant have only primary color
    },
    subgroup = "raw-material",
    order = "h2[lithium]",
  },
  {
    type = "recipe",
    name = "heavy-water",
    category = "electrolysis",
    energy_required = 120,
    enabled = false,
    always_show_made_in = true,
    always_show_products = true,
    allow_productivity = true,
    ingredients = {
      { type = "fluid", name = "water", amount = 500, catalyst_amount = 500 },
    },
    crafting_machine_tint = {
      primary = { r = 0.405, g = 0.402, b = 1.000, a = 1.000 },
      secondary = { r = 0.391, g = 0.720, b = 1.000, a = 0.900 },
      tertiary = { r = 1.000, g = 1.000, b = 1.000, a = 0.500 },
      quaternary = { r = 1.000, g = 1.000, b = 1.000, a = 0.300 },
    },
    results = {
      { type = "fluid", name = "heavy-water", amount = 20 },
    },
    subgroup = "fluid-recipes",
    order = "y06[heavy-water]",
  },
}
