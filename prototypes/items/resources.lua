data:extend({
  {
    type = "item",
    name = "raw-rare-metals",
    icon = kr_items_with_variations_icons_path .. "raw-rare-metals/raw-rare-metals.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
      {
        size = 64,
        filename = kr_items_with_variations_icons_path .. "raw-rare-metals/raw-rare-metals.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        size = 64,
        filename = kr_items_with_variations_icons_path .. "raw-rare-metals/raw-rare-metals-1.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        size = 64,
        filename = kr_items_with_variations_icons_path .. "raw-rare-metals/raw-rare-metals-2.png",
        scale = 0.25,
        mipmap_count = 4,
      },
      {
        size = 64,
        filename = kr_items_with_variations_icons_path .. "raw-rare-metals/raw-rare-metals-3.png",
        scale = 0.25,
        mipmap_count = 4,
      },
    },
    subgroup = "raw-resource",
    order = "ga[raw-rare-metals]",
    stack_size = 200,
  },
  {
    type = "item",
    name = "raw-imersite",
    icon = kr_items_with_variations_icons_path .. "raw-imersite/raw-imersite.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures = {
      {
        layers = {
          {
            size = 64,
            filename = kr_items_with_variations_icons_path .. "raw-imersite/raw-imersite.png",
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = kr_items_with_variations_icons_path .. "raw-imersite/raw-imersite-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
      {
        layers = {
          {
            size = 64,
            filename = kr_items_with_variations_icons_path .. "raw-imersite/raw-imersite-1.png",
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = kr_items_with_variations_icons_path .. "raw-imersite/raw-imersite-1-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
      {
        layers = {
          {
            size = 64,
            filename = kr_items_with_variations_icons_path .. "raw-imersite/raw-imersite-2.png",
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = kr_items_with_variations_icons_path .. "raw-imersite/raw-imersite-2-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
      {
        layers = {
          {
            size = 64,
            filename = kr_items_with_variations_icons_path .. "raw-imersite/raw-imersite-3.png",
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = kr_items_with_variations_icons_path .. "raw-imersite/raw-imersite-3-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
    },
    subgroup = "raw-resource",
    order = "ga[raw-imersite]",
    stack_size = 200,
  },
})
