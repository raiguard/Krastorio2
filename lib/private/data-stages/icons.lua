krastorio.icons = {}

-- 1 -> positions.upper_left Upper left
-- 2 -> positions.upper_right Upper right
-- 3 -> positions.bottom_left Bottom left
-- 4 -> positions.bottom_right Bottom right
krastorio.icons.positions = { upper_left = 1, upper_right = 2, bottom_left = 3, bottom_right = 4 }

-- @ _position, see krastorio.icons.positions
-- @ _icon_path
-- @ _icon_size
-- @ _over_icon_path
-- @ _over_icon_size
function krastorio.icons.createOverlappedIcon(_position, _icon_path, _icon_size, _over_icon_path, _over_icon_size)
  -- compute overlay position
  local overlay_shift = _over_icon_size / 8
  local overlay_shift_x, overlay_shift_y = nil, nil
  if _position == 1 then -- 1 upper left   -x -y
    overlay_shift_x = -overlay_shift
    overlay_shift_y = -overlay_shift
  elseif _position == 2 then -- 2 upper right  +x -y
    overlay_shift_x = overlay_shift
    overlay_shift_y = -overlay_shift
  elseif _position == 3 then -- 3 bottom left  -x +y
    overlay_shift_x = -overlay_shift
    overlay_shift_y = overlay_shift
  else -- 4 bottom right +x +y
    overlay_shift_x = overlay_shift
    overlay_shift_y = overlay_shift
  end

  return {
    {
      icon = _icon_path,
      icon_size = _icon_size,
      scale = 1.0,
    },
    {
      icon = _over_icon_path,
      icon_size = _over_icon_size,
      scale = 0.25,
      shift = { overlay_shift_x, overlay_shift_y },
    },
  }
end

-- These functions use a nonexistent `positions` table, and would crash immediately if used
-- -- @ see krastorio.icons.createOverlappedIcon(...)
-- function krastorio.icons.createULOverlappedIcon(_icon_path, _icon_size, _over_icon_path, _over_icon_size)
--   krastorio.icons.createOverlappedIcon(positions.upper_left, _icon_path, _icon_size, _over_icon_path, _over_icon_size)
-- end

-- -- @ see krastorio.icons.createOverlappedIcon(...)
-- function krastorio.icons.createUROverlappedIcon(_icon_path, _icon_size, _over_icon_path, _over_icon_size)
--   krastorio.icons.createOverlappedIcon(positions.upper_right, _icon_path, _icon_size, _over_icon_path, _over_icon_size)
-- end

-- -- @ see krastorio.icons.createOverlappedIcon(...)
-- function krastorio.icons.createBLOverlappedIcon(_icon_path, _icon_size, _over_icon_path, _over_icon_size)
--   krastorio.icons.createOverlappedIcon(positions.bottom_left, _icon_path, _icon_size, _over_icon_path, _over_icon_size)
-- end

-- -- @ see krastorio.icons.createOverlappedIcon(...)
-- function krastorio.icons.createBROverlappedIcon(_icon_path, _icon_size, _over_icon_path, _over_icon_size)
--   krastorio.icons.createOverlappedIcon(positions.bottom_right, _icon_path, _icon_size, _over_icon_path, _over_icon_size)
-- end

--- Standardize and return the prototype's `icons` table.
--- @param proto table
--- @return table
function krastorio.icons.getIconsForOverlay(proto)
  local icons_table = {}
  if proto.icons then
    -- copy all icons from the source item to the returned table,
    -- but populate the icon_size in each icon; we want the icon size defined in each icon for future overlay scaling
    for _, original_icon in ipairs(proto.icons) do
      -- create a copy of the icon with the appropriately found size
      local new_icon = krastorio_utils.tables.fullCopy(original_icon)
      -- per https://wiki.factorio.com/Types/IconSpecification, icon_size should be defined in one of two places
      new_icon.icon_size = (proto.icon_size or original_icon.icon_size or 32)
      table.insert(icons_table, new_icon)
    end
  else
    if not proto.icon and proto.type == "recipe" then
      return krastorio.icons.getIconsForOverlay(krastorio.items.getItem(proto.name))
    elseif not proto.icon and proto.type ~= "recipe" then
      return {}
    end
    -- single icon, simple insert
    table.insert(icons_table, {
      icon = proto.icon,
      icon_size = proto.icon_size,
    })
  end
  return icons_table
end

-- @item_or_recipe, item or recipe
function krastorio.icons.addOverlayIcons(item_or_recipe, icons_to_add, icon_size, scale, shift)
  local scale = (scale or 1)
  local shift = (shift or { 0, 0 })
  local icon_size = (icon_size or item_or_recipe.icon_size or 64)
  if type(icons_to_add) == "string" then
    icons_to_add = { {
      icon = icons_to_add,
      icon_size = icon_size,
    } }
  end

  if not item_or_recipe.icons then
    -- normalize to icon specification option 1, with icon size defined in each layer
    item_or_recipe.icons = krastorio.icons.getIconsForOverlay(item_or_recipe)
    -- clean up after ourselves
    item_or_recipe.icon = nil
    item_or_recipe.icon_size = nil
  end

  -- add the requested additional icons
  for _, icon_to_add in ipairs(icons_to_add) do
    local overlay_icon = krastorio_utils.tables.fullCopy(icon_to_add)
    -- preserve the overlay icon's scale and include the argument requested scale, accounting for differing icon sizes
    overlay_icon.scale = scale * (icon_size / overlay_icon.icon_size) * (overlay_icon.scale or 1)

    if overlay_icon.shift then
      -- if the overlay icon had shift already, preserve it and add the argument requested shift
      overlay_icon.shift = { overlay_icon.shift[1] + shift[1], overlay_icon.shift[2] + shift[2] }
    else
      -- if the overlay icon had no shift, use the argument requested shift
      overlay_icon.shift = shift
    end

    table.insert(item_or_recipe.icons, overlay_icon)
  end
end

-- -- Items

-- @ _recipe_name
-- @ _icon_path
-- @ _icon_size
function krastorio.icons.setItemIcon(_item_name, _icon_path, _icon_size, _icon_mipmaps)
  if krastorio.items.exist(_item_name) then
    local item_type = krastorio.items.getItemType(_item_name)
    if data.raw[item_type][_item_name].icons then
      data.raw[item_type][_item_name].icons = nil
    end
    data.raw[item_type][_item_name].icon = _icon_path
    data.raw[item_type][_item_name].icon_size = _icon_size or 64
    data.raw[item_type][_item_name].icon_mipmaps = _icon_mipmaps

    return true
  end
  return false
end

-- @ _recipe_name
-- @ _icons
function krastorio.icons.setItemIcons(_item_name, _icons)
  if krastorio.items.exist(_item_name) then
    local item_type = krastorio.items.getItemType(_item_name)
    if data.raw[item_type][_item_name].icon or data.raw[item_type][_item_name].icon_size then
      data.raw[item_type][_item_name].icon = nil
      data.raw[item_type][_item_name].icon_size = nil
    end
    data.raw[item_type][_item_name].icons = _icons

    return true
  end
  return false
end

-- @ _recipe_name
-- @ _icons
function krastorio.icons.setItemPictures(_item_name, _mipmaps, _icon_mipmaps)
  if krastorio.items.exist(_item_name) then
    local item_type = krastorio.items.getItemType(_item_name)
    data.raw[item_type][_item_name].icon_mipmaps = _icon_mipmaps
    data.raw[item_type][_item_name].pictures = _mipmaps

    return true
  end
  return false
end

-- -- Recipes

-- @ _recipe_name
-- @ _icon_path
-- @ _icon_size
function krastorio.icons.setRecipeIcon(_recipe_name, _icon_path, _icon_size, _icon_mipmaps)
  if krastorio.recipes.exist(_recipe_name) then
    if data.raw.recipe[_recipe_name].icons then
      data.raw.recipe[_recipe_name].icons = nil
    end
    data.raw.recipe[_recipe_name].icon = _icon_path
    data.raw.recipe[_recipe_name].icon_size = _icon_size or 64
    data.raw.recipe[_recipe_name].icon_mipmaps = _icon_mipmaps

    return true
  end
  return false
end

-- @ _recipe_name
-- @ _icons
function krastorio.icons.setRecipeIcons(_recipe_name, _icons)
  if krastorio.recipes.exist(_recipe_name) then
    if data.raw.recipe[_recipe_name].icon or data.raw.recipe[_recipe_name].icon_size then
      data.raw.recipe[_recipe_name].icon = nil
      data.raw.recipe[_recipe_name].icon_size = nil
    end
    data.raw.recipe[_recipe_name].icons = _icons

    return true
  end
  return false
end

-- -- Technologies

-- @ _technology_name
-- @ _icon_path
function krastorio.icons.setTechnologyIcon(_technology_name, _icon_path, _icon_size, _icon_mipmaps)
  if krastorio.technologies.exist(_technology_name) then
    data.raw.technology[_technology_name].icon = _icon_path
    data.raw.technology[_technology_name].icons = nil

    data.raw.technology[_technology_name].icon_size = _icon_size or 128
    data.raw.technology[_technology_name].icon_mipmaps = _icon_mipmaps or nil

    return true
  end
  return false
end

-- @ _technology_name
-- @ _icons
function krastorio.icons.setTechnologyIcons(_technology_name, _icons, _icon_size, _icon_mipmaps)
  if krastorio.technologies.exist(_technology_name) then
    data.raw.technology[_technology_name].icons = _icons
    data.raw.technology[_technology_name].icon = nil

    data.raw.technology[_technology_name].icon_size = _icon_size or nil
    data.raw.technology[_technology_name].icon_mipmaps = _icon_mipmaps or nil

    return true
  end
  return false
end
