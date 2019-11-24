krastorio.icons = {}

-- 1 -> positions.upper_left Upper left
-- 2 -> positions.upper_right Upper right
-- 3 -> positions.bottom_left Bottom left
-- 4 -> positions.bottom_right Bottom right
krastorio.icons.positions = {upper_left = 1, upper_right = 2, bottom_left = 3, bottom_right = 4}

-- @ _position, see krastorio.icons.positions
-- @ _icon_path
-- @ _icon_size
-- @ _over_icon_path
-- @ _over_icon_size
function krastorio.icons.createOverlappedIcon(_position, _icon_path, _icon_size, _over_icon_path, _over_icon_size)

	-- compute overlay position
	local overlay_shift = _over_icon_size / 8
	local overlay_shift_x, overlay_shift_y = nil, nil
	if _position == 1 then     -- 1 upper left   -x -y
		overlay_shift_x = - overlay_shift
		overlay_shift_y = - overlay_shift
	elseif _position == 2 then -- 2 upper right  +x -y
		overlay_shift_x = overlay_shift
		overlay_shift_y = - overlay_shift 
	elseif _position == 3 then -- 3 bottom left  -x +y
		overlay_shift_x = - overlay_shift
		overlay_shift_y = overlay_shift	
	else                      -- 4 bottom right +x +y
		overlay_shift_x = overlay_shift
		overlay_shift_y = overlay_shift 
	end

	return
	{
		{
			icon = _icon_path,
			icon_size = _icon_size
		},
		{ 
			icon = _over_icon_path,
			icon_size = _over_icon_size,
			scale = 0.25,
			shift = {overlay_shift_x, overlay_shift_y}
		}
	}
	
end

-- @ see krastorio.icons.createOverlappedIcon(...)
function krastorio.icons.createULOverlappedIcon(_icon_path, _icon_size, _over_icon_path, _over_icon_size)
	krastorio.icons.createOverlappedIcon(positions.upper_left, _icon_path, _icon_size, _over_icon_path, _over_icon_size)
end

-- @ see krastorio.icons.createOverlappedIcon(...)
function krastorio.icons.createUROverlappedIcon(_icon_path, _icon_size, _over_icon_path, _over_icon_size)
	krastorio.icons.createOverlappedIcon(positions.upper_right, _icon_path, _icon_size, _over_icon_path, _over_icon_size)
end

-- @ see krastorio.icons.createOverlappedIcon(...)
function krastorio.icons.createBLOverlappedIcon(_icon_path, _icon_size, _over_icon_path, _over_icon_size)
	krastorio.icons.createOverlappedIcon(positions.bottom_left, _icon_path, _icon_size, _over_icon_path, _over_icon_size)
end

-- @ see krastorio.icons.createOverlappedIcon(...)
function krastorio.icons.createBROverlappedIcon(_icon_path, _icon_size, _over_icon_path, _over_icon_size)
	krastorio.icons.createOverlappedIcon(positions.bottom_right, _icon_path, _icon_size, _over_icon_path, _over_icon_size)
end

-- -- Items

-- @ _recipe_name
-- @ _icon_path
-- @ _icon_size
function krastorio.icons.setItemIcon(_item_name, _icon_path, _icon_size)
	if krastorio.items.exist(_item_name) then
		local item_type = krastorio.items.getItemType(_item_name)
		if data.raw[item_type][_item_name].icons then
			data.raw[item_type][_item_name].icons = nil
		end
		data.raw[item_type][_item_name].icon = _icon_path
		data.raw[item_type][_item_name].icon_size = _icon_size or 64
	end
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
	end
end

-- @ _recipe_name
-- @ _icons
function krastorio.icons.setItemMipmaps(_item_name, _mipmaps)
	if krastorio.items.exist(_item_name) then
		local item_type = krastorio.items.getItemType(_item_name)		
		data.raw[item_type][_item_name].icon_mipmaps = #_mipmaps
		data.raw[item_type][_item_name].pictures = _mipmaps
	end
end

-- -- Recipes

-- @ _recipe_name
-- @ _icon_path
-- @ _icon_size
function krastorio.icons.setRecipeIcon(_recipe_name, _icon_path, _icon_size)
	if krastorio.recipes.exist(_recipe_name) then
		if data.raw.recipe[_recipe_name].icons then
			data.raw.recipe[_recipe_name].icons = nil
		end
		data.raw.recipe[_recipe_name].icon = _icon_path
		data.raw.recipe[_recipe_name].icon_size = _icon_size or 64
	end
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
	end
end

-- -- Technologies

-- @ _technology_name
-- @ _icon_path
function krastorio.icons.setTechnologyIcon(_technology_name, _icon_path, _icon_size)
	if krastorio.technologies.exist(_technology_name) then
		if data.raw.technology[_technology_name].icons then
			data.raw.technology[_technology_name].icons = nil
		end	
		data.raw.technology[_technology_name].icon = _icon_path
		data.raw.technology[_technology_name].icon_size = _icon_size or 128
	end
end

-- @ _technology_name
-- @ _icons
function krastorio.icons.setTechnologyIcons(_technology_name, _icons)
	if krastorio.technologies.exist(_technology_name) then
		if data.raw.technology[_technology_name].icon or data.raw.technology[_technology_name].icon_size then
			data.raw.technology[_technology_name].icon = nil
			data.raw.technology[_technology_name].icon_size = nil		
		end	
		data.raw.technology[_technology_name].icons = _icons
	end
end
