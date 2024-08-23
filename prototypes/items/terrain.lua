data:extend({
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------

  -- -- --
  -- CREEP
  -- -- --

  {
    type = "item",
    name = "kr-creep",
    icon = "__Krastorio2Assets__/icons/items-with-variations/biomass/biomass.png",
    icon_size = 64,
    icon_mipmaps = 4,
    hidden = true,
    pictures = {
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items-with-variations/biomass/biomass.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items-with-variations/biomass/biomass-1.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items-with-variations/biomass/biomass-2.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        size = 64,
        filename = "__Krastorio2Assets__/icons/items-with-variations/biomass/biomass-3.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
    subgroup = "terrain",
    order = "z[creep]-z[creep]",
    place_as_tile = {
      result = "kr-creep",
      condition_size = 1,
      condition = { layers = { water_tile = true } },
    },
    stack_size = 200,
  },

  -- -- --
  -- BLACK REINFORCED PLATE
  -- -- --

  {
    type = "item",
    name = "kr-black-reinforced-plate",
    icon = "__Krastorio2Assets__/icons/items/black-reinforced-plate.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "terrain",
    order = "z[black-reinforced-plate]-a1[black-reinforced-plate]",
    place_as_tile = {
      result = "kr-black-reinforced-plate",
      condition_size = 1,
      condition = { layers = { water_tile = true } },
    },
    stack_size = 200,
  },
  {
    type = "item",
    name = "kr-white-reinforced-plate",
    icon = "__Krastorio2Assets__/icons/items/white-reinforced-plate.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "terrain",
    order = "z[white-reinforced-plate]-a2[white-reinforced-plate]",
    place_as_tile = {
      result = "kr-white-reinforced-plate",
      condition_size = 1,
      condition = { layers = { water_tile = true } },
    },
    stack_size = 200,
  },

  -- -- --

  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
})
