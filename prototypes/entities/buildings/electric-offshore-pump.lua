local electric_offshore_pump = util.table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])

electric_offshore_pump.type = "assembling-machine"
electric_offshore_pump.name = "kr-electric-offshore-pump"
electric_offshore_pump.localised_name = {"entity-name.offshore-pump"}
electric_offshore_pump.localised_description = {"entity-description.offshore-pump"}
electric_offshore_pump.crafting_speed = 1
electric_offshore_pump.energy_usage = "19kW"
electric_offshore_pump.energy_source =
{
	type = "electric",
	usage_priority = "secondary-input",
	drain = "1kW"
}
electric_offshore_pump.crafting_categories = {"kr-electric-offshore-pump-crafting_categories"}
electric_offshore_pump.animation = electric_offshore_pump.picture
electric_offshore_pump.fixed_recipe = "kr-drain-water"
electric_offshore_pump.ingredient_count = 1
electric_offshore_pump.show_recipe_icon = false
electric_offshore_pump.fluid_boxes = 
{
	fluid_box =
	{
		base_area = 0.5,
		base_level = 1,
		pipe_covers = pipecoverspictures(),
		production_type = "output",
		filter = "water",
		pipe_connections =
		{
			{
				position = {0, 1},
				type = "output"
			}
		}
	}, 
	off_when_no_fluid_recipe = false
}

electric_offshore_pump_item = util.table.deepcopy(data.raw["item"]["offshore-pump"])
electric_offshore_pump_item.name = "kr-electric-offshore-pump"
electric_offshore_pump_item.name = "kr-electric-offshore-pump"
electric_offshore_pump_item.localised_name = {"entity-name.offshore-pump"}
electric_offshore_pump_item.place_result = "kr-electric-offshore-pump"

data:extend(
{
	-- Crafting category
	{
	   type = "recipe-category",
	   name = "kr-electric-offshore-pump-crafting_categories"
	},
	-- Recipe
	{
		type = "recipe",
		name = "kr-drain-water",
		category = "kr-electric-offshore-pump-crafting_categories",
		energy_required = 1,
		enabled = true,
		hidden = true,
		ingredients = {},
		results =
		{ 
			{type = "fluid", name = "water", amount = 1200 }
		}
	},
	-- Entity
	electric_offshore_pump,
	electric_offshore_pump_item
})