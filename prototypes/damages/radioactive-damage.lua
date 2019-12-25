data:extend(
{
	{
		type = "damage-type",
		name = "radioactive"
	},
	{
		type     = "sound",
		name     = "radioactive",
		category = "alert",
		filename = "__Krastorio2__/sounds/others/radioactivity.ogg",
		volume   = 0.5,
		audible_distance_modifier = 2.0,
		aggregation =
		{
			max_count             = 1,
			remove                = true,
			count_already_playing = true
		}
	}
})