local small_minable_ship_residues = 
{
	mining_time = 2,
	results = 
	{
		{ type = "item", name = "iron-plate", amount_min = 1, amount_max = 2, probability = 0.75 },
		{ type = "item", name = "copper-cable", amount_min = 0, amount_max = 2, probability = 0.50 },
		{ type = "item", name = "iron-gear-wheel", amount_min = 0, amount_max = 2, probability = 0.50},
		{ type = "item", name = "electronic-circuit", amount_min = 0, amount_max = 2, probability = 0.25}
	}
}

local big_minable_ship_residues = 
{
	mining_time = 5,
	results = 
	{
		{ type = "item", name = "iron-plate", amount_min = 1, amount_max = 10 },
		{ type = "item", name = "copper-cable", amount_min = 1, amount_max = 10 },
		{ type = "item", name = "iron-gear-wheel", amount_min = 1, amount_max = 10 },
		{ type = "item", name = "electronic-circuit", amount_min = 1, amount_max = 5 }
	}
}

-- Lab
local crash_site_lab_repaired_item = util.table.deepcopy(data.raw["item"]["crash-site-lab-repaired"])
crash_site_lab_repaired_item.name = "kr-crash-site-lab-repaired"
crash_site_lab_repaired_item.localised_name = {"entity-name.kr-damaged-ship-research-computer"}
crash_site_lab_repaired_item.localised_description = {"entity-description.crash-site-lab-repaired"}
crash_site_lab_repaired_item.place_result = "kr-crash-site-lab-repaired"
local crash_site_lab_repaired_entity = util.table.deepcopy(data.raw["lab"]["crash-site-lab-repaired"])
crash_site_lab_repaired_entity.name = "kr-crash-site-lab-repaired"
crash_site_lab_repaired_entity.localised_name = {"entity-name.kr-damaged-ship-research-computer"}
crash_site_lab_repaired_entity.localised_description = {"entity-description.crash-site-lab-repaired"}
crash_site_lab_repaired_entity.inputs = { "basic-tech-card" }
crash_site_lab_repaired_entity.minable = big_minable_ship_residues
data:extend({crash_site_lab_repaired_item, crash_site_lab_repaired_entity})

-- Assembling machines
local crash_site_assembling_machine_1_repaired_item = util.table.deepcopy(data.raw["item"]["crash-site-assembling-machine-1-repaired"])
crash_site_assembling_machine_1_repaired_item.name = "kr-crash-site-assembling-machine-1-repaired"
crash_site_assembling_machine_1_repaired_item.localised_name = {"entity-name.kr-damaged-ship-assembler"}
crash_site_assembling_machine_1_repaired_item.localised_description = {"entity-description.crash-site-assembling-machine-1-repaired"}
crash_site_assembling_machine_1_repaired_item.place_result = "kr-crash-site-assembling-machine-1-repaired"
local crash_site_assembling_machine_1_repaired_entity = util.table.deepcopy(data.raw["assembling-machine"]["crash-site-assembling-machine-1-repaired"])
crash_site_assembling_machine_1_repaired_entity.name = "kr-crash-site-assembling-machine-1-repaired"
crash_site_assembling_machine_1_repaired_entity.localised_name = {"entity-name.kr-damaged-ship-assembler"}
crash_site_assembling_machine_1_repaired_entity.localised_description = {"entity-description.crash-site-assembling-machine-1-repaired"}
crash_site_assembling_machine_1_repaired_entity.minable = big_minable_ship_residues
data:extend({crash_site_assembling_machine_1_repaired_item, crash_site_assembling_machine_1_repaired_entity})

local crash_site_assembling_machine_2_repaired_item = util.table.deepcopy(data.raw["item"]["crash-site-assembling-machine-2-repaired"])
crash_site_assembling_machine_2_repaired_item.name = "kr-crash-site-assembling-machine-2-repaired"
crash_site_assembling_machine_2_repaired_item.localised_name = {"entity-name.kr-damaged-ship-assembler"}
crash_site_assembling_machine_2_repaired_item.localised_description = {"entity-description.crash-site-assembling-machine-2-repaired"}
crash_site_assembling_machine_2_repaired_item.place_result = "kr-crash-site-assembling-machine-2-repaired"
local crash_site_assembling_machine_2_repaired_entity = util.table.deepcopy(data.raw["assembling-machine"]["crash-site-assembling-machine-2-repaired"])
crash_site_assembling_machine_2_repaired_entity.name = "kr-crash-site-assembling-machine-2-repaired"
crash_site_assembling_machine_2_repaired_entity.localised_name = {"entity-name.kr-damaged-ship-assembler"}
crash_site_assembling_machine_2_repaired_entity.localised_description = {"entity-description.crash-site-assembling-machine-2-repaired"}
crash_site_assembling_machine_2_repaired_entity.minable = big_minable_ship_residues
data:extend({crash_site_assembling_machine_2_repaired_item, crash_site_assembling_machine_2_repaired_entity})

-- Generator
local crash_site_generator_item = util.table.deepcopy(data.raw["item"]["crash-site-generator"])
crash_site_generator_item.name = "kr-crash-site-generator"
crash_site_generator_item.localised_name = {"entity-name.kr-damaged-ship-reactor"}
crash_site_generator_item.localised_description = {"entity-description.crash-site-generator"}
crash_site_generator_item.place_result = "kr-crash-site-generator"
local crash_site_generator_entity = util.table.deepcopy(data.raw["electric-energy-interface"]["crash-site-generator"])
crash_site_generator_entity.name = "kr-crash-site-generator"
crash_site_generator_entity.localised_name = {"entity-name.kr-damaged-ship-reactor"}
crash_site_generator_entity.localised_description = {"entity-description.crash-site-generator"}
crash_site_generator_entity.energy_source =
{
  type = "electric",
  buffer_capacity = "240kJ",
  usage_priority = "tertiary",
  input_flow_limit = "0kW",
  output_flow_limit = "240kW"
}
crash_site_generator_entity.energy_production = "240kW"
crash_site_generator_entity.minable = big_minable_ship_residues
data:extend({crash_site_generator_item, crash_site_generator_entity})

-- Chests
data.raw["container"]["crash-site-chest-1"].minable = small_minable_ship_residues
data.raw["container"]["crash-site-chest-1"].inventory_size = 3
data.raw["container"]["crash-site-chest-2"].minable = small_minable_ship_residues
data.raw["container"]["crash-site-chest-2"].inventory_size = 3

-- Ship wreck
local big_ship_wreck_1 = util.table.deepcopy(data.raw["container"]["big-ship-wreck-1"])
big_ship_wreck_1.type = "simple-entity"
big_ship_wreck_1.minable = big_minable_ship_residues
data.raw["container"]["big-ship-wreck-1"] = nil
data:extend({big_ship_wreck_1})

local big_ship_wreck_2 = util.table.deepcopy(data.raw["container"]["big-ship-wreck-2"])
big_ship_wreck_2.type = "simple-entity"
big_ship_wreck_2.minable = big_minable_ship_residues
data.raw["container"]["big-ship-wreck-2"] = nil 
data:extend({big_ship_wreck_2})

local big_ship_wreck_3 = util.table.deepcopy(data.raw["container"]["big-ship-wreck-3"])
big_ship_wreck_3.type = "simple-entity"
big_ship_wreck_3.minable = big_minable_ship_residues
data.raw["container"]["big-ship-wreck-3"] = nil 
data:extend({big_ship_wreck_3})

-- Mineable wreckage
data.raw["simple-entity"]["mineable-wreckage"].minable = small_minable_ship_residues
