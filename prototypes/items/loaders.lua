if krastorio.general.getSafeSettingValue("kr-loaders") then
  -- Variable utils
  local loader_names = {
    [1] = "kr-loader",
    [2] = "kr-fast-loader",
    [3] = "kr-express-loader",
    [4] = "kr-advanced-loader",
    [5] = "kr-superior-loader",
  }

  -- ITEMS

  function kr_loader_item(data)
    local name = data.name
    local icon = data.icon or kr_entities_icons_path .. "loaders/" .. name .. ".png"
    local icon_size = data.icon_size or 64
    local icon_mipmaps = data.icon_mipmaps or 4
    local subgroup = data.subgroup or "belt"
    local order = data.order
    return {
      type = "item",
      name = name,
      icon = icon,
      icon_size = icon_size,
      icon_mipmaps = icon_mipmaps,
      subgroup = subgroup,
      order = order,
      place_result = name,
      stack_size = 50,
    }
  end

  local items = {
    kr_loader_item({
      name = loader_names[1],
      order = "d[loader]-a1[" .. loader_names[1] .. "]",
    }),
    kr_loader_item({
      name = loader_names[2],
      order = "d[loader]-a2[" .. loader_names[2] .. "]",
    }),
    kr_loader_item({
      name = loader_names[3],
      order = "d[loader]-a3[" .. loader_names[3] .. "]",
    }),
    kr_loader_item({
      name = loader_names[4],
      order = "d[loader]-a4[" .. loader_names[4] .. "]",
    }),
    kr_loader_item({
      name = loader_names[5],
      order = "d[loader]-a5[" .. loader_names[5] .. "]",
    }),
  }
  data:extend(items)
end
