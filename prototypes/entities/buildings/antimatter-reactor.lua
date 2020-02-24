local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

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
		damaged_trigger_effect = hit_effects.entity(),
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
			burnt_inventory_size = 1,
			effectivity = 1,
			emissions_per_minute = 200,
			light_flicker = {intensity = 1.5, minimum_light_size = 3, color = {r=1, g=0.5, b=0.8}},
		},
		vehicle_impact_sound = sounds.generic_impact,
		animation = 
		{
			layers =
			{
				{
				filename = kr_entities_path .. "antimatter-reactor/antimatter-reactor.png",
				frame_count = 6,
				scale = scale,
				width = 330,
				height = 353,
				shift = {0, -0.5},
				frame_count = 30,
				line_length = 6,
				animation_speed=0.9,
				scale = 0.96,
				hr_version =
				{
					filename = kr_entities_path .. "antimatter-reactor/hr-antimatter-reactor.png",
					frame_count = 6,
					scale = scale,
					width = 660,
					height = 706,
					shift = {0, -0.5},
					frame_count = 30,
					line_length = 6,
					animation_speed=0.9,
					scale = 0.48
				}
				},
				{
				filename = kr_entities_path .. "antimatter-reactor/antimatter-reactor-sh.png",
				frame_count = 1,
				width = 362,
				height = 315,
				shift = {0.2, 0.1},
				frame_count = 1,
				repeat_count = 30,
				animation_speed=0.9,
				scale = 0.96,
				draw_as_shadow = true,
				hr_version =
				{
					filename = kr_entities_path .. "antimatter-reactor/hr-antimatter-reactor-sh.png",
					frame_count = 1,
					width = 724,
					height = 630,
					shift = {0.57, 0.27},
					frame_count = 1,
					repeat_count = 30,
					animation_speed=0.9,
					scale = 0.48,
					draw_as_shadow = true
				}
				},
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
		max_power_output = "3000MW"
	}
})