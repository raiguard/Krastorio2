data:extend(
{   
	{
		type = "burner-generator",
		name = "kr-antimatter-reactor",		
		icon = kr_entities_icons_path .. "antimatter-reactor.png",
		icon_size = 128,
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 2, result = "kr-antimatter-reactor"},
		max_health = 10000,
		corpse = "kr-antimatter-reactor-remnant",
		dying_explosion = "big-matter-explosion",
		effectivity = 5,
		resistances = 
		{
			{type = "physical", percent = 60},
			{type = "fire", percent = 90},
			{type = "impact", percent = 90}
		},		
		collision_box = {{-4.75, -4.75}, {4.75, 4.75}},
		selection_box = {{-4.95, -4.95}, {4.95, 4.95}},
		fluid_box =
		{		
			production_type = "input",
			base_area = 1,
			base_level = -1,
			pipe_connections = {{ type="input", position = {5, 0} }}	
		},
		energy_source =
		{
			type = "electric",
			render_no_power_icon = false,
			usage_priority = "primary-output"
		},		
		burner =
		{
			type = "burner",
			fuel_category = "antimatter-fuel",
			fuel_inventory_size = 1,
			effectivity = 1,
			effectivity = 5,
			emissions_per_minute = 200,
			light_flicker = {intensity = 1.5, minimum_light_size = 3, color = {r=0.35, g=0.75, b=1}},
		},
		vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
		animation = 
		{
			filename = kr_entities_path .. "antimatter-reactor/antimatter-reactor.png",
			frame_count = 6,
			scale = scale,
			width = 400,
			height = 400,
			frame_count = 10,
			line_length = 5,
			animation_speed=1,
			scale = 0.96,
			hr_version =
			{
				filename = kr_entities_path .. "antimatter-reactor/hr-antimatter-reactor.png",
				frame_count = 6,
				scale = scale,
				width = 800,
				height = 800,
				frame_count = 10,
				line_length = 5,
				animation_speed=1,
				scale = 0.48
			}
		},	
		working_sound = 
		{
			sound = 
			{
				{	
					filename = kr_buildings_sounds_path .. "antimatter-reactor.ogg",
					volume = 1.75
				}
			}
		},
		audible_distance_modifier = 10,
		min_perceived_performance = 0.25,
		performance_to_sound_speedup = 0.5,
		max_power_output = "2000MW"
	}
})