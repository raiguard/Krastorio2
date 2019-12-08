if settings.startup["loaders"] and settings.startup["loaders"].value then

	-- Variable utils
	local loader_names = 
	{
		[1] = "kr-loader",
		[2] = "kr-fast-loader",
		[3] = "kr-express-loader",
		[4] = "kr-superior-loader"
	}
	local kr_loader_path = kr_entities_path .. "loaders/"

	-- ENTITY

	function kr_loader(data)
		local name = data.name
		local speed = data.speed
		local icon = data.icon
		local belt_animation_set = data.belt_animation_set
		local order = data.order
		local upgrade = data.upgrade or nil

		return 
		{
			type = "loader",
			name = name,
			icon = icon,
			icon_size = 32,
			flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
			minable = {mining_time = 0.25, result = name},
			max_health = 300,
			filter_count = 5,
			corpse = "small-remnants",
			resistances =
			{
				{
					type = "fire",
					percent = 90
				}
			},
			collision_box = {{-0.4, -0.45}, {0.4, 0.45}},
			selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
			drawing_box = {{-0.4, -0.4}, {0.4, 0.4}},
			animation_speed_coefficient = 32,
			container_distance = 0.75, --Default: 1.5
			belt_distance = 0.00, --Default: 0.5 
			belt_length = 0.20, -- Default: 0.5
			structure_render_layer = "object",
			--structure_render_layer = "transport-belt-circuit-connector", --Default:"lower-object" 
			belt_animation_set = belt_animation_set,
			fast_replaceable_group = "loader",
			next_upgrade = upgrade,
			speed = speed,
			structure =
			{
				direction_in =
				{
					sheet =
					{
						filename = kr_loader_path .. name .. "/" .. name .. ".png",
						priority = "extra-high",
						shift = {0.15625, 0.0703125},
						width = 53,
						height = 43,
						y = 43,
						hr_version =
						{
							filename = kr_loader_path .. name .. "/" .. "hr-" .. name .. ".png",
							priority = "extra-high",
							shift = {0.15625, 0.0703125},
							width = 106,
							height = 85,
							y = 85,
							scale = 0.5
						}
					}
				},
				direction_out =
				{
					sheet =
					{
						filename = kr_loader_path .. name .. "/" .. name .. ".png",
						priority = "extra-high",
						shift = {0.15625, 0.0703125},
						width = 53,
						height = 43,
						hr_version =
						{
							filename = kr_loader_path .. name .. "/" .. "hr-" .. name .. ".png",
							priority = "extra-high",
							shift = {0.15625, 0.0703125},
							width = 106,
							height = 85,
							scale = 0.5
						}
					}
				}
			},
			order = order		
		}
	end

	local entities = 
	{
		kr_loader
		{
			name = loader_names[1],
			speed = data.raw["transport-belt"]["transport-belt"].speed,
			upgrade = loader_names[2],
			belt_animation_set = data.raw["transport-belt"]["transport-belt"].belt_animation_set,
			icon = kr_entities_icons_path .. "loaders/" .. loader_names[1] .. ".png"
		},
		kr_loader
		{
			name = loader_names[2],
			speed =	data.raw["transport-belt"]["fast-transport-belt"].speed,
			upgrade = loader_names[3],
			belt_animation_set = data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set,
			icon = kr_entities_icons_path .. "loaders/" .. loader_names[2] .. ".png"
		},
		kr_loader
		{
			name = loader_names[3], 
			speed =	data.raw["transport-belt"]["express-transport-belt"].speed,
			-- upgrade = loader_names[4], -- DECOMMENT WHEN SUPERIOR LOADER IS ADDED
			belt_animation_set = data.raw["transport-belt"]["express-transport-belt"].belt_animation_set,
			icon = kr_entities_icons_path .. "loaders/" .. loader_names[3] .. ".png"
		},
		--[[
		kr_loader
		{
			name = loader_names[4], 
			speed =	data.raw["transport-belt"]["k-transport-belt"].speed,
			belt_animation_set = data.raw["transport-belt"]["k-transport-belt"].belt_animation_set,
			icon = kr_entities_icons_path .. "loaders/" .. loader_names[4] .. ".png"
		}
		--]]
	}
	data:extend(entities)
	
end
