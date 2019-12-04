data:extend(
{   
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

	{
	type = "electric-energy-interface",
	name = "kr-wind-turbine",
	icon =  kr_entities_icons_path .. "wind-turbine.png",
	icon_size = 64,
	flags = {"placeable-neutral","player-creation"},
	minable = {mining_time = 1, result = "kr-wind-turbine"},
	max_health = 400,
	corpse = "big-remnants",
	dying_explosion = "medium-explosion",
	resistances =
	{
	  {
		type = "fire",
		percent = 70
	  },
	  {
				type = "physical",
				percent = 100
	  },
	  {
		type = "impact",
		percent = 30
	  }
	},
	fast_replaceable_group = "kr-wind-turbine",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
	selection_box = {{-0.95, -0.95}, {0.95, 0.95}},
	drawing_box = {{-0.5, -2}, {0.5, 1}},
    energy_source =
    {
      type = "electric",
      buffer_capacity = "0kJ",
      usage_priority = "primary-output",
      input_flow_limit = "0kW",
      output_flow_limit = "30kW",
      render_no_power_icon = false
    },
    energy_production = "30kW",
    energy_usage = "0kW",
    animation =
    {
		layers =
		{
			{
			filename = kr_entities_path .. "wind-turbine/hr-wind-turbine.png",
			priority = "medium",
			width = 150,
			height = 220,
			scale = 0.5,
			frame_count = 30,
			line_length = 6,
			animation_speed = 0.5,
			shift = {0, -0.9},
			},
			{
			filename = kr_entities_path .. "wind-turbine/hr-wind-turbine-shadow.png",
			priority = "medium",
			width = 242,
			height = 100,
			scale = 0.5,
			frame_count = 30,
			line_length = 6,
			animation_speed = 0.5,
			draw_as_shadow = true,
			shift = {0.95, 0.1},
			},
		},
	},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.6
      },
      idle_sound =
      {
        filename = "__base__/sound/train-wheels.ogg",
        volume = 0.0
      },
      max_sounds_per_type = 5
    },
	},

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
})
