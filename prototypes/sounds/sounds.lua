if krastorio.general.getSafeSettingValue("kr-main-menu-song") then
	data:extend(
	{
		-- -- Ambient
		{
			type     = "ambient-sound",
			name     = "K2-main-menu",
			sound    =
			{
				filename = "__Krastorio2__/sounds/ambient/K2-main-menu.ogg",
				volume   = 2.0,
				preload  = true
			},
			track_type = "main-track",
			weight = 666
		}
	})
end

data:extend(
{
	-- -- Scripts
	{
		type     = "sound",
		name     = "kr-radioactive",
		category = "alert",
		filename = "__Krastorio2__/sounds/others/radioactivity.ogg",
		volume   = 0.75,
		audible_distance_modifier = 2.0,
		aggregation =
		{
			max_count             = 1,
			remove                = true,
			count_already_playing = true
		}
	},
	{
		type     = "sound",
		name     = "kr-welding",
		category = "alert",
		filename = "__Krastorio2__/sounds/others/welding.ogg",
		volume   = 0.75,
		audible_distance_modifier = 0.5,
		aggregation =
		{
			max_count             = 1,
			remove                = true,
			count_already_playing = true
		}
	},
	{
		type     = "sound",
		name     = "kr-collect-creep",
		category = "alert",
		filename = kr_tiles_sounds_path .. "creep-deconstruction.ogg",
		volume   = 0.75,
		audible_distance_modifier = 0.5,		
		aggregation =
		{
			max_count = 1,
			remove = false,
			count_already_playing = true
		}
	},
	{
		type     = "sound",
		name     = "kr-jackhammer",
		category = "alert",
		filename = "__Krastorio2__/sounds/others/jackhammer.ogg",
		volume   = 0.75,
		audible_distance_modifier = 0.5,		
		aggregation =
		{
			max_count = 1,
			remove = false,
			count_already_playing = true
		}
	}
})