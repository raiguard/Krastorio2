data:extend({
  {
    type = "recipe",
    name = "kr-air-cleaning",
    category = "air-purification",
    icon = "__Krastorio2Assets__/icons/recipes/filtering.png",
    subgroup = "raw-material",
    order = "zz[air-cleaning]",
    enabled = false,
    hidden = false,
    hide_from_player_crafting = true,
    energy_required = 480,
    ingredients = {
      { type = "item", name = "pollution-filter", amount = 1 },
    },
    results = {
      { type = "item", name = "used-pollution-filter", probability = 0.9, amount = 1 },
    },
  },
  {
    type = "recipe",
    name = "kr-air-cleaning-2",
    category = "air-purification",
    icon = "__Krastorio2Assets__/icons/recipes/filtering.png",
    subgroup = "raw-material",
    order = "zz[air-cleaning]",
    enabled = false,
    hidden = false,
    hide_from_player_crafting = true,
    energy_required = 600,
    ingredients = {
      { type = "item", name = "improved-pollution-filter", amount = 1 },
    },
    results = {
      { type = "item", name = "used-improved-pollution-filter", probability = 0.9, amount = 1 },
    },
    emissions_multiplier = 2.0,
  },
})
