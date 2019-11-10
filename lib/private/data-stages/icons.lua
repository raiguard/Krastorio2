krastorio.icons = {}

krastorio.icons.positions = {upper_left = 1, upper_right = 2, bottom_left = 3, bottom_right = 4}

-- 1/positions.upper_left Upper left
-- 2/positions.upper_right Upper right
-- 3/positions.bottom_left Bottom left
-- 4/positions.bottom_right Bottom right
function krastorio.icons.createOverlappedIcon(_position, _icon_path, _icon_size, _over_icon_path, _over_icon_size)

	-- compute overlay position
	local overlay_shift = _over_icon_size / 8
	local overlay_shift_x = nil
	local overlay_shift_y = nil	
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
			shift = {overlay_shift_x,overlay_shift_y}
		}
	}
	
end
