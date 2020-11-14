-- Crash site flags
local crash_site_flags = {"placeable-player", "player-creation", "hidden", "not-rotatable"}

-- Minable random drops
local small_minable_ship_residues = 
{
	mining_time = 2,
	results = 
	{
		{ type = "item", name = "iron-plate", amount_min = 1, amount_max = 2, probability = 0.70 },
		{ type = "item", name = "copper-cable", amount_min = 0, amount_max = 2, probability = 0.40 },
		{ type = "item", name = "iron-gear-wheel", amount_min = 0, amount_max = 2, probability = 0.40},
		{ type = "item", name = "electronic-circuit", amount_min = 0, amount_max = 2, probability = 0.20},
		{ type = "item", name = "kr-sentinel", amount_min = 0, amount_max = 2, probability = 0.10}
	},
	mining_particle = "shell-particle"
}

local big_minable_ship_residues = 
{
	mining_time = 4,
	results = 
	{
		{ type = "item", name = "iron-plate", amount_min = 5, amount_max = 13, probability = 1 },
		{ type = "item", name = "copper-cable", amount_min = 4, amount_max = 8, probability = 1 },
		{ type = "item", name = "iron-gear-wheel", amount_min = 3, amount_max = 5, probability = 0.75},
		{ type = "item", name = "electronic-circuit", amount_min = 2, amount_max = 3, probability = 0.75},
		{ type = "item", name = "kr-sentinel", amount_min = 1, amount_max = 2, probability = 0.50}
	},
	mining_particle = "shell-particle"
}

-- Assembling machines
local crash_site_assembling_machine_2_repaired_entity = util.table.deepcopy(data.raw["assembling-machine"]["crash-site-assembling-machine-2-repaired"])
crash_site_assembling_machine_2_repaired_entity.name = "kr-crash-site-assembling-machine-2-repaired"
crash_site_assembling_machine_2_repaired_entity.flags = crash_site_flags
crash_site_assembling_machine_2_repaired_entity.localised_name = {"entity-name.kr-damaged-ship-assembler"}
crash_site_assembling_machine_2_repaired_entity.localised_description = {"entity-description.kr-crash-site-building"}
crash_site_assembling_machine_2_repaired_entity.resistances =
{
	{type = "fire", percent = 100},
	{type = "impact",percent = 60},
	{type = "physical",percent = 50}
}
crash_site_assembling_machine_2_repaired_entity.minable = big_minable_ship_residues
crash_site_assembling_machine_2_repaired_entity.crafting_speed = 0.25
crash_site_assembling_machine_2_repaired_entity.has_backer_name = false
data:extend({crash_site_assembling_machine_2_repaired_item, crash_site_assembling_machine_2_repaired_entity})

-- Generator
local crash_site_generator_entity = util.table.deepcopy(data.raw["electric-energy-interface"]["crash-site-generator"])
crash_site_generator_entity.name = "kr-crash-site-generator"
crash_site_generator_entity.flags = crash_site_flags
crash_site_generator_entity.localised_name = {"entity-name.kr-damaged-ship-reactor"}
crash_site_generator_entity.localised_description = {"entity-description.kr-crash-site-building"}
crash_site_generator_entity.resistances =
{
	{type = "fire", percent = 100},
	{type = "impact",percent = 60},
	{type = "physical",percent = 50}
}
crash_site_generator_entity.energy_source =
{
  type = "electric",
  buffer_capacity = "240kJ",
  usage_priority = "primary-output",
  input_flow_limit = "0kW",
  output_flow_limit = "240kW"
}
crash_site_generator_entity.energy_production = "240kW"
crash_site_generator_entity.minable = big_minable_ship_residues
data:extend({crash_site_generator_item, crash_site_generator_entity})

-- Chests
local crash_site_chest_1_entity = util.table.deepcopy(data.raw["container"]["crash-site-chest-1"])
crash_site_chest_1_entity.name = "kr-crash-site-chest-1"
crash_site_chest_1_entity.flags = crash_site_flags
crash_site_chest_1_entity.localised_name = {"entity-name.crash-site-chest-1"}
crash_site_chest_1_entity.localised_description = {"entity-description.kr-crash-site-building"}
crash_site_chest_1_entity.resistances =
{
	{type = "fire", percent = 100},
	{type = "impact",percent = 60},
	{type = "physical",percent = 50}
}
crash_site_chest_1_entity.minable = small_minable_ship_residues
crash_site_chest_1_entity.inventory_size = 5
data:extend({crash_site_chest_1_item, crash_site_chest_1_entity})

local crash_site_chest_2_entity = util.table.deepcopy(data.raw["container"]["crash-site-chest-2"])
crash_site_chest_2_entity.name = "kr-crash-site-chest-2"
crash_site_chest_2_entity.flags = crash_site_flags
crash_site_chest_2_entity.localised_name = {"entity-name.crash-site-chest-2"}
crash_site_chest_2_entity.localised_description = {"entity-description.kr-crash-site-building"}
crash_site_chest_2_entity.resistances =
{
	{type = "fire", percent = 100},
	{type = "impact",percent = 60},
	{type = "physical",percent = 50}
}
crash_site_chest_2_entity.minable = small_minable_ship_residues
crash_site_chest_2_entity.inventory_size = 5
data:extend({crash_site_chest_2_item, crash_site_chest_2_entity})

-- Mineable wreckage
local mineable_wreckage_entity = util.table.deepcopy(data.raw["simple-entity"]["mineable-wreckage"])
mineable_wreckage_entity.name = "kr-mineable-wreckage"
mineable_wreckage_entity.flags = crash_site_flags
mineable_wreckage_entity.localised_description = {"entity-description.mineable-wreckage"}
mineable_wreckage_entity.resistances =
{
	{type = "fire", percent = 100},
	{type = "impact",percent = 60},
	{type = "physical",percent = 50}
}
mineable_wreckage_entity.minable = small_minable_ship_residues
data:extend({mineable_wreckage_entity})
