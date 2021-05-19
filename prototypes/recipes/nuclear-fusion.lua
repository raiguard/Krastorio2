-- Recipe used by fusion reactor to create steam
return {
  {
    type = "recipe",
    name = "kr-fusion",
    category = "nuclear-fusion",
    icon = kr_recipes_icons_path .. "fusion-energy.png",
    icon_size = 64,
    energy_required = 5,
    enabled = true,
    hidden = true,
    ingredients = {
      { type = "fluid", name = "water", amount = 1000, catalyst_amount = 1000 },
      { type = "item", name = "dt-fuel", amount = 1 },
    },
    results = {
      { type = "fluid", name = "steam", amount = 10000, temperature = 975 },
      { type = "item", name = "empty-dt-fuel", amount = 1 },
    },

    subgroup = "intermediate-product",
    order = "z[fusion]",
  },
}
