local matter_lib = require("prototypes.libraries.matter")

matter_lib.make_recipes({
  material = { type = "item", name = "biomass", amount = 10 },
  matter_count = 5,
  energy_required = 1,
})

matter_lib.make_recipes({
  material = { type = "item", name = "coal", amount = 10 },
  matter_count = 3.5,
  energy_required = 1,
  unlocked_by = "kr-matter-coal-processing",
})

matter_lib.make_recipes({
  material = { type = "item", name = "copper-ore", amount = 10 },
  matter_count = 5,
  energy_required = 1,
  unlocked_by = "kr-matter-copper-processing",
})

matter_lib.make_recipes({
  material = { type = "fluid", name = "crude-oil", amount = 100 },
  matter_count = 6,
  energy_required = 1,
  unlocked_by = "kr-matter-oil-processing",
})

matter_lib.make_recipes({
  material = { type = "item", name = "imersite-powder", amount = 10 },
  matter_count = 3.35,
  energy_required = 1,
  unlocked_by = "kr-matter-minerals-processing",
})

matter_lib.make_recipes({
  material = { type = "item", name = "iron-ore", amount = 10 },
  matter_count = 5,
  energy_required = 1,
  unlocked_by = "kr-matter-iron-processing",
})

matter_lib.make_recipes({
  material = { type = "item", name = "matter-cube", amount = 1 },
  matter_count = 1000,
  energy_required = 15,
  needs_stabilizer = true,
  unlocked_by = "kr-matter-cube",
})

matter_lib.make_recipes({
  material = { type = "fluid", name = "mineral-water", amount = 100 },
  matter_count = 5,
  energy_required = 1,
  unlocked_by = "kr-matter-water-processing",
})

matter_lib.make_recipes({
  material = { type = "item", name = "raw-rare-metals", amount = 10 },
  matter_count = 8,
  energy_required = 1,
  unlocked_by = "kr-matter-rare-metals-processing",
})

matter_lib.make_recipes({
  material = { type = "item", name = "stone", amount = 10 },
  matter_count = 3.5,
  energy_required = 1,
  unlocked_by = "kr-matter-stone-processing",
})

matter_lib.make_recipes({
  material = { type = "item", name = "uranium-238", amount = 10 },
  matter_count = 47.1,
  energy_required = 1,
  unlocked_by = "kr-matter-uranium-processing",
})

matter_lib.make_recipes({
  material = { type = "item", name = "uranium-ore", amount = 10 },
  matter_count = 8,
  energy_required = 1,
  unlocked_by = "kr-matter-uranium-processing",
})

matter_lib.make_recipes({
  material = { type = "item", name = "wood", amount = 10 },
  matter_count = 2,
  energy_required = 1,
})

matter_lib.make_conversion_recipe({
  material = { type = "item", name = "quartz", amount = 10 },
  matter_count = 1.84,
  energy_required = 1,
  unlocked_by = "kr-matter-stone-processing",
})

matter_lib.make_conversion_recipe({
  material = { type = "item", name = "raw-imersite", amount = 10 },
  matter_count = 10,
  energy_required = 1,
  unlocked_by = "kr-matter-minerals-processing",
})

matter_lib.make_deconversion_recipe({
  material = { type = "item", name = "copper-plate", amount = 10 },
  matter_count = 7.5,
  energy_required = 2,
  needs_stabilizer = true,
  unlocked_by = "kr-matter-copper-processing",
})

matter_lib.make_deconversion_recipe({
  material = { type = "item", name = "glass", amount = 10 },
  matter_count = 3.5,
  energy_required = 2,
  needs_stabilizer = true,
  unlocked_by = "kr-matter-stone-processing",
})

matter_lib.make_deconversion_recipe({
  material = { type = "item", name = "iron-plate", amount = 10 },
  matter_count = 7.5,
  energy_required = 2,
  needs_stabilizer = true,
  unlocked_by = "kr-matter-iron-processing",
})

matter_lib.make_deconversion_recipe({
  material = { type = "item", name = "plastic-bar", amount = 10 },
  matter_count = 6.6,
  energy_required = 2,
  needs_stabilizer = true,
  unlocked_by = "kr-matter-oil-processing",
})

matter_lib.make_deconversion_recipe({
  material = { type = "item", name = "rare-metals", amount = 10 },
  matter_count = 14,
  energy_required = 2,
  needs_stabilizer = true,
  unlocked_by = "kr-matter-rare-metals-processing",
})

matter_lib.make_deconversion_recipe({
  material = { type = "item", name = "sand", amount = 10 },
  matter_count = 1.17,
  energy_required = 1,
  unlocked_by = "kr-matter-stone-processing",
})

matter_lib.make_deconversion_recipe({
  material = { type = "item", name = "silicon", amount = 10 },
  matter_count = 4.67,
  energy_required = 2,
  needs_stabilizer = true,
  unlocked_by = "kr-matter-stone-processing",
})

matter_lib.make_deconversion_recipe({
  material = { type = "item", name = "steel-plate", amount = 10 },
  matter_count = 17.2,
  energy_required = 2,
  needs_stabilizer = true,
  unlocked_by = "kr-matter-iron-processing",
})

matter_lib.make_deconversion_recipe({
  material = { type = "item", name = "sulfur", amount = 10 },
  matter_count = 8,
  energy_required = 4,
  needs_stabilizer = true,
  unlocked_by = "kr-matter-oil-processing",
})

matter_lib.make_deconversion_recipe({
  material = { type = "fluid", name = "water", amount = 100 },
  matter_count = 0.5,
  energy_required = 1,
  unlocked_by = "kr-matter-water-processing",
})
