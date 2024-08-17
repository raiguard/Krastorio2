-- -- -- Add Substation mk2

data:extend({
  -- Recipe
  {
    type = "recipe",
    name = "kr-substation-mk2",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "imersium-beam", amount = 3 },
      { type = "item", name = "rare-metals", amount = 6 },
      { type = "item", name = "substation", amount = 1 },
      { type = "item", name = "processing-unit", amount = 2 },
    },
    results = { { type = "item", name = "kr-substation-mk2", amount = 1 } },
  },
  -- Technology
  {
    type = "technology",
    name = "electric-energy-distribution-3",
    icon_size = 256,
    icon_mipmaps = 4,
    icon = kr_technologies_icons_path .. "electric-energy-distribution.png",
    effects = {
      {
        type = "unlock-recipe",
        recipe = "kr-substation-mk2",
      },
    },
    prerequisites = { "electric-energy-distribution-2", "kr-advanced-tech-card" },
    unit = {
      count = 300,
      ingredients = {
        { "production-science-pack", 1 },
        { "utility-science-pack", 1 },
        { "advanced-tech-card", 1 },
      },
      time = 45,
    },
  },
})

data.raw["electric-pole"]["substation"].fast_replaceable_group = "substation"
data.raw["electric-pole"]["substation"].next_upgrade = "kr-substation-mk2"
