-- A RECIPE FOR STAY IN THIS FILE SHOULD HAVE THE ATTRIBUTE category = "air-purification"
return {
  {
    type = "recipe",
    name = "kr-air-cleaning",
    category = "air-purification",
    icon = kr_recipes_icons_path .. "filtering.png",
    icon_size = 64,
    energy_required = 480,
    enabled = false,
    hidden = true,
    ingredients = {
      { type = "item", name = "pollution-filter", amount = 1 },
    },
    results = {
      { type = "item", name = "used-pollution-filter", probability = 0.90, amount = 1 },
    },
    subgroup = "raw-material",
    order = "zz[air-cleaning]",
  },
  {
    type = "recipe",
    name = "kr-air-cleaning-2",
    category = "air-purification",
    icon = kr_recipes_icons_path .. "filtering.png",
    icon_size = 64,
    energy_required = 600,
    enabled = false,
    hidden = true,
    ingredients = {
      { type = "item", name = "improved-pollution-filter", amount = 1 },
    },
    results = {
      { type = "item", name = "used-improved-pollution-filter", probability = 0.90, amount = 1 },
    },
    emissions_multiplier = 2.0,
    subgroup = "raw-material",
    order = "zz[air-cleaning]",
  },
}
