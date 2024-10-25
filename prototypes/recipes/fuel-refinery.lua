local light_oil_icon = data.raw.fluid["light-oil"].icon
if light_oil_icon == "__base__/graphics/icons/fluid/light-oil.png" then
  light_oil_icon = "__Krastorio2Assets__/icons/fluids/light-oil.png"
end

-- TODO: Handle icons array

data:extend({
  {
    type = "recipe",
    name = "fuel-1",
    localised_name = { "other.recipe-variation", { "item-name.fuel" } },
    subgroup = "intermediate-product",
    order = "o1[fuel1]",
    icons = {
      { icon = "__Krastorio2Assets__/icons/items/fuel.png" },
      {
        icon = light_oil_icon,
        scale = 0.26,
        shift = { 8, -8 },
      },
    },
    enabled = false,
    category = "fuel-refinery",
    energy_required = 10,
    ingredients = {
      { type = "fluid", name = "light-oil", amount = 60 },
    },
    results = {
      { type = "item", name = "fuel", amount = 10 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
    crafting_machine_tint = {
      primary = { r = 0.662, g = 0.807, b = 0.839, a = 0.000 },
      secondary = { r = 0.541, g = 0.647, b = 0.670, a = 0.250 },
      tertiary = { r = 0.454, g = 0.517, b = 0.529, a = 0.500 },
      quaternary = { r = 0.662, g = 0.807, b = 0.839, a = 0.900 },
    },
  },
  {
    type = "recipe",
    name = "fuel-2",
    localised_name = { "other.recipe-variation", { "item-name.fuel" } },
    icons = {
      { icon = "__Krastorio2Assets__/icons/items/fuel.png" },
      {
        icon = data.raw.item["solid-fuel"].icon,
        icon_size = data.raw.item["solid-fuel"].icon_size or 64,
        scale = 0.26,
        shift = { 8, -8 },
      },
    },
    subgroup = "intermediate-product",
    order = "o2[fuel2]",
    enabled = false,
    category = "fuel-refinery",
    energy_required = 10,
    ingredients = {
      { type = "item", name = "solid-fuel", amount = 6 },
      { type = "fluid", name = "hydrogen", amount = 50 },
    },
    results = {
      { type = "item", name = "fuel", amount = 10 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
    crafting_machine_tint = {
      primary = { r = 0.662, g = 0.807, b = 0.839, a = 0.000 },
      secondary = { r = 0.541, g = 0.647, b = 0.670, a = 0.250 },
      tertiary = { r = 0.454, g = 0.517, b = 0.529, a = 0.500 },
      quaternary = { r = 0.662, g = 0.807, b = 0.839, a = 0.900 },
    },
  },
  {
    type = "recipe",
    name = "bio-fuel",
    icon = "__Krastorio2Assets__/icons/items/bio-fuel.png",
    subgroup = "intermediate-product",
    order = "o3[bio-fuel]",
    enabled = false,
    category = "fuel-refinery",
    energy_required = 10,
    ingredients = {
      { type = "item", name = "fuel", amount = 6 },
      { type = "fluid", name = "biomethanol", amount = 50 },
    },
    results = {
      { type = "item", name = "bio-fuel", amount = 10 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
    crafting_machine_tint = {
      primary = { r = 0.30, g = 0.53, b = 0.20, a = 0.000 },
      secondary = { r = 0.30, g = 0.53, b = 0.20, a = 0.250 },
      tertiary = { r = 0.454, g = 0.517, b = 0.529, a = 0.500 },
      quaternary = { r = 0.662, g = 0.807, b = 0.839, a = 0.900 },
    },
  },
  {
    type = "recipe",
    name = "advanced-fuel",
    icon = "__Krastorio2Assets__/icons/items/advanced-fuel.png",
    subgroup = "intermediate-product",
    order = "o4[bio-fuel]",
    enabled = false,
    category = "fuel-refinery",
    energy_required = 10,
    ingredients = {
      { type = "item", name = "fuel", amount = 10 },
      { type = "item", name = "imersite-powder", amount = 6 },
    },
    results = {
      { type = "item", name = "advanced-fuel", amount = 10 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
    crafting_machine_tint = {
      primary = { r = 0.30, g = 0.53, b = 0.20, a = 0.000 },
      secondary = { r = 0.30, g = 0.53, b = 0.20, a = 0.250 },
      tertiary = { r = 0.454, g = 0.517, b = 0.529, a = 0.500 },
      quaternary = { r = 0.662, g = 0.807, b = 0.839, a = 0.900 },
    },
  },
  {
    type = "recipe",
    name = "biomethanol",
    icon = "__Krastorio2Assets__/icons/fluids/biomethanol.png",
    subgroup = "fluid-recipes",
    order = "y08[biomethanol]",
    enabled = false,
    category = "fuel-refinery",
    energy_required = 20,
    ingredients = {
      { type = "item", name = "wood", amount = 5 },
      { type = "fluid", name = "oxygen", amount = 60 },
      { type = "fluid", name = "steam", amount = 120 },
    },
    results = {
      { type = "fluid", name = "biomethanol", amount = 120 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
    crafting_machine_tint = {
      primary = { r = 0.25, g = 0.53, b = 0.15, a = 0.750 },
      secondary = { r = 0.27, g = 0.53, b = 0.12, a = 0.900 },
    },
  },
  {
    type = "recipe",
    name = "rocket-fuel-with-ammonia",
    localised_name = { "item-name.rocket-fuel" },
    icons = {
      { icon = "__Krastorio2Assets__/icons/recipes/rocket-fuel.png", icon_size = 64 },
      { icon = "__Krastorio2Assets__/icons/fluids/ammonia.png", icon_size = 64, scale = 0.26, shift = { 8, -8 } },
    },
    enabled = false,
    energy_required = 16,
    category = "fuel-refinery",
    ingredients = {
      { type = "item", name = "iron-plate", amount = 1 },
      { type = "fluid", name = "ammonia", amount = 50 },
      { type = "fluid", name = "oxygen", amount = 50 },
    },
    results = {
      { type = "item", name = "rocket-fuel", amount = 1 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = { r = 0.261, g = 0.200, b = 0.650, a = 0.100 },
      secondary = { r = 0.211, g = 0.447, b = 0.670, a = 0.250 },
      tertiary = { r = 0.204, g = 0.417, b = 0.529, a = 0.500 },
      quaternary = { r = 0.312, g = 0.407, b = 0.739, a = 0.900 },
    },
  },
  {
    type = "recipe",
    name = "rocket-fuel-with-hydrogen-chloride",
    localised_name = { "item-name.rocket-fuel" },
    icons = {
      { icon = "__Krastorio2Assets__/icons/recipes/rocket-fuel.png" },
      {
        icon = "__Krastorio2Assets__/icons/fluids/hydrogen-chloride.png",
        scale = 0.26,
        shift = { 8, -8 },
      },
    },
    enabled = false,
    category = "fuel-refinery",
    energy_required = 16,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 1 },
      { type = "fluid", name = "hydrogen-chloride", amount = 50 },
      { type = "fluid", name = "oxygen", amount = 50 },
    },
    results = {
      { type = "item", name = "rocket-fuel", amount = 1 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    crafting_machine_tint = {
      primary = { r = 0.421, g = 0.720, b = 0.350, a = 0.100 },
      secondary = { r = 0.541, g = 0.797, b = 0.370, a = 0.250 },
      tertiary = { r = 0.354, g = 0.527, b = 0.229, a = 0.500 },
      quaternary = { r = 0.362, g = 0.617, b = 0.439, a = 0.900 },
    },
  },
})
