local variations_util = require(kr_public_lib .. "create-roboport-states")

if mods["IndustrialRevolution"] then
  -----------------------------------------------------------------------------------------------------------------------
  -- -- TECHNOLOGIES
  -----------------------------------------------------------------------------------------------------------------------

  krastorio.technologies.addPrerequisite("ir2-electronics-2", "kr-silicon-processing")

  -- Prerequisite duplicated
  krastorio.technologies.removePrerequisite("gate", "ir2-electronics-1")

  -- Overriding
  krastorio.technologies.removePrerequisite("logistic-science-pack", "ir2-electronics-1")
  krastorio.technologies.removePrerequisite("fluid-handling", "kr-basic-fluid-handling")
  krastorio.technologies.removePrerequisite("nuclear-power", "kr-steam-engine")
  krastorio.technologies.removePrerequisite("production-science-pack", "uranium-processing")
  krastorio.technologies.removePrerequisite("utility-science-pack", "rocket-fuel")

  krastorio.technologies.convertPrerequisite("kr-fluids-chemistry", "kr-basic-fluid-handling", "fluid-handling", true)

  krastorio.technologies.convertPrerequisite("kr-steel-fluid-tanks", "kr-steel-fluid-handling", "ir2-barrelling", false)

  krastorio.technologies.removePrerequisite("stone-wall", "military")
  krastorio.technologies.removePrerequisite("light-armor", "military")
  krastorio.technologies.addPrerequisite("ir2-steambot", "light-armor")
  krastorio.technologies.addResearchUnitIngredient("light-armor", "automation-science-pack", 1)
  krastorio.technologies.removeResearchUnitIngredient("light-armor", "logistic-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("heavy-armor", "logistic-science-pack", 1)

  -- -- Fix technologies that must be under iron age
  -- Greenhouse
  krastorio.technologies.addPrerequisite("kr-greenhouse", "ir2-iron-milestone")
  krastorio.technologies.addResearchUnitIngredient("kr-greenhouse", "automation-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("kr-greenhouse", "logistic-science-pack", 1)
  krastorio.technologies.addPrerequisite("kr-crusher", "ir2-iron-milestone")
  -- Crusher
  krastorio.technologies.addResearchUnitIngredient("kr-crusher", "automation-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("kr-crusher", "logistic-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("kr-stone-processing", "automation-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("kr-stone-processing", "logistic-science-pack", 1)

  krastorio.technologies.addResearchUnitIngredient("fluid-handling", "logistic-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("kr-fluids-chemistry", "logistic-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("kr-fluids-chemistry", "chemical-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("oil-processing", "logistic-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("plastics", "logistic-science-pack", 1)
  if krastorio.general.getSafeSettingValue("kr-containers") then
    krastorio.technologies.addResearchUnitIngredient("kr-containers", "chemical-science-pack", 1)
  end
  krastorio.technologies.addResearchUnitIngredient("kr-radar", "chemical-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("logistic-2", "logistic-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("logistic-2", "chemical-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("kr-silicon-processing", "chemical-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("kr-fluid-excess-handling", "chemical-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("automobilism", "chemical-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("advanced-radar", "chemical-science-pack", 1)

  krastorio.technologies.removeResearchUnitIngredient("kr-fluids-chemistry", "basic-tech-card")
  krastorio.technologies.removeResearchUnitIngredient("kr-fluid-excess-handling", "basic-tech-card")
  krastorio.technologies.removeResearchUnitIngredient("automobilism", "basic-tech-card")
  krastorio.technologies.removeResearchUnitIngredient("advanced-radar", "basic-tech-card")
  krastorio.technologies.removeResearchUnitIngredient("kr-silicon-processing", "basic-tech-card")

  -- lithium-sulfur-battery
  krastorio.technologies.addPrerequisite("kr-lithium-sulfur-battery", "production-science-pack")
  krastorio.technologies.addResearchUnitIngredient("kr-lithium-sulfur-battery", "production-science-pack", 1)

  -- Fix lab utility
  krastorio.technologies.convertPrerequisiteFromAllTechnologies("kr-singularity-lab", "kr-quantum-computer", true)
  data.raw.technology["kr-singularity-lab"].prerequisites = { "kr-imersium-processing" }
  data.raw.technology["kr-advanced-tech-card"].prerequisites = { "kr-singularity-lab" }
  krastorio.technologies.addResearchUnitIngredient("kr-singularity-lab", "space-science-pack", 1, true)
  krastorio.technologies.addResearchUnitIngredient("kr-singularity-lab", "matter-tech-card", 1, true)

  krastorio.technologies.addResearchUnitIngredient("military", "automation-science-pack", 1)
  krastorio.technologies.addResearchUnitIngredient("engine", "logistic-science-pack", 1)

  -- Remove unlock
  krastorio.technologies.removeUnlockRecipe("kr-stone-processing", "glass-2")
  krastorio.technologies.removeUnlockRecipe("logistics", "inserter")
  krastorio.technologies.removeUnlockRecipe("logistics", "long-handed-inserter")
  -- Add unlock
  krastorio.technologies.addUnlockRecipe("ir2-furnaces-2", "rare-metals")
  krastorio.technologies.addUnlockRecipe("kr-automation-core", "burner-inserter")
  krastorio.technologies.addUnlockRecipe("kr-automation-core", "inserter-parts")

  -- Removing technologies

  data.raw.technology["kr-basic-fluid-handling"] = nil
  data.raw.technology["kr-steam-engine"] = nil

  data.raw.technology["kr-air-purification"] = nil
  data.raw.technology["kr-improved-pollution-filter"] = nil

  data.raw.technology["kr-electric-mining-drill"] = nil
  data.raw.technology["kr-electric-mining-drill-mk2"] = nil
  data.raw.technology["kr-electric-mining-drill-mk3"] = nil

  data.raw.technology["ir2-nuclear-fuel"] = nil

  data.raw.technology["kr-steel-fluid-handling"] = nil

  krastorio.technologies.disable("ir2-transmat", false)

  data:extend({
    {
      type = "technology",
      name = "kr-wind-turbine",
      localised_name = { "item-name.kr-wind-turbine" },
      localised_description = { "item-description.kr-wind-turbine" },
      mod = "Krastorio2",
      icon = kr_technologies_icons_path .. "wind-turbine.png",
      icon_size = 256,
      icon_mipmaps = 4,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "kr-wind-turbine",
        },
      },
      prerequisites = { "ir2-steam-power" },
      unit = {
        count = 50,
        ingredients = {
          { "basic-tech-card", 1 },
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
        },
        time = 30,
      },
    },
  })

  -----------------------------------------------------------------------------------------------------------------------
  -- -- Recipes
  -----------------------------------------------------------------------------------------------------------------------

  -- Unifing redundant item
  krastorio.recipes.convertIngredientFromAllRecipes("charcoal", "coke")
  krastorio.recipes.convertProductFromAllRecipes("charcoal", "coke")
  krastorio.recipes.convertIngredientFromAllRecipes("sand", "silica")
  krastorio.recipes.convertProductFromAllRecipes("sand", "silica")

  -- Basic tech card
  krastorio.recipes.convertIngredient("basic-tech-card", "copper-cable", "copper-gear-wheel")

  -- -- Automation core
  --Disable copper motor
  krastorio.recipes.disable("copper-motor")
  krastorio.recipes.disable("kr-wind-turbine")
  krastorio.recipes.disable("rare-metals")
  krastorio.recipes.disable("burner-inserter")
  krastorio.recipes.disable("inserter-parts")

  krastorio.recipes.convertIngredientFromAllRecipes("copper-motor", "automation-core")
  krastorio.recipes.convertIngredient("automation-core", "iron-gear-wheel", "copper-gear-wheel")
  krastorio.recipes.convertIngredient("automation-core", "iron-stick", "copper-rod")

  -- Inserter parts
  krastorio.recipes.convertIngredient("inserter-parts", "iron-gear-wheel", "tin-gear-wheel")
  krastorio.recipes.convertIngredient("inserter-parts", "iron-stick", "tin-rod")
  -- Burner inserters
  krastorio.recipes.convertIngredient("burner-inserter", "iron-plate", "automation-core")
  -- Inserters
  krastorio.recipes.convertIngredient("inserter", "automation-core", "iron-motor")
  krastorio.recipes.convertIngredient("long-handed-inserter", "automation-core", "iron-motor")
  krastorio.recipes.replaceIngredient("filter-inserter", "inserter-parts", { "fast-inserter", 1 })
  krastorio.recipes.replaceIngredient("filter-inserter", "steel-plate", { "sensor", 1 })
  krastorio.recipes.removeIngredient("filter-inserter", "electronic-circuit")

  krastorio.recipes.replaceIngredient("stack-filter-inserter", "inserter-parts", { "stack-inserter", 1 })
  krastorio.recipes.replaceIngredient("stack-filter-inserter", "steel-plate", { "sensor", 1 })
  krastorio.recipes.removeIngredient("stack-filter-inserter", "advanced-circuit")
  krastorio.recipes.removeIngredient("stack-filter-inserter", "steel-gear-wheel")

  krastorio.recipes.replaceIngredient("kr-superior-filter-inserter", "inserter-parts", { "kr-superior-inserter", 1 })
  krastorio.recipes.replaceIngredient("kr-superior-filter-inserter", "processing-unit", { "sensor", 1 })
  krastorio.recipes.removeIngredient("kr-superior-filter-inserter", "imersium-plate")
  krastorio.recipes.removeIngredient("kr-superior-filter-inserter", "imersium-gear-wheel")

  krastorio.recipes.replaceIngredient(
    "kr-superior-long-filter-inserter",
    "inserter-parts",
    { "kr-superior-long-inserter", 1 }
  )
  krastorio.recipes.replaceIngredient("kr-superior-long-filter-inserter", "processing-unit", { "sensor", 1 })
  krastorio.recipes.removeIngredient("kr-superior-long-filter-inserter", "imersium-plate")
  krastorio.recipes.removeIngredient("kr-superior-long-filter-inserter", "imersium-gear-wheel")

  -- Deadlock inserters
  krastorio.recipes.replaceIngredient("pipe-inserter", "tin-rod", { "inserter-parts", 1 })
  krastorio.recipes.replaceIngredient("long-handed-pipe-inserter", "tin-rod", { "inserter-parts", 1 })

  -- Loaders
  krastorio.recipes.replaceIngredient("kr-loader", "iron-beam", { "copper-frame-small", 1 })
  krastorio.recipes.replaceIngredient("kr-fast-loader", "kr-loader", { "iron-frame-small", 1 })
  krastorio.recipes.replaceIngredient("kr-express-loader", "kr-fast-loader", { "steel-frame-small", 1 })
  krastorio.recipes.replaceIngredient("kr-se-loader", "kr-fast-loader", { "steel-frame-small", 1 })
  krastorio.recipes.replaceIngredient("kr-advanced-loader", "kr-express-loader", { "stainless-frame-small", 1 })
  krastorio.recipes.replaceIngredient("kr-superior-loader", "kr-advanced-loader", { "stainless-frame-small", 1 })

  -- Labs
  krastorio.recipes.convertIngredient("kr-singularity-lab", "steel-plate", "imersium-plate")
  krastorio.recipes.replaceIngredient("kr-singularity-lab", "biusart-lab", { "quantum-lab", 2 })

  -- Black tech card
  krastorio.recipes.convertIngredient("blank-tech-card", "iron-plate", "tin-plate")
  krastorio.recipes.convertIngredient("blank-tech-card", "copper-cable", "copper-rod")

  -- Rail
  krastorio.recipes.convertIngredient("rail", "steel-beam", "iron-beam")

  -- Disable unseful recipes
  krastorio.recipes.disable("iron-beam-2")

  -- Electronic components
  krastorio.recipes.convertIngredientFromAllRecipes("electronic-components", "gold-gate")
  krastorio.recipes.convertIngredient("energy-control-unit", "gold-gate", "tellurium-gate")

  -- Processor unit
  krastorio.recipes.removeIngredient("processing-unit", "rare-metals")

  -- AI-core
  krastorio.recipes.addIngredient("ai-core", { "tellurium-gate", 2 })

  -- Steel pipes from K2 to IR2
  krastorio.recipes.convertIngredientFromAllRecipes("kr-steel-pipe", "steel-pipe")

  -- Fluid tanks
  krastorio.recipes.convertIngredient("rail", "steel-beam", "iron-beam")

  -- Lithium sulfur battery
  krastorio.recipes.replaceIngredient(
    "lithium-sulfur-battery",
    "lithium",
    { type = "item", name = "lithium", amount = 2 }
  )
  krastorio.recipes.replaceIngredient(
    "lithium-sulfur-battery",
    "copper-plate",
    { type = "item", name = "bronze-plate-special", amount = 2 }
  )
  krastorio.recipes.replaceIngredient(
    "lithium-sulfur-battery",
    "sulfuric-acid",
    { type = "fluid", name = "sulfuric-acid", amount = 40 }
  )

  -- Fluid burner
  krastorio.recipes.addIngredient("kr-fluid-burner", { "iron-motor", 1 })

  -- Fuel refinery
  krastorio.recipes.replaceIngredient("kr-fuel-refinery", "steel-beam", { "iron-frame-large", 1 })

  -- atmospheric-condenser
  krastorio.recipes.replaceIngredient("kr-atmospheric-condenser", "steel-beam", { "iron-frame-large", 1 })
  krastorio.recipes.replaceIngredient("kr-atmospheric-condenser", "electronic-circuit", { "iron-motor", 4 })

  -- electrolysis-plant
  krastorio.recipes.replaceIngredient("kr-electrolysis-plant", "steel-beam", { "iron-frame-large", 1 })

  -- filtration-plant
  krastorio.recipes.replaceIngredient("kr-filtration-plant", "steel-beam", { "iron-frame-large", 1 })

  -- Rocket fuel
  krastorio.recipes.removeIngredient("rocket-fuel", "petroleum-gas")
  krastorio.recipes.removeIngredient("rocket-fuel", "iron-stick")
  krastorio.recipes.removeIngredient("rocket-fuel", "iron-powder")

  -- Research server
  krastorio.recipes.replaceIngredient("kr-research-server", "steel-beam", { "steel-frame-large", 1 })

  -- Quantum computer
  krastorio.recipes.replaceIngredient("kr-quantum-computer", "processing-unit", { "computer-mk3", 8 })
  krastorio.recipes.replaceIngredient("kr-quantum-computer", "copper-plate", { "cupronickel-plate", 8 })

  -- Fusion reactor
  krastorio.recipes.replaceIngredient("kr-fusion-reactor", "rare-metals", { "computer-mk3", 8 })
  krastorio.recipes.replaceIngredient("kr-fusion-reactor", "processing-unit", { "laser", 8 })
  krastorio.recipes.convertIngredient("kr-fusion-reactor", "steel-plate", "lead-plate-special")

  -- Antimatter reactor
  krastorio.recipes.replaceIngredient("kr-antimatter-reactor", "rare-metals", { "computer-mk3", 16 })
  krastorio.recipes.convertIngredient("kr-antimatter-reactor", "steel-plate", "lead-plate-special")

  -- Advanced furnace
  krastorio.recipes.replaceIngredient("kr-advanced-furnace", "gold-gate", { "computer-mk3", 2 })
  krastorio.recipes.convertIngredient("kr-advanced-furnace", "copper-plate", "invar-plate-special")
  krastorio.recipes.replaceIngredient("kr-advanced-furnace", "steel-beam", { "stainless-frame-large", 2 })

  -- Advanced chemical plant
  krastorio.recipes.replaceIngredient("kr-advanced-chemical-plant", "gold-gate", { "computer-mk3", 2 })

  -- Adding recipe for rare-metals conversion
  data:extend({
    -- Gold
    {
      type = "recipe",
      name = "gold-ingot-2",
      icons = {
        { icon = "__IndustrialRevolution__/graphics/icons/64/gold-ingot.png", icon_size = 64, mipmap_count = 4 },
        {
          icon = kr_items_with_variations_icons_path .. "rare-metals/rare-metals.png",
          icon_size = 64,
          scale = 0.22,
          shift = { -8, -8 },
          mipmap_count = 4,
        },
      },
      icon_size = 64,
      category = "washing",
      energy_required = 8,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      allow_productivity = true,
      ingredients = {
        { type = "fluid", name = "sulfuric-acid", amount = 10 },
        { type = "item", name = "crushed-rare-metals", amount = 5, catalyst_amount = 10 },
      },
      results = {
        { type = "item", name = "gold-ingot", amount = 10, catalyst_amount = 10 },
        { type = "fluid", name = "dirty-water", amount = 20 },
      },
      main_product = "gold-ingot",
      crafting_machine_tint = {
        primary = { r = 0.314, g = 0.6863, b = 0.2157, a = 0.000 },
        secondary = { r = 0.200, g = 0.680, b = 0.300, a = 0.357 },
        tertiary = { r = 0.430, g = 0.305, b = 0.2, a = 0.000 },
        quaternary = { r = 0.970, g = 0.501, b = 0.000, a = 0.900 },
      },
      subgroup = "pure",
      order = "e-c-j-b-a",
    },
    -- Chromium
    {
      type = "recipe",
      name = "chromium-pure-2",
      icons = {
        { icon = "__IndustrialRevolution__/graphics/icons/64/chromium-pure.png", icon_size = 64, mipmap_count = 4 },
        {
          icon = kr_items_with_variations_icons_path .. "rare-metals/rare-metals.png",
          icon_size = 64,
          scale = 0.22,
          shift = { -8, -8 },
          mipmap_count = 4,
        },
      },
      icon_size = 64,
      category = "washing",
      energy_required = 8,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      allow_productivity = true,
      ingredients = {
        { type = "fluid", name = "sulfuric-acid", amount = 20 },
        { type = "item", name = "crushed-rare-metals", amount = 5, catalyst_amount = 10 },
      },
      results = {
        { type = "item", name = "chromium-pure", amount = 5, catalyst_amount = 5 },
        { type = "fluid", name = "dirty-water", amount = 40 },
      },
      main_product = "chromium-pure",
      crafting_machine_tint = {
        primary = { r = 0.80, g = 0.2784, b = 0.2941, a = 0.000 },
      },
      subgroup = "pure",
      order = "e-c-j-b-b",
    },
    -- Lead
    {
      type = "recipe",
      name = "lead-pure-2",
      icons = {
        { icon = "__IndustrialRevolution__/graphics/icons/64/lead-pure.png", icon_size = 64, mipmap_count = 4 },
        {
          icon = kr_items_with_variations_icons_path .. "rare-metals/rare-metals.png",
          icon_size = 64,
          scale = 0.22,
          shift = { -8, -8 },
          mipmap_count = 4,
        },
      },
      icon_size = 64,
      category = "washing",
      energy_required = 8,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      allow_productivity = true,
      ingredients = {
        { type = "fluid", name = "sulfuric-acid", amount = 20 },
        { type = "item", name = "crushed-rare-metals", amount = 5, catalyst_amount = 10 },
      },
      results = {
        { type = "item", name = "lead-pure", amount = 5, catalyst_amount = 5 },
        { type = "fluid", name = "dirty-water", amount = 40 },
      },
      main_product = "lead-pure",
      crafting_machine_tint = {
        primary = { r = 0.3, g = 0.3, b = 0.3, a = 0.000 },
      },
      subgroup = "pure",
      order = "e-c-j-b-c",
    },
    -- Nickel
    {
      type = "recipe",
      name = "nickel-pure-2",
      icons = {
        { icon = "__IndustrialRevolution__/graphics/icons/64/nickel-pure.png", icon_size = 64, mipmap_count = 4 },
        {
          icon = kr_items_with_variations_icons_path .. "rare-metals/rare-metals.png",
          icon_size = 64,
          scale = 0.22,
          shift = { -8, -8 },
          mipmap_count = 4,
        },
      },
      icon_size = 64,
      category = "washing",
      energy_required = 8,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      allow_productivity = true,
      ingredients = {
        { type = "fluid", name = "sulfuric-acid", amount = 20 },
        { type = "item", name = "crushed-rare-metals", amount = 5, catalyst_amount = 10 },
      },
      results = {
        { type = "item", name = "nickel-pure", amount = 5, catalyst_amount = 5 },
        { type = "fluid", name = "dirty-water", amount = 40 },
      },
      main_product = "nickel-pure",
      crafting_machine_tint = {
        primary = { r = 0.3, g = 0.3, b = 0.3, a = 0.000 },
      },
      subgroup = "pure",
      order = "e-c-j-b-d",
    },
    -- Tellurium
    {
      type = "recipe",
      name = "tellurium-pure-2",
      icons = {
        { icon = "__IndustrialRevolution__/graphics/icons/64/tellurium-pure.png", icon_size = 64, mipmap_count = 4 },
        {
          icon = kr_items_with_variations_icons_path .. "rare-metals/rare-metals.png",
          icon_size = 64,
          scale = 0.22,
          shift = { -8, -8 },
          mipmap_count = 4,
        },
      },
      icon_size = 64,
      category = "washing",
      energy_required = 8,
      enabled = false,
      always_show_made_in = true,
      always_show_products = true,
      allow_productivity = true,
      ingredients = {
        { type = "fluid", name = "sulfuric-acid", amount = 20 },
        { type = "item", name = "crushed-rare-metals", amount = 5, catalyst_amount = 10 },
      },
      results = {
        { type = "item", name = "tellurium-pure", amount = 5, catalyst_amount = 5 },
        { type = "fluid", name = "dirty-water", amount = 40 },
      },
      main_product = "tellurium-pure",
      crafting_machine_tint = {
        primary = { r = 0.3843, g = 0.2431, b = 0.7098, a = 0.000 },
      },
      subgroup = "pure",
      order = "e-c-j-b-e",
    },
  })
  krastorio.technologies.addUnlockRecipe("ir2-washing-1", "gold-ingot-2")
  krastorio.technologies.addUnlockRecipe("ir2-washing-1", "tellurium-pure-2")
  krastorio.technologies.addUnlockRecipe("ir2-washing-1", "chromium-pure-2")
  krastorio.technologies.addUnlockRecipe("ir2-washing-1", "lead-pure-2")
  krastorio.technologies.addUnlockRecipe("ir2-washing-1", "nickel-pure-2")

  -- Modify enrichement recipes to be balanced
  krastorio.recipes.replaceIngredient("enriched-copper-plate", "enriched-copper", { "enriched-copper", 4 })
  krastorio.recipes.replaceProduct("enriched-copper-plate", "copper-plate", { "copper-ingot", 12 })
  data.raw.recipe["enriched-copper-plate"].main_product = "copper-ingot"
  data.raw.recipe["enriched-copper-plate"].icons = {
    { icon = "__IndustrialRevolution__/graphics/icons/64/copper-ingot.png", icon_size = 64 },
    {
      icon = kr_items_with_variations_icons_path .. "enriched-copper/enriched-copper.png",
      icon_size = 64,
      scale = 0.22,
      shift = { -8, -8 },
    },
  }

  krastorio.recipes.replaceIngredient("enriched-iron-plate", "enriched-iron", { "enriched-iron", 4 })
  krastorio.recipes.replaceProduct("enriched-iron-plate", "iron-plate", { "iron-ingot", 12 })
  data.raw.recipe["enriched-iron-plate"].main_product = "iron-ingot"
  data.raw.recipe["enriched-iron-plate"].icons = {
    { icon = "__IndustrialRevolution__/graphics/icons/64/iron-ingot.png", icon_size = 64 },
    {
      icon = kr_items_with_variations_icons_path .. "enriched-iron/enriched-iron.png",
      icon_size = 64,
      scale = 0.22,
      shift = { -8, -8 },
    },
  }

  -----------------------------------------------------------------------------------------------------------------------
  -- -- ENTITIES
  -----------------------------------------------------------------------------------------------------------------------

  -- -- Fast replecable group next upgrades
  -- Inserters
  data.raw.inserter["long-handed-inserter"].fast_replaceable_group = "long-handed-inserter"
  data.raw.inserter["long-handed-inserter"].next_upgrade = "kr-superior-long-inserter"
  data.raw.inserter["kr-superior-filter-inserter"].fast_replaceable_group = "filter-inserter"

  -- Fix different collision boxes
  data.raw["mining-drill"]["electric-mining-drill"].next_upgrade = nil

  -- Smelting recipes
  if data.raw["assembling-machine"]["kr-advanced-furnace"] then
    if data.raw["recipe-category"]["smelting-1"] then
      table.insert(data.raw["assembling-machine"]["kr-advanced-furnace"].crafting_categories, "smelting-1")
    end
    if data.raw["recipe-category"]["smelting-2"] then
      table.insert(data.raw["assembling-machine"]["kr-advanced-furnace"].crafting_categories, "smelting-2")
    end
    if data.raw["recipe-category"]["smelting-3"] then
      table.insert(data.raw["assembling-machine"]["kr-advanced-furnace"].crafting_categories, "smelting-3")
    end
  end

  -- Roboport (changeble mode)
  variations_util.createRoboportVariations("robotower")

  -- Steel washer and Bronze furnace(selectable recipe)
  for _, furnace_name in pairs({ "bronze-furnace", "steel-washer" }) do
    if data.raw.furnace[furnace_name] then
      local furnace = krastorio_utils.tables.fullCopy(data.raw.furnace[furnace_name])
      furnace.type = "assembling-machine"
      furnace.source_inventory_size = 2
      furnace.energy_usage = "250kW"
      data.raw.furnace[furnace_name] = nil
      data:extend({ furnace })
    end
  end

  -- Add basic science to copper lab
  table.insert(data.raw.lab["copper-lab"].inputs, "basic-tech-card")
  -- Add sciences to quantum lab
  table.insert(data.raw.lab["quantum-lab"].inputs, "production-science-pack")
  table.insert(data.raw.lab["quantum-lab"].inputs, "utility-science-pack")
  table.insert(data.raw.lab["quantum-lab"].inputs, "space-science-pack")
  table.insert(data.raw.lab["quantum-lab"].inputs, "matter-tech-card")

  -- Solar panel rebalancing
  data.raw["solar-panel"]["solar-array"].production = "200kW"
  data.raw["solar-panel"]["kr-advanced-solar-panel"].production = "300kW"

  -- Locomotive
  data.raw.locomotive["locomotive"].burner.fuel_categories = { "chemical", "vehicle-fuel", "battery" }
  data.raw.locomotive["locomotive"].burner.fuel_category = nil
  data.raw.car["monowheel"].burner.fuel_categories = { "chemical", "vehicle-fuel", "battery" }
  data.raw.car["monowheel"].burner.fuel_category = nil

  -----------------------------------------------------------------------------------------------------------------------
  -- -- OTHERS
  -----------------------------------------------------------------------------------------------------------------------

  -- Fix uranium magazine bug
  data:extend({
    {
      type = "ammo",
      name = "uranium-rounds-magazine",
      icon = "__base__/graphics/icons/uranium-rounds-magazine.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        layers = {
          {
            size = 64,
            filename = "__base__/graphics/icons/uranium-rounds-magazine.png",
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            size = 64,
            filename = "__base__/graphics/icons/uranium-rounds-magazine-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
      ammo_type = {
        category = "bullet",
        action = {
          type = "direct",
          action_delivery = {
            type = "instant",
            source_effects = {
              type = "create-explosion",
              entity_name = "explosion-gunshot",
            },
            target_effects = {
              {
                type = "create-entity",
                entity_name = "explosion-hit",
                offsets = { { 0, 1 } },
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
              },
              {
                type = "damage",
                damage = { amount = 24, type = "physical" },
              },
            },
          },
        },
      },
      magazine_size = 10,
      subgroup = "ammo",
      order = "a[basic-clips]-c[uranium-rounds-magazine]",
      stack_size = 200,
    },
  })

  -- -- Rebalance all damage done by player weapons (Turrets, ammo...)
  if krastorio.general.getSafeSettingValue("kr-damage-and-ammo") then
    data.raw["ammo"]["uranium-rounds-magazine"].ammo_type.action.action_delivery = {
      type = "instant",
      source_effects = {
        type = "create-explosion",
        entity_name = "explosion-gunshot",
      },
      target_effects = {
        {
          type = "create-entity",
          entity_name = "explosion-hit",
          offsets = { { 0, 1 } },
          offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        },
        {
          type = "damage",
          damage = { amount = 9, type = "physical" },
        },
        {
          type = "damage",
          damage = { amount = 9, type = "radioactive" },
        },
      },
    }
  end

  -- Removing tip and trick not usable
  data.raw["tips-and-tricks-item"]["kr-air-purifier"] = nil

  -- Chargable battery
  data:extend({
    -- item
    {
      type = "item",
      name = "charged-lithium-sulfur-battery",
      icon = kr_graphic_mod_path .. "compatibility/IndustrialRevolution/charged-lithium-sulfur-battery.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        layers = {
          {
            size = 64,
            filename = kr_graphic_mod_path .. "compatibility/IndustrialRevolution/charged-lithium-sulfur-battery.png",
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            size = 64,
            filename = kr_items_icons_path .. "lithium-sulfur-battery-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
      subgroup = "raw-material",
      order = "i2[lithium-sulfur-battery]",

      burnt_result = "lithium-sulfur-battery",
      fuel_acceleration_multiplier = 1.3,
      fuel_category = "battery",
      fuel_emissions_multiplier = 0.05,
      fuel_glow_color = { 0.314, 0.6863, 0.2157, 1 },
      fuel_value = "40MJ",
      stack_size = 50,
    },
    -- recipe
    {
      type = "recipe",
      name = "charged-lithium-sulfur-battery",
      allow_as_intermediate = false,
      allow_decomposition = false,
      allow_intermediates = false,
      always_show_made_in = true,
      always_show_products = true,
      show_amount_in_title = false,
      category = "charging",
      enabled = false,
      energy_required = 40,
      hide_from_stats = true,
      ingredients = {
        { "lithium-sulfur-battery", 1 },
      },
      order = "h[z-imersite-battery]",
      overload_multiplier = 50,
      results = {
        { type = "item", name = "charged-lithium-sulfur-battery", amount = 1, probability = 0.99 },
      },
      main_product = "charged-lithium-sulfur-battery",
    },
  })
  krastorio.technologies.addUnlockRecipe("kr-lithium-sulfur-battery", "charged-lithium-sulfur-battery")

  -- -- Matter recipes for IR2
  local new_minerals = {
    { "tin", 5, 7.5 },
    { "gold", 8, 14 },
    { "chromium", 10, 14 },
    { "lead", 10, 14 },
    { "nickel", 10, 14 },
    { "tellurium", 10, 14 },
  }
  local new_pure_conversion = nil
  local new_ingot_conversion = nil
  local sub_name = nil
  local pure_conv_val = nil
  local ingot_conv_val = nil

  for _, item_prop in pairs(new_minerals) do
    sub_name = item_prop[1]
    pure_conv_val = item_prop[2]
    ingot_conv_val = item_prop[3]

    data:extend({
      {
        type = "technology",
        name = "kr-matter-" .. sub_name .. "-processing",
        mod = "Krastorio2",
        icons = {
          { icon = kr_technologies_icons_path .. "backgrounds/matter.png", icon_size = 256, icon_mipmaps = 4 },
          {
            icon = "__IndustrialRevolution__/graphics/icons/64/" .. sub_name .. "-pure.png",
            icon_size = 64,
            scale = 2,
            icon_mipmaps = 4,
          },
        },
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {},
        prerequisites = { "kr-matter-processing" },
        order = "g-e-e",
        unit = {
          count = 350,
          ingredients = {
            { "production-science-pack", 1 },
            { "utility-science-pack", 1 },
            { "matter-tech-card", 1 },
          },
          time = 45,
        },
      },
    })

    new_pure_conversion = {
      item_name = sub_name .. "-pure",
      minimum_conversion_quantity = 10,
      matter_value = pure_conv_val,
      energy_required = 1,
      unlocked_by_technology = "kr-matter-" .. sub_name .. "-processing",
    }
    new_ingot_conversion = {
      item_name = sub_name .. "-ingot",
      minimum_conversion_quantity = 10,
      matter_value = ingot_conv_val,
      energy_required = 2,
      only_deconversion = true,
      need_stabilizer = true,
      unlocked_by_technology = "kr-matter-" .. sub_name .. "-processing",
    }

    krastorio.matter_func.createMatterRecipe(new_pure_conversion)
    krastorio.matter_func.createMatterRecipe(new_ingot_conversion)
  end

  -- -- Re-do the overmodule fix
  -- For each recipe that is in smelting
  -- multiply by 5 the recipe stat for avoid overmodule bug effect
  for name, recipe in pairs(data.raw.recipe) do
    if
      recipe.category
      and (recipe.category == "smelting" or recipe.category == "smelting-1" or recipe.category == "smelting-2" or recipe.category == "smelting-3")
      and krastorio.recipes.normalEnergyRequired(name) < 6.4
    then
      if not recipe.energy_required then
        krastorio.recipes.setEnergyCost(name, 3.2)
      end
      krastorio.recipes.multiplyRecipeStat(name, 5)
    end
  end

  -- Crushed rare metals
  data:extend({
    {
      type = "item",
      name = "crushed-rare-metals",
      icon = kr_graphic_mod_path .. "compatibility/IndustrialRevolution/crushed-rare-metals.png",
      icon_size = 64,
      icon_mipmaps = 4,
      pictures = {
        {
          filename = kr_graphic_mod_path .. "compatibility/IndustrialRevolution/crushed-rare-metals.png",
          size = 64,
          scale = 0.25,
          mipmap_count = 4,
        },
        {
          filename = kr_graphic_mod_path .. "compatibility/IndustrialRevolution/crushed-rare-metals-1.png",
          size = 64,
          scale = 0.25,
          mipmap_count = 4,
        },
      },
      subgroup = "raw-material",
      order = "x[raw-rare-metals]",
      stack_size = 200,
    },
    {
      type = "recipe",
      name = "crushed-rare-metals",
      category = "grinding-2",
      icon = kr_graphic_mod_path .. "compatibility/IndustrialRevolution/crushed-rare-metals.png",
      icon_size = 64,
      icon_mipmaps = 4,
      always_show_products = true,
      enabled = false,
      ingredients = { { "raw-rare-metals", 1 } },
      main_product = "crushed-rare-metals",
      result = "crushed-rare-metals",
      result_count = 1.5,
      energy_required = 1.6,
      order = "b-i2",
      subgroup = "crushed",
    },
  })
  krastorio.technologies.addUnlockRecipe("ir2-grinding-2", "crushed-rare-metals")
  krastorio.modules.addProductivityLimitation("crushed-rare-metals", true)

  -- Smelting crafting fix
  local materials = {
    "tin",
    "copper",
    "iron",
    "bronze",
    "gold",
    "steel",
    "stainless",
    "chromium",
    "tellurium",
    "invar",
    "cupronickel",
  }

  local intermediates = {
    "-plate",
    "-plate-heavy",
    "-plate-special",
    "-beam",
    "-cable",
    "-gear-wheel",
    "-rod",
    "-foil",
    "-rivet",
    "-piston",
  }

  local item_name = nil
  local original_recipe = nil
  local ingredients = nil
  local sub_ingredients = nil
  local done = nil

  for _, material in pairs(materials) do
    for _, intermediate in pairs(intermediates) do
      item_name = material .. intermediate
      original_recipe = krastorio.recipes.getRecipeFromName(item_name)
      if original_recipe then
        local original_recipe = krastorio_utils.tables.fullCopy(original_recipe)
        original_recipe.name = "kr-s-c-" .. item_name
        original_recipe.main_product = item_name
        original_recipe.category = "smelting-crafting"
        original_recipe.subgroup = "smelting-crafting"
        original_recipe.energy_required = original_recipe.energy_required * 4
        original_recipe.allow_productivity = true
        original_recipe.hide_from_player_crafting = true
        original_recipe.always_show_made_in = true
        original_recipe.always_show_products = true
        data:extend({ original_recipe })

        ingredients = krastorio.recipes.getIngredients("kr-s-c-" .. item_name)
        if ingredients and next(ingredients) ~= nil then
          done = false
          while not done do
            done = true
            for _, ingredient in pairs(ingredients) do
              if ingredient and ingredient.name then
                if
                  not (
                    string.find(ingredient.name, "ore")
                    or string.find(ingredient.name, "pure")
                    or string.find(ingredient.name, "mix")
                    or string.find(ingredient.name, "coke")
                    or ingredient.type == "fluid"
                  )
                then
                  done = false
                  sub_ingredients = krastorio.recipes.getIngredients(ingredient.name)
                  for i, sub_ingredient in pairs(sub_ingredients) do
                    krastorio.recipes.addIngredient("kr-s-c-" .. item_name, sub_ingredient)
                  end
                  krastorio.recipes.removeIngredient("kr-s-c-" .. item_name, ingredient.name)
                end
              end
            end
          end
        end

        krastorio.technologies.addUnlockRecipe("kr-automation", "kr-s-c-" .. item_name)
        krastorio.modules.addProductivityLimitation("kr-s-c-" .. item_name, true)
      end
    end
  end

  -- special fix
  data:extend({
    {
      type = "recipe",
      name = "kr-s-c-iron-stick",
      category = "smelting-crafting",
      subgroup = "smelting-crafting",
      energy_required = 1.6,
      enabled = false,
      allow_productivity = true,
      hide_from_player_crafting = true,
      always_show_made_in = true,
      always_show_products = true,
      ingredients = {
        { "iron-ore", 1 },
      },
      result = "iron-stick",
      result_count = 2,
    },
  })

  -- Equipemnt categories
  table.insert(data.raw["generator-equipment"]["burner-generator-equipment"].categories, "universal-equipment")
  table.insert(data.raw["generator-equipment"]["iron-burner-generator-equipment"].categories, "universal-equipment")
  table.insert(data.raw["roboport-equipment"]["copper-roboport-equipment"].categories, "universal-equipment")
  table.insert(data.raw["generator-equipment"]["battery-discharge-equipment"].categories, "universal-equipment")
  -- Equipemnt adjustment
  data.raw["generator-equipment"]["small-portable-generator"].power = "270kW"

  -- Stack sizes
  local kr_stack_size_value = krastorio.general.getSafeSettingValue("kr-stack-size")

  if kr_stack_size_value and kr_stack_size_value ~= "No changes" then
    data.raw.item["bronze-plate"].stack_size = kr_stack_size_value

    data.raw.item["tin-ore"].stack_size = kr_stack_size_value
    data.raw.item["tin-plate"].stack_size = kr_stack_size_value

    data.raw.item["copper-gear-wheel"].stack_size = kr_stack_size_value
    data.raw.item["tin-gear-wheel"].stack_size = kr_stack_size_value

    data.raw.item["gold-ore"].stack_size = kr_stack_size_value

    data.raw.item["lead-plate"].stack_size = kr_stack_size_value
    data.raw.item["invar-plate"].stack_size = kr_stack_size_value
    data.raw.item["cupronickel-plate"].stack_size = kr_stack_size_value
    data.raw.item["stainless-plate"].stack_size = kr_stack_size_value
    data.raw.item["chromium-plate"].stack_size = kr_stack_size_value

    data.raw.item["gravel"].stack_size = kr_stack_size_value
    data.raw.item["copper-crushed"].stack_size = kr_stack_size_value
    data.raw.item["tin-crushed"].stack_size = kr_stack_size_value
    data.raw.item["iron-crushed"].stack_size = kr_stack_size_value
    data.raw.item["gold-crushed"].stack_size = kr_stack_size_value

    data.raw.item["rubber-wood"].stack_size = kr_stack_size_value
    data.raw.item["wood-chips"].stack_size = kr_stack_size_value

    data.raw.item["copper-pure"].stack_size = kr_stack_size_value
    data.raw.item["tin-pure"].stack_size = kr_stack_size_value
    data.raw.item["iron-pure"].stack_size = kr_stack_size_value
    data.raw.item["gold-pure"].stack_size = kr_stack_size_value
    data.raw.item["nickel-pure"].stack_size = kr_stack_size_value
    data.raw.item["chromium-pure"].stack_size = kr_stack_size_value
    data.raw.item["lead-pure"].stack_size = kr_stack_size_value
    data.raw.item["tellurium-pure"].stack_size = kr_stack_size_value

    data.raw.item["silica"].stack_size = kr_stack_size_value
    data.raw.item["carbon-powder"].stack_size = kr_stack_size_value
    data.raw.item["iron-powder"].stack_size = kr_stack_size_value
    data.raw.item["ruby-powder"].stack_size = kr_stack_size_value
    data.raw.item["sapphire-powder"].stack_size = kr_stack_size_value
    data.raw.item["diamond-powder"].stack_size = kr_stack_size_value

    data.raw.item["silicon-mix"].stack_size = kr_stack_size_value
    data.raw.item["bronze-mix"].stack_size = kr_stack_size_value
    data.raw.item["glass-mix"].stack_size = kr_stack_size_value
    data.raw.item["gunpowder"].stack_size = kr_stack_size_value
    data.raw.item["steel-mix"].stack_size = kr_stack_size_value
    data.raw.item["invar-mix"].stack_size = kr_stack_size_value
    data.raw.item["cupronickel-mix"].stack_size = kr_stack_size_value
    data.raw.item["chromium-mix"].stack_size = kr_stack_size_value
    data.raw.item["stainless-mix"].stack_size = kr_stack_size_value

    data.raw.item["plastiglass"].stack_size = kr_stack_size_value

    data.raw.item["copper-scrap"].stack_size = kr_stack_size_value
    data.raw.item["tin-scrap"].stack_size = kr_stack_size_value
    data.raw.item["bronze-scrap"].stack_size = kr_stack_size_value
    data.raw.item["glass-scrap"].stack_size = kr_stack_size_value
    data.raw.item["iron-scrap"].stack_size = kr_stack_size_value
    data.raw.item["gold-scrap"].stack_size = kr_stack_size_value
    data.raw.item["lead-scrap"].stack_size = kr_stack_size_value
    data.raw.item["steel-scrap"].stack_size = kr_stack_size_value
    data.raw.item["invar-scrap"].stack_size = kr_stack_size_value
    data.raw.item["cupronickel-scrap"].stack_size = kr_stack_size_value
    data.raw.item["stainless-scrap"].stack_size = kr_stack_size_value

    data.raw.item["wood-beam"].stack_size = kr_stack_size_value
    data.raw.item["copper-beam"].stack_size = kr_stack_size_value
    data.raw.item["stainless-beam"].stack_size = kr_stack_size_value
  end

  -----------------------------------------------------------------------------------------------------------------------
end
