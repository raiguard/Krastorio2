local data_util = require("__flib__.data-util")
local table = require("__flib__.table")

local function sc_icon(product, ingredient)
  local product_icon = data_util.create_icons(data.raw[product.type][product.name])
  local ingredient_icon = data_util.create_icons(data.raw[ingredient.type][ingredient.name])
  ingredient_icon[1].scale = 0.22
  ingredient_icon[1].shift = { -8, -8 }
  return table.array_merge({ product_icon, ingredient_icon })
end

return {
  {
    type = "recipe",
    name = "kr-s-c-copper-cable",
    icons = sc_icon({ type = "item", name = "copper-cable" }, { type = "item", name = "copper-ore" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 1.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "copper-ore", amount = 2 },
    },
    results = { { type = "item", name = "copper-cable", amount = 2 } },
  },
  {
    type = "recipe",
    name = "kr-s-c-copper-cable-enriched",
    icons = sc_icon({ type = "item", name = "copper-cable" }, { type = "item", name = "enriched-copper" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 1.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "enriched-copper", amount = 1 },
    },
    results = { { type = "item", name = "copper-cable", amount = 2 } },
  },
  -- Irons
  {
    type = "recipe",
    name = "kr-s-c-iron-stick",
    icons = sc_icon({ type = "item", name = "iron-stick" }, { type = "item", name = "iron-ore" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 1.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "iron-ore", amount = 2 },
    },
    results = { { type = "item", name = "iron-stick", amount = 2 } },
  },
  {
    type = "recipe",
    name = "kr-s-c-iron-stick-enriched",
    icons = sc_icon({ type = "item", name = "iron-stick" }, { type = "item", name = "enriched-iron" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 1.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "enriched-iron", amount = 1 },
    },
    results = { { type = "item", name = "iron-stick", amount = 2 } },
  },
  {
    type = "recipe",
    name = "kr-s-c-iron-gear-wheel",
    icons = sc_icon({ type = "item", name = "iron-gear-wheel" }, { type = "item", name = "iron-ore" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 1.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "iron-ore", amount = 2 },
    },
    results = { { type = "item", name = "iron-gear-wheel", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-s-c-iron-gear-wheel-enriched",
    icons = sc_icon({ type = "item", name = "iron-gear-wheel" }, { type = "item", name = "enriched-iron" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 1.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "enriched-iron", amount = 1 },
    },
    results = { { type = "item", name = "iron-gear-wheel", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-s-c-iron-beam",
    icons = sc_icon({ type = "item", name = "iron-beam" }, { type = "item", name = "iron-ore" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 4.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "iron-ore", amount = 4 },
    },
    results = { { type = "item", name = "iron-beam", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-s-c-iron-beam-enriched",
    icons = sc_icon({ type = "item", name = "iron-beam" }, { type = "item", name = "enriched-iron" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 4.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "enriched-iron", amount = 4 },
    },
    results = { { type = "item", name = "iron-beam", amount = 1 } },
  },
  -- Steels
  {
    type = "recipe",
    name = "kr-s-c-steel-gear-wheel",
    icons = sc_icon({ type = "item", name = "steel-gear-wheel" }, { type = "item", name = "iron-plate" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 5.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 10 },
      { type = "item", name = "coke", amount = 1 },
    },
    results = { { type = "item", name = "steel-gear-wheel", amount = 5 } },
  },
  {
    type = "recipe",
    name = "kr-s-c-steel-beam",
    icons = sc_icon({ type = "item", name = "steel-beam" }, { type = "item", name = "iron-plate" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 20.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 20 },
      { type = "item", name = "coke", amount = 4 },
    },
    results = { { type = "item", name = "steel-beam", amount = 5 } },
  },
  -- Imersiums
  {
    type = "recipe",
    name = "kr-s-c-imersium-gear-wheel",
    icons = sc_icon({ type = "item", name = "imersium-gear-wheel" }, { type = "item", name = "imersite-powder" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 2.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "imersite-powder", amount = 3 },
      { type = "item", name = "rare-metals", amount = 2 },
    },
    results = { { type = "item", name = "imersium-gear-wheel", amount = 1 } },
  },
  {
    type = "recipe",
    name = "kr-s-c-imersium-beam",
    icons = sc_icon({ type = "item", name = "imersium-beam" }, { type = "item", name = "imersite-powder" }),
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 12.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "imersite-powder", amount = 6 },
      { type = "item", name = "rare-metals", amount = 4 },
    },
    results = { { type = "item", name = "imersium-beam", amount = 1 } },
  },
  -- Other
  {
    type = "recipe",
    name = "kr-s-c-electronic-components",
    category = "smelting-crafting",
    subgroup = "smelting-crafting",
    energy_required = 12.0,
    enabled = false,
    allow_productivity = true,
    hide_from_player_crafting = true,
    always_show_made_in = true,
    ingredients = {
      { type = "item", name = "plastic-bar", amount = 5 },
      { type = "item", name = "stone", amount = 12 },
      { type = "fluid", name = "water", amount = 20 },
    },
    results = { { type = "item", name = "electronic-components", amount = 6 } },
  },
}
