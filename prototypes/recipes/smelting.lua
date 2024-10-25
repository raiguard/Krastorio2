data:extend({
  {
    type = "recipe",
    name = "coke",
    enabled = false,
    category = "smelting",
    energy_required = 16,
    ingredients = {
      { type = "item", name = "coal", amount = 6 },
      { type = "item", name = "wood", amount = 6 },
    },
    results = {
      { type = "item", name = "coke", amount = 6 },
    },
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "enriched-copper-plate",
    icons = {
      { icon = "__Krastorio2Assets__/icons/items/copper-plate.png" },
      {
        icon = "__Krastorio2Assets__/icons/items-with-variations/enriched-copper/enriched-copper.png",
        scale = 0.22,
        shift = { -8, -8 },
      },
    },
    order = "c[copper-plate]-b[enriched-copper-plate]",
    enabled = false,
    category = "smelting",
    energy_required = 16,
    ingredients = {
      { type = "item", name = "enriched-copper", amount = 5 },
    },
    results = {
      { type = "item", name = "copper-plate", amount = 5 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
  },
  {
    type = "recipe",
    name = "enriched-iron-plate",
    icons = {
      { icon = "__Krastorio2Assets__/icons/items/iron-plate.png" },
      {
        icon = "__Krastorio2Assets__/icons/items-with-variations/enriched-iron/enriched-iron.png",
        scale = 0.22,
        shift = { -8, -8 },
      },
    },
    order = "b[iron-plate]-b[enriched-iron-plate]",
    enabled = false,
    category = "smelting",
    energy_required = 16,
    ingredients = {
      { type = "item", name = "enriched-iron", amount = 5 },
    },
    results = {
      { type = "item", name = "iron-plate", amount = 5 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
  },
  {
    type = "recipe",
    name = "glass",
    enabled = false,
    category = "smelting",
    energy_required = 16,
    ingredients = {
      { type = "item", name = "sand", amount = 16 },
    },
    results = {
      { type = "item", name = "glass", amount = 8 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
  },
  {
    type = "recipe",
    name = "imersium-plate",
    enabled = false,
    category = "smelting",
    energy_required = 32,
    ingredients = {
      { type = "item", name = "imersite-powder", amount = 9 },
      { type = "item", name = "rare-metals", amount = 6 },
    },
    results = {
      { type = "item", name = "imersium-plate", amount = 3 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
  },
  {
    type = "recipe",
    name = "rare-metals",
    icons = {
      { icon = "__Krastorio2Assets__/icons/items-with-variations/rare-metals/rare-metals.png" },
      {
        icon = "__Krastorio2Assets__/icons/items-with-variations/raw-rare-metals/raw-rare-metals.png",
        scale = 0.22,
        shift = { -8, -8 },
      },
    },
    subgroup = "raw-material",
    enabled = true,
    category = "smelting",
    energy_required = 16,
    ingredients = {
      { type = "item", name = "raw-rare-metals", amount = 10 },
    },
    results = {
      { type = "item", name = "rare-metals", amount = 5 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
  },
  {
    type = "recipe",
    name = "rare-metals-2",
    icons = {
      { icon = "__Krastorio2Assets__/icons/items-with-variations/rare-metals/rare-metals.png" },
      {
        icon = "__Krastorio2Assets__/icons/items-with-variations/enriched-rare-metals/enriched-rare-metals.png",
        scale = 0.22,
        shift = { -8, -8 },
      },
    },
    subgroup = "raw-material",
    order = "c[rare-metals]-b[enriched-rare-metals]",
    enabled = false,
    category = "smelting",
    energy_required = 16,
    ingredients = {
      { type = "item", name = "enriched-rare-metals", amount = 5 },
    },
    results = {
      { type = "item", name = "rare-metals", amount = 5 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
  },
  {
    type = "recipe",
    name = "silicon",
    enabled = false,
    category = "smelting",
    energy_required = 16,
    ingredients = {
      { type = "item", name = "quartz", amount = 18 },
    },
    results = {
      { type = "item", name = "silicon", amount = 9 },
    },
    allow_productivity = true,
    always_show_made_in = true,
    always_show_products = true,
  },
})
