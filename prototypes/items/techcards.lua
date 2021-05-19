data:extend({
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------

  {
    type = "item",
    name = "blank-tech-card",
    icon = kr_items_with_variations_icons_path .. "blank-tech-card/blank-tech-card-1.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "a00[blank-tech-card]",
    stack_size = 200,
  },
  {
    type = "item",
    name = "biters-research-data",
    icon = kr_cards_icons_path .. "biters-research-data.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "a01[biters-research-data]",
    stack_size = 200,
  },
  {
    type = "item",
    name = "matter-research-data",
    icon = kr_cards_icons_path .. "matter-research-data.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "a02[matter-research-data]",
    stack_size = 200,
  },
  {
    type = "item",
    name = "space-research-data",
    icon = kr_cards_icons_path .. "space-research-data.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "a03[space-research-data]",
    stack_size = 1000,
  },

  -----------------------------------------------------------------------------------------------------------------

  {
    type = "tool",
    name = "basic-tech-card",
    localised_description = { "item-description.science-pack" },
    icon = kr_cards_icons_path .. "basic-tech-card.png",
    stack_size = 200,
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "science-pack",
    order = "b01[basic-tech-card]",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
  },
  {
    type = "tool",
    name = "matter-tech-card",
    localised_description = { "item-description.science-pack" },
    icon = kr_cards_icons_path .. "matter-tech-card.png",
    stack_size = 200,
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
      layers = {
        {
          size = 64,
          filename = kr_cards_icons_path .. "matter-tech-card.png",
          scale = 0.25,
          mipmap_count = 4,
        },
        {
          draw_as_light = true,
          flags = { "light" },
          size = 64,
          filename = kr_cards_icons_path .. "matter-tech-card-light.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
    },
    subgroup = "science-pack",
    order = "b09[matter-tech-card]",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
  },
  {
    type = "tool",
    name = "advanced-tech-card",
    localised_description = { "item-description.science-pack" },
    icon = kr_cards_icons_path .. "advanced-tech-card.png",
    stack_size = 200,
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
      layers = {
        {
          size = 64,
          filename = kr_cards_icons_path .. "advanced-tech-card.png",
          scale = 0.25,
          mipmap_count = 4,
        },
        {
          draw_as_light = true,
          flags = { "light" },
          size = 64,
          filename = kr_cards_icons_path .. "advanced-tech-card-light.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
    },
    subgroup = "science-pack",
    order = "b10[advanced-tech-card]",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
  },
  {
    type = "tool",
    name = "singularity-tech-card",
    localised_description = { "item-description.science-pack" },
    icon = kr_cards_icons_path .. "singularity-tech-card.png",
    stack_size = 200,
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
      layers = {
        {
          size = 64,
          filename = kr_cards_icons_path .. "singularity-tech-card.png",
          scale = 0.25,
          mipmap_count = 4,
        },
        {
          draw_as_light = true,
          flags = { "light" },
          size = 64,
          filename = kr_cards_icons_path .. "singularity-tech-card-light.png",
          scale = 0.25,
          mipmap_count = 4,
        },
      },
    },
    subgroup = "science-pack",
    order = "b11[singularity-tech-card]",
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
  },
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------------------------
})
